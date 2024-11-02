Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D6249F9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 00:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730506331; cv=none; b=RNAlJ32ISio9KcsR/zmOin1f7QJq2V9KKu//2Z3S2Chwvfn4kgyPo9+e4+M8zAWUzYY8nstHenitBjsXVpqKkmfujx3btUUTmo6CDaithEdf7gWGpPqqCBzeUNIVzEzFOcYyiCtJDHIp79W7LRrGSEcJx9kcawYBRO3vRYmCPGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730506331; c=relaxed/simple;
	bh=3XGpBuAWGVpDESTLylxD/oItdzdLU53KeJHvaxQ4uNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGLzymz5dZOCfuPU7dtQGGpDTPent8hQ/Vqhsz21qKCOHfYDF9FeHpsXz9HTTn76D4DmvQmOwzosNlQ8CHCD+SGL3WDWCWMCnfO/lsy8kVBiff3UpWNH+Vc+oyMlCS0iE4tADvaboqUBIVz6qcb1ZJiRmu3CcQNVh7uA+skTejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/PztBPk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/PztBPk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730506329; x=1762042329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XGpBuAWGVpDESTLylxD/oItdzdLU53KeJHvaxQ4uNI=;
  b=Q/PztBPkPQXlh1f8oBlKdg24q3tbU02fgpnDxowv8lSOla498GpO83SC
   VKWF0DaWN7Lv/xjQWYejYud1E2vgLA8/OEhMv+ggJXQ29zHSKGV0D+CAz
   IMnoI8MnhoquTudH+Cwy1MmTiLduet4uPIh1X3z4/0H9SpXRqc6pP1X9Q
   zTXLYrtpzBpt8qb1ikfOXtmnABl+1oL3Yh6jZd0sm7eeoO9utvqEa0jzd
   R/2fcyblkYx1sRK5hb4w7qBjvPX/xtCzVTfaevlb0aYuI/hysV2rTBNV/
   /k1an/yoUiUaSp4IwVTAbsixOpqPrZolUBbMNi2NgxTsBgF8qXwMjwLLT
   g==;
X-CSE-ConnectionGUID: V7K7LMIUQBiNBBxNfD7sFA==
X-CSE-MsgGUID: r3pP/woxRCCEIOlHUEivRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30386866"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="30386866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 17:12:08 -0700
X-CSE-ConnectionGUID: xKjUFzV+SFWVJ7T4LGAIcQ==
X-CSE-MsgGUID: k5x9co8iTvibdRv2eLTXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87712930"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2024 17:12:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t71kJ-000iCH-1p;
	Sat, 02 Nov 2024 00:12:03 +0000
Date: Sat, 2 Nov 2024 08:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, Vibhore Vardhan <vibhore@ti.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [linux-next:master 7690/8858]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:110:26: error: called object type
 'void *' is not a function or function pointer
Message-ID: <202411020829.tfeflyn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: 7c2c8d2651b5ffaffb2d5f723bd5b0493bd66f36 [7690/8858] pmdomain: ti_sci: add per-device latency constraint management
config: arm64-randconfig-r071-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020829.tfeflyn6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020829.tfeflyn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020829.tfeflyn6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/ti/ti_sci_pm_domains.c:110:26: error: called object type 'void *' is not a function or function pointer
     110 |         ret = pm_generic_suspend(dev);
         |               ~~~~~~~~~~~~~~~~~~^
   1 error generated.


vim +110 drivers/pmdomain/ti/ti_sci_pm_domains.c

   104	
   105	static int ti_sci_pd_suspend(struct device *dev)
   106	{
   107		int ret;
   108		s32 val;
   109	
 > 110		ret = pm_generic_suspend(dev);
   111		if (ret)
   112			return ret;
   113	
   114		val = dev_pm_qos_read_value(dev, DEV_PM_QOS_RESUME_LATENCY);
   115		if (ti_sci_pd_is_valid_constraint(val))
   116			ti_sci_pd_set_lat_constraint(dev, val);
   117	
   118		return 0;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
