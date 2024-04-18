Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E616C444
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 15:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713453163; cv=none; b=h8/Gb8ncRHmmhqdGLNaG9v+Cn6Cby3GDgtyq3zpwgDYsgY6YZu56L1gmT7KOI/LPdvE+fEaSsBfJ31xF4XVkYZaDKqqOpB+HW9oMSoUAN8+Ns59rNUDCbyWE8w0q7+UEiNrXAwGcIaZjUQbv/JxKiqpvYi6H/Ypg7GQgigNr2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713453163; c=relaxed/simple;
	bh=WeZWiT0D59nSGBG18mBQbDxxuV/h7fezPcselX+FYmY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=tHCo6obxxlekcwMf5RnzQ0TwwVxbF2Ier+O6JiDKanHpQz7kP4FImDYdhbKQQwdOd7c4RrDxRgIuMz8busUVB9J2Bdmc8JMOzh3HVcKI6zrj8AR8zinPPms7UL9ix/2DAOl+8uXYiC9igJOBnZZs9rqy+MVasPcOfZQop4C1lOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CNJykaPU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CNJykaPU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso926372b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713453159; x=1714057959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdauHvV9rzQCVgQOHF/PnU3Zp568UZBB5xXDEPJHMmM=;
        b=CNJykaPUASKj9L+FyeJxuRyNx4a/USwTDygcwMIl7AROOGPPzW+bGzAJi3yTxSgQM7
         zPB8dJFcfPRpV8jHTUvWEGGWh3PJ0Bfnwx/Kzvp+6F56F04PCGPaldwFX7TNJWkYtfID
         /b9tvcKsxeE2lY43SaxcV8pgPSFfKZ8eXHmf2Deu5oDvt7iK5hFVNU7acPfHc54QE2tV
         6rX0olnM8WRIkOVcLZ2dH8eo/+RNRL3n+3MuK7j/xaeFJoILFtym3zbaffFK6BNs3DGw
         FPRtD2hFeMe85KlvaSfNWqxxw5xSRUxrT0eNK54tKYfUtdi50cMrya1k9WsMDxJFlKsg
         Ux+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713453159; x=1714057959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdauHvV9rzQCVgQOHF/PnU3Zp568UZBB5xXDEPJHMmM=;
        b=FVfhYgurI7QZoiBCgQK8wqkosk2n347qInPnGDKvWTCl6mV5PrJ+DAfuh/fqJJ8ops
         2kE7TNY34HamXDvZKEL47aR73gKEy+M9+Yr7SaRtPc4LJqPqM4nPICrvVy8rpeYw/ibN
         K710q1b+w24ryRBqg0wZFFB46/+lAqvftb940xxOgxNCD5Ekcl5JFDVkF3AwzGknYrAA
         qTM5LK+ehimt2jVVYTQ/XPwnAX8vBsHcxOMPakwvzG7EBDm4emK32H8oDZ/h4Hquj5oq
         RePcnx14iu2suCHIk27/SzJHoUuBhaWRSDRnsVgMNZyrJC0Z/F8kyPC7e4ZwDkKyWCAX
         SrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpylaAzK3EXTuxprh5hI8S23fV371+9cE/KHsXPevpG0wDm6qY2SSoF7dLMRyJ/InMaSCEjHbJwVpB5PGBADpxO5e5krHMWugp5Pcaqg==
X-Gm-Message-State: AOJu0YxkoBL4dJ89VOBtLkvDIR9uWP5of3quLNU4zhwHdJYSq4Bkuu0F
	GKt46UkTy8oVH6hagzunTEamsAMNiuz6n/Uddo/S0oqRPhcZgCT6zY0gQygebaFJom/vzQIiZyE
	g
X-Google-Smtp-Source: AGHT+IH+uu3ACOntz38KVWU88nyFX4mf1kHTSH7kUK7BxALGsTABzYrcn/TmBVxpA0/4+IhLbN2gJw==
X-Received: by 2002:a05:6a20:9192:b0:1aa:10ba:3f8d with SMTP id v18-20020a056a20919200b001aa10ba3f8dmr4237151pzd.41.1713453158579;
        Thu, 18 Apr 2024 08:12:38 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id h17-20020a62b411000000b006edd05e3751sm1638307pfn.176.2024.04.18.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 08:12:37 -0700 (PDT)
Date: Thu, 18 Apr 2024 08:12:37 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Apr 2024 08:12:36 PDT (-0700)
Subject:     Re: [palmer:for-next 27/30] arch/riscv/mm/cacheflush.c:168:37: error: 'mm_context_t' has no member named 'icache_stale_mask'
In-Reply-To: <ZiBgeosKlgEnpOuW@ghost>
CC: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>,
  alexghiti@rivosinc.com, samuel.holland@sifive.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-dbc2b104-a21e-4616-8485-81515903f8f3@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 17 Apr 2024 16:51:22 PDT (-0700), Charlie Jenkins wrote:
> On Thu, Apr 18, 2024 at 06:14:34AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
>> head:   a76716f0ec75b9e7ac62d30854d690044c857684
>> commit: 383289e4b071ca4c8c42e34567f3f267766f093c [27/30] riscv: Include riscv_set_icache_flush_ctx prctl
>> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/config)
>> compiler: riscv64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.qG7A9Tk0-lkp@intel.com/
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>    arch/riscv/mm/cacheflush.c: In function 'set_icache_stale_mask':
>> >> arch/riscv/mm/cacheflush.c:168:37: error: 'mm_context_t' has no member named 'icache_stale_mask'
>>      168 |         mask = &current->mm->context.icache_stale_mask;
>>          |                                     ^
>>    arch/riscv/mm/cacheflush.c: At top level:
>> >> arch/riscv/mm/cacheflush.c:157:13: warning: 'set_icache_stale_mask' defined but not used [-Wunused-function]
>>      157 | static void set_icache_stale_mask(void)
>>          |             ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +168 arch/riscv/mm/cacheflush.c
>>
>>    156
>>  > 157	static void set_icache_stale_mask(void)
>>    158	{
>>    159		cpumask_t *mask;
>>    160		bool stale_cpu;
>>    161
>>    162		/*
>>    163		 * Mark every other hart's icache as needing a flush for
>>    164		 * this MM. Maintain the previous value of the current
>>    165		 * cpu to handle the case when this function is called
>>    166		 * concurrently on different harts.
>>    167		 */
>>  > 168		mask = &current->mm->context.icache_stale_mask;
>>    169		stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
>>    170
>>    171		cpumask_setall(mask);
>>    172		assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
>>    173	}
>>    174
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>
> I thought I tested this... Simple fix though, just need to guard this
> function with CONFIG_SMP
> https://lore.kernel.org/lkml/20240417-fix_nosmp_icache-v1-1-921a3c07d4ce@rivosinc.com/T/#u.

Thanks.  This hasn't landed in for-next yet, so I'm just going to squash 
it into the offending patch.

>
> - Charlie
