Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFAF38399C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 21:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333795; cv=none; b=VCK4tsJlflhAIoCgCTNIMgU0/vOv/vaRWH6u+qtfax7wwANdE1qQbt1WO8yhHxJJTcANN3CoNdGLDc/innp6Q/28cjLnKVahWm+gKN6aOhnJZd6sAnlEirKo6/mXyA+/s3Pq8vCxEk8Qewelrl2P6Xg1gq9/d9BGvNh5+GQGezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333795; c=relaxed/simple;
	bh=3oKmc8BsngH8dJCDJq57RIzpeW6Yn69on92xs3duUSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qUCvRFGz3bBPOBxiYx8I5ipX7LTN34lSHmAi/MIkFb+ZbFUTDWWWXZoft+19w59H7XAdv8N6FOZHiQGslg6177UNt/Ia1RD8r3EHxUNoXp9NoQMrun1z8AvLyuq3kpF5rimfAvwpq2s9tPe3c+ODqZYcbcxUB2L+1pxXCaQhs3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCtlq0Ow; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCtlq0Ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789333793; x=1820869793;
  h=date:from:to:cc:subject:message-id;
  bh=3oKmc8BsngH8dJCDJq57RIzpeW6Yn69on92xs3duUSo=;
  b=OCtlq0OwCOSsSfjf0Gk2jMO2ojJbwD0r8ITBBb7LpTowDWHNCOmJHSNZ
   7xosTRAXTEDHGpIH6kScnmwY8k9+YAV2vtUcX7wkIsLbluCUP/X+9lHjK
   S61IGoixxuyuWVXp9eMExE37CFQWNdk/klsnH/L2LQIHbhG3WfBKEaGO4
   tgBzg33Vf5+xB01NmM607Mwyww1UqIKkMmdYDstEbt7zykFzluv788eAt
   Lc4xOdXQ6QZlKFvJ6CEr795cM6j0LneKurpl37IRtJe8yNqXQKSz0ujLV
   lUYzGGxkHDl8FEL++Aym56ORg6PqUiHQSsyaRACrwM2UosoTKjYC0h+gb
   g==;
X-CSE-ConnectionGUID: 08yDlsWuQuOQiMDW2QakXg==
X-CSE-MsgGUID: btYWrTXHRMKVQFW6mvvpqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="115235739"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="115235739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 14:09:52 -0700
X-CSE-ConnectionGUID: 6ZjlXFcvRjK7PggXMTaQQw==
X-CSE-MsgGUID: rDo2rLeqTEukFK4VkFkA6A==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Sep 2026 14:09:51 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5rSP-000000001i7-0NKQ;
	Sun, 13 Sep 2026 21:09:49 +0000
Date: Sun, 13 Sep 2026 23:09:19 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 164/164] kismet: WARNING:
 unmet direct dependencies detected for VFIO_DEVICE_CDEV when selected by
 VFIO_PCI_LIVEUPDATE
Message-ID: <202609132206.M9bg3cC6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   271ed1169e6b74dae1a8cd72c9296e13fcfa1a16
commit: b22e2aa1153bf380cf38c1b0026e7e0a5beac1c8 [164/164] anolis: vfio/pci: Select VFIO_DEVICE_CDEV for vfio pci liveupdate
config: x86_64-kismet-CONFIG_VFIO_DEVICE_CDEV-CONFIG_VFIO_PCI_LIVEUPDATE-0-0 (https://download.01.org/0day-ci/archive/20260913/202609132206.M9bg3cC6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260913/202609132206.M9bg3cC6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609132206.M9bg3cC6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_DEVICE_CDEV when selected by VFIO_PCI_LIVEUPDATE
   WARNING: unmet direct dependencies detected for VFIO_DEVICE_CDEV
     Depends on [n]: VFIO [=y] && IOMMUFD [=n] && !SPAPR_TCE_IOMMU [=n]
     Selected by [y]:
     - VFIO_PCI_LIVEUPDATE [=y] && VFIO [=y] && PCI [=y] && MMU [=y] && VFIO_PCI [=y] && PCI_LIVEUPDATE [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
