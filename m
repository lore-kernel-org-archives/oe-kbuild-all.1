Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B326A1B4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779569; cv=none; b=p62ocP7VTFcb+03sg+n6PDig+RnIiTLI6yP0oNzGMojjK6fVs6TCb7NxZuvKgvZ+AxhYcjXHI+pH/CFJ9wFsPsCF6haZgCfppBvF36LVaTKqgE1a1qavlASdylG7DKgnMq3a4KNPX5M1m9E+HIORH8IwyzR36l6WijwsH4kPuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779569; c=relaxed/simple;
	bh=7+m9QINV713/kifzS0hZ+oo4+XIqH2QKZTLtVX8HyFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N09L4BNzwfe3F5TqKBTnomupe/Re6TWTNuderPGO36ns31ei/BaX6GBAuZTKg29FiMS1rTDPC90suP7EeASN8vhco+GXbspFsB1m1JN+oFwqwPHvwkZIT0i3HkzgovDhE3erChLOMznoxR+Wb0DIuHkQpCszxmgQ1Hze5xrNLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+b/b8n7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+b/b8n7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746779568; x=1778315568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+m9QINV713/kifzS0hZ+oo4+XIqH2QKZTLtVX8HyFc=;
  b=E+b/b8n7f42jlehWZjq59OEQpMXj4kw85HBc74mNVg6bb4HCO01rwG2H
   agM4JOI9x8+R4KS13iO2nKwFQzchKcIv27PG3WKwpa70g+HG6U8eFV6RQ
   ug/a7kb7XyjA/wdJ8s6T9mr4KsbFF6zlVelwag5lSi01Sy9bFYg/kQ0U0
   8yyN4KIf182hhi+suAyqQ2BOOCl7RVsnXWzHXORKiOP9yPbzJFj4A+8NE
   Fr+UafDV4vP8tz/dShg0zOuBqmAGBdCF6hEXN8sW6rnc9DqvEktcMt+T3
   QzY8sKyktQcwSInis1EzzKAZ7uakxRURd7mnySJJzjHSKp3ewihi59I49
   Q==;
X-CSE-ConnectionGUID: 5FcSNZgtTOCzT1EtQjOhBQ==
X-CSE-MsgGUID: KJT3m23uQRq859m7D+RkyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58815565"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="58815565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:32:47 -0700
X-CSE-ConnectionGUID: scReZudrQTaWFm1pnUTemg==
X-CSE-MsgGUID: 7DBqkb6fSKW2+EpCR8cXKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="137076902"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2025 01:32:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJ9v-000BpR-1G;
	Fri, 09 May 2025 08:32:43 +0000
Date: Fri, 9 May 2025 16:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/9] fs/f2fs/node.c:313:6: error: conflicting
 types for 'f2fs_in_warm_node_list'; have 'bool(struct f2fs_sb_info *, struct
 folio *)' {aka '_Bool(struct f2fs_sb_info *, struct folio *)'}
Message-ID: <202505091600.SSwjiap4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   56f0d9dcfebca8e7a862599e19fa2f462622da46
commit: a3963f90df1f719ba20b77f0aa1bdb29c673809c [3/9] f2fs: introduce is_{meta,node}_folio
config: i386-buildonly-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091600.SSwjiap4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091600.SSwjiap4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091600.SSwjiap4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/node.c:313:6: error: conflicting types for 'f2fs_in_warm_node_list'; have 'bool(struct f2fs_sb_info *, struct folio *)' {aka '_Bool(struct f2fs_sb_info *, struct folio *)'}
     313 | bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/f2fs/node.c:16:
   fs/f2fs/f2fs.h:3750:6: note: previous declaration of 'f2fs_in_warm_node_list' with type 'bool(struct f2fs_sb_info *, const struct folio *)' {aka '_Bool(struct f2fs_sb_info *, const struct folio *)'}
    3750 | bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +313 fs/f2fs/node.c

   312	
 > 313	bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
   314	{
   315		return is_node_folio(folio) && IS_DNODE(&folio->page) &&
   316						is_cold_node(&folio->page);
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
