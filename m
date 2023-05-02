Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890571C2D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 12:22:28 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-2fa36231b1cso2292838f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 May 2023 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683030146; x=1685622146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx4CtFX9QxyVfk/q3EEN11kGuSB1DWR9fWIlov2TAkU=;
        b=1WWbgGlysQzIaLwC2UzSNHkkmgcvAvwA9Hiy9w17z5oE9XrjkKB9OuxVqL3L9damxD
         tAkj+sI8O+kiGEBfw0XhSp44ZQianpCGDkb3DakG116pRMUejON2+bmiB0w5RXNmFDR7
         HwNMOi6XA3M+ZehLDUqSrLQw1FrjDMnIlHSZLCfeuRXKeiIfnRCcvc1IBjUes+8CzCe1
         6jO4L+w8JQqes7ddeDH19bgDUJtdQnm9E/lg7d0X8ARa5wioN4Ud3/Pgf3PuPQ+KrDiA
         Dbv9KPdZXFT38QINmWTFJay5u4F1j15tki6/SszDigq5Rc3zrtoDHkBtA+D2QcOjvYD5
         pVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683030146; x=1685622146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx4CtFX9QxyVfk/q3EEN11kGuSB1DWR9fWIlov2TAkU=;
        b=Ds5MzM+KwN5qwqXm8+NGPl1eSs4H6YUloaZvS6CMQi1Q0F5IJbYhxLdW7D1TCI5G0C
         cdYeMEg7sFGMRuzH3D7ssp4qZLrDpF/aY0RggGgy/UgpNi+lf9feTsDm4ZPqZ6tLUPNE
         qyBv5sR485nbd13B8Pyw18oCRIqdV3rv4WstlzVwsn5qU1uc9dmBo0/eZho8pUTLsP0W
         H0H0/H+tAMC4XkRLfAi03K2TgORJkBkX4MwRwh6QQo8IHkyLmD4bKAHcodmWEExsjVOc
         xU7WaHZ5bvVp7Y0SQ3+PzlB0NL0945zyTsrKlmnhoTyURAJj5J7x5/ib6eRnl8X97IFl
         8fmw==
X-Gm-Message-State: AC+VfDw0wKi04LF9jmlxKf+A55H1OzuUfPX24mxbAEE+hTdZh4NN6L9y
	QdhCnmQCKpdpU1gYGxLZVUnQyU1k66RTVXodCYMAJsgwe3OVBtLM
X-Google-Smtp-Source: ACHHUZ7gL7v2p9lIQ9ZYhZIRIXsEdQKGPPd4p1XkwAS5t5RnwYfSKbGo75GmV0zdqESpeLFdljuN3hFCqrQ4p1mIJQc=
X-Received: by 2002:adf:e3c5:0:b0:2cf:ee9d:ce2f with SMTP id
 k5-20020adfe3c5000000b002cfee9dce2fmr11808712wrm.19.1683030146536; Tue, 02
 May 2023 05:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304301606.Cgp113Ha-lkp@intel.com>
In-Reply-To: <202304301606.Cgp113Ha-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 2 May 2023 14:22:15 +0200
Message-ID: <CAHVXubg_PO2uab5ucLjhsFwDEnT+ov_G17ND7dtAosHxHJ8xjQ@mail.gmail.com>
Subject: Re: riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local'
 from `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.rel.ro.local'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 30, 2023 at 10:30=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   825a0714d2b3883d4f8ff64f6933fb73ee3f1834
> commit: 26e7aacb83dfd04330673c5c9ac336560da52bb3 riscv: Allow to downgrad=
e paging mode from the command line
> date:   4 days ago
> config: riscv-randconfig-r005-20230430 (https://download.01.org/0day-ci/a=
rchive/20230430/202304301606.Cgp113Ha-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D26e7aacb83dfd04330673c5c9ac336560da52bb3
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 26e7aacb83dfd04330673c5c9ac336560da52bb3
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304301606.Cgp113Ha-lkp@i=
ntel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' fr=
om `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.=
rel.ro.local'
> >> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `a=
rch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_ind=
ex'
> >> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' fr=
om `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.=
rel.ro.local'
> >> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `a=
rch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_ind=
ex'
> >> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' fr=
om `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.=
rel.ro.local'
> >> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `a=
rch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_ind=
ex'
> >> riscv64-linux-ld: warning: orphan section `.init.data.rel.ro.local' fr=
om `arch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.data.=
rel.ro.local'
> >> riscv64-linux-ld: warning: orphan section `.init.printk_index' from `a=
rch/riscv/kernel/pi/lib-fdt.pi.o' being placed in section `.init.printk_ind=
ex'

I thought I had caught all the orphan sections introduced with
kernel/pi, which is not the case: I have a fix that I'm testing.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
