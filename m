Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F57AD50A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jan 2023 23:02:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id o2so32387859pjh.4
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Jan 2023 15:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MwCF+WzKuWB1NL5s02h7WS4hQiedaMR+EuZIdArRZoE=;
        b=BXHTh2Lqu+op9XEIs7tGkruDUIJdz8bJW3hs1BBwkr7HyJds9Lnw3z/fm/4NTXPNtc
         OoKtcDKV0rKQ1z5WE5AWY4S46h1mS1R7CNJuqEX44vMLEGoczwDA+nI2Ia98dsVvdluh
         2dxAeRUZk+oXb5/EF4Qa6m42ee3LsWAcVAjA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwCF+WzKuWB1NL5s02h7WS4hQiedaMR+EuZIdArRZoE=;
        b=a0Qrcxzm3OXtwmG8yJO8W9Qls9msn+ZcfnGpNV1iB9Xmwd8a31lEzKcEyruX7GxHsL
         hLobrvtk8q3WaMdA/7QEDLm947t+qCGYsWmw8Nl28bEzb30iWtFiSLfgKFF2ng+k6rPB
         NBrdor0oBkYztYRHduUyn+f9IDR+081dX8Ldhwdn1yKsEwQpTncrXH0RCF4K79v5jfqA
         RUPLLISB3zYXcrtATArv5k83cOYtJ+w4m3O5JKKbJY6vb9pfPtOyOu1PBQ0T+RxU3fZA
         zwpfoFjFhvpmqV53R+y/UCCTM48uGF9Xw003cQBkJo8Dff3DTNxGhSpVDo5ObC/OZXdi
         dvKA==
X-Gm-Message-State: AFqh2kp8IocCG1JrJvIiL1WGUM7Zzgum8xlGDLWdSycxLG77RR5TBpdb
	dX4tzHw2Zz+HQ3t+a+dRQ4yOJAUsoko3TNNzIBE=
X-Google-Smtp-Source: AMrXdXsdCvRdbBBxZbBk0NQd51JbaZHBMHJrtLSgNF+8pjA/Dl3+mkpQ5qt/X0Yh2O7HQchWdwtG5w==
X-Received: by 2002:a17:903:1c1:b0:191:271f:47be with SMTP id e1-20020a17090301c100b00191271f47bemr79288338plh.35.1672873374709;
        Wed, 04 Jan 2023 15:02:54 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b00186abb95bfdsm24723548pls.25.2023.01.04.15.02.53
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 15:02:53 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id b145so19933798pfb.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Jan 2023 15:02:53 -0800 (PST)
X-Received: by 2002:a65:5b88:0:b0:495:fb5f:4395 with SMTP id
 i8-20020a655b88000000b00495fb5f4395mr2094468pgr.63.1672873372703; Wed, 04 Jan
 2023 15:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221101-easycam-v3-2-2c9881a7a4f7@chromium.org> <202301050612.aB5wCXLV-lkp@intel.com>
In-Reply-To: <202301050612.aB5wCXLV-lkp@intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jan 2023 00:02:41 +0100
X-Gmail-Original-Message-ID: <CANiDSCtSj5qcjnAQvAutRiQspMCb=oWcCAiFdfDU8hW4A4XCww@mail.gmail.com>
Message-ID: <CANiDSCtSj5qcjnAQvAutRiQspMCb=oWcCAiFdfDU8hW4A4XCww@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvcvideo: Fix power line control for Lenovo
 Integrated Camera
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

Unfortunately it is not a false positive, this depends on gcc 8.1+
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69960#c18 and the kernel
requires gcc 5.1 :(, Let me see tomorrow what can I come up with that
is not too ugly.

Thanks!

On Wed, 4 Jan 2023 at 23:34, kernel test robot <lkp@intel.com> wrote:
>
> Hi Ricardo,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on 69b41ac87e4a664de78a395ff97166f0b2943210]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-uvcvideo-Limit-power-line-control-for-Acer-EasyCamera/20230103-190526
> base:   69b41ac87e4a664de78a395ff97166f0b2943210
> patch link:    https://lore.kernel.org/r/20221101-easycam-v3-2-2c9881a7a4f7%40chromium.org
> patch subject: [PATCH v3 2/3] media: uvcvideo: Fix power line control for Lenovo Integrated Camera
> config: riscv-randconfig-c006-20230101
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 7a8cb6cd4e3ff8aaadebff2b9d3ee9e2a326d444)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/2fc14361ca0ab71f686693c1297320eea993022b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Ricardo-Ribalda/media-uvcvideo-Limit-power-line-control-for-Acer-EasyCamera/20230103-190526
>         git checkout 2fc14361ca0ab71f686693c1297320eea993022b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/usb/uvc/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/media/usb/uvc/uvc_ctrl.c:737:2: error: initializer element is not a compile-time constant
>            uvc_ctrl_power_line_mapping_uvc11,
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
>
>
> vim +737 drivers/media/usb/uvc/uvc_ctrl.c
>
>    735
>    736  static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
>  > 737          uvc_ctrl_power_line_mapping_uvc11,
>    738  };
>    739
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



-- 
Ricardo Ribalda
