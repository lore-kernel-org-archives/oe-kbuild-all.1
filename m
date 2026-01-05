Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D432F74B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604718; cv=none; b=ZZ76aqkzNrwy9TlFppVIhBM+9DaKto41JEdUm4rOtXrKyKvKEXmdJA8PoMK5Nv1NE11EZEn+4wMLbDQUeqial3NRdHeepx3x4bP2Ef9799RliVgHN/VXqVtVdbPPni6jC+43IhVxavE8Ot6p4AJB+5oWKHWr0M+cWJtFpyh6+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604718; c=relaxed/simple;
	bh=uDGBeze7Qp/kTrEFdck8KJs8Ay1ByYEFrUBaR72pN2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCaZgqkegi3UhBMeh3hDcidg4QLCdwBnyRODwap0VWtgdzkTwFK/l1GDMlogCJu+QvrzjdKNAX1XyPhVT62EW5GQoefx6f3y5m5LdQYn3x1PHNTs+3QXh0Jm01iKgpq6VT+qjrKtxnsId8DNOqvjxOZtLkQR1T4iG/SjqhLtwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cvmphz14; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cvmphz14"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so6956745e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767604715; x=1768209515; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtNuc23wxF7JVUYShxjAtkJq7LIq3vf9Fgku4TAxklw=;
        b=Cvmphz14khpuxuwc/HC8ktB+IRR69s1NYZF3NwxW3KHahw6TWF7OvCF4RWkGKiem4z
         EtCvZrw2WXgJptGZ3fH8WG/CP2Dl9ulcz/D097d8/Oela2ECx9J8HFsotaSXl0TwQ6BB
         4DALVAypAwmQrd+TeQt2X5NIMtFED4jnWNXatBZwBZ+Ke0o9GTArJXpvRYYSk8Vl8ZLM
         +717U0R291EEMGcEiWL5gFY1JDN2FKHqLodLLq7O0qMgJ77yDroP8bizZjrJzBtLLdw0
         TgU0pRN+YQqwEmVJGrmZOg6Amu37FQuBHmYAPKmYIGpeQepvKtv3/KUTRtgLqYHh6dbl
         MS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604715; x=1768209515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtNuc23wxF7JVUYShxjAtkJq7LIq3vf9Fgku4TAxklw=;
        b=g7YsUvOcCBznHN8xHxVNnHMLyELTKiYeavYaZKRkXOxxftz8Z5pZVY5x6RCQZ8h2fd
         77YSxuEzIFaPTIsyp5O/v7WSLDt89lQ4uHULKAZYJQ31AxDrqvtD1HDx4zk4jlAz6r7q
         63v833fJfniEV9AIOGpwEyVZWHMWCbs7AiwFp3hmJ6o8hqlx1SFl5e58QlPICs+NgPsP
         AW0LsTfz65I1ped7UtG64XmCTChPF5NmYUx2B5022UCwPfhnuRdYK0v3V9TDayfB1Mlb
         omt2yYIJFl6gKGeVFPb125sPkaMpACkkNk5zkCB3NNKncUlllVhnXk3fMysKPOYku5La
         N/UA==
X-Forwarded-Encrypted: i=1; AJvYcCVULDPbWEIFDHxTEbh7NhOjBKR+47r2Rg2+2Dy7B3vxu2BRVKOrplof8fcWbpYuYfjD1j9ab5dxi8rMVeJA@lists.linux.dev
X-Gm-Message-State: AOJu0YxPgyR41OjOntKcDdMqGcoWRthaZe7i8IovYLE+1vpOUSR7c/Uf
	sohq0paEciVf2OdpTVidOqKJ31V9dEt+bPscNS9RPj4QpHDe30hTxSVP0dVMs1Sk/wE=
