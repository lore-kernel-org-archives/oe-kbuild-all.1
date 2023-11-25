Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A979D4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdKFa5rn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700898225; x=1732434225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtXv0qKclj513chkuph9YxouYY1j+jCfAg1+yUbqtf8=;
  b=PdKFa5rnZ1hcqh54bbvBVBqmNQTbRvKNQlOh4r55XjKV2v/X0oDkgR0Q
   WArou/8Lp0P6azaGzJwJFeZ2TvgFQ7z5Y4+IbxGT0IxmoX5ujTatNjsok
   80UhN8T0pmY1r44Q3six79TWlMkxHKc2oBZ8Tn+1kuCouX82Xk146tZCr
   hvEzJ/nNSA5SlmhyU2Khd7vAAkTKajqr3L34sKXVDl+yNr3i8ziA+pKTr
   e+D0wRw7Z7Fz5SlylBc3zSVR4pJNNb3yQ49BHzvbaS9BePdEuP0Al+iO0
   WF6KqfGTumWxFGl1dQN8hfAdM9c2u/KSHCu1D0NnHIs7vhobXXltA1Cus
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392266108"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="392266108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 23:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911623523"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911623523"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 23:43:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6nKB-0003k2-3B;
	Sat, 25 Nov 2023 07:43:35 +0000
Date: Sat, 25 Nov 2023 15:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 5/6] wifi: mac80211: use wiphy locked debugfs helpers
 for agg_status
Message-ID: <202311251529.nJoINTMh-lkp@intel.com>
References: <20231124172522.a5e8901f9976.Id4251db174cdd42519a5ef19cbb08d7ed8f65397@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124172522.a5e8901f9976.Id4251db174cdd42519a5ef19cbb08d7ed8f65397@changeid>

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus wireless-next/main wireless/main linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/debugfs-fix-automount-d_fsdata-usage/20231125-005630
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231124172522.a5e8901f9976.Id4251db174cdd42519a5ef19cbb08d7ed8f65397%40changeid
patch subject: [PATCH v2 5/6] wifi: mac80211: use wiphy locked debugfs helpers for agg_status
config: alpha-kismet-CONFIG_MAC80211_DEBUGFS-CONFIG_ATH9K_STATION_STATISTICS-0-0 (https://download.01.org/0day-ci/archive/20231125/202311251529.nJoINTMh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251529.nJoINTMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251529.nJoINTMh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MAC80211_DEBUGFS when selected by ATH9K_STATION_STATISTICS
   
   WARNING: unmet direct dependencies detected for MAC80211_DEBUGFS
     Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=y] && CFG80211_DEBUGFS [=n]
     Selected by [y]:
     - ATH9K_DEBUGFS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH9K [=y] && DEBUG_FS [=y]
     - ATH9K_STATION_STATISTICS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH9K [=y] && ATH9K_DEBUGFS [=y] && DEBUG_FS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
