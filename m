Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945D11CB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716107013; cv=none; b=EZWJbx4XpZWFUeHqHTSksPLUH3Sik/Kxk0WwVA4gsD66/xxfMXU8Pb59e/0oKOMElRmh7yDoak/xd8MUU6mxV9smrpXuA8ziCCDYydG0SK4bLvUjLAcwVmtn5V9pPsorWmG8TsYBf4P5V3xI0ezQsPtptJ2FwXpGwq12jmHRpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716107013; c=relaxed/simple;
	bh=ODGaX1JCrqjJ9K1HEjp/Nj6828y2clJs6IKjR6JwxaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE8AYzCg9W5ss9inLHbrci0b6YPzWOPtbavdqU1WsI9AWX3JLZlEshR0KgZ+tJPDWCsbtZEhrEbGUuAsYpLj/EjXykbxikBhRhZsTPJBfCzr8wGRxAOJ6uZpKpiHghPXd+gwdfcwe0L+cVaKolwr3Lnb3Jq4/BqJBk4s+RVOv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dal/7WRe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dal/7WRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716107011; x=1747643011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ODGaX1JCrqjJ9K1HEjp/Nj6828y2clJs6IKjR6JwxaI=;
  b=Dal/7WReb9FAoD2gjpOvQP1VwPScrihhPbd8MsvyS5lvzC49fg0CA0ek
   5lnV0zZvIEJgPWzDQceF6hExu4hVRtXyULp5YFma5LNeTo1phx0Assjpt
   utx2XyxS6M3hJuE7rMYde+ULivArPXGEPzqwXI8fs4ryk+oAjvKXQERz5
   FDzr8YwNw3E0/y0keewONf/n4DX+wjUfXJg3G1JmzOkW5I0RwIlUdpRJp
   UVhRjRgeGwsk4TNFRQebzdK+ELRggNVahim3qk5InCwNS7SOE+awMGU73
   IbuHt7bvM2SxZZOnUyEipVGgkr88q+S7bpReqSuEJA8sfyXvWvfDJpVrT
   Q==;
X-CSE-ConnectionGUID: k/hpXcFzTPKT9L3JQi1A+A==
X-CSE-MsgGUID: mtgg88BnRu6tM5wY1WiK0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="16036211"
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="16036211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 01:23:30 -0700
X-CSE-ConnectionGUID: un3EiAtwQnSLZynH57rRqg==
X-CSE-MsgGUID: pZB8f54LTXWE1nx/2Ku0Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,172,1712646000"; 
   d="scan'208";a="32215501"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2024 01:23:28 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8bn7-0003HY-28;
	Sun, 19 May 2024 08:21:36 +0000
Date: Sun, 19 May 2024 16:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 RFC] wifi: cfg80211: Refactor interface combination
 input parameter
Message-ID: <202405191509.jR6xGgJX-lkp@intel.com>
References: <20240518055316.3102746-1-quic_periyasa@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518055316.3102746-1-quic_periyasa@quicinc.com>

Hi Karthikeyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on a17b9f590f6ec2b9f1b12b1db3bf1d181de6b272]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-cfg80211-Refactor-interface-combination-input-parameter/20240518-135455
base:   a17b9f590f6ec2b9f1b12b1db3bf1d181de6b272
patch link:    https://lore.kernel.org/r/20240518055316.3102746-1-quic_periyasa%40quicinc.com
patch subject: [PATCH v2 RFC] wifi: cfg80211: Refactor interface combination input parameter
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405191509.jR6xGgJX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405191509.jR6xGgJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405191509.jR6xGgJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/quantenna/qtnfmac/cfg80211.c: In function 'qtnf_validate_iface_combinations':
>> drivers/net/wireless/quantenna/qtnfmac/cfg80211.c:133:1: warning: the frame size of 1528 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     133 | }
         | ^


vim +133 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c