X-Gm-Gg: AY/fxX4Q7f8godXDthshtAwilRPjzcVzAKc9BvSPM9f+xlUJxjRxn0kE2yCY5YQUmQI
	tUbM7Dj/InpZOrDuz0tgcQ6eBVHRrPhdeYDQxG+HHv1P8FsGO/G26AqZ+YtedWiLYdIIZu7cOCX
	yKUDRHQQHOehkcoh4SVBOsU6A3UAAhW/oHuWV53hcGMIGEogaiZY6q/wWSLT9iYaA5jbP2TEXNp
	hlD2zEek7VFi7yBReohXRozHp8p+530jv1SYl88GbRd6ZdMtGCtUJ4f9nNC5zWKY4s7uVmdVuIR
	i1yV0F7jeH8oG2JwlDYINlJBlAeWWnbO2eFqp9RDngjjAskq1kwrn34IIHwpnpN/+1FwHezJReb
	Yi7whIOdoWQ42diwbLVeTfBEXLB8sdDxJRRwIomZmAUFU7AztawkPSRpxhpDH+XfZL8KRjh79YF
	B52UyCzS6wIpNhWTnI
X-Google-Smtp-Source: AGHT+IHqgw6Mxl8sTdZ16+AchffquZvGMldLB07kEoKTUCIorvTuAsMEk24dXkoHkEOyG+JY9d7W7A==
X-Received: by 2002:a05:600c:46cb:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-47d6ba829c1mr95907355e9.8.1767604711605;
        Mon, 05 Jan 2026 01:18:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba30531sm57512165e9.1.2026.01.05.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:18:31 -0800 (PST)
Date: Mon, 5 Jan 2026 12:18:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 547/2671]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640
 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with
 state->initialized unset from line: 631
Message-ID: <aVuB5C1yvi-SE7hG@stanley.mountain>
References: <202512210334.ZRd8j65a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202512210334.ZRd8j65a-lkp@intel.com>

I have fixed this false positive.

https://github.com/error27/smatch/commit/d19c7ae6466cf1a0d54fb873e3089b03163a98a3

regards,
dan carpenter

