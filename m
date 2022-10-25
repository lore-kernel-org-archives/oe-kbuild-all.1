Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1647748F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Oct 2022 17:23:00 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id y72so15429916yby.13
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Oct 2022 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NKTXcYN6Ga8OwOynRBy3VsgpCimivGzV8i42n9KI8Xs=;
        b=dnCJtTbVe6fGlfGFGFEzpXhI8pThgiiSAAo7AcJBQwDLg9hhJdKYXB9MJDE6iZyAGW
         P6qW+MXcbyKwSxXUy9taRrWk3088fgsh3WalfN3A588AH7Ppg5+QIe3oiVn3wJqHjSta
         2nu0gIzyTwGwR4tYgnIvovM/ymkKIul3FI1r8CKFHALd5ji0KC5+UB7arLByWR6ocaer
         r65UU/Qzomw83ejZEoE1DOSB50Psslpap4cpVVGuzMsk1zi+M+pk2VzzL53iZQsAW4bz
         U9Dc8IH+Du+hcSIMOh9aIV3meSAqFwHEhkuaswKMBcIzL18f64uH9Iuu5yCuf427rlwv
         yB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKTXcYN6Ga8OwOynRBy3VsgpCimivGzV8i42n9KI8Xs=;
        b=T1JqlPIzOtSVpgYRcY1lA4x76uqsMqE1kDKjT82PrUTkzmHjnscsi7Nt4LR54p3qFl
         DVLaldrjGc85pjA9SgXN5bHw4oVbU15SE7BZfi5s1rqGQRMYRKKopUCVcCDC7mmcAgvB
         UfsCeNtvUQWb35U47NctMKJ3doRU0Cq79UuuNBFivcteVxHNYUCMz/fZBeIldAxA0u53
         ueSLUca+zqagI9HQSNjro6rfU2v9s0qKGbfEY3En8kiUIpBnzUJzd2wyrzzY0cq4fPdQ
         /rnG+i9AoCq0TkU822MK8pyItF79lLfRGruqx29GHOVC67TEGg62TMly9LG/chpQl2g+
         Kokw==
X-Gm-Message-State: ACrzQf2Vcg1Se2mXJmPhUNJAF6TPUYagj6tj8BBe11ksJC1ajggcUwie
	8JkiPuF1B6bFLq9e/Q90QOpH2Wc9YAE4Xny93PjyQA==
X-Google-Smtp-Source: AMsMyM5D22AxGmbHEw1VDoNqDzk8sAPCpRYX8yAWCbCLAlgN2IR6RbCtmXFpkIMMVcOdHCdp1w7aria/94BIN8t1MhM=
X-Received: by 2002:a05:6902:305:b0:6c3:b4d6:7a04 with SMTP id
 b5-20020a056902030500b006c3b4d67a04mr34072324ybs.93.1666718579652; Tue, 25
 Oct 2022 10:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210260009.9qq1JXZi-lkp@intel.com>
In-Reply-To: <202210260009.9qq1JXZi-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Tue, 25 Oct 2022 10:22:23 -0700
Message-ID: <CANpmjNP4kX75dTyoGHMkS4Rmjd7rkPGzQn9y3Xuvrc5TUSu3zA@mail.gmail.com>
Subject: Re: [linux-next:master 1602/3190] ERROR: modpost: "iounmap"
 [drivers/tty/ipwireless/ipwireless.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Oct 2022 at 09:40, kernel test robot <lkp@intel.com> wrote:
>
> Hi Marco,
>
> First bad commit (maybe != root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   89bf6e28373beef9577fa71f996a5f73a569617c
> commit: 7c201739beef1a586d806463f1465429cdce34c5 [1602/3190] kcsan: Instrument memcpy/memset/memmove with newer Clang

This is unlikely to be the cause.

> config: s390-randconfig-r044-20221025 (attached as .config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7c201739beef1a586d806463f1465429cdce34c5
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 7c201739beef1a586d806463f1465429cdce34c5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> >> ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
> >> ERROR: modpost: "iounmap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
> >> ERROR: modpost: "ioremap" [drivers/net/ethernet/fujitsu/fmvj18x_cs.ko] undefined!
> >> ERROR: modpost: "devm_ioremap" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
> ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
> ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

There are already similar warnings.

My guess is that testing newer (unstable!) clang + CONFIG_KCSAN=y was
broken before the KCSAN commit that fixed memcpy/etc., so from this
commit onwards things build again and thus show a bunch of other
warnings/errors due to semi-successful build.
