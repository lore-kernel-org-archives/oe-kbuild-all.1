Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AC19E82A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761150296; cv=none; b=EW2eNnyKegew6JFqFbztws1UwiereLDQ8HBvuOA4Jo/Od93APcv25pDhIrBSIv55HHeUFyUbE84vzB3YtAojxJpX03tgqfR4l1rtixvjXTrk4pOgbtHfrROCDFATiH/anJ5DfXr6ie0WyYMZtfU/nliJvG8CnzVTpPIi1uM+vjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761150296; c=relaxed/simple;
	bh=EDdZFI/35s+UAqN9EyBmUGTWev1l7J3BZf9LQvbi2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q19i56JKQOsHE4qEJb/cRdqkGTiuqDupNO+p9R9QGf2HLmfNMOTPowpBd2l5WtDrq/Lc5RN2HUyJWVksz1BJp+ZXi15CvZAcPC08G5hE0RfBULYAFsaJ8WkeQ6z5l49S2eyqi8BRG/hfbnKztChhSDXhbrm52hT+pq5kpdGj33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcMOWg+C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcMOWg+C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711f156326so56289055e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761150293; x=1761755093; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2Fdjr7hxlZxG70XERQeTfbA/EUhHrvfUgPY/9BUlZk=;
        b=FcMOWg+CpGe4OBbCogGK1xDOC9YoRiBZHOLZcZWna23scvGqZDBV/8qGTUWGWbMDou
         n0YCIoHoKSHs6mkhetgareiUc7qpSGnUAn8JawYdEVtfgQ/0tQ1MbmapicaBNrhQV/Eq
         1EJUTs585ABKndTIesMpPZ6wmRD0kfS3TJGrAfxrJBOQI5wl8K1tM+KGqZghLK4q/QQt
         wJSEBCiZZPVk0SDt+eyB27mqSIHNoH+wAj3SSgxDdNKA2ZxOgXqDoHerryJEKht9KfUK
         t4mqDBI4+hpCJGscXhNUkcqcOepnKjyXORlUJLkAmLw92AVDBLHKKWve4KXmmFQgDYFg
         2fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150293; x=1761755093;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2Fdjr7hxlZxG70XERQeTfbA/EUhHrvfUgPY/9BUlZk=;
        b=epTYuXPp4W8KGPvjdCxV4f4q8u8UR13cPJXXcsqWpXxV4tdrCrrldNsWQlojmXhsnw
         oqHjdji/xViVsQ9Wz4dFX8UzsA2QQAe3lRN1+pxM/PPQDHn8UQKg7BfjEntjkq5augMN
         y5rGR3VUMCtsT1BMdklWCzIcq8Mp0EgwDHz4xJh88u0bLUUoflBWe+LY41lqZo1oZZtb
         tGWObDL078EOhhaGsqU+E/J0Zn8jn1cSXINVxcBcrQ2y/Gcw7okwunziMn2AAHkxE9A/
         CxI9c3gtXp/7CFaWIPW8WsGx7ad1Vqsx/SGhZhyVoCozY2Y9q1Q1/3UdNXroqbh75Q7t
         zLBg==
X-Forwarded-Encrypted: i=1; AJvYcCVNUz6KjH3iVkj0th3F2NtfhwNtXvip9jT2dVzUDn/qIOLNU6APpK7ydMiA4QObK3r+HQ6UzyCCOAKI448U@lists.linux.dev
X-Gm-Message-State: AOJu0YxVnsQWg4O/6EhsHKJjkq9R/WtFUSxQWaQ6uWmQaYFSzshcT6vh
	yqMzrqyi7VzEVBfzXAD+GPiDVt5v2kz457Phgf8on9kjm6b2hBAFySv5FpdUX9FqCH0=
X-Gm-Gg: ASbGncvlHIdul8nTCpmQWNCqNcYtFwcU83dAGGPsxYzG7pqWPDPR6fCe3xT3jmdytXs
	DBphCFs7EGTaAdl2tjvnGwqw44gb0zN3FSTTA+bhyMLCzn5tUL0yyilXisbnlvgMhDYb6mrBEAU
	chhyN/DwzAis6F3kHai6ypmQ/+D/mFRLZL6+Gec6ShzreylZcGo3zxjsPm5tmUZTT0x3rXyyaxg
	v0Ilu9mnd7LK8NYBen1PztEqIdJ7wAvbzqHRflrHJfW+hTF6Lc+431EitQhjvO8Lr1EDvN5NEFT
	qvYsB1m05jVJGOYJHaUECMORHPnKkrTPSFWcCn4hJHpzCxsMG/2dAbxrLQCoDL5GgXJevbQHm4E
	G5I2NcTBJm6SrnoioTz5oS7JdTh/H3jPNR2d5Gf+VR+Ao3I3m4lLIJTnh6GelCOzokLW5egxV30
	A5ad6ytw==
