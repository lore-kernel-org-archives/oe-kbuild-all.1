Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EBF26E179
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763202773; cv=none; b=H0rxIuMBo1Hl3bQOaa2nwnMph0zjCyo6osTwmpqzKfofBEL1oEt3+BlIoHr9KVvwiucrjV/h4EmjNqrRJVP3EfZTSvaRlffb1h/WMIErPs/TzMZJesmfeMsViNaHyXgwHWAsOs5fgUYSGHRIB9PMHOn6V017R0bdqaTT+3XxsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763202773; c=relaxed/simple;
	bh=elANGExcynx3LW8roGgSRsUVVNTgUlJ2FrABMmDBvX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uhdv7LXI/oYjbh+uXGEdNkKeHD6N0i28TbQdKHvDrACCiwv7fCXsHqU98Ha9hB0+EoGlfGMfp7Fvk5khfRrayBIKm+8ZyjSjgkcfq2F1gc4L1RZ5NL5TrcXMdds1d9Qk5ohl084p966aKcsp6FZBh8HyRhvykzCRtPr/I6NXxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zl+jzoj7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zl+jzoj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763202772; x=1794738772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elANGExcynx3LW8roGgSRsUVVNTgUlJ2FrABMmDBvX4=;
  b=Zl+jzoj74OFRxcRQe09lydTTPLxU7hFLULulfrGQDe9et15DRRcaANC/
   LbNgw8QO6udHjTIRVqNUQ9C4d7Ko2anlrmOLSws83gvJih0f9rf402WGU
   gCvT4YF9+Fshae37nGar0Vh6fv/KxapFo9lAOQDA/GG2xbtifkxVxiMKs
   dmLqYmyVyYAFuC40gHFNx6UzFVC3th+eQcPqZgEoiXT3c0/JXAzhittDU
   vAKPGE6xwR0M1M2IhAYjQ1zfR4jfuar66rqAz9RNVOgXYmIO4gl4I3ncV
   EBDV/4qjvIsjNl77qssHg01RFvwsWTXhws1Vuu21596poevS/pbMUOAtz
   g==;
X-CSE-ConnectionGUID: yQdukRzzRLKR37d5gQOf1w==
X-CSE-MsgGUID: /cBltM1zRi+RMdkNnU5dRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="68906035"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="68906035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 02:32:51 -0800
X-CSE-ConnectionGUID: hWYPFlo6Rh+TVSS8duSSmQ==
X-CSE-MsgGUID: gmXHzGY7TZ+CpPU1N548fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="194448831"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Nov 2025 02:32:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKDaJ-0007tD-0Z;
	Sat, 15 Nov 2025 10:32:47 +0000
Date: Sat, 15 Nov 2025 18:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:objtool/core 5/5] drivers/tty/serial/icom.o: warning: objtool:
 startup() function name creates ambiguity with -ffunction-sections
Message-ID: <202511151839.A810rWWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   9c7dc1dd897a1cdcade9566ea4664b03fbabf4a4
commit: 9c7dc1dd897a1cdcade9566ea4664b03fbabf4a4 [5/5] objtool: Warn on functions with ambiguous -ffunction-sections section names
config: powerpc-randconfig-r123-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151839.A810rWWM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151839.A810rWWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151839.A810rWWM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/icom.o: warning: objtool: startup() function name creates ambiguity with -ffunction-sections

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
