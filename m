Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642261DDF3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765685264; cv=none; b=lxDJpIOhDGvMSc/+J3Lrh6LnLzDyxTXwEiGpYsc32gdIFddi0q+qFE0x40brJX5mKVs7MILFOAlYPYA3rLnUxlFJI/pV4qR5d987YwD4+Fy9akkGT5pqkl1m/4s5tn9ehYlescM+CbfvL/jpSgK+c8+cpOOSKEEQ6pp/BMKNAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765685264; c=relaxed/simple;
	bh=YKeThF5fXswZPV4ESjYhQ7xG4lB1H0Rpy937CU19xYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJ3UP6XbxUKmLBwmK4quYSSMAFRKX9163sIQrkDV2kpIrZBurXnuSEinbfzZCfQT9wPUEWnSyh0sQO5rJJNUKq/ovnVHmXfIt3evKEF6XvJbWP9wEacPREcSPuUXt4th8o7dChmo4cb6Ckwbsa+HKbFC0JfJXmu1GuqNd88omfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHj4NFwP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHj4NFwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765685263; x=1797221263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKeThF5fXswZPV4ESjYhQ7xG4lB1H0Rpy937CU19xYA=;
  b=bHj4NFwPio4lPe1S5sn7qAiP2aRP8FxluADTp57RJRVjYfrGAB5wE7bO
   UAuROwp3mPe9oCyaICPTdPZm3i+a1havmRlALoB3xnOpL5ooae44RAm1V
   jrMslIPOxr8j7ZgR78lS6Ub4bT5hcHOaXBGsVSLd89nVAnvWsSuStB/uv
   9b+QwECj8Ow7NKukP+4hjCW8NDEBJLHYqz3Z78VtPavLdqgbWYmYRKHBt
   d/KVdytlUXomwIqtGSrdDMBrDLbAzoT4PLMofMgvzsnygRQ2hfJOFZ7ui
   iRoH4jAc+0Ug3+P2dxw16ZgV+7h1Dq+PhQK/xAhdfLfWYn6Xjqh1/qasW
   Q==;
X-CSE-ConnectionGUID: cAV7/Z7gRKaiyWi5UVCuxg==
X-CSE-MsgGUID: pIAMfzigSV+a63+gs8vVkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67701628"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67701628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:07:41 -0800
X-CSE-ConnectionGUID: lSc7QxioR4GO8M519BkxZw==
X-CSE-MsgGUID: mV1MEz/CSjqncxUQHjj/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202528732"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 20:07:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdOT-000000002Gm-3L2k;
	Sun, 14 Dec 2025 04:07:37 +0000
Date: Sun, 14 Dec 2025 05:07:34 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40] map_hugetlb.c:79:25:
 error: implicit declaration of function 'default_huge_page_size'
Message-ID: <202512140510.DX2ZS4I4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: a584c7734a4dd050451fcdd65c66317e15660e81 [40/40] selftests: mm: fix map_hugetlb failure on 64K page size systems
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251214/202512140510.DX2ZS4I4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140510.DX2ZS4I4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140510.DX2ZS4I4-lkp@intel.com/

All errors (new ones prefixed by >>):

   map_hugetlb.c: In function 'main':
>> map_hugetlb.c:79:25: error: implicit declaration of function 'default_huge_page_size' [-Wimplicit-function-declaration]
      79 |         hugepage_size = default_huge_page_size();
         |                         ^~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
