Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813841E5734
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749033005; cv=none; b=uKb0BQFuNwqepKmQE/K9njcYP77XnWu6KaT3r9JAeykbyqVS7Bdj8Z0k+BurbBEUNfAm3X1jYjCcbCro4JWPsDrE2LedB6PHx5Mr8lfYukk2DIYCFJDNSdsWoXg+oLqBWPlkwH98YyDmENwFeKaQR8xru+C1b/h88GIU4qOaIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749033005; c=relaxed/simple;
	bh=Ea0Z1lE7jcHuZwuHcx7jNUUcSjMjrnR6jgUNyT8jqxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OiIlFHgL3y+Dbk3JAN7sCQ9tOaC79ssudf0RnDEriuOqB6eg+brB4SVgYANhH6yKMJSapyNtsjKVPjpb+2YdbL1DkwKNLmt5zHbIUqlVNUjkAZII/2TfDNsGzr9rzkrGxLxFMlDO9bXmqnzGY1f7PhahSR8NbsHwh1ZeZ9HrNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCHTFvTs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCHTFvTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749033004; x=1780569004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ea0Z1lE7jcHuZwuHcx7jNUUcSjMjrnR6jgUNyT8jqxg=;
  b=OCHTFvTs8t5PWQz5yUaKQ+TW1KLWSu73xLjkcwPbY9grJiKd32L8jHsz
   LRWgZ6v0uBHLgo4lEvzowk3noy7XrnL3YoZ9Q8woxnwmLsVp3+vOyTzNw
   /oUvqmfaktIGl4pjhdEqqAeE7/+lRNyKunD7lw8cl9/3K0LpMvRUNKPjI
   Ls9UQNgSUlQwaDiWVP32LahX6bHDjscw63P2CprKy+ncLGCOJntYfPp93
   HwQweLDWAjhFqXqbq1K4QwHe6w7hCnyE+4ny0Kd0+Xa00iiJvdXYHE2WH
   e5zrA+yFAT4zcH19Qbjuo5gv4487wyin88z1BOYeFjW1WmH/FPp5WbHCL
   Q==;
X-CSE-ConnectionGUID: kqzvPl10RCmvWJ+rvpOENw==
X-CSE-MsgGUID: 0rDegJa7QfeiVytbkCH2Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50969661"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="50969661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 03:30:03 -0700
X-CSE-ConnectionGUID: gZ9T/OltQj2gT69tf+5abQ==
X-CSE-MsgGUID: oYEXnKYURbWBnrfiCoBClg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="176099373"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 03:30:02 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMlNf-0001fm-2L;
	Wed, 04 Jun 2025 10:29:59 +0000
Date: Wed, 4 Jun 2025 18:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crc 8/18] cc1: warning: lib/crc/um: No such file or
 directory
Message-ID: <202506041854.M6toQPRR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crc
head:   79a990c201e59b2d1e74b994ec4f782a420b6b19
commit: 7814014d8c1a59ac008f79285cabb34035f6f309 [8/18] lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
config: um-randconfig-2002-20250604 (https://download.01.org/0day-ci/archive/20250604/202506041854.M6toQPRR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041854.M6toQPRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041854.M6toQPRR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: lib/crc/um: No such file or directory [-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
