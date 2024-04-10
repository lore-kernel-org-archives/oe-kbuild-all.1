Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B27F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712708355; cv=none; b=artmHTjD4XrtfEcM2WOfvqJHNTnxFjcO1c/KxScN4AfCgXpclWA1V63Dy4uUYyqgqiGbGWfAdmC0urAiGoKuAlC8XumE7xP9FY/EQdEPCwhqC5vZ4SeppyBzKVbhgBzgMdOljBlwsP329qMm10QNo23lnwm2ujUAXw0CZPf2kNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712708355; c=relaxed/simple;
	bh=zplqVf4DQ8iquxUU4Xp981fym0oLVN9utTdlt0SAfyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFPpPT28r/YJGjSXTFaUVoMQ/L8dc2ETsi9zAxMqZrMb9j9EjPsyyf8i4JhFhfPpk5NYfJOGaS514FwN4ejIELfKhnGgW0STPz85xA2S0yUTuZvu8407C9Sup3jXMPNCx4KF43qXeg9XEGQNnddPzJ04sHIEb5QDroH4DXieAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL2EF7sh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL2EF7sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712708354; x=1744244354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zplqVf4DQ8iquxUU4Xp981fym0oLVN9utTdlt0SAfyk=;
  b=kL2EF7shNF2ex5SiDEYOr5g8V/JcGAPUJLmie5iRSdIcCidu2Xr37PA7
   EO/IwufOxp/5ncfnBL5JPYVjdFYk9P5s/FzbzjM76xx/1LDunctAfSxTO
   v/F0xsly1KQWhXqCNxI1mxLWSKtBlkMhCOslMkLtc60jPF440GhzeFT5m
   FNtDA0d+h4VM4D0gXavX0FhCeNV3QDji2NxZxax4Egal148VsvoXARNiX
   K8kjTxzavprzvl1MmhtHqYp20gtEH3fI8sr+0MI+2N6YsHLMiVPXX865T
   +fhH2JQm4H4MF8EGA8qGiYbQxmHqH024kHdtdOwQhemse4vAnhk5Cs9J4
   w==;
X-CSE-ConnectionGUID: a15mswDOQuilv2qenOCcPg==
X-CSE-MsgGUID: rO8HgEGfRiC9Ezo+gdN7PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8175691"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8175691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 17:19:12 -0700
X-CSE-ConnectionGUID: srvSzDHUT1mGMbPZ3rsaTg==
X-CSE-MsgGUID: jRf3EI8HSumD7B6LkmlBbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25180988"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2024 17:19:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruLgC-0006e0-1U;
	Wed, 10 Apr 2024 00:19:08 +0000
Date: Wed, 10 Apr 2024 08:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:clk-reset-stuff 6/6] drivers/reset/reset-mpfs.c:154:9: error:
 implicit declaration of function 'kfree'; did you mean 'vfree'?
Message-ID: <202404100824.he3s5A31-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git clk-reset-stuff
head:   a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2
commit: a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 [6/6] clock, reset: microchip: move all mpfs reset code to the reset subsystem
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100824.he3s5A31-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100824.he3s5A31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100824.he3s5A31-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/reset/reset-mpfs.c: In function 'mpfs_reset_adev_release':
>> drivers/reset/reset-mpfs.c:154:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     154 |         kfree(adev);
         |         ^~~~~
         |         vfree
   drivers/reset/reset-mpfs.c: In function 'mpfs_reset_adev_alloc':
>> drivers/reset/reset-mpfs.c:162:16: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |                ^~~~~~~
         |                vzalloc
   drivers/reset/reset-mpfs.c:162:14: warning: assignment to 'struct auxiliary_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     162 |         adev = kzalloc(sizeof(*adev), GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors


vim +154 drivers/reset/reset-mpfs.c

   149	
   150	static void mpfs_reset_adev_release(struct device *dev)
   151	{
   152		struct auxiliary_device *adev = to_auxiliary_dev(dev);
   153	
 > 154		kfree(adev);
   155	}
   156	
   157	static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
   158	{
   159		struct auxiliary_device *adev;
   160		int ret;
   161	
 > 162		adev = kzalloc(sizeof(*adev), GFP_KERNEL);
   163		if (!adev)
   164			return ERR_PTR(-ENOMEM);
   165	
   166		adev->name = "reset-mpfs";
   167		adev->dev.parent = clk_dev;
   168		adev->dev.release = mpfs_reset_adev_release;
   169		adev->id = 666u;
   170	
   171		ret = auxiliary_device_init(adev);
   172		if (ret) {
   173			kfree(adev);
   174			return ERR_PTR(ret);
   175		}
   176	
   177		return adev;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
