Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197CB1DD877
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771550697; cv=none; b=PhNw9wXKgNHIQmEEJ/0OcFP2GNt4lseII+oABPgEpyE1OYiFroziPpDKPE0qf+LGzqtattIdFMnEm+1cilflZynSXMa2AuCDVHDIj1abVw/khvLAD/dyeqNZMSaMZbZGxF+82HwNayLIgkSGN5K44zmeN+i4p+rRj4UuHOl3j78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771550697; c=relaxed/simple;
	bh=NppwgVBJNMzog96UBt+OzqmYUNTGhQh7RZ1lFw6ANQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R6ZqAntw+nt1NeQMJkm+DOUnaEEvA+iSP0XA2gUMAQsPrVJoMSaZJAVTtisCHgN8OuZmIovzCg5R1kzmQ30pQGM4uwl9EwaFcs1ekPWC6K3kxTIUYrqQv/OXqzh2fGu0NZshvkIu3/1D3s7gxMV9Q8iDpC6JZjo9XmAMxuoPe9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWPmIwWJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWPmIwWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771550696; x=1803086696;
  h=date:from:to:cc:subject:message-id;
  bh=NppwgVBJNMzog96UBt+OzqmYUNTGhQh7RZ1lFw6ANQg=;
  b=hWPmIwWJ0LRnqEFGSdGcFwgri354qD9F36lD41ZEJMORGpRpZJswWhxm
   Q8XV3cqjYpQsGBvEaLP1N5/8hPiM0Ff4AJjaTFTz6nRiT7DE9WEZNYPXZ
   sgzGDGW0N6kFIVTecfEj9RX0NZO5dJa9O/LzutWxjbHEumxP6HxBPRr0y
   Azw1LmauFVJSV18vH+XOrlxDudsuZ1B1QLAMh4tDL099/ivqAjcySSBLn
   9qmeYNp45cKYm7AUbUQLa7MuYYhCMX+icDRNmP+DKpdq25hH8BIZFuxnN
   LfRKfeFCrX+LQvaKbQ74eFP7CObwJeQgBcSJ7xBFHDEYptA8vCkIi3ngL
   w==;
X-CSE-ConnectionGUID: 2S+LhKfMQqehPiLsTcLZEg==
X-CSE-MsgGUID: 9mGdgb+DTBuZpA3a5oH7gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72554461"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72554461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 17:24:55 -0800
X-CSE-ConnectionGUID: YEaQtcscT8+Fs4x9KB7oNQ==
X-CSE-MsgGUID: VQjYrSKcTtG+Goj4g8TPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="243250577"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2026 17:24:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtFGF-000000013hI-3tjF;
	Fri, 20 Feb 2026 01:24:51 +0000
Date: Fri, 20 Feb 2026 09:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 8/18] <stdin>:1630:2: warning: syscall
 rootns_wait not implemented
Message-ID: <202602200952.W1R4ePRT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   bbfe3fc31c861befc0d2aa15a02e672b2e248cd6
commit: 200438b6dc1097f11abc6f81f4136432eb8a59b6 [8/18] rootns: Implement rootns_wait()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200952.W1R4ePRT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200952.W1R4ePRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200952.W1R4ePRT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
>> <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
   2 warnings generated.
--
   <stdin>:1627:2: warning: syscall rootns_create not implemented [-W#warnings]
    1627 | #warning syscall rootns_create not implemented
         |  ^
>> <stdin>:1630:2: warning: syscall rootns_wait not implemented [-W#warnings]
    1630 | #warning syscall rootns_wait not implemented
         |  ^
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
