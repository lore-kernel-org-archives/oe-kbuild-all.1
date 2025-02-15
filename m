Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D3433CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739578909; cv=none; b=rhNiyluxz7etrsInqy0396RKJJ1Vz4TIZJkgAJxyr/O5hLxLHpyFJClxBTyrKlxm3/EBiXZpbyopwsczzUodpwKnFyrtTO5mvxvm8s6kRBaG5NS6FgHA9Nl1mLbbHeddw8YouOS6JmO4KWw1Red0Ltj2ALFHXrDqe/akMNYj3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739578909; c=relaxed/simple;
	bh=bHpzRPify6yV51k3HPzf7SK8ybIhIStyv0GgLEdYBng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iAqnoYoI0cdCE95h4eWYJlevj7HZ13w/ckTUi/ftEC8jH75qVN/pzNuLBZk6eeT0QCtXjazbNZeYZZ43kJQdJuP8KT6zbBaunNIgW24ojuFEfMdaXlm8WwdWLH6gFEohZrXjkUGMznU1GaD1db8wgi4awVVXNwx2kRfuscEHoNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWXn5lfL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWXn5lfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739578897; x=1771114897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHpzRPify6yV51k3HPzf7SK8ybIhIStyv0GgLEdYBng=;
  b=NWXn5lfLwt9btsZHyTNyBcZ35NjWojG730hh04V4W6m9+xjs899tZScY
   yZr53K3afiLT2v3tOLzrkvpdzzqrWw6zoeWcW3NtF/JiFvc7G83qAOCdf
   dca96mJXkrP+1lO+vaFTylYQ79FERJZKeZb7L4s6LV0XAyiFBE8IOKbY8
   hLFyC6jiUFNBBiEOHY4nU3NwfAzNLKDxs9HcbCUdIwfS8Kx1eJtH1zptm
   cJFEzFJb+wV0oM432Rr55+7httkwa0X/O53bMwfkno52rCgjJiDBgeklO
   cBADVNyYth1GpopAhL7WrLe9kcUSp/x5pKjdHCqxZJk9DbQpq2QWiZH53
   g==;
X-CSE-ConnectionGUID: RL487HPZQcKUhvZHGXA20A==
X-CSE-MsgGUID: k2+o9gl7TnOEZwTqaLKgwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40482169"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40482169"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 16:21:36 -0800
X-CSE-ConnectionGUID: UPQkuzUMRcCKS7wrZk94PQ==
X-CSE-MsgGUID: dgdifQ1RSseHvmmIe9e6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118515098"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 16:21:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj5w4-001AJz-0t;
	Sat, 15 Feb 2025 00:21:32 +0000
Date: Sat, 15 Feb 2025 08:21:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1926/1926] mm/share_pool.c:787: warning: Function
 parameter or member 'node_id' not described in 'sp_area_alloc'
Message-ID: <202502150809.BaTrf9hC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56197cf035ddc0d25f6d27169455448133fd75dd
commit: b39fcd51ad1b62c99ed0932ad0d2f89dfdc17aaa [1926/1926] mm/sharepool: Add sp_area management code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150809.BaTrf9hC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150809.BaTrf9hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150809.BaTrf9hC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c:685: warning: expecting prototype for mp_sp_group_id_by_pid(). Prototype was for mg_sp_group_id_by_pid() instead
>> mm/share_pool.c:787: warning: Function parameter or member 'node_id' not described in 'sp_area_alloc'
   mm/share_pool.c:1110: warning: duplicate section name 'Return'
   mm/share_pool.c:1145: warning: Function parameter or member 'spg_id' not described in 'mg_sp_unshare'