On Sun, Dec 21, 2025 at 03:16:15AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Philipp Stanner <phasta@kernel.org>
> CC: "Christian König" <christian.koenig@amd.com>
> CC: Felix Kuehling <felix.kuehling@amd.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> commit: 06bc18e0def7d926265480faa555bf0b67a35a90 [547/2671] amd/amdkfd: Use dma_fence_check_and_signal()
> :::::: branch date: 2 days ago
> :::::: commit date: 2 weeks ago
> config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210334.ZRd8j65a-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202512210334.ZRd8j65a-lkp@intel.com/
> 
> New smatch warnings:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 631
> 
> Old smatch warnings:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:594 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 582
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:887 kfd_create_process() warn: Calling kobject_put|get with state->initialized unset from line: 877
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1999 signal_eviction_fence() warn: signedness bug returning '(-22)'
> 
> vim +640 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c
> 
> 4327bed2ff8e3d Philip Cox  2020-06-30  608  
> 751580b3ff9ac6 Philip Yang 2021-06-16  609  static void kfd_procfs_add_sysfs_counters(struct kfd_process *p)
> 751580b3ff9ac6 Philip Yang 2021-06-16  610  {
> 751580b3ff9ac6 Philip Yang 2021-06-16  611  	int ret = 0;
> 751580b3ff9ac6 Philip Yang 2021-06-16  612  	int i;
> 751580b3ff9ac6 Philip Yang 2021-06-16  613  	char counters_dir_filename[MAX_SYSFS_FILENAME_LEN];
> 751580b3ff9ac6 Philip Yang 2021-06-16  614  
> 751580b3ff9ac6 Philip Yang 2021-06-16  615  	if (!p || !p->kobj)
> 751580b3ff9ac6 Philip Yang 2021-06-16  616  		return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  617  
> 751580b3ff9ac6 Philip Yang 2021-06-16  618  	/*
> 751580b3ff9ac6 Philip Yang 2021-06-16  619  	 * Create sysfs files for each GPU which supports SVM
> 751580b3ff9ac6 Philip Yang 2021-06-16  620  	 * - proc/<pid>/counters_<gpuid>/
> 751580b3ff9ac6 Philip Yang 2021-06-16  621  	 * - proc/<pid>/counters_<gpuid>/faults
> 751580b3ff9ac6 Philip Yang 2021-06-16  622  	 * - proc/<pid>/counters_<gpuid>/page_in
> 751580b3ff9ac6 Philip Yang 2021-06-16  623  	 * - proc/<pid>/counters_<gpuid>/page_out
> 751580b3ff9ac6 Philip Yang 2021-06-16  624  	 */
> 751580b3ff9ac6 Philip Yang 2021-06-16  625  	for_each_set_bit(i, p->svms.bitmap_supported, p->n_pdds) {
> 751580b3ff9ac6 Philip Yang 2021-06-16  626  		struct kfd_process_device *pdd = p->pdds[i];
> 751580b3ff9ac6 Philip Yang 2021-06-16  627  		struct kobject *kobj_counters;
> 751580b3ff9ac6 Philip Yang 2021-06-16  628  
> 751580b3ff9ac6 Philip Yang 2021-06-16  629  		snprintf(counters_dir_filename, MAX_SYSFS_FILENAME_LEN,
> 751580b3ff9ac6 Philip Yang 2021-06-16  630  			"counters_%u", pdd->dev->id);
> 751580b3ff9ac6 Philip Yang 2021-06-16  631  		kobj_counters = kfd_alloc_struct(kobj_counters);
> 751580b3ff9ac6 Philip Yang 2021-06-16  632  		if (!kobj_counters)
> 751580b3ff9ac6 Philip Yang 2021-06-16  633  			return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  634  
> 751580b3ff9ac6 Philip Yang 2021-06-16  635  		ret = kobject_init_and_add(kobj_counters, &sysfs_counters_type,
> 751580b3ff9ac6 Philip Yang 2021-06-16  636  					   p->kobj, counters_dir_filename);
> 751580b3ff9ac6 Philip Yang 2021-06-16  637  		if (ret) {
> 751580b3ff9ac6 Philip Yang 2021-06-16  638  			pr_warn("Creating KFD proc/%s folder failed",
> 751580b3ff9ac6 Philip Yang 2021-06-16  639  				counters_dir_filename);
> 751580b3ff9ac6 Philip Yang 2021-06-16 @640  			kobject_put(kobj_counters);
> 751580b3ff9ac6 Philip Yang 2021-06-16  641  			return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  642  		}
> 751580b3ff9ac6 Philip Yang 2021-06-16  643  
> 751580b3ff9ac6 Philip Yang 2021-06-16  644  		pdd->kobj_counters = kobj_counters;
> 751580b3ff9ac6 Philip Yang 2021-06-16  645  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_faults,
> 751580b3ff9ac6 Philip Yang 2021-06-16  646  				      "faults");
> 751580b3ff9ac6 Philip Yang 2021-06-16  647  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_in,
> 751580b3ff9ac6 Philip Yang 2021-06-16  648  				      "page_in");
> 751580b3ff9ac6 Philip Yang 2021-06-16  649  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_out,
> 751580b3ff9ac6 Philip Yang 2021-06-16  650  				      "page_out");
> 751580b3ff9ac6 Philip Yang 2021-06-16  651  	}
> 751580b3ff9ac6 Philip Yang 2021-06-16  652  }
> 4327bed2ff8e3d Philip Cox  2020-06-30  653  
> 
> :::::: The code at line 640 was first introduced by commit
> :::::: 751580b3ff9ac6bf39da8586e132dbebee2409ef drm/amdkfd: add sysfs counters for vm fault and migration
> 
> :::::: TO: Philip Yang <Philip.Yang@amd.com>
> :::::: CC: Alex Deucher <alexander.deucher@amd.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
