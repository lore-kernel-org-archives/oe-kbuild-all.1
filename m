Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23013E3D90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 02:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093980; cv=none; b=T5Z7XU6u8Ybd2zY/ccAcXjwTXwW9sdN/81iZH1D6xkaQ06C2YJi/h8IirhSe8kvugSAqvKiWGfseN8vCVlC4SReYbzfzccrsEu5ll/AL9fNanJLtk99EA8+9eBZamOpC4MQSzH8Rg5WubQ+cJUlG0wkHzS7apvs7hM4pbiGDPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093980; c=relaxed/simple;
	bh=TLneGU5cpPr8W6a2vODaLVqluMnh0ued4PXvWQFkf04=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DRFftu2/QCX6b+vLd3l/NWh0Y6M71UM6FfJSilEBHGx4WOaA0b3tLJ+O/YNPmMHg8QtOv4ElGcscy69B1QKttA94FceIVEyU30efPOEHqXe+d/kmgq7DYU2oypD+KlYC5SbuzbEp3EZvrm3Q7ZfAWHeP//tdN0vjZgh6ZYbf5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBsbjY0j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBsbjY0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789093977; x=1820629977;
  h=date:from:to:cc:subject:message-id;
  bh=TLneGU5cpPr8W6a2vODaLVqluMnh0ued4PXvWQFkf04=;
  b=RBsbjY0jl5p9lOpjpZIoyeA8THj+YwytzeIJMI6rpDFHIJs1Un7kM6MZ
   m6qahvJwvfOB97j5ssb6I7O5Doa0l3l3bsiVm0updjqMV9rwZfvW08AzL
   khTug66gNT0xyn+w2qiVhbhs2M2KBTlZdoLBNNPE9UuWVnwsb9YBrygdR
   2HC+z5y666XdxhtpShJ60bVxF3e5+g4rqL734LWl9Fh0X/XkhlqA1CxDa
   aN70qMdTu8s57mEYxaVR2za0IJA1Hsn131XMMOxbMSmZbfPcivb5oJH/c
   VllPpMQRevp14disE0Y8cHphVyFQBJ5OUN+eNVWkhciF9ITVMbM808Oc5
   g==;
X-CSE-ConnectionGUID: n65JOSWfR26yAftgWp7oaw==
X-CSE-MsgGUID: u8qA5h0YQcW4OaXQge1j9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107070705"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="107070705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 19:32:57 -0700
X-CSE-ConnectionGUID: 6B+zl6K4R2Ke0ss5kGa60g==
X-CSE-MsgGUID: ab6o2yMzQ36N+cFf9p1gVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="295270017"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 19:32:53 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4r4G-000000000s8-0OH8;
	Fri, 11 Sep 2026 02:32:46 +0000
Date: Fri, 11 Sep 2026 10:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Bradley Morgan <brads@mainlining.org>
Subject: [brauner-vfs:namespace-7.4.misc 6/7]
 kernel/user_namespace.c:787:22: warning: no previous prototype for
 'insert_extent'
