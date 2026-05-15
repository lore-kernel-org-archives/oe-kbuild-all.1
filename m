Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C13DD52D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832671; cv=none; b=DotjaVYEs0Q5UoGQQlaBtED/rRToOOO8ZX+Tw1TAU6y1iyN9w9JnlsPi6k72N9oVc2oi1/KvVmcDKrI91l8H0ufveED2f1j0MEeBgcdZgYSi9ncPGhycfKXG3DYuPJn4xZ7F4zEtelbPmzDV1yjoI2Z0fPyu0loO7+b/+CpfX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832671; c=relaxed/simple;
	bh=v5XFqkKT52yEvyrmKZRxeTf2CxWWlBEe4UpsqHPKD2s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyfldDSZ4F87iHQ7JUg7petP/fT2ZdbOXqXYra6mdEc6QVg9AgjAKNKfWLl2goe47PITT03n4hoiB5Snzti+YjWZ8z++iFxg4JGyy+8Zr5tGSDjdNlz2vPg7bozJzIjmyONHU2CDToOd+tFbceXLo0mBjj1f4YkUxOWdMTZUh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZymPcTl5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZymPcTl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778832670; x=1810368670;
  h=date:from:to:cc:subject:message-id;
  bh=v5XFqkKT52yEvyrmKZRxeTf2CxWWlBEe4UpsqHPKD2s=;
  b=ZymPcTl5MgYNJI7UAFZxk5tBxWorPIp8eY6SnS/1jNKkWG1M8g8goQ7d
   ph1ImZ4tyyzMCB+5Aw+nS79aqaZJofFh35oHwkBFwsQJXbbD9ZBGYWvy4
   gAF/N5UGrY6Y9YCHgHj6lYTTxULwgUv3IzDvNNj54B2LO36tqN0GR5r3+
   lc6BMrrjgUWGKLKhKSYK7xY2WLgnxvZ2juye+RORHIpz+vYrSKTqXpIXA
   r/dsCEG9BKyrAPqisTVJCcISY84Ji7s+hM0Imm2yvze1+a8JAjmng2IS/
   q+2O4kZ9K1u0xH6lPAlyuGur0gk3iVdV9QHijECzN9kU9b7dma+ljtVux
   Q==;
X-CSE-ConnectionGUID: snS+jjFHTSOuvV7s7ongNA==
X-CSE-MsgGUID: J37qtnYmQKmrgaZZ0ATL1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90364636"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90364636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 01:11:09 -0700
X-CSE-ConnectionGUID: jCLp687zQNWNJQdtoIfalg==
X-CSE-MsgGUID: ++5GATpwSGGRHqrpNS5H9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237641724"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 01:11:07 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNndR-000000008xZ-1yVM;
	Fri, 15 May 2026 08:11:05 +0000
Date: Fri, 15 May 2026 10:10:15 +0200
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/scheduler/sched-arch.rst:108:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202605151011.KtNAJKrV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260515-054159
head:   7c2ea3b4f5530a92ddf8bf0b9835101138cbcefb
commit: a9c3470cec4255c02ebdc8637ef447726b6b792f sched/docs: Document cpu_preferred_mask and Preferred CPU concept
date:   10 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260515/202605151011.KtNAJKrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151011.KtNAJKrV-lkp@intel.com/

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
   105	2. This feature works for FAIR/RT class.
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
