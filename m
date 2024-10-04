Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EDE231CA7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728075825; cv=none; b=Yd2uWtZpCeDNOWBXKuDoaP7Z+NxTaqHVgebj+4rnmKjBqI3ffoZf+UOV/2qrvyKdFSxSBmVC2XP5khCgDCa+i9p0kqyeHA6FGGhBbDT1mlT61faH0ivqLwdx2CbfSMVEoechpwx+6s0Q+ZrowmyjAeHdRyom7FRescSy73vhG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728075825; c=relaxed/simple;
	bh=S2eQ+YGsZW/jWuYKZQJB2rhBR/8C3IrWuP7d18dI7N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hny2ZpqaEcEUhaEn6hLbHC1ax8+OwjlcTXgFQ9+YAushbmInrP0bpJoDk3ZmMtMToww14Hh6uE3BcsDDTDslcgUNsG5pHzssZixt9dW0vx7ZdRU42ffbt70CY1Ao4BN0wgcU2WfiaJ/Y5VUoIO2key3VTTdi93zN5lyEyFuE2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYzBz4+Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYzBz4+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728075823; x=1759611823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2eQ+YGsZW/jWuYKZQJB2rhBR/8C3IrWuP7d18dI7N8=;
  b=VYzBz4+QWui2dATGmg7jucywwmEk20qF3XWbWUj4bcY8p8lM9MTLl8Mo
   TI6eJiQwCT2LU7+81c63j8daZT8Y1eQdyCZMAvOvBfmU7/qmmUgt45k/n
   LeuaxQBogK1zG95NVYsjK8bkuHUJU2o1Txv8tH7qycHhP26hNF/G4VKwF
   EG+MhTXDD2WEUp0h3UJsR+avmBTMhwW9c7nUkL2AI9KKjLo7VEuxqu76A
   6IhL8ACB+gaiXS935KeuvwDp10PYmlMex7pJMSE8j6SZZvkE4F2DGAxtc
   g4SxeTx7GYdLPbpwicKskt39ETSSL/unklz4gl8oR7pzm+vvkZymlAOEq
   A==;
X-CSE-ConnectionGUID: Paa67QoGS8y7DlSQL2Dzuw==
X-CSE-MsgGUID: Vi9L+flkSPyRSepSL5PFEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37967837"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="37967837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 14:03:43 -0700
X-CSE-ConnectionGUID: lHa9QM5BSzmMfEyfY0+RBA==
X-CSE-MsgGUID: iJID+FSNRCCsvQsiqbj96g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="105669417"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2024 14:03:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swpSd-0002Di-22;
	Fri, 04 Oct 2024 21:03:39 +0000
Date: Sat, 5 Oct 2024 05:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [morse:mpam/snapshot/v6.12-rc1 48/132] htmldocs: Warning:
 fs/resctrl/Kconfig references a file that doesn't exist:
 file:Documentation/fs/resctrl.rst
Message-ID: <202410050550.9upmA12n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1
head:   4d17b37b670795954fd7a70c8ec83fb705a5e2ad
commit: a2273d13b7e6bd18935bcb8c1f67d67b92cb44c6 [48/132] x86,fs/resctrl: Move resctrl.rst to live under Documentation/filesystems
reproduce: (https://download.01.org/0day-ci/archive/20241005/202410050550.9upmA12n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050550.9upmA12n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/fs/resctrl*
   Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/arch/x86/resctrl.rst
>> Warning: fs/resctrl/Kconfig references a file that doesn't exist: file:Documentation/fs/resctrl.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
