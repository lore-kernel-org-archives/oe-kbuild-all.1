Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115AD27475
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="du4sDHlE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697734161; x=1729270161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7fmDUeFO424ZsRsTPdvYXQZ7InvWicRjdJyXye9JVVQ=;
  b=du4sDHlEOIZYvzRkVhktaxDuZf79qUVLAfNW1suc7TdzuIPFIEtOkjVz
   f/lJqCyf/fhPaNM+CAd56BltwhOcQ1GRTwXX4QPe7Os+/j0MnCuM35pbg
   Upzhde+cim4nImlFdt1hucv4Nk8CdgB+0eAKRUOVUxYQkW+aHBStVtuvw
   r3hIpbpiJPxnMYsFE0PwGsLT0TASY95G1Y8w393r95yCZ9pwCEhOFh0YJ
   /2Ien5k10JU+dNIdZ6w6O7fHeyNcKKsFmKq2Z78jXXcOmappdJE84IcFH
   mpN3GSguMyPTH77mkwtoLvv/0r9fDWYWc5gEFijNCeyW0l9/80hwBd391
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="365654312"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="365654312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 09:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="5046530"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 09:49:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtWCv-0002Gg-35;
	Thu, 19 Oct 2023 16:49:13 +0000
Date: Fri, 20 Oct 2023 00:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 51/162] mm/zswap.c:708:17: error: implicit
 declaration of function 'obj_cgroup_report_zswap_wb'; did you mean
 'obj_cgroup_charge_zswap'?
Message-ID: <202310200057.UDmkbOVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3e8f171b80668501d4715af47563b31b969c94da
commit: cfa9143b9f60ce4a760c154557807a8570fc1b27 [51/162] mm: memcg: add per-memcg zswap writeback stat
config: sparc-randconfig-001-20231019 (https://download.01.org/0day-ci/archive/20231020/202310200057.UDmkbOVO-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200057.UDmkbOVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200057.UDmkbOVO-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zswap.c: In function 'shrink_memcg_cb':
>> mm/zswap.c:708:17: error: implicit declaration of function 'obj_cgroup_report_zswap_wb'; did you mean 'obj_cgroup_charge_zswap'? [-Werror=implicit-function-declaration]
     708 |                 obj_cgroup_report_zswap_wb(entry->objcg);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 obj_cgroup_charge_zswap
   cc1: some warnings being treated as errors


vim +708 mm/zswap.c

   661	
   662	static enum lru_status shrink_memcg_cb(struct list_head *item, struct list_lru_one *l,
   663					       spinlock_t *lock, void *arg)
   664	{
   665		struct zswap_entry *entry = container_of(item, struct zswap_entry, lru);
   666		struct mem_cgroup *memcg;
   667		struct zswap_tree *tree;
   668		pgoff_t swpoffset;
   669		enum lru_status ret = LRU_REMOVED_RETRY;
   670		int writeback_result;
   671	
   672		/*
   673		 * Once the lru lock is dropped, the entry might get freed. The
   674		 * swpoffset is copied to the stack, and entry isn't deref'd again
   675		 * until the entry is verified to still be alive in the tree.
   676		 */
   677		swpoffset = swp_offset(entry->swpentry);
   678		tree = zswap_trees[swp_type(entry->swpentry)];
   679		list_lru_isolate(l, item);
   680		spin_unlock(lock);
   681	
   682		/* Check for invalidate() race */
   683		spin_lock(&tree->lock);
   684		if (entry != zswap_rb_search(&tree->rbroot, swpoffset)) {
   685			goto unlock;
   686		}
   687		/* Hold a reference to prevent a free during writeback */
   688		zswap_entry_get(entry);
   689		spin_unlock(&tree->lock);
   690	
   691		writeback_result = zswap_writeback_entry(entry, tree);
   692	
   693		spin_lock(&tree->lock);
   694		if (writeback_result) {
   695			zswap_reject_reclaim_fail++;
   696			memcg = get_mem_cgroup_from_entry(entry);
   697			spin_lock(lock);
   698			/* we cannot use zswap_lru_add here, because it increments node's lru count */
   699			list_lru_putback(&entry->pool->list_lru, item, entry_to_nid(entry), memcg);
   700			spin_unlock(lock);
   701			mem_cgroup_put(memcg);
   702			ret = LRU_RETRY;
   703			goto put_unlock;
   704		}
   705		zswap_written_back_pages++;
   706	
   707		if (entry->objcg)
 > 708			obj_cgroup_report_zswap_wb(entry->objcg);
   709	
   710		/*
   711		 * Writeback started successfully, the page now belongs to the
   712		 * swapcache. Drop the entry from zswap - unless invalidate already
   713		 * took it out while we had the tree->lock released for IO.
   714		 */
   715		zswap_invalidate_entry(tree, entry);
   716	
   717	put_unlock:
   718		/* Drop local reference */
   719		zswap_entry_put(tree, entry);
   720	unlock:
   721		spin_unlock(&tree->lock);
   722		spin_lock(lock);
   723		return ret;
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
