Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE3A136352
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740469516; cv=none; b=BfSCY8WCuU7xSupA5UAz7kat/nSgFCNHQrvjba3j75XknNdUE6j0z+raBgX9yibzRCSySNylsa26VPoSt59WPrCxvFoZqFVBszlA1wHPbMGq/PyCcQowhPOxlX+lEdRNnT1+3kNygXXWLgaJu21sD5ez3mE8UCFIhBYr6d7gzVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740469516; c=relaxed/simple;
	bh=DZZzMoV08duZrjeXK9rB/asdhcFDyvHPLWy+QHsH+2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK+c35Zra/iiD91C3gl+x0Ri4bJ2JmQWvQCHsI3dNYKjKrNwBTy/docBwikIcf8fThHt3x9yojeeItAXca29nGK1bTwHcVWWUioX6+ejvgAqXLpOMMymsGxJBw2FwQnpIAotfLrSyHEyYbcHSbtbti/1dpaWw9jkfEWul1zrHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opI3lHk/; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opI3lHk/"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb90c20baeso677494066b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 23:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740469513; x=1741074313; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouvnF+Q3OmV1JA+hZygvXP5itVU3pOn09SLnIQdEu0w=;
        b=opI3lHk/yHZq0wdRVAMZWQ3+dGIjkO2ZVJnrDaJHX0mFoOtaakgD8V1EZCFOZSogyX
         yUg2gKNKpnfLr0hi2ae/71URUFDfxE9vfYyECcu2YalzizLkqUC+tu4AvwPz05Pgczg2
         c/N7suxbS1KYV2YBvRmgbj2gdNZjZEkewc14qSI0mAptn69hjeD+kw0DiLKDZp+RSe/c
         5NWnygmwUNi9wZEHizLkr6XlIHD7PsUcu3GuG8Ob5emXam93zD7ZfEmzU2RAON6qc1Nx
         L3Ckumws7yst2wTkb7mZh/JnJxIc+mzGX3w6mNa6iMHU7cPrcnc59cpXNZdIyn8Pb6sD
         fVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740469513; x=1741074313;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouvnF+Q3OmV1JA+hZygvXP5itVU3pOn09SLnIQdEu0w=;
        b=Miuwg2VmHr2zFRIjDEfkQPii6IAZlY1dYbrfMwIgeVwzvH43/b51cQoYaSHXcsk3oq
         c4vf24WVdtEfSC+zMpkDN3+eJLUVmSwi5akxLIUyauvQ4OTy2EYpggiDLWaXC9bOAQTZ
         redCxSrBazOHsqQTH9LD2AR+SofQe4DgsErrV2klLIaCFd/gsVY1km2YqWVm4TjFJry2
         BfM+Da9m2tVcWsBd20YeYDeF8iE+GLdeLV4Xi5DuXGM9HNewr9BN8ginW2InnD5Uztmx
         VRuaUN/KH6xVuWzObIPVy6hCwJsh3nUyG1i12RsM7SF+euaD1zt80PaNCVb3wMHc9Mvf
         jYzA==
X-Forwarded-Encrypted: i=1; AJvYcCWRqN9Ebj8JDbQnk9/6loPQh5bjr31HimuDesdJFWxQn7pxLRq9ygQwV4ALtySXUNzcj/C0NrqSbY8QJAQB@lists.linux.dev
X-Gm-Message-State: AOJu0YwJvawuxpbEcJnBv9lfkITZj5g+AQ4eZFa1nvdeHaDCMd7i8KTo
	iSoQBl1EMIUB1KqscRMx3ZGlHx9NXoGj5fnTtip8Ff3kKIvPlnUlcCsP3+WNL5A=
X-Gm-Gg: ASbGncuREpHIdXvOVqUA3a+vVSxPBgdO/2QOx0rR0FMn7uaXpgrhB0l3j/VpX5ktase
	MZT3Fe/j7QpgN3D8dWDKAp27NqOkIg6xPflQIcovVTQ6WQp2l0UigR2KXAdzCeu3p38lMd8DZEj
	WxnGxYSdZzWwJ6KKlmNaOnMl9lGTA6WNtJAOc/uQkb5xoBcrSPTY79C3iuZk+z8hNfGba9pQJmP
	jQpAAbrytIevFiGgXhKh4jssiUnynbw9GhgDz2rtORLVr+QzvEwMtMtNjX20VpGw35Y0X1d85jx
	N/tyIzNVZF25PtmVgtNgCDofPFJa2uI=
