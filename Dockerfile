# This image has java, I should probably use a smaller image
FROM cimg/android:2024.01.1-ndk

RUN sudo apt update

RUN sudo apt install golang

# This is a placeholder
RUN go mod init this_is_a_test

RUN go get fyne.io/fyne/v2@latest

RUN go install fyne.io/fyne/v2/cmd/fyne@latest

# Add go bin to path
ENV PATH="~/go/bin:${PATH}"

ADD ./ .

RUN go mod tidy

ENTRYPOINT ["/bin/bash"]
