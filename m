Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E424C2ED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746915091; cv=none; b=ADOzB2eIB1Q3d8rAovAJMHLd0TQs7SCFw/Vd95M+me2gHqVGwelkSVEhjR+LBeXUyAWpg9po0/Cc/ABmKjjL399zQPMM+Wb0HCX8+GgDs1eWbUsRfaWX1wAC3ED5p0mulxGpExxJzu1OCqV/vr9jv0Kfv0SperAKpYYcddByRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746915091; c=relaxed/simple;
	bh=zKa9CAwdFaBrhhLQFw4FI4JpIH3e39nbxrT/Bma3zyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBvyHxxL1tvSK5KmyYG9OCRh3HjLplL4YMCi12H+LcZ52w+7SDTS3n8zY4Mnk+M7gzw/RD8lRIPglWnyZkV9Zz0XU3xd6UVwzmTmM3lwwOI3Y0pmB/9adjBU79LhtF6QBKU7iqZnI/DIoSCBALepxI3yl9SVYOZzgJs/Og7d5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fX+b+3aU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fX+b+3aU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746915089; x=1778451089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zKa9CAwdFaBrhhLQFw4FI4JpIH3e39nbxrT/Bma3zyE=;
  b=fX+b+3aUTf+qaKrwC/Mo2Ri037DWeu2QmyMBVl6UGtqQWrBZXQ8DBebq
   4GDvW3uRTuSESF3nKyvto578HBnL86ZDrT4tboH1W/L5GUCBVARIHKKGT
   D0ki793tq3BxM2/4sOBpneHgyt/BnX1EyMSch9q2zuRnazIX3izE8Bh7R
   V6yJ0gKPeiepeOen2oEZYPwy/wSjs6/mKZ/xJL4btqOia8r6mTHY2yZZE
   uAB3hHwo1LQZbTLTdXN88LleYzDPVob1wTncyq+WMq+/gWVs3nv3bNGx7
   M1O5vHKifGt1cWugaQHxWG2XPXL+v4ZG3vO8kiwEy6t2UzXyM6JFrhPLX
   A==;
X-CSE-ConnectionGUID: JinU8CQEQg+m4nTZWmywMQ==
X-CSE-MsgGUID: 2IMiL1bSQ7yVRkcVSenZvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47845273"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47845273"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 15:11:29 -0700
X-CSE-ConnectionGUID: mcOEFLZpRFSvZTUSAmL8pw==
X-CSE-MsgGUID: QoivF7v0RD+6bMVr4Hh8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="168043901"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2025 15:11:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDsPl-000DQJ-1a;
	Sat, 10 May 2025 22:11:25 +0000
Date: Sun, 11 May 2025 06:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 198/199]
 fs/bcachefs/bset.c:499:13: warning: 'bch2_bset_verify_rw_aux_tree' defined
 but not used
Message-ID: <202505110620.dZJFx7P0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   d815fb1b379fb43f7a33d1bede6efea16b6405e6
commit: e8a89a1d80edd0d477f297b75cbc2dce8ce4da11 [198/199] bcachefs: debug_check_bset_lookups
config: i386-buildonly-randconfig-002-20250511 (https://download.01.org/0day-ci/archive/20250511/202505110620.dZJFx7P0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110620.dZJFx7P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110620.dZJFx7P0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/bset.c:531:20: error: redefinition of 'bch2_bset_verify_rw_aux_tree'
     531 | static inline void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bset.c:499:13: note: previous definition of 'bch2_bset_verify_rw_aux_tree' with type 'void(struct btree *, struct bset_tree *)'
     499 | static void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/bset.c: In function 'bch2_bset_verify_rw_aux_tree':
   fs/bcachefs/bset.c:535:17: error: implicit declaration of function '__bch2_bset_verify_rw_aux_tree'; did you mean 'bch2_bset_verify_rw_aux_tree'? [-Werror=implicit-function-declaration]
     535 |                 __bch2_bset_verify_rw_aux_tree(b, t);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 bch2_bset_verify_rw_aux_tree
   fs/bcachefs/bset.c: At top level:
>> fs/bcachefs/bset.c:499:13: warning: 'bch2_bset_verify_rw_aux_tree' defined but not used [-Wunused-function]
     499 | static void bch2_bset_verify_rw_aux_tree(struct btree *b,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bch2_bset_verify_rw_aux_tree +499 fs/bcachefs/bset.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  498  
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @499  static void bch2_bset_verify_rw_aux_tree(struct btree *b,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  500  					 struct bset_tree *t)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  501  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  502  	struct bkey_packed *k = btree_bkey_first(b, t);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  503  	unsigned j = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  504  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  505  	BUG_ON(bset_has_ro_aux_tree(t));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  506  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  507  	if (!bset_has_rw_aux_tree(t))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  508  		return;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  509  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  510  	BUG_ON(t->size < 1);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  511  	BUG_ON(rw_aux_to_bkey(b, t, j) != k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  512  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  513  	goto start;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  514  	while (1) {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  515  		if (rw_aux_to_bkey(b, t, j) == k) {
e88a75ebe86c1d Kent Overstreet 2022-11-24  516  			BUG_ON(!bpos_eq(rw_aux_tree(b, t)[j].k,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  517  					bkey_unpack_pos(b, k)));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  518  start:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  519  			if (++j == t->size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  520  				break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  521  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  522  			BUG_ON(rw_aux_tree(b, t)[j].offset <=
1c6fdbd8f2465d Kent Overstreet 2017-03-16  523  			       rw_aux_tree(b, t)[j - 1].offset);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  524  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  525  
ac2ccddc2689d5 Kent Overstreet 2023-03-04  526  		k = bkey_p_next(k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  527  		BUG_ON(k >= btree_bkey_last(b, t));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  528  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  529  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  530  

:::::: The code at line 499 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
