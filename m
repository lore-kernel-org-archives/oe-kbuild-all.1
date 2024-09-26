Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15920175D2F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727353219; cv=none; b=ZanAUViPTmCL/zTCw28D6d2lcbXXUvPPwN6XpNql5yv+/GbWKhskeAm4Pfrj0rgVQcjBeLb6i8S+PnEGouje9lJgyMoMHgjZa6fEKf+KmMsAHYpAbTfpnWRuGMVCtPXbzDaC38grJ2ZBkuA8I6NCcgXSS3kCTkvYmqRiGW1nmyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727353219; c=relaxed/simple;
	bh=0bm08rnlpQUdJLBhVe19UC9wUEJEMqrFdy9mt3I0tCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJ479xzAQmK2uOdMYTbzcHRSl2dPgsiZc3lZd9HzyDPazydiJpbKwewC209hR/994zLaM7UIKvXqZ5/80CJLDQcyY/ZnCQoqPCLUSC3TfcVXIVx8j47spFcD9hhKCpyC7fmOSaXR/HT4ZK3Fl+vQ/T1gHsId4jimYEHH78QOVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJ6+XDH0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJ6+XDH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727353219; x=1758889219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0bm08rnlpQUdJLBhVe19UC9wUEJEMqrFdy9mt3I0tCE=;
  b=cJ6+XDH0S/W6q/23185kDx7xqYiKSyVxHHwViI/pJiddgPu2Kze81nBr
   9HwN6xqx31XikSIUqa6qAQmUMKedDBFxvtpz72LvsRNEqO7IJLSfJ1EQq
   GrQhDpjYigZsfebOqmn4/12uaW/OIPyg0HZJIIa9LI22nk2tKmGo6NVI5
   wSqXgY3kQCzj2Ymk/EujECH29XPwn8b5y+TMUCmMf7UCbW2J4fZUPgWcO
   uzJqa+tS1AZQEwbfSos9jyPVZhf7EwwMeXD25x5D6EN4KvxOQM0gPyFm8
   4WiO0guRVu05SwC2mrmeoRzdJRFNrOzg+Xkb303LqLonKu1T1MLuBlQH+
   g==;
X-CSE-ConnectionGUID: xBCwcofzRe6bULs6rCh7ug==
X-CSE-MsgGUID: k4RYPVtBRiSec7K57ZBKbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26391289"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26391289"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:20:16 -0700
X-CSE-ConnectionGUID: eAB3u7mjSnuE5bKtJ2uyUQ==
X-CSE-MsgGUID: oaD71DsqSgSrqbuYUBDJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="95476029"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 05:20:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stnTe-000Kht-2n;
	Thu, 26 Sep 2024 12:20:10 +0000
Date: Thu, 26 Sep 2024 20:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yihang Li <liyihang9@huawei.com>, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	linuxarm@huawei.com, liyihang9@huawei.com
Subject: Re: [PATCH 03/13] scsi: hisi_sas: Add firmware information check
Message-ID: <202409262042.MIMB8blU-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on jejb-scsi/for-next]
[also build test ERROR on mkp-scsi/for-next linus/master v6.11 next-20240926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yihang-Li/scsi-hisi_sas-Adjust-priority-of-registering-and-exiting-debugfs-for-security/20240926-094506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20240926014332.3905399-4-liyihang9%40huawei.com
patch subject: [PATCH 03/13] scsi: hisi_sas: Add firmware information check
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240926/202409262042.MIMB8blU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409262042.MIMB8blU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409262042.MIMB8blU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/hisi_sas/hisi_sas_main.c: In function 'hisi_sas_shost_alloc':
>> drivers/scsi/hisi_sas/hisi_sas_main.c:2457:32: error: returning 'int' from a function with return type 'struct Scsi_Host *' makes pointer from integer without a cast [-Wint-conversion]
    2457 |                         return error;
         |                                ^~~~~


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
