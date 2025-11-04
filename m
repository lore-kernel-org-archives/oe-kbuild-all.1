Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C7952F88
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251947; cv=none; b=LavwxJRxUkR1jTuPS2LvAzsofI5xd0pXDH9M9ss8Eg2+Y6mR2vzvw850N88Zsi4qYDWFAxjME57aTKRLpUyq34cXIkgag3Pb1DfvKGy8hPEmIyLkCBRrDCTVtP7QQyOyiDtBAApo5g2WYzb3fWxv7pwU5tFY01xs1ce/7le/jWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251947; c=relaxed/simple;
	bh=Cm3qLhFb5v2wrycZ1jgwXerBwfggytM325tJN2l2PlI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FDBMcSkdy4qb006vPczfm2MBmsCFIvFeoIcJ1Ox5+aQV+xcvlQk7qgtdVZ0A6QpohVBL8L4DqccklSCFxUcosDVMIRdabb/E0BHZNkWp9PpGhqwWz0WWns79GKE5ExSXnhpzRa3Tyi6/xqNt7T5xrcg+SyTvBm5JXlUZT0sk/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWWxRBKY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWWxRBKY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ac10f4ce46so104683b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Nov 2025 02:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762251945; x=1762856745; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqlzX9rNH4gINbOWoGPGbVbDgYd2hfLpjepAFuU9mCc=;
        b=NWWxRBKYwRUsC5dmx5tTbHu5+3xmNJSrwO5qBACw4nQHkur54KfpXpamLclIw/4F2D
         xV+5AUcLpHHizKF/jn32rySWD9ZAUencyOIqZGMpc2ILVHzqZDF0dDrRcpQYD7Dm3tVp
         /sCN0bInozbOn87/aGscETvst/6CiJ8axSN6KNinVThI1etAEfeDpuFc1IMiLzaQhk4B
         OW5kg/t4Jd7JUXYHhQ5HFRHzZiNn4bmGUQdDpHvYr1ixMaYjwMcFNejmFANQ/LQXmVBO
         1fnXhl9EUE5a1ewYgkzU3BRJYRacd3bhxMqgcqG++HkyvS30Rtz32/XUZy6xcrgU4hvn
         l3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251945; x=1762856745;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qqlzX9rNH4gINbOWoGPGbVbDgYd2hfLpjepAFuU9mCc=;
        b=GpNQzMFXzu6oxx3bBfICq+wr5a4YPsYlGGTOR64VBK5KWcs1zEsW7d3j7NNKXLlEhM
         sTv6GbYh9YPIk9AAEd1vwO84CcZI7G1e/f7p5XfxH4ew1L2rcOiDhrn5NRLhByx/8VhO
         ajVvaUQCzOG4THNIcXD0aGFOg2Ws6Ov1uauGwSmsX5iuJGGY02GRSHkEeEozvbApbj3w
         35CBdpiNJLBYwpbLnhe4Bj/lfVnOegWUUZxHP/W4oXDRv5rOpqw1Tsv+alIwyuFE9blN
         gUMhDMtk7AhFzBv/Z2KLzpnHV5E6bZhPqPv6573DNYE9Kk10uUS+xI306TBIVDEulaFu
         Gidg==
X-Forwarded-Encrypted: i=1; AJvYcCVtI4Tg2xXVynlZwdUUfltEA+15ae1bKqqcBl97KhJbcJzyt0WNbZMdtk4BdsaEN3QBMnV/inOfDB0h2xVS@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi4X/Y/IOaAsRCTXpSMvL0yOwXbsVd73bF9CVDFI9J135sFbzT
	Xvn5BcGlROcR3OH6BTkgtKLYLqfC82fi7uPweuqB5/AY1n+iD+kN56UI
