Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A77367F24
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197144; cv=none; b=s72sluWJqceuoa3y0bqE3dMEbr3FoHQX2uWC5nFYnEivY/vWzDWFRt+f14G7gsMGyBrOdgbjlBwqEVV1Ca1+C01T66WkAyb/BSl4Xigk+8KQhbFPkGuWrHssXjPu+5WLcDYzU1oxj51XTqpxQt+tVdR7yE7/6OONlIZvfJt1A8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197144; c=relaxed/simple;
	bh=sfB6SZZUsG/4pFop9nPbJXi+ya9yBuo72RFii+WdciY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFeR1omyx0vRvJHt6vusRfT171UvAy1Jvpw0tGQ2GlOPs7xG2tUPyQWP+M7im25WsN49ckdF70rCLvqgHpxbYSg3MSmcYPRtb7IiaJ/KEm2QRgEqFD7QkkLzUcgkaJn4vw93aOmkvBeJ9F+bFoEOSDRyytCfPHTq1y08jWzZxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AogeJYNB; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AogeJYNB"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so69578605e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Feb 2026 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770197142; x=1770801942; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/Dwz60eN8t814Eadtkgm3VGTpt3HNP1bBhGTKSnFdw=;
        b=AogeJYNBNqEHYE3+9xeROUM1Dj7uHPVNzXrmJCzawLktc5nagxr7N3jI7BLDFn2SLt
         yj6af5O6+9OeUaMsSD2YG0wCYdsUeYiGGVsDYJj8K0UMYJ90gaX294WiKQCO49v03RpG
         DkN8uMeoynEQPaXNiUVUnUl3B0L5y89dzp157EELfdSWsNTYXv+9JbZVWvBhpWXGWEBV
         VqsFTlaqbfKAvgKQHixYDErq/AIFkzgsukdrB5U0Q8OsGNPU8VGotjC+2e9RopoEdlWS
         Wc8eNwOgEulD2Y+qns6CJnin7nE2ZVZQKOhvIE5ig3OyPY5pN5RK/WMADGFYvR3s8LxG
         lF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197142; x=1770801942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/Dwz60eN8t814Eadtkgm3VGTpt3HNP1bBhGTKSnFdw=;
        b=lZAUNvzeimLgl53YLzQiWQwV3E6K5rnM8hvsPJ6Iy56HnSIPvpC4GJN9uhYY+0R1Tj
         63NVSgGs/cHhrKdYoPYVq26EF76ERFESFuXLwsrmv2bjcS1C3S0jA+yQya8Nkoqu/Keb
         w0hIC69odi0NQ7rwK0pcunZDn1yp42IA8mM93GUpykqyNYDVUvvcnWL5jABnF/gCsopK
         2jfZrlLItJvddPcdAFkkvILtutU61jWxC3+gjMuKN2N9l2Jl47CybF4ha/vOJumrNk2A
         n5dPmUOkSi1cHpvsKN63f27l/JbRWGWkXISbKC7Q8KcUDn+PmCkx5/jZUHs+2r3087s7
         eapA==
X-Forwarded-Encrypted: i=1; AJvYcCVk7zixDv3Ql3vYK4uPzZKxxFwIgrhSzFzPHY/wcvPSUJB8kXx30MZAvAGeHsJ0duEwsub5v3GvlPchoVl8@lists.linux.dev
X-Gm-Message-State: AOJu0YzLzy0zlyIkT+CCwtRVG6rWwY7uZpNrK6yCAgdrMN+XsOGra19h
	Y/2dqJGr44vYTcq5cSNVwqAd7UeStzFekMLMkXiDEuTEy/KRD0NuT4ABphcR57aYiGs=
X-Gm-Gg: AZuq6aLt3Uogtn2RYG2BsS3hUBhy6rsCNOeV3jEQlNNZ51/riUvj7wT4Af4TYLdFAN7
	baZCOt30PUIehQ9jP/C+B1P0rntk3/SybuFNt0/RtKGRLAg7gZo685fKAVLIocwqdAZXkIgPGta
	eO2BlqKfdveX+EJTsqF2tMUbIVokb+5JIxya3zaxIVtjLTIyZthI9yuqC3iaJmJ34vLZPobG/EO
	T/3O75J6kna/t54k3B7ws7tA2pvsm6hZ/nhDf8E04c3lRlJ6fJDJGU3PxYF4ERDkGp211v2gXxd
	QPHQk6cWezuu2H8z1gThAWUZJDEGqwOOsd+hHMTYQdHqhcuw+RdYathA+4VhT/RXVzEA6uojUx+
	EohjazfJXquflqPIfAoNKdDKS+CQS8zcSrLpdetpDYxl/rMDaSB++QrPqgyY1oIkBlf8YdrbZPz
	vzeQiepIzF0x3X/LKn
