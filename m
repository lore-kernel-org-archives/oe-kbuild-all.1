Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FD4C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770697887; cv=none; b=fFRboDmWX4csmbWYgIL4CNZeonnAkFyMiQyB3q5bGryEBAFbbwyyDwVV5IzURTVxY6oFYvcO5bt0mziuRYtILojx1j21eoUfVoQ2sSRWLk4FCeXsnoKFdW0MBYMAIAFWgueXf7wke/fBt6vKBhAAkIi8Dl7qeUwtNdVXttDEEC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770697887; c=relaxed/simple;
	bh=lT3gsafAupB51eOoHzdDNYimUp9oQaiiUW7KOiCIL9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dlaOeVzZ/PUIIau1cQWbwe6jZuRkNA4L3Y6ZOrL9+SfKbT+PFJcg+WeeZtqAcuPBTRLGvYk+RnrNW56U8HBqLIZRnzdKkLolvfjTfvtrRtwWKRHqG5V/cG+LK48TeRJwgrZUUnjtn0pU/OOIjfvJ+jWUN8AVFE9KS39L4HHhqUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmzZ426g; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmzZ426g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770697885; x=1802233885;
  h=date:from:to:cc:subject:message-id;
  bh=lT3gsafAupB51eOoHzdDNYimUp9oQaiiUW7KOiCIL9g=;
  b=XmzZ426giT9kLby+UDYFR/htQBT34+xyLjKcoFZjgUO99vNIPsEeHrjg
   isU9KJ3ovZvcn40WWLzwQyI8HpEKDC4WvUwtqjJy8PKphJoqWEp3/MNG6
   XlqscJnQUs/Ju33uc3d1oh4be/9wxmpe8Z1hRr2MApPckE/BMb/s32qQy
   ha2aqh4Lf+RQAiVq+zkpD04xi1NJl/moiXY9M7yr+U6mIE72oqdUuwWnF
   QSQAlFZEbjizkPd/cZjr0fEJW2xcaWqAdvQZlP0oqbYo8V5mAJ9d6A/WS
   eQ4wINKdqiviRyEuUkrjEynxFoTcdzhRHsR3coQsBRHKEMucBXUA3f8+n
   g==;
X-CSE-ConnectionGUID: klIppqGFTbatw9FI4w3spw==
X-CSE-MsgGUID: eva+CZv+SDmrme9KuVtXJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59385034"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59385034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:31:21 -0800
X-CSE-ConnectionGUID: GAF1rBscTbadBovZGcMk0g==
X-CSE-MsgGUID: XHHfxunLQz2uzb1KOxFR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211621212"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 20:31:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfPC-00000000odo-10dz;
	Tue, 10 Feb 2026 04:31:18 +0000
Date: Tue, 10 Feb 2026 12:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 468/799]
 fs/bcachefs/fs/dirent.c:157:5-8: Unneeded variable: "ret". Return "0" on line
 207
Message-ID: <202602101217.RYZf9R3D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 0e349fe46a443dc2f5f3d2b67a3cc42c12d2bf35 [468/799] bcachefs: move fs code to fs/
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101217.RYZf9R3D-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101217.RYZf9R3D-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs/dirent.c:157:5-8: Unneeded variable: "ret". Return "0" on line 207
--
>> fs/bcachefs/fs/inode.c:505:5-8: Unneeded variable: "ret". Return "0" on line 538
   fs/bcachefs/fs/inode.c:852:5-8: Unneeded variable: "ret". Return "0" on line 858
   fs/bcachefs/fs/inode.c:872:5-8: Unneeded variable: "ret". Return "0" on line 878
--
>> fs/bcachefs/fs/quota.c:65:5-8: Unneeded variable: "ret". Return "0" on line 72
--
>> fs/bcachefs/fs/xattr.c:80:5-8: Unneeded variable: "ret". Return "0" on line 104

vim +157 fs/bcachefs/fs/dirent.c

