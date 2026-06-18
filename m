Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813437DEAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 05:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781759482; cv=none; b=ArNBiea2rfa0FiSIfXgyC+a1f0xSFNgtNjQaqEpnf/dbyL4OkRspYZS354l0XKfdc0WwttSrkJCspopaaK1A0oiq67roQ/0O7DB1Z8ZmHZlAGxeWflGzY+hHLuStntoKLDGTG7eVdSW05Ee+K2dOThnpr5sFYy3AqDbUgxmkVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781759482; c=relaxed/simple;
	bh=YleL+2T+L75/D8Mv6H/VVFxiVyuNRqVawCM+4BSgXwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZDrlDsKqT3OeUCSnrvSw99NEAUYnr15mT6ronsDqcgnOA+vd7kYFh6IJ+iqQewy4dh7FAJh/HMXZ1v9rolROCNzBLS2aeWi7MwcNTwEtDb7bV27Y2UCTkeDwFv2mSIgHEPym5rtTuu03w8WdZH3esJJFDv4yyGQdZpAfGbqvLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpmV7+Ti; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpmV7+Ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781759479; x=1813295479;
  h=date:from:to:cc:subject:message-id;
  bh=YleL+2T+L75/D8Mv6H/VVFxiVyuNRqVawCM+4BSgXwM=;
  b=HpmV7+TiXLpY5HY4BCpO6nHVbe3IxWw20M9XKp6sgDQYEmdBlffqEmq7
   QDKkM54AUf/qMn6vYtUEHWoRzFm0ecPevo32BqNRD2TDRWForPmIgf2Ji
   7Ta61syhJMDti15h6UaV1QsGg6EO9qHnFtMExKp2ql7wmEZOvtaY0CAiX
   IuGERULx8HhoA93VfpuuXoK9YVsq0yd49zOj0sSAoDoiw1kBUNdZUTvjS
   h6dKGrfvJhol1ffg5RSXne7cg/mVsi1TKM+YnPDHn23XrXFyuOCv0jPfO
   j+e5BNhujlHu27BtKzxQHNgWPeE+fwgOok2tzrLovK+nnCUOlzn5xESRR
   w==;
X-CSE-ConnectionGUID: M+x/HPGHRIOPuD0MT1Xdaw==
X-CSE-MsgGUID: D92pHqpjQ2SpaVlaRJolFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82588816"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="82588816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 22:11:19 -0700
X-CSE-ConnectionGUID: JVkGR2MdSrGwooe1SFZHDA==
X-CSE-MsgGUID: G+fbjfEdRJi3Oe9uai+5tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="252574328"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2026 22:11:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa524-000000005Sp-0KRr;
	Thu, 18 Jun 2026 05:11:16 +0000
Date: Thu, 18 Jun 2026 07:10:44 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/scheduler/sched-arch.rst:108:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202606180717.yNM0yb41-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
commit: 4c29e4f3ba22adc04fc456620f2c6abf539d76df sched/docs: Document cpu_preferred_mask and Preferred CPU concept
date:   10 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180717.yNM0yb41-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
   MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +108 Documentation/scheduler/sched-arch.rst

   102	
   103	Notes:
   104	1. This feature is available under CONFIG_PREFERRED_CPU
   105	2. This feature works for FAIR class only.
   106	3. A task pinned, which can't be moved to preferred CPUs will continue
   107	   to run based on its affinity. But no load balancing happens
 > 108	4. If needed, steal time based governors/arch dependent method
   109	   could be used to cater to different types of cpu numbers.
   110	   Arch can do so by implementing its own hooks.
   111	5. Decision to use/not use is driven by kernel. Hence it shouldn't
   112	   break user affinities. One of the main reason why CPU hotplug
   113	   or Isolated cpuset partitions was not a solution.
   114	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
