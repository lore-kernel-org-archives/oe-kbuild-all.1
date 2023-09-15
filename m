Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E930D01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694807474; x=1726343474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jGlVnan1F6OXndGdwDolDNl3nL4uyeK1URTOll8+Bm0=;
  b=HZmghr0x3LQpRXVfnujqHPSYya5XSao7MkkMhdlndXyBlO4j8FHepatD
   CYcXEQBsIr0FPrl0F6IRttFJPup+VQ4VF+XA60jTgeFs1YWx292iGlmHA
   hLQNM55HVrMT4m8R2alupezHYWbeeK72KEp5babBzZyMMWpIlVLluJ6oG
   X5hbjDThvPx2peYc2bOda2u0dpd7nRe+/sMNJ3j0qA8fNmPFl1lAYAqgX
   ZeCGnkQGrMb3aSd7Kjciq1p9yd7/Kb2eQXGN7S3Py3XJRfM82ob7TvxTd
   GSJEYNmXZdofdiVFlrsKCAVOnuPmSGGQ8Otx+QMDNbIP8heLwxl3XYo2U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364381159"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="364381159"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 12:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1075888780"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="1075888780"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 12:51:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhEqC-0003La-31;
	Fri, 15 Sep 2023 19:51:07 +0000
Date: Sat, 16 Sep 2023 03:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Thornber <ejt@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dm-devel@redhat.com,
	Mike Snitzer <snitzer@kernel.org>
Subject: [device-mapper-dm:for-next 2/4]
 drivers/md/persistent-data/dm-extent-allocator.c:373: undefined reference to
 `__udivdi3'
Message-ID: <202309160312.k1ou4uxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
head:   785f3bb19d40050d0f40c07cbe6345e361acdcae
commit: b97bcee4b9999c9f5aadc06317ade18c5cbe37f6 [2/4] dm persistent data: Introduce extent allocator
config: i386-randconfig-013-20230915 (https://download.01.org/0day-ci/archive/20230916/202309160312.k1ou4uxF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160312.k1ou4uxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160312.k1ou4uxF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/md/persistent-data/dm-extent-allocator.o: in function `__select_child':
>> drivers/md/persistent-data/dm-extent-allocator.c:373: undefined reference to `__udivdi3'
>> ld: drivers/md/persistent-data/dm-extent-allocator.c:374: undefined reference to `__udivdi3'
>> ld: drivers/md/persistent-data/dm-extent-allocator.c:374: undefined reference to `__udivdi3'
>> ld: drivers/md/persistent-data/dm-extent-allocator.c:373: undefined reference to `__udivdi3'


vim +373 drivers/md/persistent-data/dm-extent-allocator.c

   359	
   360	/**
   361	 * __select_child - Selects the best child node to allocate from in the extent allocator.
   362	 * @ea: Pointer to the extent allocator.
   363	 * @left: left child node.
   364	 * @right: right child node.
   365	 *
   366	 * The best child is the one with the highest ratio of free blocks to holders. If the
   367	 * ratios are equal, the left child is preferred.
   368	 */
   369	static struct node **__select_child(struct dm_extent_allocator *ea, struct node **left, struct node **right)
   370	{
   371		uint64_t left_score, right_score;
   372	
 > 373		left_score = __nr_free_blocks(*left) / ((*left)->nr_holders + 1);
 > 374		right_score = __nr_free_blocks(*right) / ((*right)->nr_holders + 1);
   375	
   376		if (left_score >= right_score)
   377			return left;
   378		else
   379			return right;
   380	}
   381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
