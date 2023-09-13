Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763957F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 00:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694563759; x=1726099759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChlckRbWbRy80tIrWWC4IFv+F0VZNViog1KMF8jLLho=;
  b=mcQ/TipsueKH708BrB76BbcAKW9ZDF9+bmquGIfwZRGt4ibt8IjyQtyM
   iKptsd7Ak8HlbnGdYdr2DqDPymAkPp/2wHLF3hVLDeVoF+U45PnhpZFHJ
   8HhlpWJuc58dct0yPwSXS49qsqPxxzEKbjsaFmhbHploKMn0NnOi9Yt51
   x/PXhyx7kFRTRNNnTv3+ijpq7ettU6CKZ+fF6uSISav32ZXsXE3ez/+4o
   eRSsSBIlHygDNu5003QDt1YJpMPIxfzzlXxaBIGjiDKD9Z1hqAWX36n2Z
   y0OY4TGM7ZshYXOdoVXqpUllzOduQMuZVLTuN11tnNQMBrC4ssW0GHm4q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381228231"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="381228231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 17:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="773227676"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="773227676"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Sep 2023 17:09:17 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgDRT-0000Ur-0Y;
	Wed, 13 Sep 2023 00:09:15 +0000
Date: Wed, 13 Sep 2023 08:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3857/4552] htmldocs:
 ./include/net/cfg80211.h:5891: warning: expecting prototype for
 wiphy_delayed work_flush(). Prototype was for wiphy_delayed_work_flush()
 instead
Message-ID: <202309130803.vjwpbJWy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 56cfb8ce1f7f6c4e5ca571a2ec0880e131cd0311 [3857/4552] wifi: cfg80211: add flush functions for wiphy work
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309130803.vjwpbJWy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130803.vjwpbJWy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/net/cfg80211.h:5891: warning: expecting prototype for wiphy_delayed work_flush(). Prototype was for wiphy_delayed_work_flush() instead

vim +5891 ./include/net/cfg80211.h

  5853	
  5854	/**
  5855	 * wiphy_delayed_work_queue - queue delayed work for the wiphy
  5856	 * @wiphy: the wiphy to queue for
  5857	 * @dwork: the delayable worker
  5858	 * @delay: number of jiffies to wait before queueing
  5859	 *
  5860	 * This is useful for work that must be done asynchronously, and work
  5861	 * queued here has the special property that the wiphy mutex will be
  5862	 * held as if wiphy_lock() was called, and that it cannot be running
  5863	 * after wiphy_lock() was called. Therefore, wiphy_cancel_work() can
  5864	 * use just cancel_work() instead of cancel_work_sync(), it requires
  5865	 * being in a section protected by wiphy_lock().
  5866	 */
  5867	void wiphy_delayed_work_queue(struct wiphy *wiphy,
  5868				      struct wiphy_delayed_work *dwork,
  5869				      unsigned long delay);
  5870	
  5871	/**
  5872	 * wiphy_delayed_work_cancel - cancel previously queued delayed work
  5873	 * @wiphy: the wiphy, for debug purposes
  5874	 * @dwork: the delayed work to cancel
  5875	 *
  5876	 * Cancel the work *without* waiting for it, this assumes being
  5877	 * called under the wiphy mutex acquired by wiphy_lock().
  5878	 */
  5879	void wiphy_delayed_work_cancel(struct wiphy *wiphy,
  5880				       struct wiphy_delayed_work *dwork);
  5881	
  5882	/**
  5883	 * wiphy_delayed work_flush - flush previously queued delayed work
  5884	 * @wiphy: the wiphy, for debug purposes
  5885	 * @work: the work to flush
  5886	 *
  5887	 * Flush the work (i.e. run it if pending). This must be called
  5888	 * under the wiphy mutex acquired by wiphy_lock().
  5889	 */
  5890	void wiphy_delayed_work_flush(struct wiphy *wiphy,
> 5891				      struct wiphy_delayed_work *dwork);
  5892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
