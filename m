Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AC14ABD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfE1pFmK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702982860; x=1734518860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpLL+VF8SLay5OqzHcyWT3EsC7eUd/YYLRiPeeWzRtQ=;
  b=EfE1pFmKH8E/OgzKy5n7RCmoxW0uySLN1VP3Htf1aJERTUu74ZBjCngc
   7GxbHkoroislg7fM/xk7iUHFviR3QDLVlzDIOBTb6bYbhwLvFvWnSAR/E
   x7pTm40qsYCLH90kTODtYgiQvbiCfD1J4/qX9OFJlQg/hSgSGi2XOWh9e
   J0VFXm94n+NRPR5nZepRLFahGQYuE3unTPliSE40NqiQu1tqqyL90WdNN
   /KX4M0jqOLFjhUDaUElq1nPkwrxRNu79ffNvusa97yiUUDr8WTteS1soz
   uwxzynNYdpRaAufv3N8M9kd54Y7YqnFqkLNUKSnRuToIFeC/L1VGaLKTr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2470403"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="2470403"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 02:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846292503"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="846292503"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2023 02:47:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFXdP-0005CT-27;
	Tue, 19 Dec 2023 10:47:35 +0000
Date: Tue, 19 Dec 2023 18:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8475/9096]
 fs/bcachefs/btree_update_interior.c:158: warning: Function parameter or
 struct member 'nr' not described in 'bch2_btree_node_format_fits'
Message-ID: <202312191829.ZkroAQDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: a857ec99c72bfd31275300bdda28ef499a75a182 [8475/9096] bcachefs: btree_node_u64s_with_format() takes nr keys
config: i386-randconfig-061-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191829.ZkroAQDV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191829.ZkroAQDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191829.ZkroAQDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update_interior.c:158: warning: Function parameter or struct member 'nr' not described in 'bch2_btree_node_format_fits'


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
