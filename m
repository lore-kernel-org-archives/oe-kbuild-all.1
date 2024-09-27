Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585C1BC075
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431395; cv=none; b=Q7OqSb9qceT0bw1beOCQZ1IRnMplr2APNFY6yUX1nbGmYk2WLe9aQMh52OaggD5WPfIwt45YrhQxA9L2qFRzOoAtLHVPNbBxsVKLDN0MlRfUq0HYyYp8qMyrGYVyLF5qC3hLKSaHONS9EIpwIZXSbk6iWETK4bQZVjPCErnYcEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431395; c=relaxed/simple;
	bh=lFbPrpRue2Sh4Otl9W/nWvPjZIr3Df+KW/bk7MYwet0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh+GGdB8ImTlpNxqyI76IUJ4aR7r7UzB6kmY7zVRDbeefNo1OI962yGodq7Xg3CSItZa6+EleLcmmss9tKT55D/Td5nR4tLksyc6OHCxylf/8Lai+A23vi296tn546s7VJH7JqgAM3Yq1ZdcUc7m+GVC32sgmr0ZeENg340JFsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lO9dK62P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lO9dK62P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727431393; x=1758967393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lFbPrpRue2Sh4Otl9W/nWvPjZIr3Df+KW/bk7MYwet0=;
  b=lO9dK62PeP6xzC3J57Y2i+uwh/liw27xE8laVJdc2kLsEH1rXtOJL5DK
   rIUWwW0vfBILlL4wrxG30yAitcmAGvjJ9O3ZJfjHml2Kv8QLm2Qt0aN22
   kve9K6NWxPbpbedND2B5n2VIxzsjOk3bhenBGCLPSpRgYEcSP+aEkGJNq
   JmYhapjMzMfE+GVzCMCXUo5rizMVHS3iNA6vxgELKr7tAymBh1BG1MYcu
   1YeRSdSwEhr0YOY6Ks0f2kmoUH8gnUNtdVyh2JN395J45ImMPOFYUI9P6
   xAdlpCIokGUnEEBhxWB4GqB+4xWNrxxoBF2sH5y1VJSI9eTmXzhZR9sPi
   w==;
X-CSE-ConnectionGUID: mYgWE0p6RbK6vaD5XFflvg==
X-CSE-MsgGUID: w6sSWWJrTpeou86LR9ebBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37708312"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37708312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:03:12 -0700
X-CSE-ConnectionGUID: 6uqbNY4nRdG9xfjl57vHUA==
X-CSE-MsgGUID: Wc9LCmWcRdGwcmJZat/XIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77001807"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2024 03:03:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su7ob-000Ln5-02;
	Fri, 27 Sep 2024 10:03:09 +0000
Date: Fri, 27 Sep 2024 18:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 198/202]
 fs/bcachefs/tests.c:397:17: error: 'struct bkey' has no member named
 'bversion'; did you mean 'version'?
Message-ID: <202409271712.EZRpO2Z1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   9ee6e6730cfdb671c180b323c6d60374aa5ab6b5
commit: 8983840debcfd17df76e2a8d3831c3c5970b53a7 [198/202] bcachefs: rename version -> bversion
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271712.EZRpO2Z1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271712.EZRpO2Z1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271712.EZRpO2Z1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bset.h:9,
                    from fs/bcachefs/btree_iter.h:5,
                    from fs/bcachefs/btree_update.h:5,
                    from fs/bcachefs/tests.c:5:
   fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
   fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)                    \
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
     558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
         |                                         ^~~~~~~~
   fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
     578 | #define x(id, field) __bkey_format_add(s, id, k->field);
         |                                                  ^~~~~
   fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
     579 |         bkey_fields()
         |         ^~~~~~~~~~~
   In file included from fs/bcachefs/bset.h:10:
   fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
   fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                  ^~~~~~~~
         |                                  version
   fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member named 'bversion'; did you mean 'version'?
      73 |                 !bversion_cmp(l->bversion, r->bversion) &&
         |                                               ^~~~~~~~
         |                                               version
   fs/bcachefs/tests.c: In function 'insert_test_extent':
>> fs/bcachefs/tests.c:397:17: error: 'struct bkey' has no member named 'bversion'; did you mean 'version'?
     397 |         k.k_i.k.bversion.lo = test_version++;
         |                 ^~~~~~~~
         |                 version


vim +397 fs/bcachefs/tests.c

   386	
   387	static int insert_test_extent(struct bch_fs *c,
   388				      u64 start, u64 end)
   389	{
   390		struct bkey_i_cookie k;
   391		int ret;
   392	
   393		bkey_cookie_init(&k.k_i);
   394		k.k_i.k.p.offset = end;
   395		k.k_i.k.p.snapshot = U32_MAX;
   396		k.k_i.k.size = end - start;
 > 397		k.k_i.k.bversion.lo = test_version++;
   398	
   399		ret = bch2_btree_insert(c, BTREE_ID_extents, &k.k_i, NULL, 0, 0);
   400		bch_err_fn(c, ret);
   401		return ret;
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
