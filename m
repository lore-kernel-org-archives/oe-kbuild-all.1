Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693F2F26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734854442; cv=none; b=j7+kHoqPejT6XEuf3SIv4yN7ASPWrK1LW9rhblyCLVMlBjud3YG7wwlobAf4TBVIG/R5aLGucv24AsEqEaR0sJerh3FvJKls0WIRopymarIf3mJUEwaxd5+8SzBgmu8VCqKxH89JdgmnMro8TfyOEa88G2z6XAC+4iGIVzD55oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734854442; c=relaxed/simple;
	bh=2hLxYglG0eSxq1heZrtXiKETndfIoxbwjdLZBA/LyfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGrHQQv0ghHTNWG1auAsv3zKUoQNksMGg/R6wqpDv2D5/0+4x6/2e/ikADbdd9d62obe/UZysAghObE+CAp7MG6cvrypD2PIJ3tDJUyalB7SqgspAGR72RFLJyphkC9W2Eu6fJo66HutjXCsxj0uHkpTaj9i90CCKnvCtpnovMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsubP4FD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsubP4FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734854440; x=1766390440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2hLxYglG0eSxq1heZrtXiKETndfIoxbwjdLZBA/LyfM=;
  b=EsubP4FDBXYGcXvbbusBki80F+RFCz6JocomWBzfgNlk2UOkxgcoV95z
   x1N4tdosci2BkjzxtpD8+SFGodyO2aSQzcy1ES+gok36RtUtpKPAaiFp2
   B/9Okv6iHsaX/HBwr6kAMumBz6NNWqIKlM3Uh9DTSYxJ0oA34g6ILJ/9+
   lodinipKlZfZ5gYHaIMZ+kqqXZod9yAi6Ij21BxMwWOus8krQnBwqglLk
   mKOesXdJhLDYrIW3ek4irSjl9Px+qKjJOcaKdpYdhBaSx78zuYOdzafKj
   WG5GYAZ9zAlZr8aOmUGW80JRpGSj51MoM3cnAOO9swAtGw0ZXn8aD5hmE
   g==;
X-CSE-ConnectionGUID: EuMe9F4LSzixazQi1HA55g==
X-CSE-MsgGUID: XLm1SCQJTtKxXX2qYY0aHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35565838"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35565838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:00:40 -0800
X-CSE-ConnectionGUID: q0l1s8YeTYGyz8oM2eGYQQ==
X-CSE-MsgGUID: EKQ/5hGBQYKTfwtnPWW9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103905083"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Dec 2024 00:00:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGtA-0002nb-0y;
	Sun, 22 Dec 2024 08:00:36 +0000
Date: Sun, 22 Dec 2024 15:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@stackframe.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Helge Deller <deller@gmx.de>
Subject: kernel/kprobes.c:145: warning: Function parameter or struct member
 'c' not described in '__get_insn_slot'
Message-ID: <202412221527.sjEK4g7J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sven,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48f506ad0b683d3e7e794efa60c5785c4fdc86fa
commit: 8858ac8e9e9b1894f7bb218bc0035532371b8d7e parisc: Implement kprobes
date:   6 years ago
config: parisc-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241222/202412221527.sjEK4g7J-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221527.sjEK4g7J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221527.sjEK4g7J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kprobes.c:145: warning: Function parameter or struct member 'c' not described in '__get_insn_slot'


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
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  156  			for (i = 0; i < slots_per_page(c); i++) {
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  157  				if (kip->slot_used[i] == SLOT_CLEAN) {
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  158  					kip->slot_used[i] = SLOT_USED;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  159  					kip->nused++;
c802d64a356b5cf Heiko Carstens             2013-09-11  160  					slot = kip->insns + (i * c->insn_size);
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  161  					rcu_read_unlock();
c802d64a356b5cf Heiko Carstens             2013-09-11  162  					goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  163  				}
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  164  			}
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  165  			/* kip->nused is broken. Fix it. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  166  			kip->nused = slots_per_page(c);
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  167  			WARN_ON(1);
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  168  		}
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  169  	}
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  170  	rcu_read_unlock();
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  171  
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  172  	/* If there are any garbage slots, collect it and try again. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  173  	if (c->nr_garbage && collect_garbage_slots(c) == 0)
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  174  		goto retry;
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  175  
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  176  	/* All out of space.  Need to allocate a new page. */
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  177  	kip = kmalloc(KPROBE_INSN_PAGE_SIZE(slots_per_page(c)), GFP_KERNEL);
6f716acd5fa20ae Christoph Hellwig          2007-05-08  178  	if (!kip)
c802d64a356b5cf Heiko Carstens             2013-09-11  179  		goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  180  
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  181  	/*
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  182  	 * Use module_alloc so this page is within +/- 2GB of where the
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  183  	 * kernel image and loaded module images reside. This is required
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  184  	 * so x86_64 can correctly handle the %rip-relative fixups.
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  185  	 */
af96397de860023 Heiko Carstens             2013-09-11  186  	kip->insns = c->alloc();
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  187  	if (!kip->insns) {
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  188  		kfree(kip);
c802d64a356b5cf Heiko Carstens             2013-09-11  189  		goto out;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  190  	}
c5cb5a2d8d7dc87 Masami Hiramatsu           2009-06-30  191  	INIT_LIST_HEAD(&kip->list);
4610ee1d3638fa0 Masami Hiramatsu           2010-02-25  192  	memset(kip->slot_used, SLOT_CLEAN, slots_per_page(c));
ab40c5c6b6861ee Masami Hiramatsu           2007-01-30  193  	kip->slot_used[0] = SLOT_USED;
9ec4b1f356b3bad Ananth N Mavinakayanahalli 2005-06-27  194  	kip->nused = 1;
b4c6c34a530b4d1 Masami Hiramatsu           2006-12-06  195  	kip->ngarbage = 0;
af96397de860023 Heiko Carstens             2013-09-11  196  	kip->cache = c;
5b485629ba0d5d0 Masami Hiramatsu           2017-01-08  197  	list_add_rcu(&kip->list, &c->pages);
c802d64a356b5cf Heiko Carstens             2013-09-11  198  	slot = kip->insns;
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
