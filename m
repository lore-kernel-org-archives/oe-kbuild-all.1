Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52F6199E8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 22:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713478992; cv=none; b=NBUZPqUPpfqJkYvMQR0he/stw6Pz9UuJwlhx8VfRnjL/8LCv59/LJrHqMDNqhStdR4kPnTOgKW6+/1Mx93bhGDfKvV4chWfJfHyere/fHEbgae+DbMPQme6Owq9G+kARk6yD9x9Po2eAbCStI89b34eA9K+mhFmKYqhWzkoNnAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713478992; c=relaxed/simple;
	bh=rME2M1BW0HkXH+YOIcsB1IRnX5Subk1RiBAgHobBrEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tk9uKozfWs5CF2yGnTBLLWtPeYWnnizrbiIiaNrJqtIAnXzk1mVDzBxe7SmfviXhqXw1GRrEeE9OV65sYJlqYuKnY5bWH3cLsw6JQ/8J1PZ6Ax4pAz/ror1KHqJcLcgy67GEtv/5gHXdUvrv3Zq2Z3D9i2j2J4yw42pCTnM/5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz/WvXvc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz/WvXvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713478990; x=1745014990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rME2M1BW0HkXH+YOIcsB1IRnX5Subk1RiBAgHobBrEc=;
  b=kz/WvXvceSTmiDUQxmdLESGXnLhuFD5U9opzl2mf2hUmKTjRvIteHa+n
   MwMAf2o/M3I6079dJ/v0cb+flFV0f8EHrLBQVD5dZi6WOzickeA70KQvF
   ogGxjbKhtI3rj1OH0Xljv5X7G0itpLHi2OjxSsuEiRqBODCPMwvjjAYLq
   /VNxFG93SR1iUGpK32kedMhK1VPtkHykq0Z7tBu9mlWpV/fhpmAOshKVl
   Lxlyhcblxn0oIdLd8S5El8s3vWV0j7fCLk09XCBNZ35uKzriK61Dv2OoE
   lS1ZPm475g4eCHcZ0X7yCdK/zgLI8cOIQzFrDBhtvtLsuFxTayuyl/DTA
   w==;
X-CSE-ConnectionGUID: lJxf7uQaTp6Rhz1dhYOe+Q==
X-CSE-MsgGUID: ohdhwf6CTnaaU4Cg4jTgJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12003811"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12003811"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 15:23:09 -0700
X-CSE-ConnectionGUID: MK9xO/JDR3ehOh2obXR5uA==
X-CSE-MsgGUID: dnHSfm8vTDOTRoc9YREVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="60562017"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2024 15:23:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxa9p-0009I2-0A;
	Thu, 18 Apr 2024 22:23:05 +0000
Date: Fri, 19 Apr 2024 06:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data23' from
 `kernel/ptrace.o' being placed in section `.bss..Lubsan_data23'
Message-ID: <202404190642.z54cLsGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2668e3ae2ef36d5e7c52f818ad7d90822c037de4
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 days ago
config: powerpc-randconfig-r033-20211126 (https://download.01.org/0day-ci/archive/20240419/202404190642.z54cLsGE-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190642.z54cLsGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190642.z54cLsGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data23' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data23'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data18' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data18'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data23' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data23'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data18' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data18'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data23' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data23'
   powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data18' from `drivers/cxl/core/port.o' being placed in section `.bss..Lubsan_data18'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
