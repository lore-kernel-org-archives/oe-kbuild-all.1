Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA2C363C56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 06:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287227; cv=none; b=Mmp8r1ZXOkKvbTjVyBXudz/Y8mKXUbLosmxWVYkdUHeWpabf616EN9xqC6V7dEDcc0w0ztyA0FXiauqCSSxMFjzfE9/gdKxHlJ0JWqTfH1AQayTZtJu1uosSHHH3Iy2EKhgWUkl8JWIOP6yDpn1oQ6l1SNLhL0l+wjF+GoQZK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287227; c=relaxed/simple;
	bh=hhNg3TYJrvMscbduh4rzgl7f8NNHPoqhBvnbyCb5gZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O9ABbhXClhYNbXc6ZJuL60L2HVcXweWW+gg8RUMyitmKdVB3/p3EKxQibumBGKu0xaHa6W9mFWU/OA0GMZC7emY9oL2E/wTXt/fRWEFS7HaH6lXSH4w75Y3jyDGiOMKJMwuntJTKx0LN1Pu5SaE4jUY+LV1xnc9OTFyHTsFEsCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GewVAWqL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GewVAWqL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768287227; x=1799823227;
  h=date:from:to:cc:subject:message-id;
  bh=hhNg3TYJrvMscbduh4rzgl7f8NNHPoqhBvnbyCb5gZU=;
  b=GewVAWqLWv4tM3cfYVbZ/sGEyaXMVARn2m1FL0sxc7BADkvuhXlUbKov
   m3P7sMzGAnlM+PSoQOyE5rKlptOmxj43Fgva54rLtHbFmo7IIfCY2oUHW
   lEbkkE0VzTKhQOOcZgXr3m7e01FEKk1HbStSsDpROnaJNZZZ7yV9PQAnZ
   UKlWTlVtbMVKt0i31Z9dV9WoTG46O+YHbwY23zAaXYDnG2r342/OkjBys
   WNg9Jcv5pVIpGnmCTG8J41zhhymWVC0ssn6n5vd1quW9WyJn/Ha1a+Rln
   VSOjoJowlxGnKu1Gk0kdH+f0FIWtqaG5e9+zl6zzBwvz4lca2mEwa/3Jt
   w==;
X-CSE-ConnectionGUID: xIOIhVy5RYeLLA62jYjZiA==
X-CSE-MsgGUID: mXnGJwwiRua1O3d69J1oWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69298641"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69298641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 22:53:46 -0800
X-CSE-ConnectionGUID: WR2aFtPbQwa1VuAE9m04Tg==
X-CSE-MsgGUID: Vr3dPtRWQR62nW66QIlYjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203461963"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 22:53:45 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfYHe-0000000016X-17nH;
	Tue, 13 Jan 2026 06:53:42 +0000
Date: Tue, 13 Jan 2026 07:53:30 +0100
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Subject: [linkinjeon-ntfs:ntfs-next 13/14] Warning:
 fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in
 'ntfs_non_resident_attr_expand'
Message-ID: <202601130702.mkR4lH9H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   7a305a47bcefc8d9f628f92a700c741fa16e65a0
commit: d37f41f3e1352e866f9538ec5fcac9b44eae728f [13/14] ntfs: add Kconfig and Makefile
config: i386-randconfig-2006-20250825 (https://download.01.org/0day-ci/archive/20260113/202601130702.mkR4lH9H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130702.mkR4lH9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130702.mkR4lH9H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in 'ntfs_non_resident_attr_expand'
   Warning: fs/ntfs/attrib.c:4290 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4606 function parameter 'holes' not described in 'ntfs_attr_truncate_i'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'ni' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'non_resident' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'encrypted' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'sparse' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'allocated_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'data_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'initialized_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compressed_size' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:2725 function parameter 'compression_unit' not described in 'ntfs_attr_init'
   Warning: fs/ntfs/attrib.c:4030 function parameter 'holes' not described in 'ntfs_non_resident_attr_expand'
>> Warning: fs/ntfs/attrib.c:4030 function parameter 'need_lock' not described in 'ntfs_non_resident_attr_expand'
   Warning: fs/ntfs/attrib.c:4290 function parameter 'holes' not described in 'ntfs_resident_attr_resize'
   Warning: fs/ntfs/attrib.c:4606 function parameter 'holes' not described in 'ntfs_attr_truncate_i'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
