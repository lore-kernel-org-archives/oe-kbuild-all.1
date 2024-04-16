Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B212C7E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278310; cv=none; b=I3HKKe4KxIDZJM5eioxdCATraIix/1TdFCxeabifOFWC+EF/Zk0kTePliu6EC/Zi2gNNYCTwduNmBX8UwFZW/p2u5FyeKSQkG4/BsNOm8x8WknKHiBF0++uzg9s0KnBKfTDkWulO1DnEGMFvaMH71nc/XtmM7Yk/Uw0jjzeCuUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278310; c=relaxed/simple;
	bh=fp8iaQk1hUTvqkY+1aQTM//vZgaQmHJR07okHTclYtI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=otX3mvtA8V0gdYTibkm+W8UdKYiMP8E8DMdCULGByEnMjN8NP5EmKiNH406ZtrSonjBakicdb1/WH9LuMcU7ICYyYBo4BsgVfav8NY+Xrxn/X824ET68ARJyKZ4bEmoNlLJabt4Cbxd8NAsAMz/Ltezpz8TQotG679KI7KHB9ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilqgM5TX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilqgM5TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713278306; x=1744814306;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fp8iaQk1hUTvqkY+1aQTM//vZgaQmHJR07okHTclYtI=;
  b=ilqgM5TXn6z5P+hlew/7GVYyfDdUE3ksT0Q5FfSuUZe6i/5X7uCO/XmB
   zPTVEGguuH8ZjhDhVz5LZoGd1TXhxKeqKRG+a/uLvYuex0O8QbG40Ykta
   GjDWnttKAIAXH6dEy+njkZtXpWCKvyVqJUs6yr5HWrM00lzm0csBEN8zo
   XFDhwrohyBd/3Zpr9RhC0aG0bwLzy3JW4nAOJGzzutflNve18cZZ8w+Mi
   2+k3hRNISe+8JZe5BOksG52CwT5VdkpNLXYqOvMu/HJkoKTriUjMiLLOc
   MsRlqw4iWceU5b9LRuoTQCxT1s9ZSkZLDJK6jEryyXMImfNnvDjHsf/5I
   w==;
X-CSE-ConnectionGUID: /A2/x5VeSOq3daNZCrkLlg==
X-CSE-MsgGUID: ZenSOMrXQjS+AhRr1Vf/ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8597432"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8597432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:38:25 -0700
X-CSE-ConnectionGUID: EbZLUMrSQAaV2pM+T4Cxaw==
X-CSE-MsgGUID: NFwZ8gSiT72LOzPxGgBdXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22347566"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Apr 2024 07:38:25 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwjwv-0005Mu-1V
	for oe-kbuild-all@lists.linux.dev;
	Tue, 16 Apr 2024 14:38:18 +0000
Date: Tue, 16 Apr 2024 22:37:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: include/linux/list.h:289:21: warning: storing the address of local
 variable 'sublist' in '((struct list_head *)freepage)[1].next'
Message-ID: <202404162216.oIdznEil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6.1/dovetail-xenomai-cve
head:   ae50ab5b35a1f535d25c6c9576c161702409774a
commit: 70b44595eafe9c7c235f076d653a268ca1ab9fdb mm, compaction: use free lists to quickly locate a migration source
date:   5 years ago
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20240416/202404162216.oIdznEil-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162216.oIdznEil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162216.oIdznEil-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:19,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   In function '__list_cut_position',
       inlined from 'list_cut_position' at include/linux/list.h:319:3,
       inlined from 'move_freelist_tail' at mm/compaction.c:1066:3:
>> include/linux/list.h:289:21: warning: storing the address of local variable 'sublist' in '((struct list_head *)freepage)[1].next' [-Wdangling-pointer=]
     289 |         entry->next = list;
         |         ~~~~~~~~~~~~^~~~~~
   mm/compaction.c: In function 'move_freelist_tail':
   mm/compaction.c:1063:19: note: 'sublist' declared here
    1063 |         LIST_HEAD(sublist);
         |                   ^~~~~~~
   include/linux/list.h:24:26: note: in definition of macro 'LIST_HEAD'
      24 |         struct list_head name = LIST_HEAD_INIT(name)
         |                          ^~~~
   mm/compaction.c:1061:61: note: 'freepage' declared here
    1061 | move_freelist_tail(struct list_head *freelist, struct page *freepage)
         |                                                ~~~~~~~~~~~~~^~~~~~~~
   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s11,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s11', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required


vim +289 include/linux/list.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  281  
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  282  static inline void __list_cut_position(struct list_head *list,
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  283  		struct list_head *head, struct list_head *entry)
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  284  {
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  285  	struct list_head *new_first = entry->next;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  286  	list->next = head->next;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  287  	list->next->prev = list;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  288  	list->prev = entry;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06 @289  	entry->next = list;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  290  	head->next = new_first;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  291  	new_first->prev = head;
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  292  }
00e8a4da8cf0d7d Luis R. Rodriguez 2008-08-06  293  

:::::: The code at line 289 was first introduced by commit
:::::: 00e8a4da8cf0d7dba8cc4b0da28ea0f12dcf6b36 list.h: add list_cut_position()

:::::: TO: Luis R. Rodriguez <lrodriguez@atheros.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
