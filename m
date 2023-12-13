Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B321359
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 09:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgPTXkqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702461373; x=1733997373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqzFu5awSRoquoPwFrxFanHENGp2htz8evOHMk+auuQ=;
  b=cgPTXkqD2x6R5q/O4Utcy+EnWc36r6BNc08vHyi1ZEB1RRkepeZCqhVq
   Srs92Bteac3rxuUKW6KsMNXdD1jnCT0xSEMwjQw8skwaVSL+39x9A9QbD
   0as60zXyFsLgUq/HyKJxwsgbLCuCrYG5GzFcKblUZSAyeB4LYy5eRgJz+
   hI9Veq2/sp5OJ3HZ018MVXKk/N/8CzsDZFoWWquvDvkgKGwRPfmAbAm5U
   CpTOrPOSX98GPJHOKMCDDZGr11z5RZhz2/PomtvqSOXdP+calzsRWS39z
   pLQ/uIF2p8Cq6DdGsaYR81zcKiNA1rmk6jUktajhH8imvFPX6Gu5lR3CS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1797882"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1797882"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="750059511"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="750059511"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2023 01:56:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDLxl-000KMJ-0K;
	Wed, 13 Dec 2023 09:55:39 +0000
Date: Wed, 13 Dec 2023 17:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6565/7300] fs/bcachefs/btree_iter.c:1442:28:
 warning: variable 'path' set but not used
Message-ID: <202312131758.NED6TvQK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 1270c98a2de83dd8d9151f9564d5a5e523c13f70 [6565/7300] bcachefs: bch2_btree_path_to_text() -> btree_path_idx_t
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231213/202312131758.NED6TvQK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131758.NED6TvQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131758.NED6TvQK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_iter.c:13:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
   fs/bcachefs/btree_iter.c: In function '__bch2_trans_paths_to_text':
>> fs/bcachefs/btree_iter.c:1442:28: warning: variable 'path' set but not used [-Wunused-but-set-variable]
    1442 |         struct btree_path *path;
         |                            ^~~~


vim +/path +1442 fs/bcachefs/btree_iter.c

67e0dd8f0d8b4b Kent Overstreet 2021-08-30  1436  
73bd774d28d2b2 Kent Overstreet 2023-07-06  1437  static noinline __cold
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1438  void __bch2_trans_paths_to_text(struct printbuf *out, struct btree_trans *trans,
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1439  				bool nosort)
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1440  {
d7040e061f1283 Kent Overstreet 2023-12-10  1441  	struct trans_for_each_path_inorder_iter iter;
5c0bb66ae341c7 Kent Overstreet 2022-08-11 @1442  	struct btree_path *path;
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1443  
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1444  	if (!nosort)
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1445  		btree_trans_sort_paths(trans);
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1446  
d7040e061f1283 Kent Overstreet 2023-12-10  1447  	trans_for_each_path_inorder(trans, path, iter)
1270c98a2de83d Kent Overstreet 2023-12-10  1448  		bch2_btree_path_to_text(out, trans, iter.path_idx);
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1449  }
5c0bb66ae341c7 Kent Overstreet 2022-08-11  1450  

:::::: The code at line 1442 was first introduced by commit
:::::: 5c0bb66ae341c71e5f62c193ea4d7b0cf278a914 bcachefs: Track the maximum btree_paths ever allocated by each transaction

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
