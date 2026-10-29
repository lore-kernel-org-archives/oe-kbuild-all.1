Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267384;
	b=e/WMgimUpa85gB9kV+Dt3HvGFGlkh8i/Erk6pLl3MFltnlUnaT45RSY5pAJYI1c+MmVU
	 Y4W83VBhzpmP1PsJa8p22JZaBSwhOeWjisCBSONmr27EBUm7yC4skMVECtNp7qlHVCaa0
	 W1PCXkuuD1CnPAYaQE6YK2CCzOyQJzEVVlFNzmig1TzU9k36yPkDgH1nhm4ctiEbLP5ZC
	 pXwlBbnkeMKarTo3CecCkFjY8z2s6OFL8ldbUY4mB7jENCKtizsPjRFMPj64TxsTWzQeh
	 9rOl7xJUzPu/lATHvTicgAhKHDuwb/ht/J+uhXQrAXpRcHrxBXzlX4ay2eQGGT98lpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ip6OodyYgPxE8i09BPkUuXD8qFekO1thWPUvSkoK3J8=;
	b=MnaKyPXei+LG2EARXKIhLn6mwxvqaiY1P3f7Jk5H97Zbr6lsLBZEALMTxCicF04KJbJG
	 byUNagGr6hV2oVxUZYD5IjIIpNV9YGlU+Vxa3+tSWPyijtB340BX3/MfFf8lKsyGl1RkC
	 mRrYsYwAIx8s/M5DniUfF6+KzYmzaeciRyxLX0C7PYWrlibt/Q75X4BSj5anW3gEx3V/2
	 ox8OfhoTbrVNzj4Um+6waIsMpabXctjV9gFyNlUFpnHq6OmH2PE04qdB+8hLGilkJQXVg
	 Yo73rl88rWc2mfGqEEfwCe0vrZdLpfVH64wT187915IOapBA72werdJFY1qKmClAd0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gyxIZU;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80866606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80866606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A2gyxIZU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793267384; x=1824803384;
  h=date:from:to:cc:subject:message-id;
  bh=Dq9NImGikAuV9Umk8V6qIF4lVM1M/yT467NQ5v6qDPA=;
  b=A2gyxIZUqLPBohsWDkqJDkUyjV65k/i8X+Ah+PGEODmAzo8GlFBSjoFJ
   vPqClLLrgzrZ+PehxPvm1mEBdpnyNXgYVtaAnUgxFYyMZC6Owcsbwaf/y
   p/jkIxgxnd0ab1cLK+gqMZ7ztleL7Kj7XdNqji4RMz3bU2UJcWQYEpiYN
   Ro6TWh0gILWDX7orjgcyTud+5kKT9O2VEUcjok6BxHLas9+HwdSm/Wm/f
   nONQdMYRNXW3M35lx/2R/2IH7qF40NdDoXeuCgVqxN7SgyM+aJ+FVdAAE
   qF3Jx5LKy+iZhBAEC8nQ6t35+jwtmWm7xSjeLr2nt5CgjWRw+hx8fxiTC
   A==;
X-CSE-ConnectionGUID: JttgGmDKQA6qMrVkxy4Xjg==
X-CSE-MsgGUID: 6Q3RBXCxRYmIVCNuE6TjyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2008846"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2008846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:49:43 -0700
X-CSE-ConnectionGUID: S4hyHfXDRx+gLYzdF+BIpQ==
X-CSE-MsgGUID: pN/2Iq8UQaeYqceB1AlvWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4977246"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 02:49:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMMlO-00000000Zuy-1PSC;
	Thu, 29 Oct 2026 09:49:38 +0000
Date: Thu, 29 Oct 2026 17:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 dump_buffer_page.isra.25+0x194 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202610291727.DXytMLtV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c339f4010dea8b0d754f84ace70cd1b089878ef8
commit: 47e725702b0b7c01d4ae4ef231df8f63e5f305d5 mm: make per-VMA locks available universally
date:   3 weeks ago
config: xtensa-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291727.DXytMLtV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291727.DXytMLtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47e725702b0b ("mm: make per-VMA locks available universally")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291727.DXytMLtV-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x3c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: dump_buffer_page.isra.25+0x194 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
