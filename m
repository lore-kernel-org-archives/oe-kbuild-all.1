Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DB3DDBC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689150596; x=1720686596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8yPts8BB2j2/aD38+E2XFKifop5IC96Mbn6f5CO5mg4=;
  b=dYwQrb+ugOzpH+VH2zsHNRe/cIVKwgn2zYOtXvh4Cr4bBL6YGVm+7ac6
   57ipl/d8TMX4Frj7KtKmPLnoZwzLmZdNyQvwdlcIp35upQSpSk+rW6U6t
   QkW3Ya0syNxFQOYUaac2h+FBDUfPQIx58SSU4bese/X5uBHHk/jyPOLBl
   Ck5no41yU3tggWRzdgV5fzu4xC6En4BuQ0chViYAa9650XaacM0RdmVfr
   Ky22kQ506ad83p04j3+0Dd0ED/lJzkth365QiKfBJgkdabxC4ZejWawH0
   JJ1KTHS5l7OKfcgOkfaQ06EesxB9csBf2dnWzjGTfJenUwxaCBP1nQo9K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430962364"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="430962364"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 01:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791545963"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="791545963"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 01:29:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJVEJ-0005YL-1v;
	Wed, 12 Jul 2023 08:29:47 +0000
Date: Wed, 12 Jul 2023 16:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 476/536] block/blk-cgroup.c:1208:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202307121609.BD1WqzCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   d1ccb2b601e7279db7b279cbfb6d8792cc280299
commit: a7c7dbac32b9fc615ba132dbac34a467192964dc [476/536] blk-cgroup: Optimize blkcg_rstat_flush()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230712/202307121609.BD1WqzCn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121609.BD1WqzCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121609.BD1WqzCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-cgroup.c:23:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from block/blk-cgroup.c:23:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from block/blk-cgroup.c:23:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> block/blk-cgroup.c:1208:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1208 |         if (init_blkcg_llists(blkcg))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-cgroup.c:1258:9: note: uninitialized use occurs here
    1258 |         return ret;
         |                ^~~
   block/blk-cgroup.c:1208:2: note: remove the 'if' if its condition is always false
    1208 |         if (init_blkcg_llists(blkcg))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1209 |                 goto free_blkcg;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-cgroup.c:1193:33: note: initialize the variable 'ret' to silence this warning
    1193 |         struct cgroup_subsys_state *ret;
         |                                        ^
         |                                         = NULL
   13 warnings generated.


vim +1208 block/blk-cgroup.c

  1188	
  1189	static struct cgroup_subsys_state *
  1190	blkcg_css_alloc(struct cgroup_subsys_state *parent_css)
  1191	{
  1192		struct blkcg *blkcg;
  1193		struct cgroup_subsys_state *ret;
  1194		int i;
  1195	
  1196		mutex_lock(&blkcg_pol_mutex);
  1197	
  1198		if (!parent_css) {
  1199			blkcg = &blkcg_root;
  1200		} else {
  1201			blkcg = kzalloc(sizeof(*blkcg), GFP_KERNEL);
  1202			if (!blkcg) {
  1203				ret = ERR_PTR(-ENOMEM);
  1204				goto unlock;
  1205			}
  1206		}
  1207	
> 1208		if (init_blkcg_llists(blkcg))
  1209			goto free_blkcg;
  1210	
  1211		for (i = 0; i < BLKCG_MAX_POLS ; i++) {
  1212			struct blkcg_policy *pol = blkcg_policy[i];
  1213			struct blkcg_policy_data *cpd;
  1214	
  1215			/*
  1216			 * If the policy hasn't been attached yet, wait for it
  1217			 * to be attached before doing anything else. Otherwise,
  1218			 * check if the policy requires any specific per-cgroup
  1219			 * data: if it does, allocate and initialize it.
  1220			 */
  1221			if (!pol || !pol->cpd_alloc_fn)
  1222				continue;
  1223	
  1224			cpd = pol->cpd_alloc_fn(GFP_KERNEL);
  1225			if (!cpd) {
  1226				ret = ERR_PTR(-ENOMEM);
  1227				goto free_pd_blkcg;
  1228			}
  1229			blkcg->cpd[i] = cpd;
  1230			cpd->blkcg = blkcg;
  1231			cpd->plid = i;
  1232			if (pol->cpd_init_fn)
  1233				pol->cpd_init_fn(cpd);
  1234		}
  1235	
  1236		spin_lock_init(&blkcg->lock);
  1237		refcount_set(&blkcg->online_pin, 1);
  1238		INIT_RADIX_TREE(&blkcg->blkg_tree, GFP_NOWAIT | __GFP_NOWARN);
  1239		INIT_HLIST_HEAD(&blkcg->blkg_list);
  1240	#ifdef CONFIG_CGROUP_WRITEBACK
  1241		INIT_LIST_HEAD(&blkcg->cgwb_list);
  1242	#endif
  1243		list_add_tail(&blkcg->all_blkcgs_node, &all_blkcgs);
  1244	
  1245		mutex_unlock(&blkcg_pol_mutex);
  1246		return &blkcg->css;
  1247	
  1248	free_pd_blkcg:
  1249		for (i--; i >= 0; i--)
  1250			if (blkcg->cpd[i])
  1251				blkcg_policy[i]->cpd_free_fn(blkcg->cpd[i]);
  1252		free_percpu(blkcg->lhead);
  1253	free_blkcg:
  1254		if (blkcg != &blkcg_root)
  1255			kfree(blkcg);
  1256	unlock:
  1257		mutex_unlock(&blkcg_pol_mutex);
  1258		return ret;
  1259	}
  1260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
