Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD34A48
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754097853; cv=none; b=gvaAGDCGrZX1PFY8UOuHfhcW0hvxAjmHS46vjvWgoYjK/HEuwiTGa3c9jLpjldwgZIqJkCbJUrDRIUXDCZXOyJ6wD+sbwHMOl6pz6bJ7g+lN8v/ezQ8SLF0qBdK7jae1kjFcmhanJJrbmYqrT5S164i6cVWVCzrT2m8al9A0uuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754097853; c=relaxed/simple;
	bh=zM5ouXJwJENY57tgNyf705MBd1ctapK/Nnh4Bke9GVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNLaOmOpOL6PiFlWDQgOv3F9QkwLfUMG1fEN4dxp//TyUG4VqVMqHEQhtDGrvxaRecF5na4pUds2EtFtYMj7L8b+bsgRRFow3l28XnYprir39JdJDKsTnWxCGg24pB24eD18IdX0yj+ZVeYtGBWMvh3ir8PlhYc52LTCCmKiPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPfoCWYK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPfoCWYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754097852; x=1785633852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zM5ouXJwJENY57tgNyf705MBd1ctapK/Nnh4Bke9GVg=;
  b=TPfoCWYKNNFQEb31oCSYtXXd4sTWkQ95/DRcH2P8OmhNJiLCCoCOe1l2
   N7H+2BRafmIrtV+a1JudPQWprz/4nR+OjzO3dJA9xsAPslaReocT6m2S/
   9DLYpaJeJAGTNSX57zbOM0oGk492nIYfKcfl8JwXhv7QykGke5po85mrb
   URI5PB5uPm824Ia5nsHj7j1XsydXuPcX7LDqRpNEkdk9IHLPMmszcFGi3
   4zy/OabkEqfdT1wU15PYERtUJf3cyHTWrsQbUfwtPDqUcCBqFThoTgOAt
   etwtAOaAemBxBcQICdmYiZyOduC3+6LXwS2KLHmypC3r7jMgK6f03DVzk
   Q==;
X-CSE-ConnectionGUID: dSjKw+hLRKGhAoZN5UhA4w==
X-CSE-MsgGUID: 1OyDsLlfQdyt5TWK2SL0zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59070395"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59070395"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:24:11 -0700
X-CSE-ConnectionGUID: 6bRmJDoKSa+hUEBl7OgCXQ==
X-CSE-MsgGUID: x43NDUJYTeyHBurnKoa9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163257262"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2025 18:24:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui0yl-00054O-2e;
	Sat, 02 Aug 2025 01:24:07 +0000
Date: Sat, 2 Aug 2025 09:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 246/246]
 fs/bcachefs/btree_gc.c:297:30: warning: '%s' directive argument is null
Message-ID: <202508020910.G5e5ezsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   9ac5d4faab581112221554e80955e470840e3641
commit: 9ac5d4faab581112221554e80955e470840e3641 [246/246] bcachefs: btree_check_root_boundaries()
config: csky-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020910.G5e5ezsf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020910.G5e5ezsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020910.G5e5ezsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/backpointers.h:9,
                    from fs/bcachefs/btree_gc.c:10:
   fs/bcachefs/btree_gc.c: In function 'btree_check_root_boundaries':
>> fs/bcachefs/btree_gc.c:297:30: warning: '%s' directive argument is null [-Wformat-overflow=]
     297 |                              "btree root with incorrect min_key%s", buf.buf)) {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/error.h:107:20: note: in definition of macro 'fsck_err_wrap'
     107 |         int _ret = _do;                                                 \
         |                    ^~~
   fs/bcachefs/error.h:117:47: note: in expansion of macro 'bch2_fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                               ^~~~~~~~~~~~~
   fs/bcachefs/error.h:130:27: note: in expansion of macro '__fsck_err'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^~~~~~~~~~
   fs/bcachefs/error.h:137:9: note: in expansion of macro '__fsck_err_on'
     137 |         __fsck_err_on(cond, c, FSCK_CAN_FIX, _err_type, __VA_ARGS__)
         |         ^~~~~~~~~~~~~
   fs/bcachefs/btree_gc.c:295:13: note: in expansion of macro 'mustfix_fsck_err_on'
     295 |         if (mustfix_fsck_err_on(!bpos_eq(b->data->min_key, POS_MIN),
         |             ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_gc.c:297:64: note: format string is defined here
     297 |                              "btree root with incorrect min_key%s", buf.buf)) {
         |                                                                ^~


vim +297 fs/bcachefs/btree_gc.c

   284	
   285	static int btree_check_root_boundaries(struct btree_trans *trans, struct btree *b)
   286	{
   287		struct bch_fs *c = trans->c;
   288		struct printbuf buf = PRINTBUF;
   289		int ret = 0;
   290	
   291		BUG_ON(b->key.k.type == KEY_TYPE_btree_ptr_v2 &&
   292		       !bpos_eq(bkey_i_to_btree_ptr_v2(&b->key)->v.min_key,
   293				b->data->min_key));
   294	
   295		if (mustfix_fsck_err_on(!bpos_eq(b->data->min_key, POS_MIN),
   296					trans, btree_node_topology_bad_root_min_key,
 > 297				     "btree root with incorrect min_key%s", buf.buf)) {
   298			ret = set_node_min(c, b, POS_MIN);
   299			if (ret)
   300				goto err;
   301		}
   302	
   303		if (mustfix_fsck_err_on(!bpos_eq(b->data->max_key, SPOS_MAX),
   304					trans, btree_node_topology_bad_root_max_key,
   305				     "btree root with incorrect min_key%s", buf.buf)) {
   306			ret = set_node_max(c, b, SPOS_MAX);
   307			if (ret)
   308				goto err;
   309		}
   310	
   311	err:
   312	fsck_err:
   313		printbuf_exit(&buf);
   314		return ret;
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
