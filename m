Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FA2BFC60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779475533; cv=none; b=YvDnHpJO/9fA0J3DS5BTaTRerlKoBbvz5n37VwP0e6T7rIJymc3JduwdZUU/ggDgO/RNZpe6iOvN6E2IiwapXS/fj4h16Nt2NkCPOSj8wdoX3CQFGuJWC0Vs8M6rXjgbcX0IR/FeiXheCcPv/fcGidjiLp3V+HOJ7ejZH6hNeH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779475533; c=relaxed/simple;
	bh=uwZZ2pQB7NtcLaj2SJTZrVXgO+3wTp9kQArKDwR7e9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=juRNAs+xHhN8+ENV9CaLQb+f7fkT/79HQz7RzKgUqyMnFeeCWFbYc3MY682oc71Wt2jd1TDAnF7LxB4U+hcSJ27etOHZNMLqgAnstOMxITPDJZTx37ljSI+ldIavsFYX6LSLu8ozwshvl+HOClJ0zDUANlxExPRJNViNJgWaDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwm6H0Dp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwm6H0Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779475532; x=1811011532;
  h=date:from:to:cc:subject:message-id;
  bh=uwZZ2pQB7NtcLaj2SJTZrVXgO+3wTp9kQArKDwR7e9E=;
  b=Qwm6H0Dp4/ziGQF/y2O8A4GxYR5bCb1lYnkFGXwh6W0E2Ota9Fq57G0W
   uZ7rBmSo/v/0wP2kdOr5znYcsf7GYU119prTObb6SQdc1aaqbT5uu06e6
   KjzNdnJGeIy0xvgkpkb4WuFMqYw0/aldzQjEbV322l4u99zXlIWGUIxp1
   ss3eAhuCn7FfswlB4kWv90uQriMrLsG6c1avKssGV01K974Qp9heS2qJ0
   LvMjQodODVmVNOLE0kxTS+Mb/l19F3Zb8E1+xGUKehTDTtuyvkcYxz9PU
   hZvIQ70cAHPlzROk7TvuPqhlrza7FvSATx49bugfK260UsBWmsTHItPbq
   A==;
X-CSE-ConnectionGUID: VFvDLm5PQ52T1cSFPs4yvA==
X-CSE-MsgGUID: bapnllnGS1u2Oxxoc/XEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84265617"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84265617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:45:31 -0700
X-CSE-ConnectionGUID: Erbis5X4TNCdqJpTBrF2mQ==
X-CSE-MsgGUID: afy+SRTGRlO+uc+s/l9Oiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245025571"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 May 2026 11:45:30 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQUsB-000000002sJ-1AY6;
	Fri, 22 May 2026 18:45:27 +0000
Date: Sat, 23 May 2026 02:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 30/1197]
 ./usr/include/linux/ublk_cmd.h:601:17: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202605230222.ZY7maMUx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: a33c92e1bad897ddadbbd0cc4490eb82c29b54d6 [30/1197] cheri: compat64: Fix definition of ublk_elem_header
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230222.ZY7maMUx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230222.ZY7maMUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230222.ZY7maMUx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/ublk_cmd.h:601:17: error: C++ style comments are not allowed in ISO C90
     601 |                 /// UAPI: NoConvert: Padding/alignment only
         |                 ^
   ./usr/include/linux/ublk_cmd.h:601:17: note: (this will be reported only once per input file)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
