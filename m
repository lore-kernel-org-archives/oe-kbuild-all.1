Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADDEBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Dec 2022 04:14:43 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so10185955pjj.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Dec 2022 20:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjbmnptL4IzT5RV4kS5nsX/VoY0CGkQv0qEEjWwPwRk=;
        b=YoKgxS8NzyiAYbog7ztby4+rlr7hMbnb+W0GFu+Vz03THWh++XfD2jeLPJkB2Tevlp
         3j1C135vFRtrECTh6sGzi012fKXPm2eAJLZUIZgjzxYn/PIdJCtv1b1oestMAndvAjA1
         k7wtUSljTWGGEBaApOlrpfDLGYf9UyIetkrBcufBvq6Lz5t7OFM/fxHfWQFtJOuEizAS
         3ZGKcsjrvO8xvVMvaSWODhPnTa4ZK/k/CXFfGJ8FjQn09ppiTBfdFIDWEB27zQMm+9WR
         t7yN0lEc95h/9/xZMdv3Um6Ejv6CW7dBMYCbPVYSwkAzajk+ko0qDVnAImHZazjDhWNv
         1E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjbmnptL4IzT5RV4kS5nsX/VoY0CGkQv0qEEjWwPwRk=;
        b=hf6mC9pB8u2H0Sip10V2iycgSFhSbHhDSs6w9ARywF4Sw00UrufVSaPQqfCB5SAwOA
         eP8UkFw/KDTtVi0/esmIgas8hfFfq/x5sDlK8UgKsjqqkTu0AidC6+Dp+ohlyan8YUnH
         pZ0QRiez6sfDakOAsJgz55/KBYGeZeq2QYzBLExjYcP+FNhQDFlU76AzVQqVhVEgXESM
         aQlIuZCVF9I1xZue2oeT0+0C6Gh3NgOQzWyvf3VMJPSMIneQLM6tfn7FZQHmczahJ8Nt
         lLVnm2jbmFHY/0e/m9QHAjewnX2dn+oIx1Ya3iG0MsXM7vPwjhjoRpIadU2JEkQPzfs7
         tz3Q==
X-Gm-Message-State: ANoB5pmf+k8x/+Dn4jl1p1MHFCumldHHRkxM2QBRwkqo5KA9KfajGxX+
	eIfgoTbP8XFHenytY58iv1/95g==
X-Google-Smtp-Source: AA0mqf4i/Jf9da6nDfU2NGc0vdNyV+vpdt474WLhxPtkcUcWijPkcem/OBjPBMpmtjWcgcP/LqY33w==
X-Received: by 2002:a17:903:130e:b0:189:8ca1:e641 with SMTP id iy14-20020a170903130e00b001898ca1e641mr8531806plb.60.1670645682761;
        Fri, 09 Dec 2022 20:14:42 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d50600b00186727e5f5csm2034159plg.248.2022.12.09.20.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 20:14:42 -0800 (PST)
Date: Fri, 09 Dec 2022 20:14:42 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 20:14:08 PST (-0800)
Subject:     Re: [ammarfaizi2-block:palmer/linux/for-next 46/47] cpufeature.c:undefined reference to `riscv_cbom_block_size'
In-Reply-To: <202212101018.6d9lgpSR-lkp@intel.com>
CC: ajones@ventanamicro.com, oe-kbuild-all@lists.linux.dev, ammarfaizi2@gnuweeb.org,
  gwml@vger.gnuweeb.org, Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lkp@intel.com
Message-ID: <mhng-79a0534e-a244-42b0-b313-0ab7cc3709c9@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 09 Dec 2022 18:56:27 PST (-0800), lkp@intel.com wrote:
> tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/for-next
> head:   4f32e3ab94b6d98de7ffb7a781df3c06c8dcd166
> commit: 68dc0718407d8e9c84c530df5298078a57a8000a [46/47] RISC-V: Ensure Zicbom has a valid block size
> config: riscv-randconfig-r042-20221209
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/68dc0718407d8e9c84c530df5298078a57a8000a
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block palmer/linux/for-next
>         git checkout 68dc0718407d8e9c84c530df5298078a57a8000a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
>>> cpufeature.c:(.text.unlikely+0x1a): undefined reference to `riscv_cbom_block_size'

I forgot to base this on 5c20a3a9df19 ("RISC-V: Fix compilation without 
RISCV_ISA_ZICBOM"), which I keep forgetting about because it went in 
without an Ack (which has made through a bunch of headaches).

I'm rewriting my for-next since this was merged pretty recently, so with 
any luck I got that right.  It's on for-next now.
