Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A71841
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAQHx6UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699590249; x=1731126249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OQDecxSytfRF0Pbch1mZA4RWbb9pA5ACqswZ80OSxmk=;
  b=mAQHx6UYuyaMYN70iTD62Ho28VRCU3uIwzJGexfoJrqA5Bzwmsxf2IQq
   U47cqoglAWch1FKr359oMI7yXRqGI6Ho0rMcsncfpx7Zl12IHI5KgSZDl
   lozdH8p5xOPaqOkb73hglUvZPlIyUlukLqOO5GZU+peIVjwStkfkekLMl
   BALQf5ab8PeSzj3T0ghHF6fS4FcdcPAc8yVyOugb2ILmoMw7Fipa0vj0l
   5aq4jSdqwVyav52e5htardHjNGxxfb6/6aDuCvaknXqkWzee9FVDe/hNa
   MgQnIznUmLJ3fmOGGCkHwYOJq32BOTdHEV2ynrgzcVff/QYyB2ULSvE5Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8783406"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="8783406"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 20:24:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1095083134"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="1095083134"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 20:23:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1J3V-0009Q2-20;
	Fri, 10 Nov 2023 04:23:41 +0000
Date: Fri, 10 Nov 2023 12:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] wifi: mac80211: use wiphy locked debugfs helpers
 for agg_status
Message-ID: <202311101232.nfwr9Uqz-lkp@intel.com>
References: <20231109222251.186dcaf8bdcc.Id4251db174cdd42519a5ef19cbb08d7ed8f65397@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109222251.186dcaf8bdcc.Id4251db174cdd42519a5ef19cbb08d7ed8f65397@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main wireless/main linus/master v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/debugfs-fix-automount-d_fsdata-usage/20231110-054024
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231109222251.186dcaf8bdcc.Id4251db174cdd42519a5ef19cbb08d7ed8f65397%40changeid
patch subject: [RFC PATCH 5/6] wifi: mac80211: use wiphy locked debugfs helpers for agg_status
config: arm64-randconfig-002-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101232.nfwr9Uqz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101232.nfwr9Uqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101232.nfwr9Uqz-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mac80211/debugfs_sta.c: In function 'sta_agg_status_read':
>> net/mac80211/debugfs_sta.c:368:15: error: implicit declaration of function 'wiphy_locked_debugfs_read' [-Werror=implicit-function-declaration]
     368 |         ret = wiphy_locked_debugfs_read(wiphy, file, buf, bufsz,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_sta.c: In function 'sta_agg_status_write':
>> net/mac80211/debugfs_sta.c:445:16: error: implicit declaration of function 'wiphy_locked_debugfs_write' [-Werror=implicit-function-declaration]
     445 |         return wiphy_locked_debugfs_write(wiphy, file, _buf, sizeof(_buf),
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/wiphy_locked_debugfs_read +368 net/mac80211/debugfs_sta.c

   355	
   356	static ssize_t sta_agg_status_read(struct file *file, char __user *userbuf,
   357					   size_t count, loff_t *ppos)
   358	{
   359		struct sta_info *sta = file->private_data;
   360		struct wiphy *wiphy = sta->local->hw.wiphy;
   361		size_t bufsz = 71 + IEEE80211_NUM_TIDS * 40;
   362		char *buf = kmalloc(bufsz, GFP_KERNEL);
   363		ssize_t ret;
   364	
   365		if (!buf)
   366			return -ENOMEM;
   367	
 > 368		ret = wiphy_locked_debugfs_read(wiphy, file, buf, bufsz,
   369						userbuf, count, ppos,
   370						sta_agg_status_do_read, sta);
   371		kfree(buf);
   372	
   373		return ret;
   374	}
   375	
   376	static ssize_t sta_agg_status_do_write(struct wiphy *wiphy, struct file *file,
   377					       char *buf, size_t count, void *data)
   378	{
   379		struct sta_info *sta = data;
   380		bool start, tx;
   381		unsigned long tid;
   382		char *pos = buf;
   383		int ret, timeout = 5000;
   384	
   385		buf = strsep(&pos, " ");
   386		if (!buf)
   387			return -EINVAL;
   388	
   389		if (!strcmp(buf, "tx"))
   390			tx = true;
   391		else if (!strcmp(buf, "rx"))
   392			tx = false;
   393		else
   394			return -EINVAL;
   395	
   396		buf = strsep(&pos, " ");
   397		if (!buf)
   398			return -EINVAL;
   399		if (!strcmp(buf, "start")) {
   400			start = true;
   401			if (!tx)
   402				return -EINVAL;
   403		} else if (!strcmp(buf, "stop")) {
   404			start = false;
   405		} else {
   406			return -EINVAL;
   407		}
   408	
   409		buf = strsep(&pos, " ");
   410		if (!buf)
   411			return -EINVAL;
   412		if (sscanf(buf, "timeout=%d", &timeout) == 1) {
   413			buf = strsep(&pos, " ");
   414			if (!buf || !tx || !start)
   415				return -EINVAL;
   416		}
   417	
   418		ret = kstrtoul(buf, 0, &tid);
   419		if (ret || tid >= IEEE80211_NUM_TIDS)
   420			return -EINVAL;
   421	
   422		if (tx) {
   423			if (start)
   424				ret = ieee80211_start_tx_ba_session(&sta->sta, tid,
   425								    timeout);
   426			else
   427				ret = ieee80211_stop_tx_ba_session(&sta->sta, tid);
   428		} else {
   429			__ieee80211_stop_rx_ba_session(sta, tid, WLAN_BACK_RECIPIENT,
   430						       3, true);
   431			ret = 0;
   432		}
   433	
   434		return ret ?: count;
   435	}
   436	
   437	static ssize_t sta_agg_status_write(struct file *file,
   438					    const char __user *userbuf,
   439					    size_t count, loff_t *ppos)
   440	{
   441		struct sta_info *sta = file->private_data;
   442		struct wiphy *wiphy = sta->local->hw.wiphy;
   443		char _buf[26];
   444	
 > 445		return wiphy_locked_debugfs_write(wiphy, file, _buf, sizeof(_buf),
   446						  userbuf, count,
   447						  sta_agg_status_do_write, sta);
   448	}
   449	STA_OPS_RW(agg_status);
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
