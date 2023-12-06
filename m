Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2829DA3C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7v01eXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701822606; x=1733358606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YgoQtOELF5U4OWPViW6jdVegrIHcOMZK442I1HFX9WE=;
  b=e7v01eXffh453jIZWMUjOqKWtWGp1JX+2215VuHpI3Y/mVD6fdW28rhD
   NGTA1k3B7j7+vz1steJ0QTrF3P+3nz+AO/03JMvsLRw1oI6ZKnzWqC12H
   tcTzfwo5DY61hZPU24CLbu2DS4tGgfvj8oN8NC1vEsPNXyhK6fQxMtDhJ
   tP4tAlcmpWNmPdYGj2V1UiPczliSL45ROsonIC/B095UvKH0q/LaCm4Dj
   +YQJD685qA0Jj8Lm+0b8jJG5kSTOY3y706iBX9S7ydUFmLjz38/4ci/xB
   VcN8yn4yX6Xl/fBEtJyWcVISbKrNMAEgrgvET44kvzhwSSxdOv2tSvfIF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374163843"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="374163843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 16:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771112926"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="771112926"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 16:30:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAfnd-0009x6-28;
	Wed, 06 Dec 2023 00:30:01 +0000
Date: Wed, 6 Dec 2023 08:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:carved-up-__dentry_kill 22/28] fs/dcache.c:1101:33: error:
 'dentry' undeclared
Message-ID: <202312060802.HxDqIoDc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git carved-up-__dentry_kill
head:   20f7d1936e8a2859fee51273c8ffadcca4304968
commit: c73bce0494d44e0d26ec351106558e4408cf1cd9 [22/28] step 3: have __dentry_kill() return the parent
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20231206/202312060802.HxDqIoDc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060802.HxDqIoDc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060802.HxDqIoDc-lkp@intel.com/

Note: the viro-vfs/carved-up-__dentry_kill HEAD 20f7d1936e8a2859fee51273c8ffadcca4304968 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/dcache.c: In function 'shrink_kill':
>> fs/dcache.c:1101:33: error: 'dentry' undeclared (first use in this function)
    1101 |         struct dentry *parent = dentry->d_parent;
         |                                 ^~~~~~
   fs/dcache.c:1101:33: note: each undeclared identifier is reported only once for each function it appears in
>> fs/dcache.c:1102:33: error: expected expression before 'if'
    1102 |         if (parent != victim && if (!--parent->d_lockref.count)
         |                                 ^~
>> fs/dcache.c:1107:1: error: expected expression before '}' token
    1107 | }
         | ^


vim +/dentry +1101 fs/dcache.c

  1098	
  1099	static inline void shrink_kill(struct dentry *victim, struct list_head *list)
  1100	{
> 1101		struct dentry *parent = dentry->d_parent;
> 1102		if (parent != victim && if (!--parent->d_lockref.count)
  1103			to_shrink_list(parent, list);
  1104		parent = __dentry_kill(dentry);
  1105		if (parent)
  1106			spin_unlock(&parent->d_lock);
> 1107	}
  1108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
