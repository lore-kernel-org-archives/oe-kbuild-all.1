Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943851FA8C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545536; cv=none; b=b3w566xiXonERJJhL27GoIgGLwvLYg1yzM0jpdx7y9U8AD9KEP9ZcoyaatJyZi/nENFSWrlUilgFIlCtoreGB7uD8AyKxcBT1Hw5ZZ2JwG5n3lLiohT3HMo0ZAR0WXBp2swxMHofZ1CQ2lm1EXIpw9JKG38jxarMC0SXNtDjeTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545536; c=relaxed/simple;
	bh=7+V24XWeYuMycVkmxG0GdxkAvqCvF6CC0w58Ns06kLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hji9mNkOvq78K3lvMhbBk0NK1pFcy16+BqVBa8/UvfxErhJanvAKxXWvzj4OQlIPGhW0G7MHBZnjwvwjPuPPiHeZj/ytJ73OpiObXhjZfeV7qZbmn1IShZNE6kgt8lLCOGf1iMXqKGXcWz4DJOZU4Lz9GCRt0ufdbjlzk7qbSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fidoAo3i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fidoAo3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734545535; x=1766081535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+V24XWeYuMycVkmxG0GdxkAvqCvF6CC0w58Ns06kLo=;
  b=fidoAo3iEfy47eoaNZO5OHngy5cKecWwc0ISSlj6l5S33AIfXXYg9drZ
   SM59XJr5W097ViqGLvPcNdjWd4FNUkiUim8WVk/++IdyUtPUHAYURK6vk
   ajiYPMdbWfbZeypxlEo+p5vUMgc6SjN8qVe/IWfFO6WK6RzYZpgTFCRkc
   0XjPelRV+n3C8AOO+aA+hwcsSMQOhzSXVQ1WfugG/y8qE6EIZrV3m30sB
   befVsVkX1D+x1v0zGV3QVri1gMblBFL4rbCqPEcLh3omOET94DFPUxHUM
   QBzo1/38wJnjxa0laMc6Pf3aTbns9phlIzaB5pv/XHOrKv74ZmJCQo3FS
   g==;
X-CSE-ConnectionGUID: TH4F2y68TLWem2nCwyXxUA==
X-CSE-MsgGUID: WfXJd6KsThKkuesBTtFSdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35193830"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="35193830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 10:12:14 -0800
X-CSE-ConnectionGUID: Ej+vfapkQkS9wJxSqhVBYw==
X-CSE-MsgGUID: dla2vQt6T/yyjf0Uy3iOzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="98496057"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2024 10:12:13 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNyWo-000GXe-3B;
	Wed, 18 Dec 2024 18:12:10 +0000
Date: Thu, 19 Dec 2024 02:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 15249/24506]
 drivers/media/pci/intel/ipu6/../ipu.c:732:12: warning: 'ipu_resume' defined
 but not used
Message-ID: <202412190234.Q7NDnvAQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tianshu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   e988ffd481f368f1e5b9be5fcafc35e63b57beb3
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [15249/24506] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-buildonly-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241219/202412190234.Q7NDnvAQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190234.Q7NDnvAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190234.Q7NDnvAQ-lkp@intel.com/

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
