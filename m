Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D6A63D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 01:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCBikPg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702517214; x=1734053214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShP1RF2OKayGx4P6QhA6P+2q3H41kwVUML4l/9BrTdY=;
  b=QCBikPg3SvHIAYcA7hq7ztkr2QQf+tUn13cCVNobf0PigGcYE3vH3V2i
   1jpNU6ed8S5lK+vDCR0111KnEDJU0ZqzxLX7siO9RB51zhLGEhY/bMvrU
   XXruUxz5Vaw+Tfjt/OWj3XDbqjY2vRED+Lsh7dCZaWTJ+9rEd0sYuSkeU
   zjOVDpOND3WhD1Hd0sHAkyZ+kDZTgVVGuRR+UiMqnrKDGHgKoSdercjma
   E2M36VlKUh/f1SZuQUq9k2xi/6fuljZ+dcLHfqjj7QAvq8CridXG3NPNq
   1lcjTtp/jIqSciv4aFFTA5g5j2ujMG+wkLQYwXv6SUvo3l4qClATuukoz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1885139"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1885139"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:26:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844527628"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="844527628"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 17:26:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDaTv-000LNf-2m;
	Thu, 14 Dec 2023 01:26:09 +0000
Date: Thu, 14 Dec 2023 09:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Neeraj Upadhyay (AMD)" <neeraj.iitr10@gmail.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: [linux-next:master 6386/7300] kernel/rcu/tree.c:2965:(.text+0x5b44):
 relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312140939.zA3tdSi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 4e58aaeebb3c27993c734c99eae6881b196b1ddb [6386/7300] rcu: Restrict access to RCU CPU stall notifiers
config: csky-randconfig-r013-20230826 (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140939.zA3tdSi2-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/tree.o: in function `drain_page_cache':
>> kernel/rcu/tree.c:2965:(.text+0x5b44): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.c:2968:(.text+0x5b5c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.o: in function `kfree_rcu_shrink_scan':
   kernel/rcu/tree.c:3476:(.text+0x5b6a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.o: in function `rcu_do_batch':
   kernel/rcu/tree.c:2102:(.text+0x5be6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.c:2117:(.text+0x5c06): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.c:2119:(.text+0x5c22): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.c:2135:(.text+0x5c66): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.c:2144:(.text+0x5ca2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.o: in function `rcu_lock_acquire':
>> include/linux/rcupdate.h:301:(.text+0x5cb2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   include/linux/rcupdate.h:301:(.text+0x5cce): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   kernel/rcu/tree.o: in function `rcu_lock_release':
   include/linux/rcupdate.h:306:(.text+0x5cee): additional relocation overflows omitted from the output


vim +2965 kernel/rcu/tree.c

53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2951) 
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2952  static int
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2953  drain_page_cache(struct kfree_rcu_cpu *krcp)
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2954  {
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2955  	unsigned long flags;
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2956  	struct llist_node *page_list, *pos, *n;
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2957  	int freed = 0;
53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2958) 
6b706e5603c44f Zqiang                  2023-04-18  2959  	if (!rcu_min_cached_objs)
6b706e5603c44f Zqiang                  2023-04-18  2960  		return 0;
6b706e5603c44f Zqiang                  2023-04-18  2961  
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2962  	raw_spin_lock_irqsave(&krcp->lock, flags);
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2963  	page_list = llist_del_all(&krcp->bkvcache);
ac7625ebd5f7ba Uladzislau Rezki (Sony  2021-04-15  2964) 	WRITE_ONCE(krcp->nr_bkv_objs, 0);
d0bfa8b3c411e2 Zhang Qiang             2021-04-15 @2965  	raw_spin_unlock_irqrestore(&krcp->lock, flags);
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2966  
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2967  	llist_for_each_safe(pos, n, page_list) {
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2968  		free_page((unsigned long)pos);
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2969  		freed++;
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2970  	}
53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2971) 
d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2972  	return freed;
53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2973) }
53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2974) 

:::::: The code at line 2965 was first introduced by commit
:::::: d0bfa8b3c411e25e014e4131d2804afe29c440a6 kvfree_rcu: Release a page cache under memory pressure

:::::: TO: Zhang Qiang <qiang.zhang@windriver.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