X-Received: by 2002:a05:600c:4513:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-4830e97ae1emr30835985e9.23.1770197141948;
        Wed, 04 Feb 2026 01:25:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe7cb9csm19174065e9.8.2026.02.04.01.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:25:41 -0800 (PST)
Date: Wed, 4 Feb 2026 12:25:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, YiPeng Chai <YiPeng.Chai@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511
 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core'
 could be null (see line 507)
Message-ID: <202602031229.RI8PLyjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bd9ed02871f22beb0e50690b0c3caf457104f7c
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
config: s390-randconfig-r072-20260202 (https://download.01.org/0day-ci/archive/20260203/202602031229.RI8PLyjl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602031229.RI8PLyjl-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core' could be null (see line 507)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:530 ras_core_ras_interrupt_detected() error: we previously assumed 'ras_core' could be null (see line 526)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:210 ras_umc_log_pending_bad_bank() warn: variable dereferenced before check 'ecc_node' (see line 208)

vim +/ras_core +511 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

13c91b5b4378b5 YiPeng Chai 2025-03-17  505  uint64_t ras_core_get_utc_second_timestamp(struct ras_core_context *ras_core)
13c91b5b4378b5 YiPeng Chai 2025-03-17  506  {
13c91b5b4378b5 YiPeng Chai 2025-03-17 @507  	if (ras_core && ras_core->sys_fn &&
                                                    ^^^^^^^^
If ras_core is NULL

13c91b5b4378b5 YiPeng Chai 2025-03-17  508  		ras_core->sys_fn->get_utc_second_timestamp)
13c91b5b4378b5 YiPeng Chai 2025-03-17  509  		return ras_core->sys_fn->get_utc_second_timestamp(ras_core);
13c91b5b4378b5 YiPeng Chai 2025-03-17  510  
13c91b5b4378b5 YiPeng Chai 2025-03-17 @511  	RAS_DEV_ERR(ras_core->dev, "Failed to get system timestamp!\n");
                                                            ^^^^^^^^^^^^^
Then this will crash.

13c91b5b4378b5 YiPeng Chai 2025-03-17  512  	return 0;
13c91b5b4378b5 YiPeng Chai 2025-03-17  513  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  514  
13c91b5b4378b5 YiPeng Chai 2025-03-17  515  int ras_core_translate_soc_pa_and_bank(struct ras_core_context *ras_core,
13c91b5b4378b5 YiPeng Chai 2025-03-17  516  	uint64_t *soc_pa, struct umc_bank_addr *bank_addr, bool bank_to_pa)
13c91b5b4378b5 YiPeng Chai 2025-03-17  517  {
13c91b5b4378b5 YiPeng Chai 2025-03-17  518  	if (!ras_core || !soc_pa || !bank_addr)
13c91b5b4378b5 YiPeng Chai 2025-03-17  519  		return -EINVAL;
13c91b5b4378b5 YiPeng Chai 2025-03-17  520  
13c91b5b4378b5 YiPeng Chai 2025-03-17  521  	return ras_umc_translate_soc_pa_and_bank(ras_core, soc_pa, bank_addr, bank_to_pa);
13c91b5b4378b5 YiPeng Chai 2025-03-17  522  }
13c91b5b4378b5 YiPeng Chai 2025-03-17  523  
13c91b5b4378b5 YiPeng Chai 2025-03-17  524  bool ras_core_ras_interrupt_detected(struct ras_core_context *ras_core)
13c91b5b4378b5 YiPeng Chai 2025-03-17  525  {
13c91b5b4378b5 YiPeng Chai 2025-03-17 @526  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5 YiPeng Chai 2025-03-17  527  		ras_core->sys_fn->detect_ras_interrupt)
13c91b5b4378b5 YiPeng Chai 2025-03-17  528  		return ras_core->sys_fn->detect_ras_interrupt(ras_core);
13c91b5b4378b5 YiPeng Chai 2025-03-17  529  
13c91b5b4378b5 YiPeng Chai 2025-03-17 @530  	RAS_DEV_ERR(ras_core->dev, "Failed to detect ras interrupt!\n");
                                                            ^^^^^^^^^^^^^
Same.

13c91b5b4378b5 YiPeng Chai 2025-03-17  531  	return false;
13c91b5b4378b5 YiPeng Chai 2025-03-17  532  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

