Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECB428498
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 10:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380757; cv=none; b=srGrsPjT5tV9TlvnxVy+JC4N2u9MQ4nglG4auBIRL02aMVrXNVHAyOxKvTBUtRyj473Ij6G9ya34aiMPJMzFbLQej6ztf2YPdmxl2tX4GGC3brqgFIziioLAtl0W9PJGQcUblHGvIfI8OH8t9Heb8qRIWEWLCDknX0jQAID5Cy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380757; c=relaxed/simple;
	bh=fLNXnmy3ks5cPz3XbdUbetsxcG8HjC0hCQl8h/Kpevg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h7VfIOn0+XsLp0ROtQwp2IlP7Y52XPpWJ1ZCi0e24GoINLFyti/cAZubfNAnWYsMcAepDn46IXReukBs0MdgL0u+8M40sHlXwktPHDravrTO3VreJySAhVEYBCfZCszmGh6P0FsZdbRGRFxY3LaTgLsaVQs0VZwti38mHqlSsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2h4M9x8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2h4M9x8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789380755; x=1820916755;
  h=date:from:to:cc:subject:message-id;
  bh=fLNXnmy3ks5cPz3XbdUbetsxcG8HjC0hCQl8h/Kpevg=;
  b=V2h4M9x8Ej8yxzS24EbABRl2YT3aEBjpzo8zEhjDu2m3mWZYpNF08qDH
   Jr5n4l8ltLH2U8fSyZAB6t/MUNk169TiaJRQ72ZwVf1MnsFCXwEPhmsAP
   O+8QCZvke0ShWxplguEIPkNlznTmlqE+QNzoVM9O/4uMO04EGdaydCs45
   wJFDKlvuo1QAe4NvZHiplTGwNaKBh5WUtISQiY0duWRKz3zFPeppHjBqC
   8IPDUn5QhdP6LNVxn4kR4wfBvS3qKSoUpNsz1prQ+TLckMu1fP8xm5F04
   4RXw3q9BMoFroYmXnj4PAVk/49VQUtnjwyhevK3hpXk1KAyuVpJQvmpyF
   g==;
X-CSE-ConnectionGUID: 5Lg0E1KFQfGJ1i1csmdoAw==
X-CSE-MsgGUID: 6eV5VoHIT6+oVduwFx2HPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="115266304"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="115266304"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:12:32 -0700
X-CSE-ConnectionGUID: GN5Me/jXSvqguXbJR2kC3A==
X-CSE-MsgGUID: InaHuhsbQzylm6sjVlzgdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="270799696"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2026 03:12:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x63fo-000000002lD-2h3V;
	Mon, 14 Sep 2026 10:12:28 +0000
Date: Mon, 14 Sep 2026 18:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 hung_task_blocker_to_lock+0x48 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202609141856.psi6N6tP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: efdcfd9b4f4f07aa70663ee02a79dbdf980bf582 tracing: Use seq_buf for string concatenation
date:   7 weeks ago
config: xtensa-randconfig-r112-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141856.psi6N6tP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141856.psi6N6tP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: efdcfd9b4f4f ("tracing: Use seq_buf for string concatenation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141856.psi6N6tP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x3c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: hung_task_blocker_to_lock+0x48 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
