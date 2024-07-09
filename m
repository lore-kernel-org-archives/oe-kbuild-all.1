Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA82BAE1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720487565; cv=none; b=md3C37bSPNnjyQrcOs+FMO7ujwzsJHPhRrvMxRvj414lm9scJ17wSV4C8BMbpb7+528cY05QTN1qam0aGjm+UBy54ZJfBCA1dWftr8evuC8QjQ4Sb6cM+xMjYnjYGstwouDljxsYA3kCcoZl4KW3PRQTk5vGXnQNtks9jgrKoX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720487565; c=relaxed/simple;
	bh=udWQ6AJhZ+0kFnkqVXEh/uP4DCg6yfdLGg6W7hZV1DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvWQMEbd5LVVmtGHEN5B+L7sbcDNDqVWdQ51D9VDNQlEdUTqXpsxT7MRacgWS1X2M2ZBVHoITSwg6/g+Oltx+ksD0k2zJCNSozufqCVwweiXsyLsJv59AsepZlVNss+U48eoV8UCYdfaTlH4XHqkewUUHQ5NXEanaKkgEk+F2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEyBJKEX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEyBJKEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720487564; x=1752023564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=udWQ6AJhZ+0kFnkqVXEh/uP4DCg6yfdLGg6W7hZV1DU=;
  b=NEyBJKEXy51yorIvGi8KnFNwln3N3IAU5oLmwHnsqZokhEiwOeMEVIdZ
   DyriBTq3kbXDEsVncYAOZ33GSvkeisOSVmAlxrnrW6uTogUldyucV3nfh
   RHxecbh5Ozi1vpOa+dWHOUBo+CcEcxpXihpk2f/dil9gQXBHoaclztqtJ
   prjPNNyNNByxOgVr4DWkdx3GQx71tMH2KfXGaPpcz8y//ErgqLy08KUix
   ZPbKQeZXpdLSfvJRzpvbZ4OUaOzHEc5DAIiuw1CAME2h8BqOF+ZADlr+g
   ITFIetIO5rdGr+rZ1xri4W7DkVXVf+muD2xUqkvhVVprFdlxI4gWRGaiM
   Q==;
X-CSE-ConnectionGUID: YM6Oq3p2R125a9nj1Y7+7w==
X-CSE-MsgGUID: kwQidBDbRaml0pR8evm1HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28316125"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="28316125"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 18:12:42 -0700
X-CSE-ConnectionGUID: FYDDku6GS5S6VDK4Fnpukw==
X-CSE-MsgGUID: gqxwcUP2QsqWmTk8wvVDTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47567235"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2024 18:12:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQzPK-000WBm-0Z;
	Tue, 09 Jul 2024 01:12:38 +0000
Date: Tue, 9 Jul 2024 09:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: En-Wei Wu <en-wei.wu@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes@sipsolutions.net>,
	Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [wireless-next:main 24/27]
 drivers/net/wireless/virtual/virt_wifi.c:151:24: error: initializer element
 is not constant
Message-ID: <202407090934.NnR1TUbW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
head:   b3603133d3b727b0b07a7094ab74cf27c8aee3bd
commit: b5d14b0c6716fad7f0c94ac6e1d6f60a49f985c7 [24/27] wifi: virt_wifi: avoid reporting connection success with wrong SSID
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240709/202407090934.NnR1TUbW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090934.NnR1TUbW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090934.NnR1TUbW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/virtual/virt_wifi.c: In function 'virt_wifi_inform_bss':
>> drivers/net/wireless/virtual/virt_wifi.c:151:24: error: initializer element is not constant
     151 |                 .len = strlen(VIRT_WIFI_SSID),
         |                        ^~~~~~
   drivers/net/wireless/virtual/virt_wifi.c:151:24: note: (near initialization for 'ssid.len')


vim +151 drivers/net/wireless/virtual/virt_wifi.c

   140	
   141	static void virt_wifi_inform_bss(struct wiphy *wiphy)
   142	{
   143		u64 tsf = div_u64(ktime_get_boottime_ns(), 1000);
   144		struct cfg80211_bss *informed_bss;
   145		static const struct {
   146			u8 tag;
   147			u8 len;
   148			u8 ssid[8];
   149		} __packed ssid = {
   150			.tag = WLAN_EID_SSID,
 > 151			.len = strlen(VIRT_WIFI_SSID),
   152			.ssid = VIRT_WIFI_SSID,
   153		};
   154	
   155		informed_bss = cfg80211_inform_bss(wiphy, &channel_5ghz,
   156						   CFG80211_BSS_FTYPE_PRESP,
   157						   fake_router_bssid, tsf,
   158						   WLAN_CAPABILITY_ESS, 0,
   159						   (void *)&ssid, sizeof(ssid),
   160						   DBM_TO_MBM(-50), GFP_KERNEL);
   161		cfg80211_put_bss(wiphy, informed_bss);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
