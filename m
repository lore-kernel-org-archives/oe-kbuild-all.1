Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832F3161A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 03:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769657286; cv=none; b=DnyHap0KRaSULPAhD5LrpIsVXQWWsN2BsBqTRReG6/CEH5REvsaBgS8PfcIucP3dYDvIUZ6rFubb0qyhDUqEL2sFb00a5x/tdb+7p8W38SCoKZliqczJJ57cL11Sjyj5oAFYSsquK1/1SwMRJx/SWog6bK4KFN4WoYBNgda0y+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769657286; c=relaxed/simple;
	bh=yU2N36MaCuvyn0lE80oxylG2jR9YqdGuSGE9mirIWGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ed/OaCoo+2rSGn6/BXdhERAUclll4o1m555PbV8z6ZRYI5rvLeO6fgBwLig25iLoJCNZRuxW/yFd1ZeiVu8HOBsnIBB2cp+LR6voklt6oTH6KcaJnKlX3AxYDB1X3gpTsK9TuJttJYhZmJSCgF0LWOTz5xjUQ+/KfI701b4sWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKbjTOkg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKbjTOkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769657284; x=1801193284;
  h=date:from:to:cc:subject:message-id;
  bh=yU2N36MaCuvyn0lE80oxylG2jR9YqdGuSGE9mirIWGI=;
  b=TKbjTOkg+KHRKCwZWqfC9AhG5kIb41Jtw3eTpcj/nRwpLYPC06mdSMCl
   Q2WUkTQPYmwdxuzbohzL/CYWXgF6rrDoBfs2ESAGVlZ8jLSLMzxZWgh43
   JKmGBBDo2BiI4f21ui4irT8OQSvv2tYeHbi93ZgbhVdRVOURhjL0lM3D1
   EHo4aS/hP6ym8dJ970X2pFss1x3ig5ZOqFzY+sBgMBt1yOxnSxpWP98My
   3wmJ5ZvM3n3Pdw0NK6MCKmaEV3eUV6pM9l80X+QPxcxWP+BHO8xWsoUBN
   OwVR4I63ndG99z+WpWcD0+/qhCpag8a9CDwSlkKNubnZUy7WoRYp0VzlG
   A==;
X-CSE-ConnectionGUID: FDQ1CDCcTsiHoPTY+jbLTQ==
X-CSE-MsgGUID: FXb9JHahT3yISJfJDOeACQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88301269"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88301269"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:28:04 -0800
X-CSE-ConnectionGUID: uTPjgtIxR7i7lNnJVs0BOg==
X-CSE-MsgGUID: BKJJUnV0R06OhWTIiKsB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246053839"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2026 19:28:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlIhK-00000000b2q-3J8E;
	Thu, 29 Jan 2026 03:27:58 +0000
Date: Thu, 29 Jan 2026 11:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.4 8/18] ld.lld: error: undefined symbol:
 bpf_struct_ops_data
Message-ID: <202601291156.53hsihPp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.4
head:   09fa23dc39326303aa4b6145bfca206e15f0bb1b
commit: 54177e7f75d6d66ac08d94a715c617cf95b16f68 [8/18] mm: introduce BPF OOM struct ops
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260129/202601291156.53hsihPp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291156.53hsihPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291156.53hsihPp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_struct_ops_data
   >>> referenced by bpf_oom.c:61 (mm/bpf_oom.c:61)
   >>>               vmlinux.o:(bpf_handle_oom)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