X-Google-Smtp-Source: AGHT+IFEuIkx5E0TBMkcE9SsKVifCPtetGiK2sYrfe10FV0nlHPydwtYDJmhl+LszP9Cff9KsaTeuQ==
X-Received: by 2002:a05:6000:2f83:b0:3c7:df1d:3d9 with SMTP id ffacd0b85a97d-42704d99325mr15578287f8f.39.1761150292829;
        Wed, 22 Oct 2025 09:24:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5a0ec2sm25747381f8f.3.2025.10.22.09.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 09:24:52 -0700 (PDT)
Date: Wed, 22 Oct 2025 19:24:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, YiPeng Chai <YiPeng.Chai@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 1181/3483]
 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511
 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core'
 could be null (see line 507)
Message-ID: <202510222308.6LSfjKDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: ace232eff50e8c898103c56b3b5303e776616274 [1181/3483] drm/amdgpu: Add ras module files into amdgpu
config: x86_64-randconfig-161-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222308.6LSfjKDk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510222308.6LSfjKDk-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:511 ras_core_get_utc_second_timestamp() error: we previously assumed 'ras_core' could be null (see line 507)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c:530 ras_core_ras_interrupt_detected() error: we previously assumed 'ras_core' could be null (see line 526)
drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:210 ras_umc_log_pending_bad_bank() warn: variable dereferenced before check 'ecc_node' (see line 208)

vim +/ras_core +511 drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_core.c

13c91b5b4378b5d YiPeng Chai 2025-03-17  505  uint64_t ras_core_get_utc_second_timestamp(struct ras_core_context *ras_core)
13c91b5b4378b5d YiPeng Chai 2025-03-17  506  {
13c91b5b4378b5d YiPeng Chai 2025-03-17 @507  	if (ras_core && ras_core->sys_fn &&
                                                    ^^^^^^^^
Check for NULL

13c91b5b4378b5d YiPeng Chai 2025-03-17  508  		ras_core->sys_fn->get_utc_second_timestamp)
13c91b5b4378b5d YiPeng Chai 2025-03-17  509  		return ras_core->sys_fn->get_utc_second_timestamp(ras_core);
13c91b5b4378b5d YiPeng Chai 2025-03-17  510  
13c91b5b4378b5d YiPeng Chai 2025-03-17 @511  	RAS_DEV_ERR(ras_core->dev, "Failed to get system timestamp!\n");
                                                            ^^^^^^^^^^^^^
Unchecked dereference

13c91b5b4378b5d YiPeng Chai 2025-03-17  512  	return 0;
13c91b5b4378b5d YiPeng Chai 2025-03-17  513  }
13c91b5b4378b5d YiPeng Chai 2025-03-17  514  
13c91b5b4378b5d YiPeng Chai 2025-03-17  515  int ras_core_translate_soc_pa_and_bank(struct ras_core_context *ras_core,
13c91b5b4378b5d YiPeng Chai 2025-03-17  516  	uint64_t *soc_pa, struct umc_bank_addr *bank_addr, bool bank_to_pa)
13c91b5b4378b5d YiPeng Chai 2025-03-17  517  {
13c91b5b4378b5d YiPeng Chai 2025-03-17  518  	if (!ras_core || !soc_pa || !bank_addr)
13c91b5b4378b5d YiPeng Chai 2025-03-17  519  		return -EINVAL;
13c91b5b4378b5d YiPeng Chai 2025-03-17  520  
13c91b5b4378b5d YiPeng Chai 2025-03-17  521  	return ras_umc_translate_soc_pa_and_bank(ras_core, soc_pa, bank_addr, bank_to_pa);
13c91b5b4378b5d YiPeng Chai 2025-03-17  522  }
13c91b5b4378b5d YiPeng Chai 2025-03-17  523  
13c91b5b4378b5d YiPeng Chai 2025-03-17  524  bool ras_core_ras_interrupt_detected(struct ras_core_context *ras_core)
13c91b5b4378b5d YiPeng Chai 2025-03-17  525  {
13c91b5b4378b5d YiPeng Chai 2025-03-17 @526  	if (ras_core && ras_core->sys_fn &&
13c91b5b4378b5d YiPeng Chai 2025-03-17  527  		ras_core->sys_fn->detect_ras_interrupt)
13c91b5b4378b5d YiPeng Chai 2025-03-17  528  		return ras_core->sys_fn->detect_ras_interrupt(ras_core);
13c91b5b4378b5d YiPeng Chai 2025-03-17  529  
13c91b5b4378b5d YiPeng Chai 2025-03-17 @530  	RAS_DEV_ERR(ras_core->dev, "Failed to detect ras interrupt!\n");

Same.

13c91b5b4378b5d YiPeng Chai 2025-03-17  531  	return false;
13c91b5b4378b5d YiPeng Chai 2025-03-17  532  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

