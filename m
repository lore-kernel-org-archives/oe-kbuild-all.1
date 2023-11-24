Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A611DDD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSpKyn/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826423; x=1732362423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y0r8QwRxm5H9/X1JQK8xgcChTVGuHN2Q4QFIEaCRGPI=;
  b=GSpKyn/6gg+4v/0Ygg6MomhvyKwSgByO13G2kENKmH93cgseymngR/Z+
   8mIgeShXhxOz1yOId6P99P1d59+mz++VPnYs4ii3xI51+fyi5AkTlsRRh
   /9CsNYprW+Y6RDrxYjEDykPXY+K4uiJ3yh9wPVUf04JTY0PcbbxgBIQzT
   FxZ1T6QBT6ZjXwGPyuhqnpo0wXXiIcilgzRN2OMkXKCTC48BNjBDdgVLA
   lELOb9qmkjus2rq8aLeiss/4FADw6UnpfPO1XuRdTFBdFL30LJdXIrSOm
   oxSN7Qs3Enf0PEZVf4cP8mq3JodYNYqdjpCOKuwVKvjIEW+8Jvqa2sNYE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423547658"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423547658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="9116186"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2023 03:46:52 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Ue1-0002hk-06;
	Fri, 24 Nov 2023 11:46:49 +0000
Date: Fri, 24 Nov 2023 19:46:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH 2/7] mm: shrinker: Add a .to_text() method for shrinkers
Message-ID: <202311241457.d18KlTLu-lkp@intel.com>
References: <20231122232515.177833-3-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122232515.177833-3-kent.overstreet@linux.dev>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/seq_buf-seq_buf_human_readable_u64/20231123-111937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231122232515.177833-3-kent.overstreet%40linux.dev
patch subject: [PATCH 2/7] mm: shrinker: Add a .to_text() method for shrinkers
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231124/202311241457.d18KlTLu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241457.d18KlTLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241457.d18KlTLu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:832: warning: Function parameter or member 'out' not described in 'shrinkers_to_text'


vim +832 mm/shrinker.c

   824	
   825	/**
   826	 * shrinkers_to_text - Report on shrinkers with highest usage
   827	 *
   828	 * This reports on the top 10 shrinkers, by object counts, in sorted order:
   829	 * intended to be used for OOM reporting.
   830	 */
   831	void shrinkers_to_text(struct seq_buf *out)
 > 832	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
