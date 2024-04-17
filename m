Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2422BAE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 23:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713397887; cv=none; b=OehaIJ+HHs7AC1dlF4kczoJvrxuQwZYhQ3OGZjyqzcA1rbxxBAu39oJL43a5AuHMMRhCRocOqSucLmS9cNnYhkmtROm9vIgIgEbQ1PWmtB6txTsiz4eNzF52O0dmJMMsDTH4lLvXNyn2GdXUfZ2eK/EV3/VZF4M7XTK61ftF+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713397887; c=relaxed/simple;
	bh=Q/j9mjpm9j3aVRlIfO2zsHsTfu2rIq2pbss+Ki3fxr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hO/9AO8r/Pmslg3uIvPwvmwui8nSOi1kISIDA/m6NNi9qHsn2wJANKPJ1AA8roj298+qLKcsr3xoLTYTBlniZPP2Ko0/vrj7yhWRuoBLLFXr7IidlEqU/2/u3yslf/ldtiHSHwHlmOOopuJEMuqBxYUU/vulYZyL0JBir22DWjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VDhtqktP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VDhtqktP"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f07de6ab93so348165b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 16:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713397885; x=1714002685; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5z3oiA2h4vpK1J1fdBfyBc6bwKHUGUad9ooyCl8l6Y=;
        b=VDhtqktP/V/h4rfbTa6QiLys/MB43/ORsIsebqbu+bYUaGRRn5XmSJcWX5VVYCjyyn
         8zHCz4FiYPMNW0nmnqtUUoZXshDwQw5ebnkceew3hYhNfbz8vU0gmkaedfcvau3Pw1hm
         eXLDB7Yg4ftPbf2E5VR2faOM9Hrnmas1Kp4Y8Ui4cIkmsv+jWr2F3C4XRQNLclhcrEz7
         WjOh3fmFpwVPUlrIQg7x1nryROTPnYSh+45mAoblZ0aMJ0KAQBTiTnTH+oLnjCrCZGLw
         rb6CY8pTZstR93ShzB5RltKCclzKekmRNP31NbAjzor/vidz0AYYHmnAL5CfbHKIVjVr
         D0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713397885; x=1714002685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5z3oiA2h4vpK1J1fdBfyBc6bwKHUGUad9ooyCl8l6Y=;
        b=XQ+Yv0CaDaHptxdgg6WJJl2DUCHkXayE/NcuF7tpZSn+e7exTssQFZLCs2ME/19nJc
         wBSZk5rV2yHFG6j4M2MzFmIad6AHApH7zvStp4bF/XFZIpP99QeFKy+BJ+JpHitW3wc7
         oHd8xxTbKRyJDIG+l8AZc2bgQU+oSwAxEsHTkULAjOGFs4BmihjPUIgwupE5TV38aIh5
         vWZ5va8fR65DjHBttEfUqH3gZNqK97hzyLkQrWWX1dS7UDL/LbPS7f/I8ijIw6CnwZk/
         PHxG2EWuub6HPAmkqI9wMGhU8sAO1dUJszKxRiMFzW5Vo8wpGupxfl9dh+zHWiR17ELC
         pL5A==
X-Gm-Message-State: AOJu0YwJ5AgfOpKUs01pOCFSi8OMFn+eKmngyRQZckm8XODPIphtv8kM
	6Z4mAQfmur/yS2flY0BbQik/DNuP0KGfmIfGlu65r2UBNzPW9gpgjwLpMlfmOmk=
X-Google-Smtp-Source: AGHT+IHp0nnXbZ/OIrZrGmhIoBv6j3bbJFmk2DIE039ZKfNWys1xdjlF2E7iApq/u37gPtQkbSrkTg==
X-Received: by 2002:a05:6a00:2305:b0:6ea:bbff:7561 with SMTP id h5-20020a056a00230500b006eabbff7561mr1262032pfh.11.1713397885278;
        Wed, 17 Apr 2024 16:51:25 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id kt19-20020a056a004bb300b006e5af565b1dsm235498pfb.201.2024.04.17.16.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:51:24 -0700 (PDT)
Date: Wed, 17 Apr 2024 16:51:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [palmer:for-next 27/30] arch/riscv/mm/cacheflush.c:168:37:
 error: 'mm_context_t' has no member named 'icache_stale_mask'
Message-ID: <ZiBgeosKlgEnpOuW@ghost>
References: <202404180621.qG7A9Tk0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404180621.qG7A9Tk0-lkp@intel.com>

On Thu, Apr 18, 2024 at 06:14:34AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
> head:   a76716f0ec75b9e7ac62d30854d690044c857684
> commit: 383289e4b071ca4c8c42e34567f3f267766f093c [27/30] riscv: Include riscv_set_icache_flush_ctx prctl
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404180621.qG7A9Tk0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.qG7A9Tk0-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>    arch/riscv/mm/cacheflush.c: In function 'set_icache_stale_mask':
> >> arch/riscv/mm/cacheflush.c:168:37: error: 'mm_context_t' has no member named 'icache_stale_mask'
>      168 |         mask = &current->mm->context.icache_stale_mask;
>          |                                     ^
>    arch/riscv/mm/cacheflush.c: At top level:
> >> arch/riscv/mm/cacheflush.c:157:13: warning: 'set_icache_stale_mask' defined but not used [-Wunused-function]
>      157 | static void set_icache_stale_mask(void)
>          |             ^~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +168 arch/riscv/mm/cacheflush.c
> 
>    156	
>  > 157	static void set_icache_stale_mask(void)
>    158	{
>    159		cpumask_t *mask;
>    160		bool stale_cpu;
>    161	
>    162		/*
>    163		 * Mark every other hart's icache as needing a flush for
>    164		 * this MM. Maintain the previous value of the current
>    165		 * cpu to handle the case when this function is called
>    166		 * concurrently on different harts.
>    167		 */
>  > 168		mask = &current->mm->context.icache_stale_mask;
>    169		stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
>    170	
>    171		cpumask_setall(mask);
>    172		assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
>    173	}
>    174	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I thought I tested this... Simple fix though, just need to guard this
function with CONFIG_SMP
https://lore.kernel.org/lkml/20240417-fix_nosmp_icache-v1-1-921a3c07d4ce@rivosinc.com/T/#u.

- Charlie

