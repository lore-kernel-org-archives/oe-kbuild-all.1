Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973BB224C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300843; cv=none; b=D5bwLjymOnzgBKlCvKiqbgt7n13a5edA25sXVxT33n4ZHP2V5lvg1tOymDEd0znpAJJ4eeoINJIpKtsr0/h84a9mJ01H35KfjDrFKvO30VJI9ZASZV5EasfvTve5O73/q6pSwFGjKi7C42K1N8IIoJGLibS7MObYIMuWsbwwKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300843; c=relaxed/simple;
	bh=hpr1N9GbCxWC3VtJd+lWJRgH2xHLkPn4r+Jplnxj7NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8WzB5QcZAgKvJ30OUsZcYvtdrEPlT7km+j3WjbvHyb3TdpVS4cRw2Ev2JcYuqTpcAIJ6k0xswJgCnnlX81sU7XIK/LqvP1blr5U4YEA1JJhnl4m5leBtANLX/eFj7n+/LL4P/tJtUab9+muEQT2GaCG/St9xv/9tK34Kt08Oi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbvEMbAf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbvEMbAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706300841; x=1737836841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpr1N9GbCxWC3VtJd+lWJRgH2xHLkPn4r+Jplnxj7NA=;
  b=WbvEMbAffi2A37aSg7yCdlgtFqzoexmZ2zC/adks1QVAejjf7sV8Owwp
   4suNEZLtwfPaWDZA/R+OWJbDsdY1xXhVTm2f5bbU4lRdmgG+p6/EnbL1K
   ZsjiaTNWPDq4Z1ExtIGBRqFbkYsKtwm3ysaJWRSscFgboLxz5KN6qCfgQ
   h3bvL0wRh2/3QC6/652PCrM49wSoCK1IZodIqDFZDO27wtv7UF3DtU07A
   O+hWTndRBapIOdMT8yp0AKWc4t928bWQIxT8DBcMXb9xrBr2EwXMt4y2u
   THiBPb3YpgW9jkbgRphvAUc7UZ8Fj96MfOraVgyeqrxCBtlF2iT3DmL/O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9244232"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9244232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 12:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="910432939"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="910432939"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2024 12:27:19 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTSnF-0001K6-0F;
	Fri, 26 Jan 2024 20:27:17 +0000
Date: Sat, 27 Jan 2024 04:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfile-diet 1/21] mm/workingset.c:617:6: warning: no
 previous prototype for 'workingset_update_node'
Message-ID: <202401270452.qRvhX3Hd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfile-diet
head:   f058c95e182b4fd3eb0a057c91b8578d6f73e8e0
commit: b8a4ddf828215462979cbd7e2a7d8165eac55d0e [1/21] mm: move mapping_set_update out of <linux/swap.h>
config: i386-randconfig-012-20240126 (https://download.01.org/0day-ci/archive/20240127/202401270452.qRvhX3Hd-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270452.qRvhX3Hd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270452.qRvhX3Hd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:617:6: warning: no previous prototype for 'workingset_update_node' [-Wmissing-prototypes]
     617 | void workingset_update_node(struct xa_node *node)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/workingset_update_node +617 mm/workingset.c

14b468791fa955 Johannes Weiner           2016-12-12  616  
a97e7904c08063 Matthew Wilcox            2017-11-24 @617  void workingset_update_node(struct xa_node *node)
14b468791fa955 Johannes Weiner           2016-12-12  618  {
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  619  	struct address_space *mapping;
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  620  
14b468791fa955 Johannes Weiner           2016-12-12  621  	/*
14b468791fa955 Johannes Weiner           2016-12-12  622  	 * Track non-empty nodes that contain only shadow entries;
14b468791fa955 Johannes Weiner           2016-12-12  623  	 * unlink those that contain pages or are being freed.
14b468791fa955 Johannes Weiner           2016-12-12  624  	 *
14b468791fa955 Johannes Weiner           2016-12-12  625  	 * Avoid acquiring the list_lru lock when the nodes are
14b468791fa955 Johannes Weiner           2016-12-12  626  	 * already where they should be. The list_empty() test is safe
b93b016313b3ba Matthew Wilcox            2018-04-10  627  	 * as node->private_list is protected by the i_pages lock.
14b468791fa955 Johannes Weiner           2016-12-12  628  	 */
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  629  	mapping = container_of(node->array, struct address_space, i_pages);
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  630  	lockdep_assert_held(&mapping->i_pages.xa_lock);
68d48e6a2df575 Johannes Weiner           2018-10-26  631  
01959dfe771c68 Matthew Wilcox            2017-11-09  632  	if (node->count && node->count == node->nr_values) {
68d48e6a2df575 Johannes Weiner           2018-10-26  633  		if (list_empty(&node->private_list)) {
0a97c01cd20bb9 Nhat Pham                 2023-11-30  634  			list_lru_add_obj(&shadow_nodes, &node->private_list);
da3ceeff923e3b Muchun Song               2020-12-14  635  			__inc_lruvec_kmem_state(node, WORKINGSET_NODES);
68d48e6a2df575 Johannes Weiner           2018-10-26  636  		}
14b468791fa955 Johannes Weiner           2016-12-12  637  	} else {
68d48e6a2df575 Johannes Weiner           2018-10-26  638  		if (!list_empty(&node->private_list)) {
0a97c01cd20bb9 Nhat Pham                 2023-11-30  639  			list_lru_del_obj(&shadow_nodes, &node->private_list);
da3ceeff923e3b Muchun Song               2020-12-14  640  			__dec_lruvec_kmem_state(node, WORKINGSET_NODES);
68d48e6a2df575 Johannes Weiner           2018-10-26  641  		}
14b468791fa955 Johannes Weiner           2016-12-12  642  	}
14b468791fa955 Johannes Weiner           2016-12-12  643  }
449dd6984d0e47 Johannes Weiner           2014-04-03  644  

:::::: The code at line 617 was first introduced by commit
:::::: a97e7904c0806309fd77103005bb7820c3f1c5e4 mm: Convert workingset to XArray

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
