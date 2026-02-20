Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C3D27E074
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 03:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771558322; cv=none; b=GhBv/ICXMtZ+DHn7DrkU7KG3Y+HWJNHbGdLGY0MGqd1GQoCGlAA/TRwV9hwQ3fhYeVZA+YP1P0kXOMiKm7X9WdpFQNqaymI32mXqh0nUMULu2WdRPqDX6nLtwaV/kdWgcw2EmQtuw74Fzz167d6axpJsbHbRVh4RJM82DnT+fm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771558322; c=relaxed/simple;
	bh=YSXZQhxG2TNOP73GclDot3zjS0vYJEGhV2O349LfihQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VXE59f94s9ef2KHxYGdOaRoVXYFjsBi67WM9SdLsg+adWvO+YkEQLMlBWWKUXiNDRt+R4UXwCdNiwkVE+FMUzvY6MPLe/F1zRxNMfNCqYTc2jj3F64SxqDkBIjDu9lzW5bJdsrS1h3sCzKvytXZ+eFUyG8T+9VPkLyESDfLKcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEBAQkMT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEBAQkMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771558320; x=1803094320;
  h=date:from:to:cc:subject:message-id;
  bh=YSXZQhxG2TNOP73GclDot3zjS0vYJEGhV2O349LfihQ=;
  b=bEBAQkMTFjk7n79cDKVK+lex1TSXRgVmkAVKVNWrR1lr6AFBzP1Vf0uv
   DxxAIKGxy0Vmqa/kvg+b/PZIyf5MIq4l+NEkrWMWwVaWiE0M6FmJYLBl6
   MarPZRhCWV0BXfN4zr9zflvPhxxkc92iOJcrtWhMlmzEKAglFVqfLlp7m
   qMCJys36LVoMmARgToIRebHgnSmw1ptlXJquFvQOxf7nj/hjZOURmQ4K7
   145ZwxCIhOx7SUbJKdoYJXEE3zFiKW/oIbNE6M8ZkP5kZ1A/H/HT19AR1
   unrrMfWEe1AE+XoaHBqJWc5IZjbRN5xMLYN5Dl2/3kKOOlOUqv00dgc0L
   w==;
X-CSE-ConnectionGUID: o7n7v2ebRV6nb6DGNJd7og==
X-CSE-MsgGUID: 37omjI0ZTnaSrsyAGSTH2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84016080"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="84016080"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 19:31:59 -0800
X-CSE-ConnectionGUID: s0V6NGwbSDyRDq7QUUqENg==
X-CSE-MsgGUID: XzE2PN/1Qby5xfSnhhK1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213308686"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2026 19:31:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtHFE-000000013my-0ndi;
	Fri, 20 Feb 2026 03:31:56 +0000
Date: Fri, 20 Feb 2026 11:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 10/18] <stdin>:1636:2: warning:
 #warning syscall rootns_enter not implemented
Message-ID: <202602201118.R596pD3o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 54bc1294c2b10d47946e8a437394d48cdead2926 [10/18] rootns: Implement rootns_enter()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602201118.R596pD3o-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201118.R596pD3o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201118.R596pD3o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall rootns_enter not implemented [-Wcpp]
--
   <stdin>:1627:2: warning: #warning syscall rootns_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall rootns_wait not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall rootns_kill not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall rootns_enter not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
