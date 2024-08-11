Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D075258
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723343836; cv=none; b=jIhNiobrzjuL3Fr0GkAjzOYS2n+AbOKslIRGvtTBsC2VQm6xpcBq8pyHj/sOVxZFE9Oumgut2jniBAgWkS2d599cm+szwPTf+ekavPrVasZrJIFI0f9u1RKWIxkqbpMMr5Kt9H6ZYGEJK6BcFdpvpnwHJmedEN4Pje+GEj+S/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723343836; c=relaxed/simple;
	bh=+4QdAkGXGp4hrCX0JM76W0XgS7UHZ/VYqhQE4Fm1ooE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+NX6xUD0Amgz8ngglgxGngHaWyAX7RaiT0utC8ZsjuUsuLvt1PKHVAPLf3regAlgJRNKipsWmKu1Z3Ma1sxslqlzlQB8oeqZJM2+zMvr9ErUWA5S/Eu3nm+C+CBId7cXeacOzmC3bLOUklaUo9YhwjcDaGv3xer3jtRWJvKOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8sDRfKn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8sDRfKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723343834; x=1754879834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4QdAkGXGp4hrCX0JM76W0XgS7UHZ/VYqhQE4Fm1ooE=;
  b=j8sDRfKnUTXrpG1ZzFsRd94U8i/Kmo82zxHlmkTi9crusUOoXBR+lB7D
   JBtwKvCkOqHwQ9kRKPCsNVVEpGzPbCjtpzFUjAQd6Sa5Czjso52dQkca7
   zkVuqn1gynuo/SUWgiOWJGC4jR9/OCJe2Wg9oQotUkP+onXDuSaz865Rh
   /SzLmOayOfYcosiHOO1bDLCmRhGNgPJORjJpl0bf0aKlxkh4T5hh0Yx1o
   dPLfDOdnGdAx5c12fLHuvV7ObRtjRJIwKwYF5Ze9yG9cbUIsXZ7iQ/gRA
   t9enWG9daZkqxV+8Joh1gKH1z7+f6aUZYb5+m/eanfw3i7ahbhNDs23w/
   A==;
X-CSE-ConnectionGUID: 7Pqg0nlDTpWBx1Vn4ibMGg==
X-CSE-MsgGUID: 2/05HqNuQrmMwEo8BCvRcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32891733"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="32891733"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 19:37:14 -0700
X-CSE-ConnectionGUID: /989XiLVREGF5kseg4GE4Q==
X-CSE-MsgGUID: ec5T/6kwSpOc5D2zKMPEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58154033"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Aug 2024 19:37:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scySD-000AVv-2r;
	Sun, 11 Aug 2024 02:37:09 +0000