Message-ID: <202609111048.yhHILE11-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git namespace-7.4.misc
head:   34a496d638705dc227cc6dd2aaaa9e450893502f
commit: f6f1a2496ba5dcc076d7fb7aa329887cd6ae55fa [6/7] userns: Add KUnit test suite for uid_gid_map
config: csky-randconfig-r113-20260910 (https://download.01.org/0day-ci/archive/20260911/202609111048.yhHILE11-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111048.yhHILE11-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111048.yhHILE11-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/user_namespace.c:787:22: warning: no previous prototype for 'insert_extent' [-Wmissing-prototypes]
     787 | VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
         |                      ^~~~~~~~~~~~~
>> kernel/user_namespace.c:860:22: warning: no previous prototype for 'sort_idmaps' [-Wmissing-prototypes]
     860 | VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
         |                      ^~~~~~~~~~~


vim +/insert_extent +787 kernel/user_namespace.c

   781	
   782	/*
   783	 * insert_extent - Safely insert a new idmap extent into struct uid_gid_map.
   784	 * Takes care to allocate a 4K block of memory if the number of mappings exceeds
   785	 * UID_GID_MAP_MAX_BASE_EXTENTS.
   786	 */
 > 787	VISIBLE_IF_KUNIT int insert_extent(struct uid_gid_map *map,
   788					   struct uid_gid_extent *extent)
   789	{
   790		struct uid_gid_extent *dest;
   791	
   792		if (map->nr_extents == UID_GID_MAP_MAX_BASE_EXTENTS) {
   793			struct uid_gid_extent *forward;
   794	
   795			/* Allocate memory for 340 mappings. */
   796			forward = kmalloc_objs(struct uid_gid_extent,
   797					       UID_GID_MAP_MAX_EXTENTS);
   798			if (!forward)
   799				return -ENOMEM;
   800	
   801			/* Copy over memory. Only set up memory for the forward pointer.
   802			 * Defer the memory setup for the reverse pointer.
   803			 */
   804			memcpy(forward, map->extent,
   805			       map->nr_extents * sizeof(map->extent[0]));
   806	
   807			map->forward = forward;
   808			map->reverse = NULL;
   809		}
   810	
   811		/*
   812		 * nr_extents must be updated before the extent and forward arrays are
   813		 * accessed, otherwise KSAN will assert an out-of-bounds error.
   814		 */
   815		map->nr_extents++;
   816		if (map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
   817			dest = &map->extent[map->nr_extents - 1];
   818		else
   819			dest = &map->forward[map->nr_extents - 1];
   820	
   821		*dest = *extent;
   822		return 0;
   823	}
   824	EXPORT_SYMBOL_IF_KUNIT(insert_extent);
   825	
   826	/* cmp function to sort() forward mappings */
   827	static int cmp_extents_forward(const void *a, const void *b)
   828	{
   829		const struct uid_gid_extent *e1 = a;
   830		const struct uid_gid_extent *e2 = b;
   831	
   832		if (e1->first < e2->first)
   833			return -1;
   834	
   835		if (e1->first > e2->first)
   836			return 1;
   837	
   838		return 0;
   839	}
   840	
   841	/* cmp function to sort() reverse mappings */
   842	static int cmp_extents_reverse(const void *a, const void *b)
   843	{
   844		const struct uid_gid_extent *e1 = a;
   845		const struct uid_gid_extent *e2 = b;
   846	
   847		if (e1->lower_first < e2->lower_first)
   848			return -1;
   849	
   850		if (e1->lower_first > e2->lower_first)
   851			return 1;
   852	
   853		return 0;
   854	}
   855	
   856	/*
   857	 * sort_idmaps - Sorts an array of idmap entries.
   858	 * Can only be called if number of mappings exceeds UID_GID_MAP_MAX_BASE_EXTENTS.
   859	 */
 > 860	VISIBLE_IF_KUNIT int sort_idmaps(struct uid_gid_map *map)
   861	{
   862		if (map->nr_extents <= UID_GID_MAP_MAX_BASE_EXTENTS)
   863			return 0;
   864	
   865		/* Sort forward array. */
   866		sort(map->forward, map->nr_extents, sizeof(struct uid_gid_extent),
   867		     cmp_extents_forward, NULL);
   868	
   869		/* Only copy the memory from forward we actually need. */
   870		map->reverse = kmemdup_array(map->forward, map->nr_extents,
   871					     sizeof(struct uid_gid_extent), GFP_KERNEL);
   872		if (!map->reverse)
   873			return -ENOMEM;
   874	
   875		/* Sort reverse array. */
   876		sort(map->reverse, map->nr_extents, sizeof(struct uid_gid_extent),
   877		     cmp_extents_reverse, NULL);
   878	
   879		return 0;
   880	}
   881	EXPORT_SYMBOL_IF_KUNIT(sort_idmaps);
   882	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
