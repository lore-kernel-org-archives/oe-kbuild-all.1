Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6000101FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748169820; cv=none; b=Eg7FAp+105oC4Eoa6927l32DqxPynftRKN2sfkckMGTc9rI657MBjd3Qebe3Wuhf/GaFTiwE+7V/EUiX8H9YWhO4KptC0fmiVndu2r5kBl/cBrQESUrm+eX4lZJGzttPJxEUFWbRI40MY9Z7o+ra5gGyu94q7jNE/ctnpyOs5lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748169820; c=relaxed/simple;
	bh=+QrfLtmaHLcQ+cXayUC93UmvZMaj3ytzxVEcHiNRImQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeYEIIFUIuKgxCk7TNlf3tpYHN5R7eqNwZqIzylTzHTO+h6H9YNMoco2AII3LYuY00HUyKMwVZsPETuvKtr8W8OgsPY6+2yuzXTVgik/FuMU95WPGC8ihQt6OCMhUPDw0Nuxqe4TGUicf44HPuLFPY4cy1x218+iMXMBa2rTuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0lc1xm/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0lc1xm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748169819; x=1779705819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QrfLtmaHLcQ+cXayUC93UmvZMaj3ytzxVEcHiNRImQ=;
  b=E0lc1xm/BCDkds73ZrI7Wp6hbWycGox2m5Ws7u5Xoe6sz2XshTv12xVw
   S3L3IFRspP/VDqUYd4TBjMLLvrNgb8iIsk3qUGcTmyta/vWMwsmGSVnWy
   aDYULl42RE7W0JFcuzc4/CGKfbXHCBLh9ogmeoESJG0ur/1k0etDSl33j
   QwfLEOSOTRebayuwIgmcp0Y3yZcnoUYx0ZYPLcPhrCCXFLEugyWPs6Oaq
   A6r9hoD4dRAuPfcG10Ci+P6TUrQlS+NkPo0slOcAFr3eHDQePYu1MMpN2
   P8nvmEeGR1H7Zqmkkzxy+eLSSQcNDXdj1a8lTWhyaaL1PIYI33kaR0nZp
   g==;
X-CSE-ConnectionGUID: WUqJEZ7OS1alO4lUTKpWzA==
X-CSE-MsgGUID: g++fbFM7QuOitGbgmhGbhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="72688549"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="72688549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 03:43:38 -0700
X-CSE-ConnectionGUID: Zz3x2kXjRhOwZRJKLpdvFg==
X-CSE-MsgGUID: EUAjzLSqTBS124tzs1Ao7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="172842026"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2025 03:43:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ8pK-000RlE-20;
	Sun, 25 May 2025 10:43:34 +0000
Date: Sun, 25 May 2025 18:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 301/304]
 fs/bcachefs/tests.c:147:8: error: implicit declaration of function
 'or_each_btree_key_reverse'; did you mean 'for_each_btree_key_reverse'?
Message-ID: <202505251807.4PNNm8DI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a65e0ec5d1fc367a41e153f173cc1e5fb78e46b5
commit: 2605b73c749cf0d8dc670f1399a7106be1667d3d [301/304] bcachefs: bch2_trans_run() is deprecated
config: arc-randconfig-002-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251807.4PNNm8DI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251807.4PNNm8DI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251807.4PNNm8DI-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/tests.c: In function 'test_iterate':
>> fs/bcachefs/tests.c:147:8: error: implicit declaration of function 'or_each_btree_key_reverse'; did you mean 'for_each_btree_key_reverse'? [-Werror=implicit-function-declaration]
     ret = or_each_btree_key_reverse(trans, iter, BTREE_ID_xattrs,
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           for_each_btree_key_reverse
>> fs/bcachefs/tests.c:147:41: error: 'iter' undeclared (first use in this function); did you mean 'idr'?
     ret = or_each_btree_key_reverse(trans, iter, BTREE_ID_xattrs,
                                            ^~~~
                                            idr
   fs/bcachefs/tests.c:147:41: note: each undeclared identifier is reported only once for each function it appears in
>> fs/bcachefs/tests.c:148:35: error: 'k' undeclared (first use in this function)
        SPOS(0, U64_MAX, U32_MAX), 0, k, ({
                                      ^
   cc1: some warnings being treated as errors


vim +147 fs/bcachefs/tests.c

   105	
   106	static int test_iterate(struct bch_fs *c, u64 nr)
   107	{
   108		u64 i;
   109		int ret = 0;
   110	
   111		delete_test_keys(c);
   112	
   113		CLASS(btree_trans, trans)(c);
   114	
   115		pr_info("inserting test keys");
   116	
   117		for (i = 0; i < nr; i++) {
   118			struct bkey_i_cookie ck;
   119	
   120			bkey_cookie_init(&ck.k_i);
   121			ck.k.p.offset = i;
   122			ck.k.p.snapshot = U32_MAX;
   123	
   124			ret = bch2_btree_insert(c, BTREE_ID_xattrs, &ck.k_i, NULL, 0, 0);
   125			bch_err_msg(c, ret, "insert error");
   126			if (ret)
   127				return ret;
   128		}
   129	
   130		pr_info("iterating forwards");
   131		i = 0;
   132	
   133		ret =for_each_btree_key_max(trans, iter, BTREE_ID_xattrs,
   134						SPOS(0, 0, U32_MAX), POS(0, U64_MAX),
   135						0, k, ({
   136				BUG_ON(k.k->p.offset != i++);
   137				0;
   138			}));
   139		bch_err_msg(c, ret, "error iterating forwards");
   140		if (ret)
   141			return ret;
   142	
   143		BUG_ON(i != nr);
   144	
   145		pr_info("iterating backwards");
   146	
 > 147		ret = or_each_btree_key_reverse(trans, iter, BTREE_ID_xattrs,
 > 148					SPOS(0, U64_MAX, U32_MAX), 0, k, ({
   149				BUG_ON(k.k->p.offset != --i);
   150				0;
   151			}));
   152		bch_err_msg(c, ret, "error iterating backwards");
   153		if (ret)
   154			return ret;
   155	
   156		BUG_ON(i);
   157		return 0;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
