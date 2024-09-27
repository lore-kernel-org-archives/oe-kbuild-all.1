Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DBF172BB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727418124; cv=none; b=sxH9oueO/Nr6EJVLniUmZS3qIvywX1g0/lT3BP0GXaXPKuMYTZvdB0Ufeq3FnxlpchhEJk43b1nhKa9n6pFhGEhCSV0SouidIDS+FoA+dxQc6KKLZ51Mrrqbn0iuzm3pM7rxPZTQD6PYJqMBKptLlObOFkTSg5SjLPJQfRpWkOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727418124; c=relaxed/simple;
	bh=N7AQAWV0oNToEj6LLNMjkJMheYx5xneKbb0FFnodSzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oYXiKbWPyxlV6qlBHtD5ZW7VK1MYSZDjyj0UWQAIB5q4J8fyTC9+Pfd4sWF1ocV/rjrhX5dlf9qpQS6UusssegIXPaZRdhXfX9LMxoVi5G0QgA6YcfH2QWgwlOUbUuzKfZw2YleReBY0Wy3OGIuoyt5lpTxWs2DO1ctjeBG7dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKdGazfP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKdGazfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727418123; x=1758954123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N7AQAWV0oNToEj6LLNMjkJMheYx5xneKbb0FFnodSzg=;
  b=kKdGazfPQ1El1vAsebBPZtvC5QSMjjcW7cEx+tX6NEPyGMkJB05gFq6R
   fFVsK3bGmX/DpsQEFyin0iSoJMkT85ijy+xw943XJ8+xwEeYCi4rDRwSx
   ODxT+Q2B+5vJyF7St8NF5ueLHyvk+PzOlKSbdQpH5HRef8UZmcAkjTtHs
   KL6OSGWVcC1Kxh9h6sPot3EqHiJldq1Y6ILIZ/SpfWStq6IoFDmrqGmAv
   YEj69KFFrl2S6XE2TuhJKm7juhEogX9qRCyJcG0q+Jrrt40R7SSLo+eco
   mKy3oiuh/88D1xRbfocyQnL8eMg1wSXidL8JVF2Lo7VCPC/YfeIuVSRlW
   g==;
X-CSE-ConnectionGUID: TAsM+lmmTbOURtzsV7Tw1w==
X-CSE-MsgGUID: uh+EeIMHSO+kQHO5hclJAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37132052"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37132052"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 23:22:02 -0700
X-CSE-ConnectionGUID: LuyuWrvESuytHqGEfv3ZmA==
X-CSE-MsgGUID: UFDtpcMsTuOqB5vVMt3/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="95771097"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 23:22:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su4MZ-000LbL-00;
	Fri, 27 Sep 2024 06:21:59 +0000
Date: Fri, 27 Sep 2024 14:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 189/1001]
 drivers/media/mc/mc-entity.c:346: warning: expecting prototype for
 media_entity_graph_walk_init(). Prototype was for media_graph_walk_init()
 instead
Message-ID: <202409271441.o3jov42v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: ffcd87653ec43ef1f8c7de5718e5f8da1026d48d [189/1001] media: entity: Add media_entity_has_route() function
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240927/202409271441.o3jov42v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271441.o3jov42v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271441.o3jov42v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:346: warning: expecting prototype for media_entity_graph_walk_init(). Prototype was for media_graph_walk_init() instead


vim +346 drivers/media/mc/mc-entity.c

ffcd87653ec43e drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  332  
ffcd87653ec43e drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  333  /**
ffcd87653ec43e drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  334   * media_entity_graph_walk_init - Allocate resources for graph walk
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  335   * @graph: Media graph structure that will be used to walk the graph
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  336   * @mdev: Media device
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  337   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  338   * Reserve resources for graph walk in media device's current
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  339   * state. The memory must be released using
25ba644e3bfc96 drivers/media/mc/mc-entity.c Miaoqian Lin     2022-12-17  340   * media_graph_walk_cleanup().
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  341   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  342   * Returns error on failure, zero on success.
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  343   */
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  344  __must_check int media_graph_walk_init(
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  345  	struct media_graph *graph, struct media_device *mdev)
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16 @346  {
29d8da02d13020 drivers/media/media-entity.c Sakari Ailus     2015-12-16  347  	return media_entity_enum_init(&graph->ent_enum, mdev);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  348  }
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  349  EXPORT_SYMBOL_GPL(media_graph_walk_init);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  350  

:::::: The code at line 346 was first introduced by commit
:::::: e03d220336dd69292370393f5eee98ac17eda308 [media] media: Amend media graph walk API by init and cleanup functions

:::::: TO: Sakari Ailus <sakari.ailus@iki.fi>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
