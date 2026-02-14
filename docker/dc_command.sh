docker run --rm -it ubuntu bash -c "
  # 1. Set Timezone to Asia/Seoul
  ln -snf /usr/share/zoneinfo/Asia/Seoul /etc/localtime && echo 'Asia/Seoul' > /etc/timezone && \
  
  # 2. Update Sources to Kakao Mirror
  sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirror.kakao.com/ubuntu|g' /etc/apt/sources.list.d/ubuntu.sources && \
  sed -i 's|http://security.ubuntu.com/ubuntu/|http://mirror.kakao.com/ubuntu|g' /etc/apt/sources.list.d/ubuntu.sources && \
  
  # 3. Install packages and setup user
  apt update && apt install -y sudo nano git curl && \
  useradd -m -G sudo -s /bin/bash tempuser && \
  echo 'tempuser:helloworld' | chpasswd && \
  su - tempuser"
