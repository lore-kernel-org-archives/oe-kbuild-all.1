Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC98278156
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754565542; cv=none; b=ebtJLjiDgRkf5/IIC99YG7gIdRkLPedlLIqcTzNMQOkqBCPRsjiCcU88WXTPgD1B8zVIgFjg16cnIvpfxKfBX+0ZrcSFWSD5F3KFjyRk9nQ1OnY5je6/t37m5obEPvBZ/0IBqf2JSwbAA1pH8pANN0v82JsCxy2wI7qkBQxPQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754565542; c=relaxed/simple;
	bh=f3FqBxGBWsVlevuSNtT9SK+3TuwSSfx/Msd6vIA6Cmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tTJ2h6+15TbwbThT1Ou8QcTzf4E9zsKXVzjg91kmyhZR4Cb3LNaNV9SjO8iCu0ZbF4JE9nWKbAini7NBxddMTXIiDf/kAX/DJt/LXjudlfsMVlF7W76MPFhCxhOJ9J6ziJDYOOVFQMOr/iMa068Bi4+ZQT9pTioHk1vt1+oXwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdzzSD4K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdzzSD4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754565540; x=1786101540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3FqBxGBWsVlevuSNtT9SK+3TuwSSfx/Msd6vIA6Cmc=;
  b=fdzzSD4Ku/T8EM6cfhOHOnj4ZjraV5svVZO3a/utPljax4faehMp/yin
   Y75WIV7bCsKDHesN0V5R64PMjbi3NVRVYMJ3Uu9GpQdakE1JF6+thhTex
   3cWpVbCof/EowkbH9Ep6jjMPSajPiT3MUhBTnuFFTU883K1HGuyOB4tsx
   gqqfMhvumobDoqn1tL/l/mE77oBhayfcn6XoljNXA9Nf+E3bW7TldSeBE
   7sT2SeZthn6jOD6OYWBewxImrWz9MpU7a3w66WTp+m++VMcGj4od/+1AF
   nRt0qU/MuEHVPPZs/ywDqc5L3hddf3mzkePAlsNIyIhyxmCZs+Qp8xN/r
   w==;
X-CSE-ConnectionGUID: gN+CqozKROSGYwkXuH/1Zg==
X-CSE-MsgGUID: Rp/ocvipT/WHQnvJcBbaVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56974482"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56974482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 04:18:59 -0700
X-CSE-ConnectionGUID: 0RxGRzJtSiSbsdKZTyQEFg==
X-CSE-MsgGUID: FGOH8y7bRR6ifpUac2CzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165451468"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2025 04:18:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujye8-0002iU-2E;
	Thu, 07 Aug 2025 11:18:56 +0000
Date: Thu, 7 Aug 2025 19:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 61/61] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202508071951.1yFxpIQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   613d77dfd48aefb35495f9e9425ad216f55f1439
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [61/61] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250807/202508071951.1yFxpIQz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250807/202508071951.1yFxpIQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071951.1yFxpIQz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
