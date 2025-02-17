Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CACC8FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 00:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739752038; cv=none; b=tW/NKQA1vYF7XjsPucdDjm2exPwQX8YdNtdzHdmoo8JJKzcA0bfEyz5EJY7GubFg+V/uCiNqZxcNSXtdvJzTt46qZC+dFIlDQ1CITyyUl9DRTMAvZh+XRX3DtYN/qKnDPKAGgFQe1tjnjvNWNZjVlu/kmJQoCEDleRDh0xdF7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739752038; c=relaxed/simple;
	bh=dWNImJ1xfml3ctgQYd4yDyibMcJ7GYCV3sv2I5o/BQM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crkPHj9RjVHGkHo+zOy4bZJYckH/lTkf/VnTOrn3hMssNkwpagOHAC8ZwwjusdP1MtLFlUnjECz6hKuB5vRR9NL+HO1IZJKAkxSp96lkaWfjrsYG66fmQwdN5zyL/t1RngfEBCl0msc+OxRw/kwqbY9QY0EFGtkBGP8eO/rzEMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODTct15K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODTct15K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739752036; x=1771288036;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dWNImJ1xfml3ctgQYd4yDyibMcJ7GYCV3sv2I5o/BQM=;
  b=ODTct15KS4TuaLWm6vz0K4vYjo0CyZqdtbNr5+HtUfXtGEr4QTFh/J8R
   k8DUNXv6fUxiBpWGdtbek83Ld/rba8Gvr+J0TT1Br8y4c8pzXZPkreZy9
   6mQuwFrOvHoWfKZ9vJ77eGavHgUVpBlVxi+jcqKCp22xXEz3f6T1TFap3
   vCIsXc6I/YE51Vx+3RzjqEtNXPua1bYH7rbsU7VTYSjn6VC3GUcIis08O
   ICzf5X9PnbZuWYlNqPLr8XAjxMTD/FEt3ItiEOLrPsCeKNn5v8GRb6y59
   ZunUa5VZJ1GyFiuBbAfod5GkQb07U3dzOx3vF+Nw8YB+yN02aFWwxV58F
   g==;
X-CSE-ConnectionGUID: xHoKvCHkQiey/k4daBLw4Q==
X-CSE-MsgGUID: S/7BiUpgSeygPhgpgiTN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="57957380"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="57957380"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 16:27:15 -0800
X-CSE-ConnectionGUID: lWROEwlnSD+kZ8urIYs8QA==
X-CSE-MsgGUID: pdkYxf6cQQCNrJKEGwUJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="114603321"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Feb 2025 16:27:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjoye-001CPN-0Z
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 00:27:12 +0000
Date: Mon, 17 Feb 2025 08:27:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] fs/btrfs/props.c:389:25: warning: 'num_bytes'
 may be used uninitialized
Message-ID: <202502170851.nTNKAfc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: d7400ee1b476f201f8fb4264887d18bdb23ee352 [1/1] btrfs: use the existing reserved items for our first prop for inheritance
config: parisc-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250217/202502170851.nTNKAfc4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170851.nTNKAfc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170851.nTNKAfc4-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:99,
                    from fs/btrfs/ctree.h:9,
                    from fs/btrfs/props.h:9,
                    from fs/btrfs/props.c:7:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:60:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      60 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:289:34: note: in expansion of macro 'set_pte_at'
     289 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:60:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      60 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   fs/btrfs/props.c: In function 'inherit_props':
>> fs/btrfs/props.c:389:25: warning: 'num_bytes' may be used uninitialized [-Wmaybe-uninitialized]
     389 |                         btrfs_block_rsv_release(fs_info, trans->block_rsv,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     390 |                                         num_bytes);
         |                                         ~~~~~~~~~~
   fs/btrfs/props.c:344:21: note: 'num_bytes' was declared here
     344 |                 u64 num_bytes;
         |                     ^~~~~~~~~


vim +/num_bytes +389 fs/btrfs/props.c

   326	
   327	static int inherit_props(struct btrfs_trans_handle *trans,
   328				 struct inode *inode,
   329				 struct inode *parent)
   330	{
   331		struct btrfs_root *root = BTRFS_I(inode)->root;
   332		struct btrfs_fs_info *fs_info = root->fs_info;
   333		int ret;
   334		int i;
   335		bool need_reserve = false;
   336	
   337		if (!test_bit(BTRFS_INODE_HAS_PROPS,
   338			      &BTRFS_I(parent)->runtime_flags))
   339			return 0;
   340	
   341		for (i = 0; i < ARRAY_SIZE(prop_handlers); i++) {
   342			const struct prop_handler *h = &prop_handlers[i];
   343			const char *value;
   344			u64 num_bytes;
   345	
   346			if (!h->inheritable)
   347				continue;
   348	
   349			value = h->extract(parent);
   350			if (!value)
   351				continue;
   352	
   353			/*
   354			 * This is not strictly necessary as the property should be
   355			 * valid, but in case it isn't, don't propagate it futher.
   356			 */
   357			ret = h->validate(value, strlen(value));
   358			if (ret)
   359				continue;
   360	
   361			/*
   362			 * Currently callers should be reserving 1 item for properties,
   363			 * since we only have 1 property that we currently support.  If
   364			 * we add more in the future we need to try and reserve more
   365			 * space for them.  But we should also revisit how we do space
   366			 * reservations if we do add more properties in the future.
   367			 */
   368			if (need_reserve) {
   369				num_bytes = btrfs_calc_trans_metadata_size(fs_info, 1);
   370				ret = btrfs_block_rsv_add(root, trans->block_rsv,
   371						num_bytes, BTRFS_RESERVE_NO_FLUSH);
   372				if (ret)
   373					return ret;
   374			}
   375	
   376			ret = btrfs_setxattr(trans, inode, h->xattr_name, value,
   377					     strlen(value), 0);
   378			if (!ret) {
   379				ret = h->apply(inode, value, strlen(value));
   380				if (ret)
   381					btrfs_setxattr(trans, inode, h->xattr_name,
   382						       NULL, 0, 0);
   383				else
   384					set_bit(BTRFS_INODE_HAS_PROPS,
   385						&BTRFS_I(inode)->runtime_flags);
   386			}
   387	
   388			if (need_reserve) {
 > 389				btrfs_block_rsv_release(fs_info, trans->block_rsv,
   390						num_bytes);
   391				if (ret)
   392					return ret;
   393			}
   394			need_reserve = true;
   395		}
   396	
   397		return 0;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
