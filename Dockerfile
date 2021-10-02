FROM kmtsui/geant4:latest

RUN echo "Hello from inside the container" && \
    echo "Install WCSIM"  && \
    mkdir WCSim && \
    wget https://github.com/kmtsui/WCSim/archive/refs/heads/feature_scattering.tar.gz && tar xvf feature_scattering.tar.gz --strip-components=1 -C WCSim && \ 
    cd WCSim && mkdir build && cd build && \
    source /opt/geant4/bin/geant4.sh && \
    cmake3 ../ && make && \
    cd ../ && ln -s build/libWCSimRoot.so && \
    cd ../

RUN echo "Produce sample diffuser MC" && \
    mkdir data && cd data && \
    source /opt/geant4/bin/geant4.sh && \
    export WCSIMDIR=/WCSim && export LD_LIBRARY_PATH=$WCSIMDIR/:$LD_LIBRARY_PATH && \
    /WCSim/build/WCSim /WCSim/macros/WCSim_hybrid_injector.mac /WCSim/tuningNominal.mac && \
    cd ..

COPY ./wcsim.entrypoint.sh /WCSim/
RUN chmod +x /WCSim/wcsim.entrypoint.sh

ENTRYPOINT [ "/WCSim/wcsim.entrypoint.sh" ]
