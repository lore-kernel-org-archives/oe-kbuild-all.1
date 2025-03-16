Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB37C8CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742133778; cv=none; b=sm/KvwlhcsELJUJXS68e5ZZS0tOs8rMkIQC7/BOEkl0J+v7e2/RUKwLRzznNxTaVOvBqwzGaRURXdyKr4MCeeqva/HkSSdVh0WOUNwvFtBn1lPYADMKaBrs6h8N+pdtQNe1SSD0t03mpoSe27864SbmaSjnflEz6kQI5U8nN0lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742133778; c=relaxed/simple;
	bh=/LvDCU/lPOT4UEJUZNeeS6wniCghEBoerkL+EINUev0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qoaxJieAOec5PUtuLe1Z5JrmLSil09k2n/q8pE/L8gZqbVaL2FKB96HOwM0qGs9L616oh23bWIWNi0UsBITJsJv7KR64iGEogluWpCaH69Sf51RhC+McOKilrkqQiqpXUIzZpukyZeenvQ6cIC+aunbnxWb3PbO52y/BKb/e/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D1Glnt/r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1Glnt/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742133775; x=1773669775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/LvDCU/lPOT4UEJUZNeeS6wniCghEBoerkL+EINUev0=;
  b=D1Glnt/rDzdASE6rYFuAOqYmkTwsuTbMwEG6w+Sugk1OtgXUgH0qhGKK
   zjUb1U3o9A8iHJM82DGOMjkGmkDTw1f4iDzyLLM3LWq2x+m4lq8Hsg8gl
   TRFKfeEoVYOaWAhMFk2IQjJMP8vYzTn8+b96qahCwzWtIwsj01zqRBAHg
   zo5BmdK4DrRT8wXX7bkXwcD1OxJcftoU4AQXMwr0cmSTvluGqhZXXlVbj
   Mwghnfzaj/rwZ95oPNm2Vc/OuYR8ZtuGS8hOa2kaf7EPkeILDbRaj7M6X
   aqHfHrMTVnzficpV9KDlJtpmqnA+PuemImztE7X6YXcAWrG+OZzsHg1RG
   A==;
X-CSE-ConnectionGUID: mPq+3vW8QTeRzcCOVohvUg==
X-CSE-MsgGUID: raLXE2tMTXyxramr3PzUzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="30820078"
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="30820078"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 07:02:55 -0700
X-CSE-ConnectionGUID: jDahsuLDRha3Hnm00V02Ew==
X-CSE-MsgGUID: OJUJPKzsSmeRsNUiVeotpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,252,1736841600"; 
   d="scan'208";a="121429501"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 07:02:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttoZn-000C1b-00;
	Sun, 16 Mar 2025 14:02:51 +0000
Date: Sun, 16 Mar 2025 22:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 133/160]
 fs/bcachefs/opts.c:240:33: error: initializer element is not constant