1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  149  
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  150  int bch2_dirent_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/dirent.c Kent Overstreet 2024-11-27  151  			 struct bkey_validate_context from)
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  152  {
26609b619fa230 fs/bcachefs/dirent.c Kent Overstreet 2018-11-01  153  	struct bkey_s_c_dirent d = bkey_s_c_to_dirent(k);
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  154  	unsigned name_block_len = bch2_dirent_name_bytes(d);
01a7e74fe14179 fs/bcachefs/dirent.c Joshua Ashton   2023-08-12  155  	struct qstr d_name = bch2_dirent_get_name(d);
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  156  	struct qstr d_cf_name = bch2_dirent_get_casefold_name(d);
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24 @157  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  158  
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  159  	bkey_fsck_err_on(!d_name.len,
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  160  			 c, dirent_empty_name,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  161  			 "empty name");
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  162  
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  163  	bkey_fsck_err_on(d_name.len + d_cf_name.len > name_block_len,
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  164  			 c, dirent_val_too_big,
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  165  			 "dirent names exceed bkey size (%d + %d > %d)",
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  166  			 d_name.len, d_cf_name.len, name_block_len);
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  167  
a125c0742ccb0b fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  168  	/*
a125c0742ccb0b fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  169  	 * Check new keys don't exceed the max length
a125c0742ccb0b fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  170  	 * (older keys may be larger.)
a125c0742ccb0b fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  171  	 */
a6f4794fcd8627 fs/bcachefs/dirent.c Kent Overstreet 2024-11-27  172  	bkey_fsck_err_on((from.flags & BCH_VALIDATE_commit) && d_name.len > BCH_NAME_MAX,
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  173  			 c, dirent_name_too_long,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  174  			 "dirent name too big (%u > %u)",
01a7e74fe14179 fs/bcachefs/dirent.c Joshua Ashton   2023-08-12  175  			 d_name.len, BCH_NAME_MAX);
b6d4f474e4e785 fs/bcachefs/dirent.c Kent Overstreet 2021-04-06  176  
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  177  	bkey_fsck_err_on(d_name.len != strnlen(d_name.name, d_name.len),
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  178  			 c, dirent_name_embedded_nul,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  179  			 "dirent has stray data after name's NUL");
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  180  
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  181  	bkey_fsck_err_on((d_name.len == 1 && !memcmp(d_name.name, ".", 1)) ||
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  182  			 (d_name.len == 2 && !memcmp(d_name.name, "..", 2)),
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  183  			 c, dirent_name_dot_or_dotdot,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  184  			 "invalid name");
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  185  
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  186  	bkey_fsck_err_on(memchr(d_name.name, '/', d_name.len),
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  187  			 c, dirent_name_has_slash,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  188  			 "name with /");
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  189  
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  190  	bkey_fsck_err_on(d.v->d_type != DT_SUBVOL &&
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  191  			 le64_to_cpu(d.v->d_inum) == d.k->p.inode,
d97de0d017cde0 fs/bcachefs/dirent.c Kent Overstreet 2024-08-12  192  			 c, dirent_to_itself,
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  193  			 "dirent points to own directory");
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  194  
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  195  	if (d.v->d_casefold) {
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  196  		bkey_fsck_err_on(from.from == BKEY_VALIDATE_commit &&
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  197  				 d_cf_name.len > BCH_NAME_MAX,
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  198  				 c, dirent_cf_name_too_big,
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  199  				 "dirent w/ cf name too big (%u > %u)",
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  200  				 d_cf_name.len, BCH_NAME_MAX);
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  201  
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  202  		bkey_fsck_err_on(d_cf_name.len != strnlen(d_cf_name.name, d_cf_name.len),
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  203  				 c, dirent_stray_data_after_cf_name,
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  204  				 "dirent has stray data after cf name's NUL");
d37c14ac6f05ec fs/bcachefs/dirent.c Joshua Ashton   2023-08-13  205  	}
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24  206  fsck_err:
b65db750e2bb92 fs/bcachefs/dirent.c Kent Overstreet 2023-10-24 @207  	return ret;
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  208  }
1c6fdbd8f2465d fs/bcachefs/dirent.c Kent Overstreet 2017-03-16  209  

:::::: The code at line 157 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
