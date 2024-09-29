Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7417C230
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727629424; cv=none; b=X1kkbr3V8AU6+++L0yjRP5qALJsIgTZvPp0st7T2DTl5Yz7udoc12tx+IGTUWZhFNLABIzgXVJ79EskPUbDUnsEe1Mj9UwPUsaYMOpB7Ic+Ddg156+kv/gZMyOX88izHGoGETNrLzZgbhvF/obUfE8T3GVIGgJU+Uy93pGApUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727629424; c=relaxed/simple;
	bh=id7c42YZjq91jQ25bwcP27nUkMaC82AMHSYmc/Fl9LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCoDMKHGNMfr1G0PJ3XkTQrdVNlgHUUhNC7UwW905NfCylW6CbzQ8EgT7p57ks3QsQ0FMejYoIUCKY/M5MGItDxePggrS3nkx7QB3TpE+mMJMIjUkiTW5Ewxf5vlXvOgv6N+bFBAnAPp6VKDkOJonlj0BIKT3dpeqd/D1S9rFx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTBsqtFN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTBsqtFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727629423; x=1759165423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=id7c42YZjq91jQ25bwcP27nUkMaC82AMHSYmc/Fl9LA=;
  b=RTBsqtFNuogIl78zU1lm2dZm3AQ3YrW/Ubopj6FW6CCNPvqxiz4BCvpZ
   AVMkkZnirdRZy/t7QgbLI83Cfty0RSlXhHxah9pMRG2pGhWaO2U+HIv6a
   bxX371AEiH6cN52eYVPefBd3A06vYkLMq6dTq2vJ6kyhCBWReSSXQpK0O
   M7C2cUaeKWNTRCL5S5uuZC96XhW66pOoGBG7zWXAqkD8FdMxhHP7SnPTQ
   eG7Aj6muawOGzw2NvUy6sZPMVlWFpOh28EyUBbRT0K0vAJFrue29xNR4T
   ADRCFQM6YXGOslwkId4ZhgSSHMf5osaTFYj4klJcvHf5mUZrqPUsBTsYL
   g==;
X-CSE-ConnectionGUID: 1jflNgOUQL+SCFqIo9RUfA==
X-CSE-MsgGUID: yYC72PxYTz2w0ZvhANTHPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44178710"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="44178710"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:03:42 -0700
X-CSE-ConnectionGUID: jqO9y6JsSkq0ODBm8A7lag==
X-CSE-MsgGUID: cZEKvLy1ROy8ucvrZVgzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="110545331"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 10:03:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxKb-000OTw-1f;
	Sun, 29 Sep 2024 17:03:37 +0000
Date: Mon, 30 Sep 2024 01:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yihang Li <liyihang9@huawei.com>, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	linuxarm@huawei.com, liyihang9@huawei.com
Subject: Re: [PATCH 03/13] scsi: hisi_sas: Add firmware information check
Message-ID: <202409300042.USclhodY-lkp@intel.com>
References: <20240926014332.3905399-4-liyihang9@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926014332.3905399-4-liyihang9@huawei.com>

Hi Yihang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next linus/master v6.11 next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yihang-Li/scsi-hisi_sas-Adjust-priority-of-registering-and-exiting-debugfs-for-security/20240926-094506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240926014332.3905399-4-liyihang9%40huawei.com
patch subject: [PATCH 03/13] scsi: hisi_sas: Add firmware information check
config: alpha-randconfig-r133-20240929 (https://download.01.org/0day-ci/archive/20240930/202409300042.USclhodY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240930/202409300042.USclhodY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300042.USclhodY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2457:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected struct Scsi_Host * @@     got int [assigned] error @@
   drivers/scsi/hisi_sas/hisi_sas_main.c:2457:32: sparse:     expected struct Scsi_Host *
   drivers/scsi/hisi_sas/hisi_sas_main.c:2457:32: sparse:     got int [assigned] error
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2457:32: sparse: sparse: non size-preserving integer to pointer cast

vim +2457 drivers/scsi/hisi_sas/hisi_sas_main.c

  2424	
  2425	static struct Scsi_Host *hisi_sas_shost_alloc(struct platform_device *pdev,
  2426						      const struct hisi_sas_hw *hw)
  2427	{
  2428		struct resource *res;
  2429		struct Scsi_Host *shost;
  2430		struct hisi_hba *hisi_hba;
  2431		struct device *dev = &pdev->dev;
  2432		int error;
  2433	
  2434		shost = scsi_host_alloc(hw->sht, sizeof(*hisi_hba));
  2435		if (!shost) {
  2436			dev_err(dev, "scsi host alloc failed\n");
  2437			return NULL;
  2438		}
  2439		hisi_hba = shost_priv(shost);
  2440	
  2441		INIT_WORK(&hisi_hba->rst_work, hisi_sas_rst_work_handler);
  2442		hisi_hba->hw = hw;
  2443		hisi_hba->dev = dev;
  2444		hisi_hba->platform_dev = pdev;
  2445		hisi_hba->shost = shost;
  2446		SHOST_TO_SAS_HA(shost) = &hisi_hba->sha;
  2447	
  2448		timer_setup(&hisi_hba->timer, NULL, 0);
  2449	
  2450		if (hisi_sas_get_fw_info(hisi_hba) < 0)
  2451			goto err_out;
  2452	
  2453		if (hisi_hba->hw->fw_info_check) {
  2454			error = hisi_hba->hw->fw_info_check(hisi_hba);
  2455	
  2456			if (error)
> 2457				return error;
  2458		}
  2459	
  2460		error = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
  2461		if (error) {
  2462			dev_err(dev, "No usable DMA addressing method\n");
  2463			goto err_out;
  2464		}
  2465	
  2466		hisi_hba->regs = devm_platform_ioremap_resource(pdev, 0);
  2467		if (IS_ERR(hisi_hba->regs))
  2468			goto err_out;
  2469	
  2470		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
  2471		if (res) {
  2472			hisi_hba->sgpio_regs = devm_ioremap_resource(dev, res);
  2473			if (IS_ERR(hisi_hba->sgpio_regs))
  2474				goto err_out;
  2475		}
  2476	
  2477		if (hisi_sas_alloc(hisi_hba)) {
  2478			hisi_sas_free(hisi_hba);
  2479			goto err_out;
  2480		}
  2481	
  2482		return shost;
  2483	err_out:
  2484		scsi_host_put(shost);
  2485		dev_err(dev, "shost alloc failed\n");
  2486		return NULL;
  2487	}
  2488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
