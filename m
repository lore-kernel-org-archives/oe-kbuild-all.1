Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA181FB53
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692825191; x=1724361191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fx6XHiDbKR09aJ2pIBVrkeck4ZiQZxqTBfit32JbjbU=;
  b=T2IHjLQjM6yXAwYl93XJrHtNSJy1z3ilb4WXYz9w3yHI/CRxBNTBaxoY
   dMxRU2ZCMVBjAEjtaaOgOA8Mf8+SQUHybat5dowIH2vQsgMWc67ApZ7uU
   CMx8XDFHBRXnKz5jRJP3j1O/wUyPjDGfWe27p7V6QpQduJh0nXkdekdjh
   Sq4JU9dR/lwWCu30VzPYxuUnhKO1sbKLT9QkjeG6gRBUJdL+vih/T+t1+
   +2R2sZMxrnZmW5Td+pMr31duw7KMmQkwP/uhv6iFTRkY7aicOCTTUg2YK
   JHamiPpfOIKEw3LVHDw+YuJ1EI/NmvxnSBt91KLVSpifl8r6DUBimxZVI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378026737"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378026737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 14:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736804045"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="736804045"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2023 14:13:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYvA2-0001Vo-0T;
	Wed, 23 Aug 2023 21:13:06 +0000
Date: Thu, 24 Aug 2023 05:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Wen Gong <quic_wgong@quicinc.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH] Revert "mac80211: add parse regulatory info in 6 GHz
 operation information"
Message-ID: <202308240547.O8ZxrrXI-lkp@intel.com>
References: <20230821105903.7482379cde47.Ib72645d02fadc24b520db118abd82e861c87316e@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821105903.7482379cde47.Ib72645d02fadc24b520db118abd82e861c87316e@changeid>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/Revert-mac80211-add-parse-regulatory-info-in-6-GHz-operation-information/20230821-170019
base:   linus/master
patch link:    https://lore.kernel.org/r/20230821105903.7482379cde47.Ib72645d02fadc24b520db118abd82e861c87316e%40changeid
patch subject: [PATCH] Revert "mac80211: add parse regulatory info in 6 GHz operation information"
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308240547.O8ZxrrXI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240547.O8ZxrrXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240547.O8ZxrrXI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtw89/regd.c: In function 'rtw89_reg_6ghz_power_recalc':
>> drivers/net/wireless/realtek/rtw89/regd.c:514:39: error: 'struct ieee80211_bss_conf' has no member named 'power_type'; did you mean 'txpower_type'?
     514 |                 switch (vif->bss_conf.power_type) {
         |                                       ^~~~~~~~~~
         |                                       txpower_type


vim +514 drivers/net/wireless/realtek/rtw89/regd.c

f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  505  
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  506  void rtw89_reg_6ghz_power_recalc(struct rtw89_dev *rtwdev,
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  507  				 struct rtw89_vif *rtwvif, bool active)
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  508  {
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  509  	struct ieee80211_vif *vif = rtwvif_to_vif(rtwvif);
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  510  
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  511  	lockdep_assert_held(&rtwdev->mutex);
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  512  
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02  513  	if (active) {
f6baa1d3d5703f Zong-Zhe Yang 2023-06-02 @514  		switch (vif->bss_conf.power_type) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
