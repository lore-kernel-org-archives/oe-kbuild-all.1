Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE292905
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753973220; cv=none; b=rFB+kGNc8lEEEj9x0vK0wMqhlj+7RsKlytxhbOBxkonpKBJ9WV9LckuH8Ddwm0tUwvuDRo/nLnxwYojM9cNSZNEnM5305y1Z3FevEkyWA0hj7p5nHpxwPd2J2DltF6+OMVi1gTNFTYB/8g3sWWOqu4kJb3vRZ69RleuvStKVn9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753973220; c=relaxed/simple;
	bh=qFvCEVtBmBqOSijip253Oe8vdN7qvtV3ifhdbd9qfKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiJr85yPYYO7SKlZjUOCXjhaWaGMK9Z9DOS8b15uI+pUb2hIWm9H0EKLcqjnGTD11M0LL3TUJSQJF7/4wtTuI8P5aeOheMd2Jbm5QdqT+jhfgmnIfq2eJmxY6SmxvHCkiw0xLJSl9hFk7P0VmdXq4+S1W3Lb6H9wY54ejvsjJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTXDgkHx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTXDgkHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753973219; x=1785509219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFvCEVtBmBqOSijip253Oe8vdN7qvtV3ifhdbd9qfKE=;
  b=PTXDgkHx6JppCJEaNd8pVsYk1fjhLLlAJ323uOpcZcYGVVeNHyvrLiUd
   DxpzjW69ruoWLQ/xJEQrEyNyAT6yPvV4e+UPWOUiKOUTOwtUypx/2x9y1
   JTtfAObKuNLxCOR3CAOINFd52PSCv+Z2mA8kjLejt/k12GBF1frnfK/mt
   7YtVdRZf7H+ozw7Phou5qKNeEjwM0wLADsLP9OOQwh0Iz5YSgka+CvrvB
   /zrh1evpDVHbe7ecKwExLnloSkRv6ujUZT6H3N2JD9rboILr1ZWvvfhcz
   GzkmrLpVOAPwWWOKKNCxYgq72Pg7WNscbs6o3rOZlhN79BCjixi6UfbE1
   A==;
X-CSE-ConnectionGUID: 0ABiEl4jRZiphXZA6XhX6w==
X-CSE-MsgGUID: UF8jZK8oRVC6eKy/jVnETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55367167"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="55367167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:46:58 -0700
X-CSE-ConnectionGUID: zjury4FLQ1CTizxTJqybsg==
X-CSE-MsgGUID: uKmugbXyTsaKDlOk3YG/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="167524728"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2025 07:46:57 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhUYZ-0003qu-1l;
	Thu, 31 Jul 2025 14:46:55 +0000
Date: Thu, 31 Jul 2025 22:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 219/231] fs/bcachefs/dirent.c:765:1:
 warning: the frame size of 1344 bytes is larger than 1280 bytes
Message-ID: <202507312248.dWPpIFt3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   53def8896bdc4b3f7a15affd6f867cbc6f64dc14
commit: 8cf424e23e76826583cef06af21ada70f22ff85f [219/231] bcachefs: CLASS(btree_iter)
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250731/202507312248.dWPpIFt3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507312248.dWPpIFt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312248.dWPpIFt3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/dirent.c: In function 'bch2_fsck_remove_dirent':
>> fs/bcachefs/dirent.c:765:1: warning: the frame size of 1344 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     765 | }
         | ^


vim +765 fs/bcachefs/dirent.c

758ea4ff812b4d Kent Overstreet 2025-03-20  743  
758ea4ff812b4d Kent Overstreet 2025-03-20  744  int bch2_fsck_remove_dirent(struct btree_trans *trans, struct bpos pos)
758ea4ff812b4d Kent Overstreet 2025-03-20  745  {
758ea4ff812b4d Kent Overstreet 2025-03-20  746  	struct bch_fs *c = trans->c;
758ea4ff812b4d Kent Overstreet 2025-03-20  747  	struct bch_inode_unpacked dir_inode;
758ea4ff812b4d Kent Overstreet 2025-03-20  748  	struct bch_hash_info dir_hash_info;
758ea4ff812b4d Kent Overstreet 2025-03-20  749  
8cf424e23e7682 Kent Overstreet 2025-07-30  750  	int ret = lookup_first_inode(trans, pos.inode, &dir_inode);
758ea4ff812b4d Kent Overstreet 2025-03-20  751  	if (ret)
758ea4ff812b4d Kent Overstreet 2025-03-20  752  		goto err;
758ea4ff812b4d Kent Overstreet 2025-03-20  753  
758ea4ff812b4d Kent Overstreet 2025-03-20  754  	dir_hash_info = bch2_hash_info_init(c, &dir_inode);
758ea4ff812b4d Kent Overstreet 2025-03-20  755  
8cf424e23e7682 Kent Overstreet 2025-07-30  756  	CLASS(btree_iter, iter)(trans, BTREE_ID_dirents, pos, BTREE_ITER_intent);
758ea4ff812b4d Kent Overstreet 2025-03-20  757  
25201eae7abed7 Kent Overstreet 2025-07-30  758  	ret =   bch2_btree_iter_traverse(&iter) ?:
758ea4ff812b4d Kent Overstreet 2025-03-20  759  		bch2_hash_delete_at(trans, bch2_dirent_hash_desc,
758ea4ff812b4d Kent Overstreet 2025-03-20  760  				    &dir_hash_info, &iter,
758ea4ff812b4d Kent Overstreet 2025-03-20  761  				    BTREE_UPDATE_internal_snapshot_node);
758ea4ff812b4d Kent Overstreet 2025-03-20  762  err:
758ea4ff812b4d Kent Overstreet 2025-03-20  763  	bch_err_fn(c, ret);
758ea4ff812b4d Kent Overstreet 2025-03-20  764  	return ret;
758ea4ff812b4d Kent Overstreet 2025-03-20 @765  }

:::::: The code at line 765 was first introduced by commit
:::::: 758ea4ff812b4dfd4cef6dba0eb4b0025a7b147e bcachefs: Move bch2_check_dirent_target() to namei.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
