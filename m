Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D520B21F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748385102; cv=none; b=M1Qgp5ETpaY1ethNqrrydNWgOONcMBYTrB5WPMnUNPfwcr40uE3tPiQtg8NMGI6FcvkI/AlO/6SkPhmZpBDvEQnJKgRkEG86AdBFrHBdQoEFmu4S8Ne/TQv2vgJxpOzOHieAC1dl9ypq4HB5zZEhVF+bl135p3a6vDCXEs8tg1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748385102; c=relaxed/simple;
	bh=OQ5owQe0znpVgS2KSmqWPK105Oo1xKveyeAFoKjwt1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZpnaYQbrzUF5AEnc0odN8NdJpR1fxLN8bse1bZqwImytFhYGPwlTMmNkrqbJBMU2/xf4vJIEJ6YCPAPNfUiKFInWxMa7bYFsQD4gDA2hWnI7KzR9CqI5tzHBX4bx0bRWhIdXM6bkGg74lq5gHy28dUyb9rHRQ+4TKzbyUqzY9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DP3NCSzb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DP3NCSzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748385101; x=1779921101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQ5owQe0znpVgS2KSmqWPK105Oo1xKveyeAFoKjwt1c=;
  b=DP3NCSzbUzow442eIxSlXBB8HwL4CFy+YCf2FqmpcCDNuK47GIXR3jNd
   V4JftqvT3625t/xEVPkiFV6g5HjP0SULKQT483155uOUDlNX23XV4FvnD
   37lSBB55qzXF0XZhdhZhPcgd2TO+xLPdpT30mgnUkXhFh7NnGkU7PEUs+
   M/JoQzQhYNbUyHbCV0nrJR8gCADOTQJjmsc5ESUIltR0tMcCXMn8AGOxr
   CUr2QI3aKJMvo3cyw9E71SdJ4XD/T8FbadgdPaYUk+RLRU06xAK09YXK3
   xBv5fRj29Pj4pr8QXCDTuq/vcNNann0m6MR1qK8D+rQP9rD1V1sscWyA9
   w==;
X-CSE-ConnectionGUID: aGhCXXkLQ6mxuRFCFtBuYA==
X-CSE-MsgGUID: JHL+oQU7Sqi7UldvSdpqRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49509700"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49509700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 15:31:40 -0700
X-CSE-ConnectionGUID: 8a8Z/4OvTl2/1lp5dc1KRw==
X-CSE-MsgGUID: UVg9cVHtSeyokJMPWXBTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142921271"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 May 2025 15:31:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK2pc-000V3m-1d;
	Tue, 27 May 2025 22:31:36 +0000
Date: Wed, 28 May 2025 06:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2928/2928] kismet: WARNING: unmet direct
 dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by
 BPF_SCHED
Message-ID: <202505280648.AMUiWr41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   45e99bc87727bf5be83ac512da687f7742d4a8fb
commit: f23e7844132b626800d06e42d09e2ffe241c51cc [2928/2928] sched: Introduce CONFIG_TASK_PLACEMENT_BY_CPU_RANGE
config: x86_64-kismet-CONFIG_TASK_PLACEMENT_BY_CPU_RANGE-CONFIG_BPF_SCHED-0-0 (https://download.01.org/0day-ci/archive/20250528/202505280648.AMUiWr41-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505280648.AMUiWr41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280648.AMUiWr41-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by BPF_SCHED
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   
   WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - BPF_SCHED [=y] && BPF_EVENTS [=y] && BPF_SYSCALL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
