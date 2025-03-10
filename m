Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD11225760
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597355; cv=none; b=K8T3Z/OQQe5bEa7qVYgMWkOhn/rUF+O17NfQ5vdfC/LyUy87cgROIDkXHgf4FZnLA4dihFyQnHxalBjmUVIk2ymadZ1Ed2qh2zYTDiMVnYbqDDeJ++h5JLNR2tCOiNruEGsLXT6NArgrUBemaUwkkPJ0n1C4OYF33ZDxiuEldtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597355; c=relaxed/simple;
	bh=Q+K0C5mQJtkx3m9DfydMVq2XOYiX5pKlXrhjf91cx0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfKsjKaJtgOut4q6L6Fk2Mx1hplUOhKwCJMTZ9EyUhwP1Z67ko5NKEWHYtPCiEthukD80628FLg3j7sTclDynJ8DbhtIQ+6w9NpFQCzvEcX/wUnY6Ld8Z3LMdeijTdBb2WBskWUwuomqv9R3ptz4W69aWFDgHB7SSGXwSW7WhHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7P2q+U/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7P2q+U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741597354; x=1773133354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+K0C5mQJtkx3m9DfydMVq2XOYiX5pKlXrhjf91cx0M=;
  b=h7P2q+U/scQYbKr7fP0jrwD0om3KyQeVKVPgsm4l6ss5ueCn0xucOdCr
   /O58eb+RPV3WO257iQomeKxS4r3NyZwznHd4RsqH+Cknuz2ySF+a59Mom
   ldWPnGRhYG5Le9gxbG8+Bld6OBM20caEQTAAZKw33sZ2wCN5DfzUZFI6G
   0ECqRRwWwImU+zTR+zXrYz1dD86/9JkhTg7dt9edSelh+GNq8+USowNlX
   WIwigvkUe2kzi07I9pkLUWnJsK+7U9XwAp1A/5fLBR/xC8ZULQ54FUMzZ
   PWuI1vibjT5Mib4TUxhlgJPvslXmvEy71KQI9n9LLdyPAEnnMOqsux96X
   Q==;
X-CSE-ConnectionGUID: m/yMX06sQ4SOQs4VbY3F5Q==
X-CSE-MsgGUID: 0rUeJzedQvuKjDEMMDMxAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46366705"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46366705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 02:02:33 -0700
X-CSE-ConnectionGUID: l7i24kk6QB27r1hXlILafA==
X-CSE-MsgGUID: VMqf8uvkTwKn79u38FxOeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119769762"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2025 02:02:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trZ1p-00041Q-1S;
	Mon, 10 Mar 2025 09:02:29 +0000
Date: Mon, 10 Mar 2025 17:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 145/154] fs/bcachefs/ec.c:2009:16:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202503101658.AuqTVsK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   490615a672451c640b42c31e1b900c6450a5e6d2
commit: d7835b0d27d1934056936bec5657ba4d3c071ef6 [145/154] bcachefs: get_existing_stripe() uses new stripe lru
config: loongarch-randconfig-r121-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101658.AuqTVsK5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250310/202503101658.AuqTVsK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101658.AuqTVsK5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/ec.c: note: in included file:
   fs/bcachefs/bcachefs.h:1007:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/ec.c:2009:16: sparse: sparse: restricted __le16 degrades to integer

vim +2009 fs/bcachefs/ec.c

  1983	
  1984	static int __get_existing_stripe(struct btree_trans *trans,
  1985					 struct ec_stripe_head *head,
  1986					 struct ec_stripe_buf *stripe,
  1987					 u64 idx)
  1988	{
  1989		struct bch_fs *c = trans->c;
  1990	
  1991		struct btree_iter iter;
  1992		struct bkey_s_c k = bch2_bkey_get_iter(trans, &iter,
  1993						  BTREE_ID_stripes, POS(0, idx), 0);
  1994		int ret = bkey_err(k);
  1995		if (ret)
  1996			goto err;
  1997	
  1998		/* We expect write buffer races here */
  1999		if (k.k->type != KEY_TYPE_stripe)
  2000			goto out;
  2001	
  2002		struct bkey_s_c_stripe s = bkey_s_c_to_stripe(k);
  2003		if (stripe_lru_pos(s.v) <= 1)
  2004			goto out;
  2005	
  2006		if (s.v->disk_label	== head->disk_label &&
  2007		    s.v->algorithm	== head->algo &&
  2008		    s.v->nr_redundant	== head->redundancy &&
> 2009		    s.v->sectors	== head->blocksize &&
  2010		    bch2_try_open_stripe(c, head->s, idx)) {
  2011			bkey_reassemble(&stripe->key, k);
  2012			ret = 1;
  2013		}
  2014	out:
  2015		bch2_set_btree_iter_dontneed(&iter);
  2016	err:
  2017		bch2_trans_iter_exit(trans, &iter);
  2018		return ret;
  2019	}
  2020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
