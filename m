Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE622F9DAE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365917; cv=none; b=FhlS3lPSefQpisEaTk3XrZ+fiynNR7Gbw8HJKczkGg+Tgu+Xc+FUxQgOWbFuIAuZGYYHrna35IwNRAQW5+R/ZMK4Cz+ltD6GCb3OR9aiD+F8Pxt0Ke+FBEkKyNqPbLrcg5V9z9ZEaxpmDjbcxZCf/2Oftd9BK5WOEkWR8qmI0IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365917; c=relaxed/simple;
	bh=XXautxizrwUKwPhN/Q59HaHDxh0HoQEZDUhM+u4QALg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PM/wCAICmJr//IwGtnHtVqBfE1KrO4P1uxpkLp6m0VwEPRAynwENgdy2AbnWPX3+aCIMnT64E/vcaOXUPRtfYfZNvRzvx/vzc487bw3ARrE5xoL7PHYLzRMb1munOUf4wc8YYRDVk7ujnSrqmTICkT2fcppdefnCRJ7GelP5dEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yth+iOat; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yth+iOat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765365915; x=1796901915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXautxizrwUKwPhN/Q59HaHDxh0HoQEZDUhM+u4QALg=;
  b=Yth+iOat6UcGeMLLWtmXxFIxz7Y0HL6JSdhDe0Lm6S3KSB3k6qnIhJsB
   68QAVuANVBv6klDZQbgTL6xGW+/esBTOomCiSIgJFKIZc5WNH3LFYGscH
   2YB1/5+IxpGyYaxJ+LX0IedFudxzI2kH3E1YPa2DDBKyUqAUABlYjt8hk
   BUsvGPOQz6E5YSFG/0MTXJlnFtWDyOuGk/8JWiLtBXd5xhvMj9S+xlUrA
   wB9mLs4zQgGhAAgjTuy5EpcidpilMau5SkbZu8T9KJDIjEDGaXGMh9UU8
   Rw25u8e1Wre90UEFnE8GrjpPg7wN/lxn2sKXPgxHnpfs4Xuq3vPG71fSC
   w==;
X-CSE-ConnectionGUID: 4icP0KXhS5aC7mHzigQISw==
X-CSE-MsgGUID: koNP3dqnSXSUluZG//7WcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78447005"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="78447005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 03:25:13 -0800
X-CSE-ConnectionGUID: cQKmgvp6Q+a7HNlccXP95Q==
X-CSE-MsgGUID: Q734l696SS2fV/fhDyIY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227146711"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 03:25:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTIJh-0000000038A-2Gyx;
	Wed, 10 Dec 2025 11:25:09 +0000
Date: Wed, 10 Dec 2025 19:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] mm/memcontrol.c:4428:12: warning:
 'mem_cgroup_check_swap_for_v1' defined but not used
Message-ID: <202512101954.2PMARPcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56da8c1ec8638f6ad4df737a133a41b106a3ce42
commit: a095a940f784db58ea4e87df361f9a4fd0dd977f [3508/3508] memcg: add restrict to swap to cgroup1
config: x86_64-randconfig-122-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101954.2PMARPcx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101954.2PMARPcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101954.2PMARPcx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:4428:12: warning: 'mem_cgroup_check_swap_for_v1' defined but not used [-Wunused-function]
    4428 | static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_cgroup_check_swap_for_v1 +4428 mm/memcontrol.c

  4427	
> 4428	static int mem_cgroup_check_swap_for_v1(struct folio *folio, swp_entry_t entry)
  4429	{
  4430		return 0;
  4431	}
  4432	#endif
  4433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
