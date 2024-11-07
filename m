Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C80372
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 04:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730953981; cv=none; b=O7ngaTmmxAeNn2e+wcZ+JcMOobABV9tNi9jnBtiYdbg0vOWLGQ0+1HtkofzPoT3avw5RH6kdNUYjQYGacRVFaUmF3WdkKCHU1sQgBA/gjXM8QmEbU+Icwb1ZEXqg3Hn3SkOtMf6JLPvItIytJW4lnew9UA6nWC2S9dDaZ8QBLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730953981; c=relaxed/simple;
	bh=2KWrcIZ4GbQtBrnby22qutZp10D+VRH+C9mwoE48+3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BezqnqNTIY9Cu3dpcNFtqSxOaReRp6Ve1y6OioPlFo1BfWAsYK2BY/4emW6v/xPF1nQ0VwNIfT2Q+Wwb7HyTfRshPIPIfnbzJwjSuywteJuNVXr9oRSDR8FmChlcSTRs/XWfW+5LIX0jOjwrqYugjjLk+zSVyTXVCPpw2n88ad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APUJdH1k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APUJdH1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730953979; x=1762489979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2KWrcIZ4GbQtBrnby22qutZp10D+VRH+C9mwoE48+3c=;
  b=APUJdH1k0QyZnz5nRZFN2DVzRMEWgwaeuYMqIgE1FjW6oNczKscX0ecA
   +3IIgnqxCaoYeVPv2w1UyXvCezQwd9olq4UELb3j0sGO7GAo5wHLPBq1r
   8ZVfxVi+5m1umTMfD0yIVZ0ONY5przxMSfHd5nWHlL3CxmkyyUyI1GuCV
   RXBKglA/nlMlZoUxW4ghDkF0as7rjtfnAulwb/up94h1Q47M6Ya35gbvC
   mGws/e9zl9V8BZpKLwWDiy7c6HkRgwhfDY0u7IdoIp3bodLzjq64zA1bR
   FnDe5zYF9B9ym7WceKYIJ6YsvhCd12gHza2h7xLUXh+yrXPhCCsP1m1rc
   Q==;
X-CSE-ConnectionGUID: QiVckipxRASUpaeoddHp0w==
X-CSE-MsgGUID: tlS0VeuuQMKIvrXBYKPD9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="18403904"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="18403904"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 20:32:56 -0800
X-CSE-ConnectionGUID: o77U82BUT2albC6JOaVHDg==
X-CSE-MsgGUID: G2xB6h1nSPy65nfyfeT9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84541737"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2024 20:32:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8uCT-000ppC-1J;
	Thu, 07 Nov 2024 04:32:53 +0000
Date: Thu, 7 Nov 2024 12:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 15249/23133]
 drivers/media/pci/intel/ipu6/../ipu.c:732:12: warning: 'ipu_resume' defined
 but not used
Message-ID: <202411071231.L3moSJTK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   c9272c37b2b5aa8d04d7dcdb694b2caaf6b530ca
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [15249/23133] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-randconfig-013-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071231.L3moSJTK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071231.L3moSJTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071231.L3moSJTK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/../ipu.c:732:12: warning: 'ipu_resume' defined but not used [-Wunused-function]
     732 | static int ipu_resume(struct device *dev)
         |            ^~~~~~~~~~


vim +/ipu_resume +732 drivers/media/pci/intel/ipu6/../ipu.c

   731	
 > 732	static int ipu_resume(struct device *dev)
   733	{
   734		struct pci_dev *pdev = to_pci_dev(dev);
   735		struct ipu_device *isp = pci_get_drvdata(pdev);
   736		struct ipu_buttress *b = &isp->buttress;
   737		int rval;
   738	
   739		/* Configure the arbitration mechanisms for VC requests */
   740		ipu_configure_vc_mechanism(isp);
   741	
   742		ipu_buttress_set_secure_mode(isp);
   743		isp->secure_mode = ipu_buttress_get_secure_mode(isp);
   744		dev_info(dev, "IPU in %s mode\n",
   745			 isp->secure_mode ? "secure" : "non-secure");
   746	
   747		ipu_buttress_restore(isp);
   748	
   749		rval = ipu_buttress_ipc_reset(isp, &b->cse);
   750		if (rval)
   751			dev_err(&isp->pdev->dev, "IPC reset protocol failed!\n");
   752	
   753		rval = pm_runtime_get_sync(&isp->psys->dev);
   754		if (rval < 0) {
   755			dev_err(&isp->psys->dev, "Failed to get runtime PM\n");
   756			return 0;
   757		}
   758	
   759		rval = ipu_buttress_authenticate(isp);
   760		if (rval)
   761			dev_err(&isp->pdev->dev, "FW authentication failed(%d)\n",
   762				rval);
   763	
   764		pm_runtime_put(&isp->psys->dev);
   765	
   766		return 0;
   767	}
   768	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