98f44cb0655cbe Igor Mitsyanko         2017-05-11   72  
01efff526235a5 Sergey Matyukevich     2018-01-22   73  static int
01efff526235a5 Sergey Matyukevich     2018-01-22   74  qtnf_validate_iface_combinations(struct wiphy *wiphy,
01efff526235a5 Sergey Matyukevich     2018-01-22   75  				 struct qtnf_vif *change_vif,
01efff526235a5 Sergey Matyukevich     2018-01-22   76  				 enum nl80211_iftype new_type)
01efff526235a5 Sergey Matyukevich     2018-01-22   77  {
01efff526235a5 Sergey Matyukevich     2018-01-22   78  	struct qtnf_wmac *mac;
01efff526235a5 Sergey Matyukevich     2018-01-22   79  	struct qtnf_vif *vif;
01efff526235a5 Sergey Matyukevich     2018-01-22   80  	int i;
01efff526235a5 Sergey Matyukevich     2018-01-22   81  	int ret = 0;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   82  	struct iface_combination_params params = { };
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   83  	struct iface_combination_interface ifaces[QTNF_MAX_INTF] = { };
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   84  	bool change_vif_need = false;
01efff526235a5 Sergey Matyukevich     2018-01-22   85  
01efff526235a5 Sergey Matyukevich     2018-01-22   86  	mac = wiphy_priv(wiphy);
01efff526235a5 Sergey Matyukevich     2018-01-22   87  	if (!mac)
01efff526235a5 Sergey Matyukevich     2018-01-22   88  		return -EFAULT;
01efff526235a5 Sergey Matyukevich     2018-01-22   89  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   90  	if (change_vif)
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   91  		change_vif_need = true;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   92  
01efff526235a5 Sergey Matyukevich     2018-01-22   93  	for (i = 0; i < QTNF_MAX_INTF; i++) {
01efff526235a5 Sergey Matyukevich     2018-01-22   94  		vif = &mac->iflist[i];
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   95  		if (vif->wdev.iftype != NL80211_IFTYPE_UNSPECIFIED) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   96  			if (change_vif_need &&
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   97  			    change_vif->wdev.iftype == vif->wdev.iftype) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   98  				change_vif_need = false;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18   99  				continue;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  100  			}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  101  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  102  			ifaces[params.num_iface].iftype = vif->wdev.iftype;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  103  			ifaces[params.num_iface].valid_links = BIT(0);
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  104  			params.num_iface++;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  105  		}
01efff526235a5 Sergey Matyukevich     2018-01-22  106  	}
01efff526235a5 Sergey Matyukevich     2018-01-22  107  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  108  	if (params.num_iface < QTNF_MAX_INTF) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  109  		ifaces[params.num_iface].iftype = new_type;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  110  		ifaces[params.num_iface].valid_links = BIT(0);
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  111  		params.num_iface++;
01efff526235a5 Sergey Matyukevich     2018-01-22  112  	}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  113  	params.ifaces = ifaces;
01efff526235a5 Sergey Matyukevich     2018-01-22  114  
01efff526235a5 Sergey Matyukevich     2018-01-22  115  	ret = cfg80211_check_combinations(wiphy, &params);
01efff526235a5 Sergey Matyukevich     2018-01-22  116  
2d83dddf85cc19 Dmitry Lebed           2020-02-13  117  	if (ret)
2d83dddf85cc19 Dmitry Lebed           2020-02-13  118  		return ret;
2d83dddf85cc19 Dmitry Lebed           2020-02-13  119  
2d83dddf85cc19 Dmitry Lebed           2020-02-13  120  	/* Check repeater interface combination: primary VIF should be STA only.
2d83dddf85cc19 Dmitry Lebed           2020-02-13  121  	 * STA (primary) + AP (secondary) is OK.
2d83dddf85cc19 Dmitry Lebed           2020-02-13  122  	 * AP (primary) + STA (secondary) is not supported.
2d83dddf85cc19 Dmitry Lebed           2020-02-13  123  	 */
2d83dddf85cc19 Dmitry Lebed           2020-02-13  124  	vif = qtnf_mac_get_base_vif(mac);
2d83dddf85cc19 Dmitry Lebed           2020-02-13  125  	if (vif && vif->wdev.iftype == NL80211_IFTYPE_AP &&
2d83dddf85cc19 Dmitry Lebed           2020-02-13  126  	    vif != change_vif && new_type == NL80211_IFTYPE_STATION) {
2d83dddf85cc19 Dmitry Lebed           2020-02-13  127  		ret = -EINVAL;
2d83dddf85cc19 Dmitry Lebed           2020-02-13  128  		pr_err("MAC%u invalid combination: AP as primary repeater interface is not supported\n",
2d83dddf85cc19 Dmitry Lebed           2020-02-13  129  		       mac->macid);
2d83dddf85cc19 Dmitry Lebed           2020-02-13  130  	}
2d83dddf85cc19 Dmitry Lebed           2020-02-13  131  
01efff526235a5 Sergey Matyukevich     2018-01-22  132  	return ret;
01efff526235a5 Sergey Matyukevich     2018-01-22 @133  }
01efff526235a5 Sergey Matyukevich     2018-01-22  134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
