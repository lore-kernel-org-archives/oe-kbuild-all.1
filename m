Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7422B23A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D/xT1v5+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-407da05f05aso43440535e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698763651; x=1699368451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yHdOfoUCXOh64TJtBU+lPthA0hfFOsAVR6anmnY8mOY=;
        b=D/xT1v5+Rc+VqYGoJFdK817WMB7xt4P8vScb4rkhRPP46gdA6VCScILOWbhdkLl6Rb
         JXCqY/JipGV+qkS/HWF1kYPvSl/o7sYQs4oht+0rN/JSabDDS3WWg3mcx6Io63qSl0A8
         gER3JbZSYduD2bKmeUAH9eWWxBVvbfWUYg2sB08YsaElzkVwSelDn0pkOwmBPApydSCL
         hW4wwURJgY9Q145mr0633EzWsAMRgY03WVllngl4OJExGkSYjkD3CraUXvuL7a7iPkud
         2daBieCculKhIEqPB/niK2Snjjz1Ru6rQ+P1ejW8+CmhtwGnYDRbVr8Hex/0jm9FIPx8
         bVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698763651; x=1699368451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHdOfoUCXOh64TJtBU+lPthA0hfFOsAVR6anmnY8mOY=;
        b=tMmztUtUgN1wQeqoGOGwrgKZoBzyWzJKRbzaKUi6wzva90Ecj6D2+NaVZAb4yMQrCn
         rgH/D6rwoKZoCKaKxUMAWSsNlkW8CgwjpfVwOwYwh8GoC+TYhSmnanY7IKUZpfwGqZoP
         6mWApGHD9dxmrScLhn3sCIMFhG0rsLOlPYRIfEi3iGWRgFRBuQ/Z0xlwHlgNtJZjzcd8
         BNtBzLK5zWSnymPVgwFF5COzPg71AYJIm7quShTUonxN6xiioTtQ/a9giwqq4C0Je/3e
         w4CvDgGf3VrHQWK9Ef6A2q78ozXeEl7A1V5si0avj/cR0xi3QQFn5D5N9AtbT00pEI3X
         Df2g==
X-Gm-Message-State: AOJu0YwM4K820OGSL4HKsDgvrW+Rgoby+5HBmn+N8QaOCHHeA3DBzcgU
	MJWe4XpBijKdeIch8NfUsPH5Yw==
X-Google-Smtp-Source: AGHT+IHlI+sJSMj+K4Ls9tw9rH/x8Vw8isbrsIVM7X9ZUTtfSytYbyM054Q4JMnTL9bcAPZqQXkfzQ==
X-Received: by 2002:adf:e58a:0:b0:32d:a4e5:d3d1 with SMTP id l10-20020adfe58a000000b0032da4e5d3d1mr9943351wrm.4.1698763651435;
        Tue, 31 Oct 2023 07:47:31 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d544c000000b0031c52e81490sm1675620wrv.72.2023.10.31.07.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:47:30 -0700 (PDT)
Date: Tue, 31 Oct 2023 15:47:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [avpatel:riscv_sbi_nested_v1 64/76]
 arch/riscv/include/uapi/asm/hwprobe.h:58:49: warning: conversion from 'long
 long unsigned int' to 'long unsigned int' changes value from '4294967296' to
 '0'
Message-ID: <20231031-b401497c5c41c47861b5f6b8@orel>
References: <202310311801.hxduISrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310311801.hxduISrr-lkp@intel.com>

On Tue, Oct 31, 2023 at 07:08:16PM +0800, kernel test robot wrote:
> tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
> head:   9763a6c438da81175e07a5736eeb1e505a74e693
> commit: 3b516003495c3ceb036e452b29691977d00616d0 [64/76] RISC-V: hwprobe: Expose Zicboz extension and its block size
> config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231031/202310311801.hxduISrr-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311801.hxduISrr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310311801.hxduISrr-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/riscv/include/asm/hwprobe.h:9,
>                     from arch/riscv/kernel/sys_riscv.c:11:
>    arch/riscv/kernel/sys_riscv.c: In function 'hwprobe_one_pair':
> >> arch/riscv/include/uapi/asm/hwprobe.h:58:49: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '4294967296' to '0' [-Woverflow]
>       58 | #define         RISCV_HWPROBE_EXT_ZICBOZ        (1ULL << 32)
>          |                                                 ^~~~~~~~~~~~
>    arch/riscv/kernel/sys_riscv.c:266:44: note: in expansion of macro 'RISCV_HWPROBE_EXT_ZICBOZ'
>      266 |                 if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>          |                                            ^~~~~~~~~~~~~~~~~~~~~~~~
> 

It looks like on merge the bit got bumped from 6 to 32, but
hwprobe_ext0_has() used unsigned long for the extension, instead of u64.
The diff below, which I can send as a proper patch, is the fix.

Thanks,
drew


diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index c4c2888c9529..acfd09a63a29 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -203,7 +203,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
        pair->value &= ~missing;
 }

-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
        struct riscv_hwprobe pair;
