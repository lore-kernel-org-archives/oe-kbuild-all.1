Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597A33F8CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 21:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769635367; cv=none; b=Lb+R/y4PltWztVazxl2aiZclOEGE5W8DkgeDvJNNtKS9HbDTfKE1j6DYOoXs0DKZ0Wo6JcmNYHvajU/Sspk9EJaf59R+SnFZ26Z8WnZIJC+uQDbXlqelFBQnjUs0A1E2NFIufPv/+zKvxCjgc/4mJTODj18go7HaU6A+/+MPlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769635367; c=relaxed/simple;
	bh=kXJF2BNBfzAkpbA9ZVtwYNT+vATuVYt39sqlekJW54g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LEBTmISbkdL1RR/u3r5ZTS14ghqlGwn+yQ4SUsI/UJyiBHDD+A7VBRYUH7XAXXJEYtTjRpUagQWnEd9jxpcz69UmsV+mA6JiVvfZudCW1/cD6bcwd63FNjpoW2vlkvwUqK/mixgGeEYEJfNFVtAyOirETcRVnVYATC/RLOjZdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8LD3HHj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8LD3HHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769635366; x=1801171366;
  h=date:from:to:cc:subject:message-id;
  bh=kXJF2BNBfzAkpbA9ZVtwYNT+vATuVYt39sqlekJW54g=;
  b=e8LD3HHjWkWPL3RIQI6V3vJjW+8CTkz+tWjyLM+eUZ6hMWNfqKFgAOm9
   giskrEiOKVeXKFZbatkHEJBLoZATLCQPBNV+o4ww/NtyaODuzBHGOUW6L
   cDrnqavfUVeCsxUSZFa+rI3FXJnjkQgINkWw+vNhSsUFCTRLtYEehNnLg
   T2CiMGr4Z0RTk/UIeGzKBc57H+LUKNbKlXpd0Hmh1QLXMJh4XRwFtw46M
   91gIVKR/kHDZ+42sjeOK2lvpZZyNyY+tiAVqOT8V3EFoQ4RGSijjFWYUQ
   fIAs0+wTSjIE82ypDp2WJle6ERXyKLgQGVFPjWO5HrX3BjPHOBANxF1+O
   g==;
X-CSE-ConnectionGUID: eaEP+/zuQbmn2gDwPPO0+A==
X-CSE-MsgGUID: KKcEFZUGRSCtuh6P9h1mkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81494466"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81494466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 13:22:44 -0800
X-CSE-ConnectionGUID: rbQkozCUSV+cZ3Sf31Fidw==
X-CSE-MsgGUID: 2v7DmqwTTN+e104YxBjmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213344648"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2026 13:22:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlCzn-00000000aoS-2yV1;
	Wed, 28 Jan 2026 21:22:39 +0000
Date: Thu, 29 Jan 2026 05:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-fixes 9/9] fs/overlayfs/readdir.c:170:3:
 error: expected ')'
Message-ID: <202601290532.7UdliNxv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux vfs-fixes
head:   f3cb68366c78fa792715079a43287da07d5159c4
commit: f3cb68366c78fa792715079a43287da07d5159c4 [9/9] ovl: use name_is_dot* helpers in readdir code
config: arm-randconfig-001-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290532.7UdliNxv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290532.7UdliNxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290532.7UdliNxv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/overlayfs/readdir.c:170:3: error: expected ')'
     170 |                 return true;
         |                 ^
   fs/overlayfs/readdir.c:168:5: note: to match this '('
     168 |         if ((name_is_dot(p->name, p->len) ||
         |            ^
   1 error generated.


vim +170 fs/overlayfs/readdir.c

e9be9d5e76e348 Miklos Szeredi 2014-10-24  144  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  145  static bool ovl_calc_d_ino(struct ovl_readdir_data *rdd,
b5efccbe0a12a9 Amir Goldstein 2017-05-11  146  			   struct ovl_cache_entry *p)
b5efccbe0a12a9 Amir Goldstein 2017-05-11  147  {
b5efccbe0a12a9 Amir Goldstein 2017-05-11  148  	/* Don't care if not doing ovl_iter() */
b5efccbe0a12a9 Amir Goldstein 2017-05-11  149  	if (!rdd->dentry)
b5efccbe0a12a9 Amir Goldstein 2017-05-11  150  		return false;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  151  
adbf4f7ea83467 Amir Goldstein 2017-11-06  152  	/* Always recalc d_ino when remapping lower inode numbers */
dcb399de1e404f Amir Goldstein 2023-05-25  153  	if (ovl_xino_bits(OVL_FS(rdd->dentry->d_sb)))
adbf4f7ea83467 Amir Goldstein 2017-11-06  154  		return true;
adbf4f7ea83467 Amir Goldstein 2017-11-06  155  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  156  	/* Always recalc d_ino for parent */
f3cb68366c78fa Amir Goldstein 2026-01-28  157  	if (name_is_dotdot(p->name, p->len))
b5efccbe0a12a9 Amir Goldstein 2017-05-11  158  		return true;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  159  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  160  	/* If this is lower, then native d_ino will do */
b5efccbe0a12a9 Amir Goldstein 2017-05-11  161  	if (!rdd->is_upper)
b5efccbe0a12a9 Amir Goldstein 2017-05-11  162  		return false;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  163  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  164  	/*
b5efccbe0a12a9 Amir Goldstein 2017-05-11  165  	 * Recalc d_ino for '.' and for all entries if dir is impure (contains
b5efccbe0a12a9 Amir Goldstein 2017-05-11  166  	 * copied up entries)
b5efccbe0a12a9 Amir Goldstein 2017-05-11  167  	 */
f3cb68366c78fa Amir Goldstein 2026-01-28  168  	if ((name_is_dot(p->name, p->len) ||
b5efccbe0a12a9 Amir Goldstein 2017-05-11  169  	    ovl_test_flag(OVL_IMPURE, d_inode(rdd->dentry)))
b5efccbe0a12a9 Amir Goldstein 2017-05-11 @170  		return true;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  171  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  172  	return false;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  173  }
b5efccbe0a12a9 Amir Goldstein 2017-05-11  174  

:::::: The code at line 170 was first introduced by commit
:::::: b5efccbe0a12a9d5c65c1a60b4270837c7fdb900 ovl: constant d_ino across copy up

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
