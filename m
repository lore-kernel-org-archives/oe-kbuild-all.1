Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B71397
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352254; cv=none; b=dwZ+NjiJU5NWiawZEJV0X50+8JkJbFctIExHMhkwKdqgk1yI9Dct7xHqIUTu0IHuafCt9zV2pW704Hy8L1UDosRP2ScnKY43e731G/dZwJ9QmippLchm96ESEZUq106pVPyR4Y+XquaetnGmOtzELeHntUO595C74uI02AxvxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352254; c=relaxed/simple;
	bh=Aq6xdfyd5iujdYv6hF01TfXpTdHOCxy8dkns3Z4HO/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f8MrJj1cp3s0nHgH1rYSotUAmkBtkkQeUYopaOY6lQC1ACYGtcXr0fEz/jSf7RIG8U0uzmgHMn0i0md+6/3fd2Rn0w5sfRD/a0G7baj3n62DoMGN8rOtOUQ6qwWYbyj2pjUdYwx702Ut/hMriiJZIDlOSuxU8v5z/JkUyxB1Qc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgZKmsx7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgZKmsx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769352252; x=1800888252;
  h=date:from:to:cc:subject:message-id;
  bh=Aq6xdfyd5iujdYv6hF01TfXpTdHOCxy8dkns3Z4HO/c=;
  b=kgZKmsx7sRDiFuJuIeVUcXgnBN3ZbzXS3pyyzqv9L/S2++N9B2qnrZDo
   JhNkxYJ8MO6mDi26YLtEn5znIVaIrfGS9LR/RmysSx0QUrzGjKOwg1WSp
   0EymK4fd0fOMCkpTfNgmNvnQaiF5TbZkbo/XAj3b5speZ64zXOuWMBMgK
   KUyOkalwLBRFPBTU/80tsVbq/nFZciGHoF/t4+lmL3HulM/90Lk9caSCy
   yO465cNXB1kKw5BKIBXju4itHnPsoHViUTWK85QlkzyvYE0AQSvqx3dWE
   V7ah5+5kcCYNjHUA/+oKpbYY+yEsuR5/mHbIu68ZcqThm5agD/1NWFovC
   Q==;
X-CSE-ConnectionGUID: lHwoP0tuTbunFCrYvSppkQ==
X-CSE-MsgGUID: g/Cn28kYQ6CTmByVE9WpVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81174752"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81174752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 06:44:11 -0800
X-CSE-ConnectionGUID: nSFcyEexT9uGhajx7c/luA==
X-CSE-MsgGUID: sEIvMnk7T9yBLZa18t3qKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207284817"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 06:44:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk1LT-000000001Hd-2kbD;
	Sun, 25 Jan 2026 14:44:07 +0000
Date: Sun, 25 Jan 2026 15:43:47 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4] kismet: WARNING: unmet
 direct dependencies detected for PHY_PACKAGE when selected by
 GKI_HIDDEN_PHY_CONFIGS
Message-ID: <202601251519.Ng4ZCCVD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c624c4db89acf5f5e2466e371f744a5b6c8261e2
commit: e720a50b14c5896defc425452f52d3ee1d2de1c5 [4/4] ANDROID: GKI: Select PHY_PACKAGE for vendor modules
config: i386-kismet-CONFIG_PHY_PACKAGE-CONFIG_GKI_HIDDEN_PHY_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260125/202601251519.Ng4ZCCVD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251519.Ng4ZCCVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251519.Ng4ZCCVD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_PACKAGE when selected by GKI_HIDDEN_PHY_CONFIGS
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
     Depends on [n]: NETDEVICES [=y] && PHYLIB [=n]
     Selected by [y]:
     - GKI_HIDDEN_PHY_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