vim +787 mm/share_pool.c

   773	
   774	/**
   775	 * sp_area_alloc() - Allocate a region of VA from the share pool.
   776	 * @size: the size of VA to allocate.
   777	 * @flags: how to allocate the memory.
   778	 * @spg: the share group that the memory is allocated to.
   779	 * @type: the type of the region.
   780	 * @applier: the tgid of the task which allocates the region.
   781	 *
   782	 * Return: a valid pointer for success, NULL on failure.
   783	 */
   784	static struct sp_area *sp_area_alloc(unsigned long size, unsigned long flags,
   785					     struct sp_group *spg, enum spa_type type,
   786					     pid_t applier, int node_id)
 > 787	{
   788		int device_id;
   789		struct sp_area *spa, *first, *err;
   790		struct rb_node *n;
   791		unsigned long vstart;
   792		unsigned long vend;
   793		unsigned long addr;
   794		unsigned long size_align = ALIGN(size, PMD_SIZE); /* va aligned to 2M */
   795		struct sp_mapping *mapping;
   796	
   797		device_id = sp_flags_device_id(flags);
   798		if (device_id < 0 || device_id >= MAX_DEVID) {
   799			pr_err("invalid device id %d\n", device_id);
   800			return ERR_PTR(-EINVAL);
   801		}
   802	
   803		if (flags & SP_PROT_FOCUS) {
   804			if ((flags & (SP_DVPP | SP_PROT_RO)) != SP_PROT_RO) {
   805				pr_err("invalid sp_flags [%lx]\n", flags);
   806				return ERR_PTR(-EINVAL);
   807			}
   808			mapping = spg->mapping[SP_MAPPING_RO];
   809		} else if (flags & SP_DVPP) {
   810			mapping = spg->mapping[SP_MAPPING_DVPP];
   811		} else {
   812			mapping = spg->mapping[SP_MAPPING_NORMAL];
   813		}
   814	
   815		if (!mapping) {
   816			pr_err_ratelimited("non DVPP spg, id %d\n", spg->id);
   817			return ERR_PTR(-EINVAL);
   818		}
   819	
   820		vstart = mapping->start[device_id];
   821		vend = mapping->end[device_id];
   822		spa = kmalloc(sizeof(struct sp_area), GFP_KERNEL);
   823		if (unlikely(!spa))
   824			return ERR_PTR(-ENOMEM);
   825	
   826		spin_lock(&mapping->sp_mapping_lock);
   827	
   828		/*
   829		 * Invalidate cache if we have more permissive parameters.
   830		 * cached_hole_size notes the largest hole noticed _below_
   831		 * the sp_area cached in free_area_cache: if size fits
   832		 * into that hole, we want to scan from vstart to reuse
   833		 * the hole instead of allocating above free_area_cache.
   834		 * Note that sp_area_free may update free_area_cache
   835		 * without updating cached_hole_size.
   836		 */
   837		if (!mapping->free_area_cache || size_align < mapping->cached_hole_size ||
   838		    vstart != mapping->cached_vstart) {
   839			mapping->cached_hole_size = 0;
   840			mapping->free_area_cache = NULL;
   841		}
   842	
   843		/* record if we encounter less permissive parameters */
   844		mapping->cached_vstart = vstart;
   845	
   846		/* find starting point for our search */
   847		if (mapping->free_area_cache) {
   848			first = rb_entry(mapping->free_area_cache, struct sp_area, rb_node);
   849			addr = first->va_end;
   850			if (addr + size_align < addr) {
   851				err = ERR_PTR(-EOVERFLOW);
   852				goto error;
   853			}
   854		} else {
   855			addr = vstart;
   856			if (addr + size_align < addr) {
   857				err = ERR_PTR(-EOVERFLOW);
   858				goto error;
   859			}
   860	
   861			n = mapping->area_root.rb_node;
   862			first = NULL;
   863	
   864			while (n) {
   865				struct sp_area *tmp;
   866	
   867				tmp = rb_entry(n, struct sp_area, rb_node);
   868				if (tmp->va_end >= addr) {
   869					first = tmp;
   870					if (tmp->va_start <= addr)
   871						break;
   872					n = n->rb_left;
   873				} else
   874					n = n->rb_right;
   875			}
   876	
   877			if (!first)
   878				goto found;
   879		}
   880	
   881		/* from the starting point, traverse areas until a suitable hole is found */
   882		while (addr + size_align > first->va_start && addr + size_align <= vend) {
   883			if (addr + mapping->cached_hole_size < first->va_start)
   884				mapping->cached_hole_size = first->va_start - addr;
   885			addr = first->va_end;
   886			if (addr + size_align < addr) {
   887				err = ERR_PTR(-EOVERFLOW);
   888				goto error;
   889			}
   890	
   891			n = rb_next(&first->rb_node);
   892			if (n)
   893				first = rb_entry(n, struct sp_area, rb_node);
   894			else
   895				goto found;
   896		}
   897	
   898	found:
   899		if (addr + size_align > vend) {
   900			err = ERR_PTR(-EOVERFLOW);
   901			goto error;
   902		}
   903	
   904		spa->va_start          = addr;
   905		spa->va_end            = addr + size_align;
   906		spa->real_size         = size;
   907		spa->region_vstart     = vstart;
   908		spa->flags             = flags;
   909		spa->is_hugepage       = (flags & SP_HUGEPAGE);
   910		spa->spg               = spg;
   911		spa->spm               = mapping;
   912		spa->type              = type;
   913		spa->kva               = 0;   /* NULL pointer */
   914		spa->applier           = applier;
   915		spa->preferred_node_id = node_id;
   916		atomic_set(&spa->use_count, 1);
   917	
   918		/* the link location could be saved before, to be optimized */
   919		spm_insert_area(mapping, spa);
   920		mapping->free_area_cache = &spa->rb_node;
   921	
   922		spin_unlock(&mapping->sp_mapping_lock);
   923		sp_group_insert_area(spg, spa);
   924	
   925		return spa;
   926	
   927	error:
   928		spin_unlock(&mapping->sp_mapping_lock);
   929		kfree(spa);
   930		return err;
   931	}
   932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
