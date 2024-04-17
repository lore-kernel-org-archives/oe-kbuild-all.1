Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B41327E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346804; cv=none; b=YPvVAkRjV/mXYG/WIn2YVNRqOFEc+4lfmXIdzwPe9nS256VkH8pdjOA7Inm2/xmAkkFaflWyF2/z3OXHS4SQMFgnS2C/zck44eAjZQohrCB1K/Xj34mvINX6FeQoVhO3CsRL390yE7Kw3o1QiuYXRIN6dYOZo0E0XKkHhgJ5+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346804; c=relaxed/simple;
	bh=lY08CLMPEUYJUJ7atl+wF8wqBZlXnL5V9uVroby4BLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhBIPvhEDDu7D0mwCbwoyxmNphS5ODaGrYLrADpOW3gJDujrWdBw1+RY34dgBF05K73WHbjul/OxKSZLLliD0m6W/Jmw+iE4cCFvhiwJ1GfjIK7jzjyOB/NmDpxT1JHmRqYw/oMGqmuFsCsKH6FDh8RJgJjZyjZOMaK7OeUfyqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDSuzX+2; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDSuzX+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713346803; x=1744882803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lY08CLMPEUYJUJ7atl+wF8wqBZlXnL5V9uVroby4BLU=;
  b=nDSuzX+2mW+CWnMDDKpshlzL4x0yEvqz/TbwkbFwuulkNzd/p6oJH6Q5
   dFwzrYWsbjsBq78a9VpN8fMXNfR9bfIPW5HbPfm5Tfr1q0pnnPF/0tAyR
   408qbuhFjpOu8eNnGXXX/hupbVleeq7zPz6nNr6sBzuTMpxWIymnmtxt2
   6mqmvozIu0AzDl1F/lykfa6kvDe2Psbid3ctSxU++hIQ03V8q4vFhS345
   XrL/iXpA2T1jJe+5J1F707Rj0yEtvINZidyAE09odCkz7L6fK710WOoAL
   ooZh5gVpNMdbhu9YHxp+5jYpq/Oq3CeumDKcyi9DJzPc4Sb2/T8VwFU+e
   A==;
X-CSE-ConnectionGUID: LpvRtRsnQA64N1OXUnb0fw==
X-CSE-MsgGUID: HTnhHjaFTNKrl82GPAHcYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12666790"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="12666790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 02:40:03 -0700
X-CSE-ConnectionGUID: Dp2Nr1FcTeaVCSFbTZ9wOQ==
X-CSE-MsgGUID: Lb9aR3mOQXiKral1ccl+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27364545"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2024 02:40:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx1lm-0006Ri-32;
	Wed, 17 Apr 2024 09:39:58 +0000
Date: Wed, 17 Apr 2024 17:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 43/43] drivers/memory/mtk-smi.c:724:40:
 warning: variable 'larb_gen' set but not used
Message-ID: <202404171708.tbxU09pZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   f3fdafb30fb7daedffbb6a158d007059240ec94c
commit: f3fdafb30fb7daedffbb6a158d007059240ec94c [43/43] CHROMIUM: memory: mtk-smi: add clamp function to protect ISP SW reset
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240417/202404171708.tbxU09pZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171708.tbxU09pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171708.tbxU09pZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/memory/mtk-smi.c: In function 'mtk_smi_larb_clamp':
>> drivers/memory/mtk-smi.c:724:40: warning: variable 'larb_gen' set but not used [-Wunused-but-set-variable]
     724 |         const struct mtk_smi_larb_gen *larb_gen;
         |                                        ^~~~~~~~


vim +/larb_gen +724 drivers/memory/mtk-smi.c

   715	
   716	/* In order to avoid the abnormal SMI bus status which is generated by the
   717	 * glitch from the master warm SW reset, parent SMI of SMI larb should be
   718	 * protected by clamp temporarily.
   719	 * This solution is required by ISP7.
   720	 */
   721	void mtk_smi_larb_clamp(struct device *larbdev, bool on)
   722	{
   723		struct mtk_smi_larb *larb = dev_get_drvdata(larbdev);
 > 724		const struct mtk_smi_larb_gen *larb_gen;
   725		unsigned long flags;
   726	
   727		if (!larb)
   728			return;
   729	
   730		spin_lock_irqsave(&smi_prot_lock, flags);
   731		if (larb->prot_status == SMI_PROT_STA_REFUSE_TO_CHANGE) {
   732			dev_err(larbdev, "refuse to change protection\n");
   733			goto clamp_out;
   734		}
   735	
   736		if ((on && (larb->prot_status == SMI_PROT_STA_PROT_ON)) ||
   737		    (!on && (larb->prot_status == SMI_PROT_STA_PROT_OFF))) {
   738			dev_warn(larbdev, "ignore duplicate protection(%s)\n",
   739				 (on) ? "on" : "off");
   740			goto clamp_out;
   741		}
   742	
   743		larb->prot_status = SMI_PROT_STA_REFUSE_TO_CHANGE;
   744		spin_unlock_irqrestore(&smi_prot_lock, flags);
   745	
   746		larb_gen = larb->larb_gen;
   747		if (on) {
   748			/* set protection */
   749			mtk_smi_larb_sleep_ctrl_enable(larb);
   750			mtk_smi_larb_clamp_protect(larbdev, true);
   751	
   752		} else {
   753			/* release protection */
   754			mtk_smi_larb_clamp_protect(larbdev, false);
   755			mtk_smi_larb_sleep_ctrl_disable(larb);
   756		}
   757	
   758		dev_dbg(larbdev, "is %sprotected\n", (on) ? "" : "un-");
   759	
   760		spin_lock_irqsave(&smi_prot_lock, flags);
   761		larb->prot_status = (on) ? SMI_PROT_STA_PROT_ON :
   762				    SMI_PROT_STA_PROT_OFF;
   763	
   764	clamp_out:
   765		spin_unlock_irqrestore(&smi_prot_lock, flags);
   766	}
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