Date: Sun, 11 Aug 2024 10:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rdma-next 2/37] include/linux/list.h:112:undefined
 reference to `zap_vma_ptes'
Message-ID: <202408111008.h9QtgGsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   e7a9574cc241bed77344c4b3f114796ceec97499
commit: dbd16df1e37fa43c15724954d9d56a266b824bbb [2/37] Introducing Multi-Path DMA Support for mlx5 RDMA Driver
config: riscv-randconfig-001-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111008.h9QtgGsJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111008.h9QtgGsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111008.h9QtgGsJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/infiniband/core/ib_core_uverbs.o: in function `__list_del_entry_valid':
>> include/linux/list.h:112:(.text+0x718): undefined reference to `zap_vma_ptes'


vim +112 include/linux/list.h

b16c42c8fde808 Marco Elver 2023-08-11   97  
b16c42c8fde808 Marco Elver 2023-08-11   98  /*
b16c42c8fde808 Marco Elver 2023-08-11   99   * Performs list corruption checks before __list_del_entry(). Returns false if a
b16c42c8fde808 Marco Elver 2023-08-11  100   * corruption is detected, true otherwise.
aebc7b0d8d91bb Marco Elver 2023-08-11  101   *
aebc7b0d8d91bb Marco Elver 2023-08-11  102   * With CONFIG_LIST_HARDENED only, performs minimal list integrity checking
aebc7b0d8d91bb Marco Elver 2023-08-11  103   * inline to catch non-faulting corruptions, and only if a corruption is
aebc7b0d8d91bb Marco Elver 2023-08-11  104   * detected calls the reporting function __list_del_entry_valid_or_report().
b16c42c8fde808 Marco Elver 2023-08-11  105   */
b16c42c8fde808 Marco Elver 2023-08-11  106  static __always_inline bool __list_del_entry_valid(struct list_head *entry)
b16c42c8fde808 Marco Elver 2023-08-11  107  {
aebc7b0d8d91bb Marco Elver 2023-08-11  108  	bool ret = true;
aebc7b0d8d91bb Marco Elver 2023-08-11  109  
aebc7b0d8d91bb Marco Elver 2023-08-11  110  	if (!IS_ENABLED(CONFIG_DEBUG_LIST)) {
aebc7b0d8d91bb Marco Elver 2023-08-11  111  		struct list_head *prev = entry->prev;
aebc7b0d8d91bb Marco Elver 2023-08-11 @112  		struct list_head *next = entry->next;
aebc7b0d8d91bb Marco Elver 2023-08-11  113  
aebc7b0d8d91bb Marco Elver 2023-08-11  114  		/*
aebc7b0d8d91bb Marco Elver 2023-08-11  115  		 * With the hardening version, elide checking if next and prev
aebc7b0d8d91bb Marco Elver 2023-08-11  116  		 * are NULL, LIST_POISON1 or LIST_POISON2, since the immediate
aebc7b0d8d91bb Marco Elver 2023-08-11  117  		 * dereference of them below would result in a fault.
aebc7b0d8d91bb Marco Elver 2023-08-11  118  		 */
aebc7b0d8d91bb Marco Elver 2023-08-11  119  		if (likely(prev->next == entry && next->prev == entry))
aebc7b0d8d91bb Marco Elver 2023-08-11  120  			return true;
aebc7b0d8d91bb Marco Elver 2023-08-11  121  		ret = false;
aebc7b0d8d91bb Marco Elver 2023-08-11  122  	}
aebc7b0d8d91bb Marco Elver 2023-08-11  123  
aebc7b0d8d91bb Marco Elver 2023-08-11  124  	ret &= __list_del_entry_valid_or_report(entry);
aebc7b0d8d91bb Marco Elver 2023-08-11  125  	return ret;
b16c42c8fde808 Marco Elver 2023-08-11  126  }
d7c816733d501b Kees Cook   2016-08-17  127  #else
d7c816733d501b Kees Cook   2016-08-17  128  static inline bool __list_add_valid(struct list_head *new,
d7c816733d501b Kees Cook   2016-08-17  129  				struct list_head *prev,
d7c816733d501b Kees Cook   2016-08-17  130  				struct list_head *next)
d7c816733d501b Kees Cook   2016-08-17  131  {
d7c816733d501b Kees Cook   2016-08-17  132  	return true;
d7c816733d501b Kees Cook   2016-08-17  133  }
0cd340dcb05c4a Kees Cook   2016-08-17  134  static inline bool __list_del_entry_valid(struct list_head *entry)
0cd340dcb05c4a Kees Cook   2016-08-17  135  {
0cd340dcb05c4a Kees Cook   2016-08-17  136  	return true;
0cd340dcb05c4a Kees Cook   2016-08-17  137  }
d7c816733d501b Kees Cook   2016-08-17  138  #endif
d7c816733d501b Kees Cook   2016-08-17  139  

:::::: The code at line 112 was first introduced by commit
:::::: aebc7b0d8d91bbc69e976909963046bc48bca4fd list: Introduce CONFIG_LIST_HARDENED

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
