Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E217CD6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Oct 2022 08:28:03 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id n130so12832282yba.10
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Oct 2022 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8hiaX3qzM77jDPn/tc4Lj/66Z56ccEa25AnRYdm1OM=;
        b=VZMm+e0TNUmZrn1v7yt1bdkyybRRhs5NJoX8ziQRiHQHdBev3jNpXEfCqQzAH7wJqh
         zW+h9clIz4rjx8AUGkYFb+b8ieEbLidYLXriPQkUkEWycE/lJaNqdz/w+pSIM0jcqCIe
         yf/dhlrLcjihdgcUpYgmifpbKdOZVjbJ6KRdO5HDThOeGNAbSPC2EBAVbF0byeL/IMct
         GRqDsSQnPT/nJaq95Q1BoinUPAMKh0G9BAGM6kqpl7Gjzqf85tf58N6VDi+cXHyULmuE
         7ZFVBb7SV4rXwciUGikNK34i0dkvA+EqafjvbJTErbnH5obk0T/L+145oCAj5agqREgS
         SY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8hiaX3qzM77jDPn/tc4Lj/66Z56ccEa25AnRYdm1OM=;
        b=qlRJaaHv1yR0xNw9P8zEYZnaPcpQGsy34W0LRIlv69QsQI4wBvN7CC0FHxOdz5R59g
         aKYdnqi8Ti3vrww+t4+UK6dJbnnBUe4Tzsk1+SBI2cikPXujOaD9+Ki1Hl89bFhBpQRy
         qWcwu1zHbcwNxotvB27vwYQNRVJ5c5RT7E3jxT5IotzLP5vNSOdiljwIV52mC04XLw3p
         vZI89oCTXPfRL6y9VHTG+afFGfTJo8F1GTQqNguRc4NkzncsUPQORCE6IevoPBxYdM7V
         uxgih+VKYzwSDYndUmyEv56khNRykobLgBqQpseoVLGuRmIB9QCYucw0RmAVdjXm9G5X
         ff/g==
X-Gm-Message-State: ACrzQf1AB90HJ18xMBBeXANOnbfXP1zllNakr7XBm39G2v04t2onECNs
	1r0hHHP9v3E+HY4qf8OlUv8qRsfSEUV6V2imNlKiog==
X-Google-Smtp-Source: AMsMyM6oRp4zLCXIi2/Z1Kc03cjZlwKVHggj8xzvByxGrQtOhr6VbY6cMZ/UI3klJbqt39SyldBiIhCLoAIi6i+sA+c=
X-Received: by 2002:a25:a088:0:b0:6ca:33ff:5b30 with SMTP id
 y8-20020a25a088000000b006ca33ff5b30mr11810505ybh.242.1667204881935; Mon, 31
 Oct 2022 01:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210310123.aklkcZzK-lkp@intel.com>
In-Reply-To: <202210310123.aklkcZzK-lkp@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 31 Oct 2022 09:27:25 +0100
Message-ID: <CAG_fn=VqT+ORnMwR=YCsp6SxOMESqL9-O_t8G-5BdsNNBe13Mg@mail.gmail.com>
Subject: Re: arch/powerpc/kexec/crash.c:311:22: error: variable 'i' might be
 clobbered by 'longjmp' or 'vfork'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks unrelated to this 2-year old commit?

On Sun, Oct 30, 2022 at 6:12 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
> commit: f0fe00d4972a8cd4b98cc2c29758615e4d51cdfe security: allow using Cl=
ang's zero initialization for stack variables
> date:   2 years, 4 months ago
> config: powerpc-wii_defconfig
> compiler: powerpc-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Df0fe00d4972a8cd4b98cc2c29758615e4d51cdfe
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout f0fe00d4972a8cd4b98cc2c29758615e4d51cdfe
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash arch/powerpc/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/kexec/crash.c: In function 'default_machine_crash_shutdow=
n':
> >> arch/powerpc/kexec/crash.c:311:22: error: variable 'i' might be clobbe=
red by 'longjmp' or 'vfork' [-Werror=3Dclobbered]
>      311 |         unsigned int i;
>          |                      ^
>    cc1: all warnings being treated as errors
>
>
> vim +311 arch/powerpc/kexec/crash.c
>
> 496b010e1e70a9 arch/powerpc/kernel/crash.c Michael Neuling  2008-01-18  3=
08
> cc53291521701f arch/powerpc/kernel/crash.c Michael Ellerman 2005-12-04  3=
09  void default_machine_crash_shutdown(struct pt_regs *regs)
> cc53291521701f arch/powerpc/kernel/crash.c Michael Ellerman 2005-12-04  3=
10  {
> 496b010e1e70a9 arch/powerpc/kernel/crash.c Michael Neuling  2008-01-18 @3=
11     unsigned int i;
>
> :::::: The code at line 311 was first introduced by commit
> :::::: 496b010e1e70a9b4286fa34f19523f24a194f119 [POWERPC] kdump shutdown =
hook support
>
> :::::: TO: Michael Neuling <mikey@neuling.org>
> :::::: CC: Paul Mackerras <paulus@samba.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
