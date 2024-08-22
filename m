Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC3B13B2B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310117; cv=none; b=IVGpUI7KNRC+5lXlzcogIExXYDiZ/plV0Pbccq/x/vn0Ei1VpCAn/lAEuNYV2IXsQa99CXNou3nZ9meJ4XVP8q5DwMj/vEDlgyVNoZ6JQ7qNo0kQ6hR6ZNa7iv88k+8Qiw2z4EiWCwtuCT33737y6S0DBUKtC4nBtuQae+dWENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310117; c=relaxed/simple;
	bh=vIOYiABN4EuW9ReBbFJ4ciIZf7MplctCYSyCk7WDaaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdA3c1LWjZaTDP+yAbVVmljxTXwlafchOIH6CnAJwke92HlQDztd3XEyGxAUg6wIZ1GotRzq/RQMojQYbQ0VPw8TGxv7Th4fekl44RYZRy1nNFNKNg2fpW0ODQ9gBdyPxSfUSGSpuX3JfLcveK9S/a8OrnYbALYLneAhII94ojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2ZsLbkQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2ZsLbkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724310116; x=1755846116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIOYiABN4EuW9ReBbFJ4ciIZf7MplctCYSyCk7WDaaQ=;
  b=d2ZsLbkQiuubs2k6fkqKZkWltbYGPGaaZoE3cOJ5rVNq76/x3g45GPaZ
   ugJr0z9Ft17ot97g73XSSMV3offWkvb7QbthY25mLgWSlpy1vP4IyJ2QM
   fEiLKn/keYEj4ENHrUQam1wzGafR8mBZC5SDXp2hmZffdh/Fq6SZ4SvZ6
   kmoSoE6onZbjdvBtBhlpLvK4cuLwWTI4TYryY2+HAEFwavRtf71TVshu2
   SW23D3Wlh6QRf7fE1cAwtxyZojZdWq/QDbOJQceQMyP8h4mBL492Yyctw
   wMQ0wvCw0aZQDQH++hPJiGsUp3S6pbjp6ucvpYHOQ4XhheIHSEuWRTSTL
   Q==;
X-CSE-ConnectionGUID: 8x6HycRSRtihkanO5mmG0A==
X-CSE-MsgGUID: sx34fEuXSWepr/oI7LqoJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33857953"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="33857953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 00:01:55 -0700
X-CSE-ConnectionGUID: Crk/b32zQIqPI5PpAlKNrQ==
X-CSE-MsgGUID: IEGp8QQgRXa7ORMUXL/YTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66029603"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Aug 2024 00:01:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh1pQ-000CVY-2A;
	Thu, 22 Aug 2024 07:01:52 +0000
Date: Thu, 22 Aug 2024 15:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:fs-next 337/433] fs/bcachefs/btree_key_cache.c:758:9:
 sparse: sparse: dereference of noderef expression
Message-ID: <202408221407.KnZ1VF8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   7ba615b05fbe745265e898c3bf8db40453c59b8a
commit: f316d2e88651ba94dff468e038621a5385002b2d [337/433] bcachefs: Rip out freelists from btree key cache
config: csky-randconfig-r132-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221407.KnZ1VF8O-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408221407.KnZ1VF8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221407.KnZ1VF8O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_key_cache.c: note: in included file:
   fs/bcachefs/bcachefs.h:996:9: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_key_cache.c:687:32: sparse: sparse: context imbalance in 'bch2_fs_btree_key_cache_exit' - different lock contexts for basic block
>> fs/bcachefs/btree_key_cache.c:758:9: sparse: sparse: dereference of noderef expression

vim +758 fs/bcachefs/btree_key_cache.c

   750	
   751	void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *bc)
   752	{
   753		printbuf_tabstop_push(out, 24);
   754		printbuf_tabstop_push(out, 12);
   755	
   756		prt_printf(out, "keys:\t%lu\r\n",		atomic_long_read(&bc->nr_keys));
   757		prt_printf(out, "dirty:\t%lu\r\n",		atomic_long_read(&bc->nr_dirty));
 > 758		prt_printf(out, "table size:\t%u\r\n",		bc->table.tbl->size);
   759	
   760		prt_printf(out, "\nshrinker:\n");
   761		prt_printf(out, "requested_to_free:\t%lu\r\n",	bc->requested_to_free);
   762		prt_printf(out, "freed:\t%lu\r\n",		bc->freed);
   763		prt_printf(out, "skipped_dirty:\t%lu\r\n",	bc->skipped_dirty);
   764		prt_printf(out, "skipped_accessed:\t%lu\r\n",	bc->skipped_accessed);
   765		prt_printf(out, "skipped_lock_fail:\t%lu\r\n",	bc->skipped_lock_fail);
   766	}
   767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
