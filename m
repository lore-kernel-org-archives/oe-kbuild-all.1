Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2AD190679
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625522; cv=none; b=WURMsgB5J6cEVAbWOWWn/YzyOdoO85FG4Zx/KcObCTZQKX+jGwXfQGGAXKF9q8tPLbdEVHpA1hxhkUxtvCl6AeTZ01qs+4bHlQccEiJ9GTB0s1JiatdRDnGbqWMnZwm1ctROVmu3GvC7YfdKUnqDJejJoBGjCp8OMpsMiyIIHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625522; c=relaxed/simple;
	bh=Kk+qzTUu/LPz0tByaNoRzzWRhucCyoYiydWP055y6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+Ixo2amiZUlbqu4n+osrPj2XC0fS9YhopRGPtZ6g9loGVR6Bqo3kpZBFkB1fXl5LvsAl8vKU/bAG+3bUbaQ7rMR44I+oph9EkECIrXbg9584N1xJ3xqXc/5zuUjT2BYN5e5obipxo/4Y1WK4R4CU0ezHE6yPgkOObU8RFm1WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=PeCJNXXb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PeCJNXXb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso2266230f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744625518; x=1745230318; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekviSgQyoe64J8uN564Y99DCC6tdD4eOX0JG1pzrNnA=;
        b=PeCJNXXbAtmlinWM7LlOj+55GyMaaJBoLXFEcLc7gvUucIntOzLLqB5USha9zhjaZG
         MOJ4jhTJuj+/Q9rq/kXgsqu/E5viVm46KjLacg1lacLVAUbasM/GIO5+0Dqbgv3kzo1B
         WEQ6ZDay/RHIxli5qV2ApwMDHgDNGRT9zkgze8bUOtxU9UJtDFpCgUUVYoX/DQKFJvkb
         EzLqJ8m+RmGgYbvoxnv7lazM9UNlMW81XOWlKAl8kthFx/bjgNIaILsC/mVfgrfCHh0k
         0YHMxA3KIdlOxJf5uxsri+FIe9QlQ+G6q8BEAOS+4Qp5N0V9AynPwH+BbuDnJndjTvml
         sdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625518; x=1745230318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekviSgQyoe64J8uN564Y99DCC6tdD4eOX0JG1pzrNnA=;
        b=E6TlHg7saxd3alWlsbFkULwsuw5IaInV25hTeIMZu6iru3x/7SP2pwQclINxJ57BUb
         ZvjVgUMP5u0vB276m6DKcAwVfoRFPfTYFma1/DVHSOCr/dAgo7+ef7HFdgbn4qBVHI8J
         EzZw1tz4wNzQXjfjLxnY4+ktgJ9JCXEruNWjtvGFAdXmZDzyoEGhWBWSjYcc7FondD0i
         7z6ChP6392h1DyNEeSMmoJYhrjufX+RJyn7PX9FTONvzrF7NQqwfDJzOz4XJfEQjfJnW
         KalEPiWDLKEinyvFcpinj83aE3RTn+b7e2pih8Y7IUd7eN62lXHhstP6/F99NJCAgQnL
         cKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVdzmxkwLJ4oG+EFmIsCbm9LevGJUh290KYyAG0cTaUi1tF31YSDSNg7AesXuFKtlCryqWECryW0d0KTkxc@lists.linux.dev
X-Gm-Message-State: AOJu0YyF7ao7XRObVqao8Vpk6997r1MhbwKIU0rYVmxN3rcwULgSRRZs
	4EaYGW6X0rGRtV45AgwjdeYfr33E8CuDwZdWrDxstOmdknsxL+AsspCHu43QOOU=
X-Gm-Gg: ASbGncvdU8Cap2YueQ2Xfd/hh4xLBIP6u7DfjR8jn3ZIgZDhmG32GMrMNCOXLLx8c9p
	GiVBL15iRfq2uBkKdAfrrFKrgGqI1a1ScvsQnBp0KumGPwV4kGqILT5s/4wF6qbv+Kyz9woKo48
	Op+HZAvL5s48gfqytpOhohwpswQKdefT9IYPkIKmA2qkyZ3XNsn1pLqvefVnWBh0JM5aNWide7O
	c6nKS1tWInA4TY2/Tb9pjTVWDkv/2Xafqrvg5pxweh7r9flMQnLOW5ID4d2331GQHHA3uPW1/oX
	7H+kZOHNAORTGMyS+jEeJw0PzdBk
X-Google-Smtp-Source: AGHT+IEq//Hd1trRvrPxeUyigXnYgKOvmpOmIQ7XVfTMtJYZ1CwhBQqistVDNwlAJ+Bgo1zIZ/GJzw==
X-Received: by 2002:a05:6000:184d:b0:39c:2264:fb22 with SMTP id ffacd0b85a97d-39eaaecda4amr9351240f8f.46.1744625518276;
        Mon, 14 Apr 2025 03:11:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c70csm10678636f8f.38.2025.04.14.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:11:57 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:11:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kernel test robot <lkp@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode
 `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
Message-ID: <20250414-5f143a94fdabfdef0191de46@orel>
References: <202504130710.3IKz6Ibs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504130710.3IKz6Ibs-lkp@intel.com>

On Sun, Apr 13, 2025 at 07:18:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b676ac484f847bbe5c7d29603f41475b64fefe55
> commit: 9343aaba1f256ff42730db5a61efc32a86149776 RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
> date:   4 weeks ago
> config: riscv-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/riscv/lib/strncmp.S: Assembler messages:
> >> arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
> >> arch/riscv/lib/strncmp.S:12: Error: junk at end of line, first unrecognized character is `0'
> --
>    arch/riscv/lib/strlen.S: Assembler messages:
> >> arch/riscv/lib/strlen.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strlen_zbb",0,30,'
> >> arch/riscv/lib/strlen.S:12: Error: junk at end of line, first unrecognized character is `0'
> --
>    arch/riscv/lib/strcmp.S: Assembler messages:
> >> arch/riscv/lib/strcmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strcmp_zbb",0,30,'
> >> arch/riscv/lib/strcmp.S:12: Error: junk at end of line, first unrecognized character is `0'
>

We're missing __ALTERNATIVE_CFG() for !RISCV_ALTERNATIVE && __ASSEMBLY__
and I see some other missing/broken macros on the !RISCV_ALTERNATIVE side.
I'll send a patch.

Thanks,
drew