X-Gm-Gg: ASbGncsBlmkTOMdH7fuIaRL1x0gZyUHdOHYy7ePQ2ZQ5pV3hpAJgOXsPMlDZOskKFFh
	TmDVEu+hnmLsuZTqtNJEf7S2DYXeysrJ/mbp83UWr7GAUDrObS60CeKjig3p8AjEePWLpJdGP+b
	6BpQFQqkCyOvjtr/jDXqQyHmB72VG26NxCLJYmf6ztflHEdg8F1Mbw+hI34SmPLq8auoZiotQbo
	JrEIdqotbUTPe8ieZjN6Z6Q7BSu5BTTbD1eJ3YcgdZjCu3YGGD1dla+ACn+hBvAiNKED5caecPk
	a3MNmQ5lgYSc8k6LbbiTIS4wQET0LIGTUH0gVC+rlzEmd/YirdSLbXYWloheJ43y7Q9SLuKp8LZ
	sHJwyarhYJ8ioe8aEfZ2L/4862OOm9eGRoglZLOPrduV9OTQfFfPD98fZqcFU5cWhzHifEOg/3p
	IxrIRKLzX98u5rMMRXYIvRxGw=
X-Google-Smtp-Source: AGHT+IHDcWGSLhPsiYZ9igaLe15T/ARSOT7S/Twm+Dk8rVyH8X95Nc9cOMQBR0AMK5VwYTcmStBVGw==
X-Received: by 2002:a05:6a00:2d98:b0:7aa:e4b6:b30b with SMTP id d2e1a72fcca58-7aae4b6b66cmr4756437b3a.0.1762251945452;
        Tue, 04 Nov 2025 02:25:45 -0800 (PST)
Received: from [192.168.0.100] ([163.125.164.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824373sm2406310b3a.62.2025.11.04.02.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:25:45 -0800 (PST)
Message-ID: <cd47b744-975a-4a98-bf5b-c876539e2c05@gmail.com>
Date: Tue, 4 Nov 2025 18:25:40 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, oe-kbuild-all@lists.linux.dev,
 Will Deacon <will@kernel.org>
Subject: Re: [arm-perf:for-next/perf 1/8] drivers/perf/arm_pmu.c:932:24:
 error: implicit declaration of function 'topology_core_has_smt'; did you mean
 'topology_core_cpumask'?
To: kernel test robot <lkp@intel.com>
References: <202511041757.vuCGOmFc-lkp@intel.com>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <202511041757.vuCGOmFc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/11/4 17:22, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
> head:   989b40b7578a2be7b0388522d33d751b257d59d9
> commit: c3d78c34ad009a7cce57ae5b5c93e1bd03bb31a3 [1/8] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
> config: arm-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041757.vuCGOmFc-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041757.vuCGOmFc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/perf/arm_pmu.c: In function 'armpmu_register':
>>> drivers/perf/arm_pmu.c:932:24: error: implicit declaration of function 'topology_core_has_smt'; did you mean 'topology_core_cpumask'? [-Wimplicit-function-declaration]
>      932 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>          |                        ^~~~~~~~~~~~~~~~~~~~~
>          |                        topology_core_cpumask
>

Checked the config used the issue is due to GENERIC_ARCH_TOPOLOGY not selected.
unlike arm64 which selects GENERIC_ARCH_TOPOLOGY unconditionally, ARM select it only if
ARM_CPU_TOPOLOGY is selected, which depends on SMP && CPU_V7. so this need to be
protected by CONFIG_GENERIC_ARCH_TOPOLOGY, will send a fix.

> vim +932 drivers/perf/arm_pmu.c
>
>    919	
>    920	int armpmu_register(struct arm_pmu *pmu)
>    921	{
>    922		int ret;
>    923	
>    924		ret = cpu_pmu_init(pmu);
>    925		if (ret)
>    926			return ret;
>    927	
>    928		/*
>    929		 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>    930		 * detect the SMT implementation.
>    931		 */
>  > 932		pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>    933	
>    934		if (!pmu->set_event_filter)
>    935			pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
>    936	
>    937		ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
>    938		if (ret)
>    939			goto out_destroy;
>    940	
>    941		pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
>    942			pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
>    943			ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
>    944			has_nmi ? ", using NMIs" : "");
>    945	
>    946		kvm_host_pmu_init(pmu);
>    947	
>    948		return 0;
>    949	
>    950	out_destroy:
>    951		cpu_pmu_destroy(pmu);
>    952		return ret;
>    953	}
>    954	
>

