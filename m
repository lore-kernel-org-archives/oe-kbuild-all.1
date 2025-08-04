Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACC01BCA0E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754289949; cv=none; b=rlroYJ/g11EBCLhZ6B6dU3hTbjKiWMIFDDmJWrzCaxuzEPDOESomMofoMOW09JJAHtumhDCKpRIYc29rwHOC2CoPv0PdTbnMf/u2tIPw2RUKvlP89MlO9O/9vbLgRDOh7mJ1uxiwym6yd2Tm3YagmjUxSgWkUof7sa+kr3HaiwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754289949; c=relaxed/simple;
	bh=V95TNGWTQ3FAGUrd0BOQSJDQnUNHkx6N9o1I5C7acyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evixWqsDh3Cki/ExBVgq8IkNdZpJMi+2nTfro1FXW3RxJV8QPZBf9FSGFe9+RXtHK9h5J926V620Qb7L+HGBIw99ZUIn0yKRt0YQU4OH3d25v+3auyJtiftdFa1e7wIjpQZzc9BtSY+GgXsPDkrkJgoHIXE8feUrlkmXTr7Kt1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RL91ayZa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RL91ayZa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso10177775e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 03 Aug 2025 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754289946; x=1754894746; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYKXxcstqX/InMeIiInqL4OvYpNRkSL2LGKBVtl/u4Q=;
        b=RL91ayZasgEAVcTFYQvlAP8NtI1eY458iY5tMVw7ZDv7xySrqkAzPWspyVr5R4Myok
         B1gFmNqcaJh9eRu/CfTf8WPr8wx1VoQRDnYPoBEdgjLh6PIJVCWBoyf/ekKkuuspLEG4
         gbXTx2MQNabktBxsTnprrO3Nu0U3aMOYXGRopRj2vjmgq/dgjZZVgvz47qq3Z2RLMCZj
         2EweHolVo1tcncg8W9DV8ZS+VEiCqzCJHU2i1NYHSWRpzlOB4KU1uMUoajWqp2vPlaXB
         8oJQlUdE+VhkzLL83GRYHRtAMPXseNKsiKBL9jHJ+nA/C63RnZXG/+x04JRNMNte98Lf
         IFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754289946; x=1754894746;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYKXxcstqX/InMeIiInqL4OvYpNRkSL2LGKBVtl/u4Q=;
        b=oK317EhrSwOS1C6yaa9TN3RTsM8zgIiatrJf1rhvvTyJb1LHmdsuReePDmZXcBRV15
         K6uepupewCJ2yWbzOkWfCxGaMce1ysIRYgKx4m/YWHQ6Yx4gWBLCJRhyZIMcnYCGMf7+
         uIVAOCMo1dT0iMPDeRW2q+chGK8bQGg+f9aqH+RNrI3gOxXGtvgJQ0lcwNI1NhLqN3SL
         Y5TeZfK4l88Fu8rUmNwiOV754wrUQmv9dPqQ6cD6aSdWfn1jdGttOw/qUZSUdl3/hWaU
         10Og6lU+MYLpF5m3QyRdBhxEVSJWHDl00RZ2R3XRF8IMj+2BIwShwu4ZPd0Zy0dvZaox
         cMbw==
X-Forwarded-Encrypted: i=1; AJvYcCV89BS/tEePGxaFHyu21mIhCXyRTe3u/mRgX/m+uTvyAAYZW+ex94WRUaKiGVa8kkGMELEEWPJ342kzOp3f@lists.linux.dev
X-Gm-Message-State: AOJu0Yytd8hGs7ypczd88S9CO0Rh87dAtuf0DFL6PB+OKlQvhwuVXmEj
	Y5w/XyFs6mo4fbQJsOQUH5F/XfhWTNdoHpnO4ms95S2OL5mIf8iRvN5gKQHu1oeq1QPL/j/HqI3
	7tO32