X-Google-Smtp-Source: AGHT+IHQ6l8bQnV+/gdQuNpdC0yeZuAkoJpxeyb9MOP/5NaXH5F2YZwMWml9JKfg21I8mnU0dGCQSA==
X-Received: by 2002:a17:906:3289:b0:abe:ce46:6226 with SMTP id a640c23a62f3a-abece4677a9mr264796466b.36.1740469512850;
        Mon, 24 Feb 2025 23:45:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2010f44sm94671966b.111.2025.02.24.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:45:12 -0800 (PST)
Date: Tue, 25 Feb 2025 10:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 1/1]
 drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c:328 ipu_psys_ppg_resume() warn:
 missing unwind goto?
Message-ID: <895433a6-269d-40db-9af6-0eb6402d2e06@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   37dbd8a8c2e99d2dc230a23b66250fcb4f26e9c0
commit: 2ef11ef12e26baa9bef7d9fc913f8e87a2d53c16 [1/1] CHROMIUM: ipu6: enable the psys downstream driver
config: x86_64-randconfig-161-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250645.LOy4jqQs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502250645.LOy4jqQs-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c:328 ipu_psys_ppg_resume() warn: missing unwind goto?
drivers/media/pci/intel/ipu6/psys/ipu-psys.c:1359 ipu6_psys_probe() warn: missing error code 'rval'

vim +328 drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c

7246d8ce30d62a5 Bingbu Cao 2024-12-03  285  int ipu_psys_ppg_resume(struct ipu_psys_ppg *kppg)
7246d8ce30d62a5 Bingbu Cao 2024-12-03  286  {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  287  	struct ipu_psys *psys = kppg->fh->psys;
8d5e92b8220938d Bingbu Cao 2024-12-03  288  	struct device *dev = &psys->adev->auxdev.dev;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  289  	struct ipu_psys_kcmd tmp_kcmd = {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  290  		.kpg = kppg->kpg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  291  		.fh = kppg->fh,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  292  	};
7246d8ce30d62a5 Bingbu Cao 2024-12-03  293  	int ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  294  
8d5e92b8220938d Bingbu Cao 2024-12-03  295  	dev_dbg(dev, "resume ppg id %d, addr 0x%p\n",
7246d8ce30d62a5 Bingbu Cao 2024-12-03  296  		ipu_fw_psys_pg_get_id(&tmp_kcmd), kppg);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  297  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  298  	kppg->state = PPG_STATE_RESUMING;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  299  	if (enable_suspend_resume) {
8d5e92b8220938d Bingbu Cao 2024-12-03  300  		ret = ipu_psys_allocate_resources(dev, kppg->kpg->pg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  301  						  kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  302  						  &kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  303  						  &psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  304  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  305  			dev_err(dev, "failed to allocate res\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  306  			return -EIO;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  307  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  308  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  309  		ret = ipu_fw_psys_ppg_resume(&tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  310  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  311  			dev_err(dev, "failed to resume ppg\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  312  			goto error;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  313  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  314  	} else {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  315  		kppg->kpg->pg->state = IPU_FW_PSYS_PROCESS_GROUP_READY;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  316  		ret = ipu_fw_psys_pg_submit(&tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  317  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  318  			dev_err(dev, "failed to submit kcmd!\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  319  			return ret;

Should these returns

7246d8ce30d62a5 Bingbu Cao 2024-12-03  320  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  321  
8d5e92b8220938d Bingbu Cao 2024-12-03  322  		ret = ipu_psys_allocate_resources(dev, kppg->kpg->pg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  323  						  kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  324  						  &kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  325  						  &psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  326  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  327  			dev_err(dev, "failed to allocate res\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03 @328  			return ret;


Be goto error;?

7246d8ce30d62a5 Bingbu Cao 2024-12-03  329  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  330  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  331  		ret = ipu_psys_kcmd_start(psys, &tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  332  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  333  			dev_err(dev, "failed to start kcmd!\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  334  			goto error;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  335  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  336  	}
8d5e92b8220938d Bingbu Cao 2024-12-03  337  	dev_dbg(dev, "s_change:%s: %p %d -> %d\n",
7246d8ce30d62a5 Bingbu Cao 2024-12-03  338  		__func__, kppg, kppg->state, PPG_STATE_RESUMED);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  339  	kppg->state = PPG_STATE_RESUMED;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  340  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  341  	return 0;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  342  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  343  error:
8d5e92b8220938d Bingbu Cao 2024-12-03  344  	ipu_psys_reset_process_cell(dev, kppg->kpg->pg, kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  345  				    kppg->kpg->pg->process_count);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  346  	ipu_psys_free_resources(&kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  347  				&psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  348  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  349  	return ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  350  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

