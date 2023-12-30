Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F22800
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 00:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xx98qifE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703894944; x=1735430944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cXU45CZIOZq7dNjJTKmcMbqN2AXLjBgHGgMDInbqyO4=;
  b=Xx98qifERWarlDSvv2+Dz7yC6tCdIYPOqJVZR+mACkNUMkk9hUeICgYS
   Sc6GigxDvWyVhvKyjrlcU+NRnYm7CYe7subsjwS3GW9oqO/NnqsTyi/eq
   xZ4syIHp1kZM1DjWr4MiM3PecboorQLMSnWPPdKvmHebMDg0h3oTMdtBg
   oFpl0Xc66kabvxJ32JwG2O+5nMDmoDSPU9HYVXoq+D2ohdxYyu9IokqhO
   KMBiAPM4LDuE3C/Dq6JcnVwX0CjnnHeeWW0wgLa/JqEhEos9C7lCEbI71
   t96Mr+ob4eylTz9Ci2YIHqVmrD9LSN8HPC3pw8pSaalMcYqhRZeAHMKdi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="381656131"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="381656131"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 16:08:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="772066026"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="772066026"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Dec 2023 16:08:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJMuJ-000Hu9-1d;
	Sat, 30 Dec 2023 00:08:51 +0000
Date: Sat, 30 Dec 2023 08:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [kleist:ipu4-dev 19/59] kismet: WARNING: unmet direct dependencies
 detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_INTEL_IPU4
Message-ID: <202312300816.ow2boiLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: d35c2043fb50817f1e5eb1ddb6ae4b95d367ae55 [19/59] media: intel/ipu4: HACK: Re-purpose ipu6 files for ipu4 driver
config: x86_64-kismet-CONFIG_VIDEO_V4L2_SUBDEV_API-CONFIG_VIDEO_INTEL_IPU4-0-0 (https://download.01.org/0day-ci/archive/20231230/202312300816.ow2boiLK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312300816.ow2boiLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300816.ow2boiLK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API when selected by VIDEO_INTEL_IPU4
   
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
     Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && MEDIA_CONTROLLER [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU4 [=y] && PCI [=y] && (ACPI [=y] || COMPILE_TEST [=n]) && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && X86 [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