X-Gm-Gg: ASbGnct0ysBQYQzLl97np/pcCtgHCRQYUXHHg2SsJw2OjbaCGcXNWjDlQcpa1F03NT1
	8xHtY8ARhuYWH3Ls8VwWpdt6+v8yEDnnyCwhvmYXKO0s9htpgeo7eQ21ukpnxD1KqqL0ytBnj40
	TkxMS9Dm/ciL/WAC+g+/dtQJY+jrghZjfZ6zF7ryuARb4GcAwXPKv1nhb3JE6Gm0jbTSuWvmrJQ
	ORLrjkDXGDucxvRzqmpv0fxwnaJNLxutl16n3dTSF698Ohhobajd4NTlPMg22/zvLVZPmh7ND0u
	SZsarBThGiGykKE2hpVa/ZF9uzU3KAv7vXXkUpN/PNtkb5Ikchl0xosa+0fG9xo20f1EwKUdWpF
	6E/uujB9MFOTCB1ODY3lBw3czUpd5cNFGUtr4MA==
X-Google-Smtp-Source: AGHT+IGLA4nml17KRiuHMJui+Zj6HGIOIXZfag0+Tqr5iyGmGsdPd6he5Xej7lWoDiI41oko5knzZg==
X-Received: by 2002:a05:600c:3b9a:b0:459:443e:b177 with SMTP id 5b1f17b1804b1-459443eb2bcmr24510005e9.25.1754289945751;
        Sun, 03 Aug 2025 23:45:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac115sm14423115f8f.12.2025.08.03.23.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:45:45 -0700 (PDT)
Date: Mon, 4 Aug 2025 09:45:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, Bin Du <bin.du@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:126 isp_genpd_add_device()
 warn: can 'pdev' even be NULL?
Message-ID: <b49ba0c5-4942-42eb-bc63-bc9d4fc49d83@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a6923c06a3b2e2c534ae28c53a7531e76cc95cfa
commit: fd14786071021bb63b0ab32b95257a594e46f8d4 drm/amd/amdgpu: Add ISP Generic PM Domain (genpd) support
config: x86_64-randconfig-161-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021712.RXyDnVIn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508021712.RXyDnVIn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:126 isp_genpd_add_device() warn: can 'pdev' even be NULL?
drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c:159 isp_genpd_remove_device() warn: can 'pdev' even be NULL?

vim +/pdev +126 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c

