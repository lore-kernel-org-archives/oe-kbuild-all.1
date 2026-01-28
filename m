Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FF3224AF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626073; cv=none; b=dQgL1h8E8+np5z2/yReaTYFkZtZtTMdNKbDFxikTh+YhBAi0wLW2iN8qfNKGJrDGpFGewkbf0LrRmfkSFWPA9YD7dkSvEXa1jXwJ0HKIMZqAyONNKTuELnYXRfQobRj3s1/0WdL+4Dsp149f8uKsS5KjL8sav0g1hO2ASDMZtFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626073; c=relaxed/simple;
	bh=aURHsVH8nf5rAUG34Tel5upLA+7ONfnZWVIULAYNCVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iZ2Gjwx5FdYnHK4EnWUGfUdpoqOVD3RoAqasEqfLMG2EtZlpTUnSoJvAPLl/WvPG0sejaTiqtLrp9izJFIBDWoRY/JVQeV0MTy858Tzk+xpGF0k5ccm5PghKlhQ+kJCVd1Kth+gsFtl2LQPRxtkC4sog6wtVnHVOkqFBj33L4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftCXrxCX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftCXrxCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769626071; x=1801162071;
  h=date:from:to:cc:subject:message-id;
  bh=aURHsVH8nf5rAUG34Tel5upLA+7ONfnZWVIULAYNCVQ=;
  b=ftCXrxCXxfS0dINUecjGV7IvEuCbkdlNQDn/RICfRKaMSh0TPNKM7gmC
   3dRnSVACAebM113qBBG3vKRSwpFHVikvecc5f6J4WkcqCLrK0PeOg5Xhm
   IZpkPtOcg+4CiSHs2Rv1iROkcg6uwPZcH39vM4fiAtcF98aRr6pl1uqZE
   9aXaQSglHmCG3H5npEwcl97fctY4sQRJooL22RfCcuDNfcZsOA1OwOSU5
   xMi24FrSy/NHhcqK4HpUVRYqX3XpqocQXJtX2PIs+c8lCy5ve9X81b04n
   5agr+461EjDLtNE3jKlCJp5w6Xwlg8jNvjYHsjYsDKZ3tgAJ9g63+OaJh
   w==;
X-CSE-ConnectionGUID: cEnNyjs2Rn66JNc9vOBBWw==
X-CSE-MsgGUID: 4JW7D1hyTjiVrSsnsGFMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74711952"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74711952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 10:47:51 -0800
X-CSE-ConnectionGUID: OPdZVsISRWan+TCCFderZA==
X-CSE-MsgGUID: VjcXJxksQKSVWV8UHpuu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208371201"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2026 10:47:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlAZu-0000000026L-1N90;
	Wed, 28 Jan 2026 18:47:46 +0000
Date: Wed, 28 Jan 2026 19:47:09 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-fixes 9/9] fs/overlayfs/readdir.c:169:61:
 error: expected ')' before 'return'
Message-ID: <202601281949.uWtz7ZwH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux vfs-fixes
head:   f3cb68366c78fa792715079a43287da07d5159c4
commit: f3cb68366c78fa792715079a43287da07d5159c4 [9/9] ovl: use name_is_dot* helpers in readdir code
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260128/202601281949.uWtz7ZwH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281949.uWtz7ZwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281949.uWtz7ZwH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/overlayfs/readdir.c: In function 'ovl_calc_d_ino':
>> fs/overlayfs/readdir.c:169:61: error: expected ')' before 'return'
     169 |             ovl_test_flag(OVL_IMPURE, d_inode(rdd->dentry)))
         |                                                             ^
         |                                                             )
     170 |                 return true;
         |                 ~~~~~~                                       
   fs/overlayfs/readdir.c:168:12: note: to match this '('
     168 |         if ((name_is_dot(p->name, p->len) ||
         |            ^
>> fs/overlayfs/readdir.c:173:1: error: expected expression before '}' token
     173 | }
         | ^
>> fs/overlayfs/readdir.c:173:1: warning: control reaches end of non-void function [-Wreturn-type]
     173 | }
         | ^


vim +169 fs/overlayfs/readdir.c

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
b5efccbe0a12a9 Amir Goldstein 2017-05-11 @169  	    ovl_test_flag(OVL_IMPURE, d_inode(rdd->dentry)))
b5efccbe0a12a9 Amir Goldstein 2017-05-11  170  		return true;
b5efccbe0a12a9 Amir Goldstein 2017-05-11  171  
b5efccbe0a12a9 Amir Goldstein 2017-05-11  172  	return false;
b5efccbe0a12a9 Amir Goldstein 2017-05-11 @173  }
b5efccbe0a12a9 Amir Goldstein 2017-05-11  174  

:::::: The code at line 169 was first introduced by commit
:::::: b5efccbe0a12a9d5c65c1a60b4270837c7fdb900 ovl: constant d_ino across copy up

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