Message-ID: <202503162158.7bEoTl00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6d7f54c162635934218ea0cede09f68e40e3bc2f
commit: 0effd697a5c73b9d6182236bbfe428b9d2146f8d [133/160] bcachefs: Kill BCH_DEV_OPT_SETTERS()
config: i386-randconfig-051-20250316 (https://download.01.org/0day-ci/archive/20250316/202503162158.7bEoTl00-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503162158.7bEoTl00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503162158.7bEoTl00-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:134:9: note: in expansion of macro 'x'
     134 |         x(block_size,                   u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[0].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:134:9: note: in expansion of macro 'x'
     134 |         x(block_size,                   u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:134:9: note: in expansion of macro 'x'
     134 |         x(block_size,                   u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[0].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:134:9: note: in expansion of macro 'x'
     134 |         x(block_size,                   u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:140:9: note: in expansion of macro 'x'
     140 |         x(btree_node_size,              u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[1].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:140:9: note: in expansion of macro 'x'
     140 |         x(btree_node_size,              u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:140:9: note: in expansion of macro 'x'
     140 |         x(btree_node_size,              u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[1].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:140:9: note: in expansion of macro 'x'
     140 |         x(btree_node_size,              u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:146:9: note: in expansion of macro 'x'
     146 |         x(errors,                       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[2].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:146:9: note: in expansion of macro 'x'
     146 |         x(errors,                       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:146:9: note: in expansion of macro 'x'
     146 |         x(errors,                       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[2].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:146:9: note: in expansion of macro 'x'
     146 |         x(errors,                       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:151:9: note: in expansion of macro 'x'
     151 |         x(write_error_timeout,          u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[3].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:151:9: note: in expansion of macro 'x'
     151 |         x(write_error_timeout,          u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:151:9: note: in expansion of macro 'x'
     151 |         x(write_error_timeout,          u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[3].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:151:9: note: in expansion of macro 'x'
     151 |         x(write_error_timeout,          u16,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:156:9: note: in expansion of macro 'x'
     156 |         x(metadata_replicas,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[4].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:156:9: note: in expansion of macro 'x'
     156 |         x(metadata_replicas,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:156:9: note: in expansion of macro 'x'
     156 |         x(metadata_replicas,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[4].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:156:9: note: in expansion of macro 'x'
     156 |         x(metadata_replicas,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:161:9: note: in expansion of macro 'x'
     161 |         x(data_replicas,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[5].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:161:9: note: in expansion of macro 'x'
     161 |         x(data_replicas,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:161:9: note: in expansion of macro 'x'
     161 |         x(data_replicas,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[5].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:161:9: note: in expansion of macro 'x'
     161 |         x(data_replicas,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:166:9: note: in expansion of macro 'x'
     166 |         x(metadata_replicas_required, u8,                               \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[6].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:166:9: note: in expansion of macro 'x'
     166 |         x(metadata_replicas_required, u8,                               \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:166:9: note: in expansion of macro 'x'
     166 |         x(metadata_replicas_required, u8,                               \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[6].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:166:9: note: in expansion of macro 'x'
     166 |         x(metadata_replicas_required, u8,                               \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:171:9: note: in expansion of macro 'x'
     171 |         x(data_replicas_required,       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[7].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:171:9: note: in expansion of macro 'x'
     171 |         x(data_replicas_required,       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:171:9: note: in expansion of macro 'x'
     171 |         x(data_replicas_required,       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[7].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:171:9: note: in expansion of macro 'x'
     171 |         x(data_replicas_required,       u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:176:9: note: in expansion of macro 'x'
     176 |         x(encoded_extent_max,           u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[8].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:176:9: note: in expansion of macro 'x'
     176 |         x(encoded_extent_max,           u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:176:9: note: in expansion of macro 'x'
     176 |         x(encoded_extent_max,           u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[8].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:176:9: note: in expansion of macro 'x'
     176 |         x(encoded_extent_max,           u32,                            \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:182:9: note: in expansion of macro 'x'
     182 |         x(metadata_checksum,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[9].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:182:9: note: in expansion of macro 'x'
     182 |         x(metadata_checksum,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
>> fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:182:9: note: in expansion of macro 'x'
     182 |         x(metadata_checksum,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[9].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:182:9: note: in expansion of macro 'x'
     182 |         x(metadata_checksum,            u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:187:9: note: in expansion of macro 'x'
     187 |         x(data_checksum,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[10].get_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:187:9: note: in expansion of macro 'x'
     187 |         x(data_checksum,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:187:9: note: in expansion of macro 'x'
     187 |         x(data_checksum,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: note: (near initialization for 'bch2_opt_table[10].set_sb')
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:267:35: note: in expansion of macro 'filter_if_type_and_neq'
     267 |                 .set_sb         = filter_if_type_and_neq(SET_##_sb_opt, SET_BCH2_NO_SB_OPT),    \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:187:9: note: in expansion of macro 'x'
     187 |         x(data_checksum,                u8,                             \
         |         ^
   fs/bcachefs/opts.c:273:9: note: in expansion of macro 'BCH_OPTS'
     273 |         BCH_OPTS()
         |         ^~~~~~~~
   fs/bcachefs/opts.c:240:33: error: initializer element is not constant
     240 | #define mask_if_eq(_p, _v)      (_p != _v ? _p : NULL)
         |                                 ^
   fs/bcachefs/opts.c:243:9: note: in expansion of macro 'mask_if_eq'
     243 |         mask_if_eq(type_compatible_or_null(_p, _v), _v)
         |         ^~~~~~~~~~
   fs/bcachefs/opts.c:266:35: note: in expansion of macro 'filter_if_type_and_neq'
     266 |                 .get_sb         = filter_if_type_and_neq(_sb_opt,       BCH2_NO_SB_OPT),        \
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/opts.h:192:9: note: in expansion of macro 'x'
     192 |         x(compression,                  u8,                             \


vim +240 fs/bcachefs/opts.c

   235	
   236	#define type_compatible_or_null(_p, _type)				\
   237		__builtin_choose_expr(						\
   238			__builtin_types_compatible_p(typeof(_p), typeof(_type)), _p, NULL)
   239	
 > 240	#define mask_if_eq(_p, _v)	(_p != _v ? _p : NULL)
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
