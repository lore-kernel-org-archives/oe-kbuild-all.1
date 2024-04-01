Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72CD137E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940947; cv=none; b=U2pba/7WMlTD0b3jP9bTeXmPYPRCgN3+Ih4sLzkGIIeJqTh9csRC9phoP+kaMEMMSFMjEp9aiv8d2Ka2F1TwoK0TMcFfQ8YPCTEgQLHtDTAIP6mMm2mMyc41MuZZ10hK4A9at7Nfw1G649znrnYalZMGUsiL4Yl7wfYM+uPoAfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940947; c=relaxed/simple;
	bh=swY/Pv8MLPfDKkh1kLYkz8IzjgF9q7YDRTl8lmbFf/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3BD8U7A4OMm6PGkSUULzQV7ygjDRjyU9hYtqPWgh1L0BUwStvEEIk/8l+/Q0bYU+8yXHUyop+6f4DBwVUVALglbIN4zXCRRdCgJyoHeBkt7xrsxvPW8h1Z3uOehGOfAgEjvtLbreGgIIIwNk1x42y4H4sWS3rFYJUu1PZ/AI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mzrf2lg/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mzrf2lg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711940946; x=1743476946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swY/Pv8MLPfDKkh1kLYkz8IzjgF9q7YDRTl8lmbFf/c=;
  b=Mzrf2lg/lR2VvuqjwE5sPLFaLLPtwsc+oXrtr7zyq+X0Dm/vkU+2IgfH
   QM6Y4uBmqrDmXtPuVd9a8SssVkgkKNjk1rXJoToGqd9N/DfF9HcBLRmWn
   mMyCsqIRCWrqfXIHeX6uW5B4E75ULLbXYLXUVxhNGlMy+3nU7tGAz7D++
   xoLGqr+oOiwgeDdXdXD16CbBzRzyglSPKElFi+tvjwR3jhblQ79wDnqTR
   y9Q0PSN4iEnG+YjTeuT1AJGS0znjTOzyMfm7HHD31/86oHgiGWPYeMEsD
   OEuY81I7O/6CSnR/4GcdkEdQgq75YTrNRqF6ybbjfDLnDlzZW2vhId2yJ
   g==;
X-CSE-ConnectionGUID: 6Hox3CVeSNCRT8bqcDP3kA==
X-CSE-MsgGUID: oOeCJz1ISxS15Sxky2Q2KQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6953706"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6953706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 20:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="48562881"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2024 20:09:01 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr82d-0001c6-0y;
	Mon, 01 Apr 2024 03:08:59 +0000
Date: Mon, 1 Apr 2024 11:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: kernel/kprobes.c:145: warning: Function parameter or member 'c' not
 described in '__get_insn_slot'
Message-ID: <202404011027.QGLZE6SP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiezhu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   39cd87c4eb2b893354f3b850f916353f2658ae6f
commit: 6d4cc40fb5f58147defc6c0e9d86e6232fe31616 LoongArch: Add kprobes support
date:   1 year, 1 month ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20240401/202404011027.QGLZE6SP-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404011027.QGLZE6SP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011027.QGLZE6SP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kprobes.c:145: warning: Function parameter or member 'c' not described in '__get_insn_slot'


vim +145 kernel/kprobes.c

b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  139  
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  140  /**
129415607845d4d Masami Hiramatsu           2009-01-06  141   * __get_insn_slot() - Find a slot on an executable page for an instruction.
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  142   * We allocate an executable page if there's no room on existing ones.
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  143   */
55479f64756fc50 Masami Hiramatsu           2014-04-17  144  kprobe_opcode_t *__get_insn_slot(struct kprobe_insn_cache *c)
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27 @145  {
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  146  	struct kprobe_insn_page *kip;
c802d64a356b5cf Heiko Carstens             2013-09-11  147  	kprobe_opcode_t *slot = NULL;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  148  
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  149  	/* Since the slot array is not protected by rcu, we need a mutex */
c802d64a356b5cf Heiko Carstens             2013-09-11  150  	mutex_lock(&c->mutex);
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  151   retry:
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  152  	rcu_read_lock();
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  153  	list_for_each_entry_rcu(kip, &c->pages, list) {
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  154  		if (kip->nused < slots_per_page(c)) {
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  155  			int i;
223a76b268c9cfa Masami Hiramatsu           2021-09-14  156  
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  157  			for (i = 0; i < slots_per_page(c); i++) {
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  158  				if (kip->slot_used[i] == SLOT_CLEAN) {
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  159  					kip->slot_used[i] = SLOT_USED;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  160  					kip->nused++;
c802d64a356b5cf Heiko Carstens             2013-09-11  161  					slot = kip->insns + (i * c->insn_size);
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  162  					rcu_read_unlock();
c802d64a356b5cf Heiko Carstens             2013-09-11  163  					goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  164  				}
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  165  			}
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  166  			/* kip->nused is broken. Fix it. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  167  			kip->nused = slots_per_page(c);
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  168  			WARN_ON(1);
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  169  		}
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  170  	}
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  171  	rcu_read_unlock();
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  172  
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  173  	/* If there are any garbage slots, collect it and try again. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  174  	if (c->nr_garbage && collect_garbage_slots(c) == 0)
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  175  		goto retry;
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  176  
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  177  	/* All out of space.  Need to allocate a new page. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  178  	kip = kmalloc(KPROBE_INSN_PAGE_SIZE(slots_per_page(c)), GFP_KERNEL);
6f716acd5fa20ae Christoph Hellwig          2007-05-08  179  	if (!kip)
c802d64a356b5cf Heiko Carstens             2013-09-11  180  		goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  181  
af96397de860023 Heiko Carstens             2013-09-11  182  	kip->insns = c->alloc();
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  183  	if (!kip->insns) {
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  184  		kfree(kip);
c802d64a356b5cf Heiko Carstens             2013-09-11  185  		goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  186  	}
c5cb5a2d8d7dc87 Masami Hiramatsu           2009-06-30  187  	INIT_LIST_HEAD(&kip->list);
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  188  	memset(kip->slot_used, SLOT_CLEAN, slots_per_page(c));
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  189  	kip->slot_used[0] = SLOT_USED;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  190  	kip->nused = 1;
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  191  	kip->ngarbage = 0;
af96397de860023 Heiko Carstens             2013-09-11  192  	kip->cache = c;
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  193  	list_add_rcu(&kip->list, &c->pages);
c802d64a356b5cf Heiko Carstens             2013-09-11  194  	slot = kip->insns;
69e49088692899d Adrian Hunter              2020-05-12  195  
69e49088692899d Adrian Hunter              2020-05-12  196  	/* Record the perf ksymbol register event after adding the page */
69e49088692899d Adrian Hunter              2020-05-12  197  	perf_event_ksymbol(PERF_RECORD_KSYMBOL_TYPE_OOL, (unsigned long)kip->insns,
69e49088692899d Adrian Hunter              2020-05-12  198  			   PAGE_SIZE, false, c->sym);
c802d64a356b5cf Heiko Carstens             2013-09-11  199  out:
c802d64a356b5cf Heiko Carstens             2013-09-11  200  	mutex_unlock(&c->mutex);
c802d64a356b5cf Heiko Carstens             2013-09-11  201  	return slot;
129415607845d4d Masami Hiramatsu           2009-01-06  202  }
129415607845d4d Masami Hiramatsu           2009-01-06  203  

:::::: The code at line 145 was first introduced by commit
:::::: 9ec4b1f356b3bad928ae8e2aa9caebfa737d52df [PATCH] kprobes: fix single-step out of line - take2

:::::: TO: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
