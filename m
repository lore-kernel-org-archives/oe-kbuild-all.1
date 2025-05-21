Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4E5221DA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747798514; cv=none; b=f9TdC1wtDRLm5eqfwIcyA5gAO1tYLFo2Tn1uOI/85ir2i5+ur9SDaSrIq9aZ4WJf52Phe4W7+/hOv0vf+gN518IAl5t6DeES5M5nnJyMwDrjX4GATtbuXM21X09M+ywH/NqhKlEOC6+5IZPDd90UMS0ZNTix4MNryBy0xYVmwVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747798514; c=relaxed/simple;
	bh=xmJYFENZH1eR7arH1khzNTbnr5JHBcQE0o0jXI23L+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovj6oS3n0Z87YBm7ddw29cXHZSwPoLFxSu1p3mAswVaxtNc8uQpdN/R6uUIeBdUmqhdSsR1m7dKeqhr74MpoSFMbuw+fZm4si/IjvqdNnG36nBf/ynuVgrCyww4aI8OYqqQvlYY2J/Bsp0XX6NwUhb76mGV88RrJeIcCoJPfPe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPXgJfa/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPXgJfa/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747798513; x=1779334513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmJYFENZH1eR7arH1khzNTbnr5JHBcQE0o0jXI23L+k=;
  b=HPXgJfa/XyrECz9ejoLCTIiX3QSpZOEaKsA38RZBEvyBAr7rI/ucnlK1
   3zYnJJrwmbwnMir8leHLEWZ+IK3rQkhPXD0QW3nXGimba6WrH52HwFJbx
   65YXRHZUgRT0WMg5T5DZkwOHmqV5zJUS3TEIGBbY2aGohjYA1GkLx6+MB
   rm5SvZItJy9OYQWQzsHTNzAyo4CVn8QOGWD6nakvIwMvz7W9xwlndJZYd
   sKD5r8x+0gaD2q+NQTfwRRC+1NRKpfMGlOBTle8vQ8Ry2O07RxEJLuGNp
   j1ppN+nlEKuuU41OrIcqfOw/zWU/Ew28mamz+m5P1Jg+XBdg9OdM3cHVs
   A==;
X-CSE-ConnectionGUID: AZJmPMwoRTOs3B6dy7zkDQ==
X-CSE-MsgGUID: rfWRvicOTJ2a44I3al7Fnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49819078"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49819078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:35:10 -0700
X-CSE-ConnectionGUID: mmwAfXGtT46ijHhRWhHzoA==
X-CSE-MsgGUID: h+rx5Pj9TvmmRjfK5w7GXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139731735"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2025 20:35:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHaEV-000Npv-22;
	Wed, 21 May 2025 03:35:07 +0000
Date: Wed, 21 May 2025 11:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 255/257]
 fs/bcachefs/inode.c:1261:24: warning: unused variable 'c'
Message-ID: <202505211114.GIymIKvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   e4be9413b049e0e7d219b061645621e995713a40
commit: 7abb73c43683ff44d31d8b806e6348e69d1c7096 [255/257] bcachefs: Fix casefold opt via xattr interface
config: arc-randconfig-002-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211114.GIymIKvT-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211114.GIymIKvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211114.GIymIKvT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/inode.c: In function 'bch2_inode_set_casefold':
>> fs/bcachefs/inode.c:1261:24: warning: unused variable 'c' [-Wunused-variable]
    1261 |         struct bch_fs *c = trans->c;
         |                        ^


vim +/c +1261 fs/bcachefs/inode.c

  1257	
  1258	int bch2_inode_set_casefold(struct btree_trans *trans, subvol_inum inum,
  1259				    struct bch_inode_unpacked *bi, unsigned v)
  1260	{
> 1261		struct bch_fs *c = trans->c;
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