fd14786071021b Pratap Nirujogi 2025-05-29  118  static int isp_genpd_add_device(struct device *dev, void *data)
fd14786071021b Pratap Nirujogi 2025-05-29  119  {
fd14786071021b Pratap Nirujogi 2025-05-29  120  	struct generic_pm_domain *gpd = data;
fd14786071021b Pratap Nirujogi 2025-05-29  121  	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  122  	struct amdgpu_isp *isp = container_of(gpd, struct amdgpu_isp, ispgpd);
fd14786071021b Pratap Nirujogi 2025-05-29  123  	struct amdgpu_device *adev = isp->adev;
fd14786071021b Pratap Nirujogi 2025-05-29  124  	int ret;
fd14786071021b Pratap Nirujogi 2025-05-29  125  
fd14786071021b Pratap Nirujogi 2025-05-29 @126  	if (!pdev)

pdev can't be NULL.  It's dev minus a non-zero offset.  Just delete
this check.

fd14786071021b Pratap Nirujogi 2025-05-29  127  		return -EINVAL;
fd14786071021b Pratap Nirujogi 2025-05-29  128  
fd14786071021b Pratap Nirujogi 2025-05-29  129  	if (!dev->type->name) {
fd14786071021b Pratap Nirujogi 2025-05-29  130  		drm_dbg(&adev->ddev, "Invalid device type to add\n");
fd14786071021b Pratap Nirujogi 2025-05-29  131  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  132  	}
fd14786071021b Pratap Nirujogi 2025-05-29  133  
fd14786071021b Pratap Nirujogi 2025-05-29  134  	if (strcmp(dev->type->name, "mfd_device")) {
fd14786071021b Pratap Nirujogi 2025-05-29  135  		drm_dbg(&adev->ddev, "Invalid isp mfd device %s to add\n", pdev->mfd_cell->name);
fd14786071021b Pratap Nirujogi 2025-05-29  136  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  137  	}
fd14786071021b Pratap Nirujogi 2025-05-29  138  
fd14786071021b Pratap Nirujogi 2025-05-29  139  	ret = pm_genpd_add_device(gpd, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  140  	if (ret) {
fd14786071021b Pratap Nirujogi 2025-05-29  141  		drm_err(&adev->ddev, "Failed to add dev %s to genpd %d\n",
fd14786071021b Pratap Nirujogi 2025-05-29  142  			pdev->mfd_cell->name, ret);
fd14786071021b Pratap Nirujogi 2025-05-29  143  		return -ENODEV;
fd14786071021b Pratap Nirujogi 2025-05-29  144  	}
fd14786071021b Pratap Nirujogi 2025-05-29  145  
fd14786071021b Pratap Nirujogi 2025-05-29  146  exit:
fd14786071021b Pratap Nirujogi 2025-05-29  147  	/* Continue to add */
fd14786071021b Pratap Nirujogi 2025-05-29  148  	return 0;
fd14786071021b Pratap Nirujogi 2025-05-29  149  }
fd14786071021b Pratap Nirujogi 2025-05-29  150  
fd14786071021b Pratap Nirujogi 2025-05-29  151  static int isp_genpd_remove_device(struct device *dev, void *data)
fd14786071021b Pratap Nirujogi 2025-05-29  152  {
fd14786071021b Pratap Nirujogi 2025-05-29  153  	struct generic_pm_domain *gpd = data;
fd14786071021b Pratap Nirujogi 2025-05-29  154  	struct platform_device *pdev = container_of(dev, struct platform_device, dev);
fd14786071021b Pratap Nirujogi 2025-05-29  155  	struct amdgpu_isp *isp = container_of(gpd, struct amdgpu_isp, ispgpd);
fd14786071021b Pratap Nirujogi 2025-05-29  156  	struct amdgpu_device *adev = isp->adev;
fd14786071021b Pratap Nirujogi 2025-05-29  157  	int ret;
fd14786071021b Pratap Nirujogi 2025-05-29  158  
fd14786071021b Pratap Nirujogi 2025-05-29 @159  	if (!pdev)
fd14786071021b Pratap Nirujogi 2025-05-29  160  		return -EINVAL;
fd14786071021b Pratap Nirujogi 2025-05-29  161  
fd14786071021b Pratap Nirujogi 2025-05-29  162  	if (!dev->type->name) {
fd14786071021b Pratap Nirujogi 2025-05-29  163  		drm_dbg(&adev->ddev, "Invalid device type to remove\n");
fd14786071021b Pratap Nirujogi 2025-05-29  164  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  165  	}
fd14786071021b Pratap Nirujogi 2025-05-29  166  
fd14786071021b Pratap Nirujogi 2025-05-29  167  	if (strcmp(dev->type->name, "mfd_device")) {
fd14786071021b Pratap Nirujogi 2025-05-29  168  		drm_dbg(&adev->ddev, "Invalid isp mfd device %s to remove\n",
fd14786071021b Pratap Nirujogi 2025-05-29  169  			pdev->mfd_cell->name);
fd14786071021b Pratap Nirujogi 2025-05-29  170  		goto exit;
fd14786071021b Pratap Nirujogi 2025-05-29  171  	}
fd14786071021b Pratap Nirujogi 2025-05-29  172  
fd14786071021b Pratap Nirujogi 2025-05-29  173  	ret = pm_genpd_remove_device(dev);
fd14786071021b Pratap Nirujogi 2025-05-29  174  	if (ret) {
fd14786071021b Pratap Nirujogi 2025-05-29  175  		drm_err(&adev->ddev, "Failed to remove dev from genpd %d\n", ret);
fd14786071021b Pratap Nirujogi 2025-05-29  176  		return -ENODEV;
fd14786071021b Pratap Nirujogi 2025-05-29  177  	}
fd14786071021b Pratap Nirujogi 2025-05-29  178  
fd14786071021b Pratap Nirujogi 2025-05-29  179  exit:
fd14786071021b Pratap Nirujogi 2025-05-29  180  	/* Continue to remove */
fd14786071021b Pratap Nirujogi 2025-05-29  181  	return 0;
fd14786071021b Pratap Nirujogi 2025-05-29  182  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

