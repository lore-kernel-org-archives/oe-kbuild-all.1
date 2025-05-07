Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2AFBF6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 04:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591893; cv=none; b=n+yBlXtJDnUQS59QkYYW1uYd1YSIu2doZZH0EFcN7k8mukQx/Iq6vjtLixg0pnzEWz5FliAMAq8g3n+GHB8HyMIUtsg+4VroRv3UIYh33rrpysSNjEkwoAgdwKxmAWlaGLQV4TTqsV5ueqjAL+GPIcYbxPmb/MJk8DI2bmggMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591893; c=relaxed/simple;
	bh=4RzgA7yY3Y68W/6Q7qpQeOeQxRW7Kqs5VEbBYrYK1nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KKc9C7nPWInP1pWytZJo232RVmfieKzcvnj6auDIA/AR8q4k9SgcmiMvUPHZ6RG1c+ZzuyGpwLnSThlfPeM95q3QDUHufuepg7rBGoHOnkJFsW1/N/oggpORsDbBjDv4IC92E+1bVGfFCRImiUL2Xko9nqS47k5DTsf7xAY9gw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHASDUQs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHASDUQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746591892; x=1778127892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4RzgA7yY3Y68W/6Q7qpQeOeQxRW7Kqs5VEbBYrYK1nw=;
  b=cHASDUQsI+4W2t2RWike5CxFu+dgxjCtUg9PRAYsBvurKtnIffuLblfn
   nH0FLF50h13xNESGXBFtrEZIFMm8/QCeyhndLNR0FgIPBtv4cFneZAnkU
   DEshqZ2F56vvQi1vdWf+NaPxXASxKpGiuNINwRrH+lgOolgk2wBOPqhT3
   jUOnfDRhbshi+tf7p/nU4ZgIUG2NQs4XKuCuVakKIpqXApODt6UpmHaQa
   2Y1vXa1+hpBsokePm4XlPlurAehhV737+p0YOP55w+pLsWMte4FYdP6HM
   i2EBB1qVoEIqkq5H7BcCrvhy177WzCyNaE3eGsTQEoayEjhVfhfqSLNN1
   A==;
X-CSE-ConnectionGUID: smRHv2uSTgaXRnTwaDLbrw==
X-CSE-MsgGUID: LkU+WvxTSkCVvL5KLThoiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48172495"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48172495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 21:24:51 -0700
X-CSE-ConnectionGUID: WEJ0j6H5RMOrmOPUwWugkQ==
X-CSE-MsgGUID: Hm2MeDl0TAaPD9DpIj/amQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135831902"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2025 21:24:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCWKt-00072b-2f;
	Wed, 07 May 2025 04:24:47 +0000
Date: Wed, 7 May 2025 12:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by
 GKI_HIDDEN_DMA_CONFIGS
Message-ID: <202505071212.qprm7MR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3d5bad71a79830f131d55d077053e1e8993f2f6d
commit: 194fc9ea8a50fa11e9b03bf04449614fc79be59a [2/2] ANDROID: GKI: enable hidden configs for DMA
config: i386-kismet-CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH-CONFIG_GKI_HIDDEN_DMA_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250507/202505071212.qprm7MR5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071212.qprm7MR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071212.qprm7MR5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH when selected by GKI_HIDDEN_DMA_CONFIGS
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_DMA_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
