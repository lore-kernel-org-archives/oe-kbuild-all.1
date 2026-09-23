Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B8481257
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160594; cv=none; b=u/VaapzLtQ0nGPO/NPa7jL5z7rzlkn35iXtkpyBG4U47plhuC1tzZyLF3aXFr2Zh8zPq5l4Gj8SW4vZOF6skjIUJtwEaKRcyFIfskZ3D/nBoag8r6CPIAkr6WLkmySt80olTaBxn2pjuek2AlNXLTaO9TM06GJ8/C9h/wVjEn+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160594; c=relaxed/simple;
	bh=l0CGsAd4dpKi8qmE5NHjMlEwg70yiuQDOO+grPyODy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yafy0WTrXqbIFXFjG8Fg+0rkqi4BDm42c8g+n7At8k0wXovFuPhLU3sg+6H/5Sf6k597qLrV9ekVm18yHbZUWVwyNHzyumKvOhsiMz7OwXfPJNx9rZNtXeMs0IRIgt92exfZLz4qo1OZ6YIWvlCEk4lxOMdVaYwnXls4xbscGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9GXUibe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9GXUibe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790160590; x=1821696590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0CGsAd4dpKi8qmE5NHjMlEwg70yiuQDOO+grPyODy0=;
  b=K9GXUibepr5zhQsh3mHaL6pyhBWGiEKl4/BBFCr1893m7Tkl+DnjdGAl
   RZK2U1B6AiwcE0T9wksQZNpYLfl4YgVelvEdCmyVycQJqwt80P6liYy4n
   x1veO5nbtgbPm+tUvwAewcXsrkb2aGDN9XYdQl9WVk1NnrhCbBdKDjGKf
   oqLKkMggszUjN3G7EplfBJpWLECGtzk0j1cWGqNycyENSyNAWNeCcF4ey
   jclvK96QYyHyeQD2jReNb0uGgtvv8YvJu9YNPUYVu/CuxZDs5I8cRmiT9
   A+JZ4JF53f9Zamvhh6+Tvstf1zXwiIWIuLtwc1K0BMUpO7uZoQGGWLdXk
   w==;
X-CSE-ConnectionGUID: LUsZAhf6Q/GuZIPVehmILQ==
X-CSE-MsgGUID: gFJdxX5+TGqOHymOoWIa3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90711102"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90711102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:49:46 -0700
X-CSE-ConnectionGUID: gSvk6hllQP2RoAzupoCv7Q==
X-CSE-MsgGUID: +oTtZrrrSs6xGfBDMoJDog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270073577"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 03:49:45 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9KXn-000000000cp-1pQF;
	Wed, 23 Sep 2026 10:49:43 +0000
Date: Wed, 23 Sep 2026 12:49:19 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 52/67]
 lib/bonsai_tree.c:286:23-30: WARNING opportunity for kmemdup
Message-ID: <202609231215.Lzgkls3r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 1119575b43c828745e61d338a67564c97d1e7a57 [52/67] lib/bonsai_tree: Add bonsai_clone, smart hint sizing, and u16 repotting
config: hexagon-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231215.Lzgkls3r-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231215.Lzgkls3r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/bonsai_tree.c:286:23-30: WARNING opportunity for kmemdup

vim +286 lib/bonsai_tree.c

   266	
   267	int bonsai_clone(const struct bonsai_tree *src, struct bonsai_tree *dst, gfp_t gfp)
   268	{
   269		unsigned int i;
   270		struct bonsai_val_slab *vslab, **tail_ptr;
   271	
   272		if (!src || !dst)
   273			return -EINVAL;
   274	
   275		bonsai_init(dst);
   276	
   277		if (!src->node_count || !src->root_idx)
   278			return 0;
   279	
   280		/* 0. Copy node slabs */
   281		for (i = 0; i < src->num_node_slabs; i++) {
   282			size_t slab_size = (i == 0)
   283				? ((size_t)src->slab0_cap_nodes * BONSAI_NODE_SIZE)
   284				: BONSAI_SLAB_SIZE;
   285	
 > 286			dst->node_slabs[i] = kmalloc(slab_size, gfp);
   287			if (!dst->node_slabs[i]) {
   288				bonsai_destroy(dst);
   289				return -ENOMEM;
   290			}
   291			memcpy(dst->node_slabs[i], src->node_slabs[i], slab_size);
   292			dst->num_node_slabs++;
   293		}
   294	
   295		/* 1. Copy value slabs */
   296		tail_ptr = &dst->val_slabs;
   297		for (vslab = src->val_slabs; vslab; vslab = vslab->next) {
   298			struct bonsai_val_slab *new_vslab;
   299			size_t total_size = sizeof(*new_vslab) + vslab->size;
   300	
   301			new_vslab = kmalloc(total_size, gfp);
   302			if (!new_vslab) {
   303				bonsai_destroy(dst);
   304				return -ENOMEM;
   305			}
   306			new_vslab->size = vslab->size;
   307			new_vslab->used = vslab->used;
   308			new_vslab->next = NULL;
   309			memcpy(new_vslab->data, vslab->data, vslab->used);
   310	
   311			*tail_ptr = new_vslab;
   312			tail_ptr = &new_vslab->next;
   313			dst->num_val_slabs++;
   314		}
   315	
   316		/* 2. Copy metadata fields */
   317		dst->slab0_cap_nodes = src->slab0_cap_nodes;
   318		dst->height = src->height;
   319		dst->root_idx = src->root_idx;
   320		dst->is_u16 = src->is_u16;
   321		dst->is_sealed = src->is_sealed;
   322		dst->val_bytes_used = src->val_bytes_used;
   323		dst->node_count = src->node_count;
   324		dst->entry_count = src->entry_count;
   325	
   326		return 0;
   327	}
   328	EXPORT_SYMBOL_GPL(bonsai_clone);
   329	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
