Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FF200A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKadd+yM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702902069; x=1734438069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDemmIWa+4T7nR9lBH9wq1xz98qMEoBio4W4tmkPvv4=;
  b=UKadd+yMSM+k0cW4vwcDmL2+/Vanqw55a51GSua+I99zhZqOzAHDfYf+
   Dp9IPAFluuYc/daWazQq5LloMRmuyK3HfvKs0O8qRn+DsGdRTsPRFQ7so
   J66E/m/sqCFIEBmcd1BNX8ZchpC1rdRbvEm3t189hV8KH/W3w4hIlFBzC
   OJa/mSJzsD5FAwT7YDuvz2FAtAnhgDl9tt+ubX12Z93CTmNKOFm8cELl4
   YqcRmRXKP4qtecP+pHZ1AYFr8IGKhL0MIEwpDioFgtz7BCcvm8z/xCO7H
   HEHmVAkb/ktB1228WfLJkzpmPD2siBoE1eaG9vzzAYqAjOnbFBtrZOl9/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="394372726"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="394372726"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:21:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="779079905"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="779079905"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Dec 2023 04:21:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFCaI-00043R-0X;
	Mon, 18 Dec 2023 12:19:49 +0000
Date: Mon, 18 Dec 2023 20:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:master 18/173] fs/bcachefs/btree_update_interior.c:158:
 warning: Function parameter or member 'nr' not described in
 'bch2_btree_node_format_fits'
Message-ID: <202312182058.T6afYGsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   f5470472504dfc96eabc3abadabdac7f15449953
commit: a857ec99c72bfd31275300bdda28ef499a75a182 [18/173] bcachefs: btree_node_u64s_with_format() takes nr keys
config: i386-buildonly-randconfig-002-20231218 (https://download.01.org/0day-ci/archive/20231218/202312182058.T6afYGsk-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312182058.T6afYGsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312182058.T6afYGsk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update_interior.c:158: warning: Function parameter or member 'nr' not described in 'bch2_btree_node_format_fits'


vim +158 fs/bcachefs/btree_update_interior.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  143  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  144  /**
7cb0e6992e5c56 Colin Ian King  2023-09-12  145   * bch2_btree_node_format_fits - check if we could rewrite node with a new format
1c6fdbd8f2465d Kent Overstreet 2017-03-16  146   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  147   * @c:		filesystem handle
96dea3d599dbc3 Kent Overstreet 2023-09-12  148   * @b:		btree node to rewrite
96dea3d599dbc3 Kent Overstreet 2023-09-12  149   * @new_f:	bkey format to translate keys to
96dea3d599dbc3 Kent Overstreet 2023-09-12  150   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  151   * Returns: true if all re-packed keys will be able to fit in a new node.
96dea3d599dbc3 Kent Overstreet 2023-09-12  152   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  153   * Assumes all keys will successfully pack with the new format.
1c6fdbd8f2465d Kent Overstreet 2017-03-16  154   */
a857ec99c72bfd Kent Overstreet 2023-12-17  155  static bool bch2_btree_node_format_fits(struct bch_fs *c, struct btree *b,
a857ec99c72bfd Kent Overstreet 2023-12-17  156  				 struct btree_nr_keys nr,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  157  				 struct bkey_format *new_f)
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @158  {
a857ec99c72bfd Kent Overstreet 2023-12-17  159  	size_t u64s = btree_node_u64s_with_format(nr, &b->format, new_f);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  160  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  161  	return __vstruct_bytes(struct btree_node, u64s) < btree_bytes(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  162  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  163  

:::::: The code at line 158 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
