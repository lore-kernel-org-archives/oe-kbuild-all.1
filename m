Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301738;
	b=NoPrAQV6jqZUqu9zHoHnX+JXCcPO4JJ8wNfKkev7H+wJMydZvDvaX0ed0lLKBwvyEBZd
	 1MEWPpfZTw+zjvjeBph8VWQHaQHe7mhc5FXuhYeKVx2pCUxxG9SUDkhOxDiermsw8r/h+
	 3khb9WtAr9XPD2Hmn8d8/Xhc+i6GSyezaQLfqKdICV6GNgdyu10p2rpDv1AEFWlybkUDM
	 YaaluaUpSbdtz5KqaKtMGsT6XUoNmKN4VhG/Aopo0lBeP3c/WlukkK19DPfYefiHo4RWV
	 AGdnpbxSRJ6OL9Be1//7lC8yuWiG4JDvLFWkA+9bWGJ6dNhjVUIxEbmsMWutQa5/t4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301738;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ELoHx3KTmzdcXmwp9XHwwUT/rHmDGqjgpwY9xqL35Fk=;
	b=bljStsQ/PSWvrV9G+huap+HwkAdHBLWZkD+JlcDHS7tQEQf1/RsZsWLRAWMcHfJNqcaP
	 UHwkgZc0pyaB4w9penf7R6Z1nHv7exUQfn200112sLHIwcT4tiFTLLBynl4OVuiRW8b3P
	 zknAWaqmZx5Ly1spya5zc16Zqb78H0xKVDKIJO+8j8WI8iuqUbQWHx1c8/lU5cJgpUUxd
	 AyTsJBbzcHHlwMAxqhFaeWZJB1v+BSs5qgvR2OAnxBtQwml74fUVduliw5tnKK2JAYJ2D
	 0FFNlaV6VqXiWYM8dWoY1GnzC5LuAHBtSf8PVr0L22TVbUYmOysu/7ZqxrwEiCTMgUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JshCp4Kx;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD37606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 19:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD37606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JshCp4Kx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793301737; x=1824837737;
  h=date:from:to:cc:subject:message-id;
  bh=gbDAOn2tO3AEFYZU0UUOlYrxeTt6Zam64FKsowpyVqM=;
  b=JshCp4KxyF8d/yZbAsuo8XGUS6yzVoSlHZoQyGPAh/eZyQEK6arqUK61
   oDTOMFDuCJi+grMK+R1QCYXwb3x6ebO8U4FEQbZUK4cG2ds8/9SH8N9zB
   WgZyTivAgFDksFJVmV9oP4j9p51SiAO0bRmp3+jjIpSFzwnfGrqOFygCg
   386Xa/CX7jsDfU81YKk9iBV/L8CNBNiR0WGyvVoIJg6MeELMzWDk9GEFx
   o3MaJ/Zz9nz051zSQJx4nW2RZZ28cu9tn+m8KO7ZqSG/uAX3iZ0zvDTTd
   zcNNmUTeLvNj2vV4DSTsSkwdsJ7v9PriMR33ifX+anWXZ5VBBRwbC39Pl
   Q==;
X-CSE-ConnectionGUID: XImllQ4rQhWbU5dia5IlKg==
X-CSE-MsgGUID: Fi+xjyXISkiA2G4YE2t7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2073390"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2073390"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 12:22:17 -0700
X-CSE-ConnectionGUID: xn6UbdskQTyHF2+/h0C1gw==
X-CSE-MsgGUID: q6go3hnnSru5tvdKkz30Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5112011"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 12:22:15 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMVhT-000000005KJ-0V6h;
	Thu, 29 Oct 2026 19:22:11 +0000
Date: Thu, 29 Oct 2026 20:21:41 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/syscall 3/5]
 arch/x86/entry/syscall_64.c:46:9: error: implicit declaration of function
 'instrumentation_weak'; did you mean 'instrumentation_end'?
Message-ID: <202610292012.o8R3mIvV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall
head:   57a2da426dba48424406ee52c0c931c6d024138a
commit: 2414544a36dd483763751772609d05b965acee6e [3/5] x86_64/entry: Make syscall dispatch noinstr
config: x86_64-randconfig-2300-20261029 (https://download.01.org/0day-ci/archive/20261029/202610292012.o8R3mIvV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292012.o8R3mIvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292012.o8R3mIvV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/entry/syscall_64.c: In function 'x64_sys_call':
>> arch/x86/entry/syscall_64.c:46:9: error: implicit declaration of function 'instrumentation_weak'; did you mean 'instrumentation_end'? [-Wimplicit-function-declaration]
      46 |         instrumentation_weak();
         |         ^~~~~~~~~~~~~~~~~~~~
         |         instrumentation_end


vim +46 arch/x86/entry/syscall_64.c

    35	
    36	/* The unsigned int @nr argument is intentional as it creates denser code */
    37	static noinstr long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
    38	{
    39		/*
    40		 * Because -fno-jump-tables, this compiles into a binary branch tree
    41		 * rather than a jump-table. As such @nr is not used as an array
    42		 * index. Additionally, this is an out-of-line function on purpose,
    43		 * such that all the actual syscall function calls are tail-calls,
    44		 * returning to our caller for the common bits.
    45		 */
  > 46		instrumentation_weak();
    47		switch (nr) {
    48		#include <asm/syscalls_64.h>
    49		default: return __x64_sys_ni_syscall(regs);
    50		}
    51	}
    52	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
