Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB81921364
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712560032; cv=none; b=MTEjT+dE0ueDaG7XfapB/8HwUvDV83F+DO8y0bZ4NbTLvICKTAhPWB+coUuIvq5D7+1wVxr+ChGhOPa5n4OXPCbuuHS0ICO/gUOokJF17bMc6YXKZXO4/76P9+ImfTZx9DEYSG6vXE4xOnnlh/PMaOM0ef1ZAX6Af2utFHt7+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712560032; c=relaxed/simple;
	bh=GP/QKxZZWjHjlmtsk2UzScIAfRdaCXGHq6WZJ+hZCU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jv58B9ZukKmdhUa7GzWDYTRt40M3AnQS6vZFXssflRDlSLSPs03fUPXxBrm7T9LL6o1BmiDFfsBczOSIw4LNL4HjwrzUU6WHrYtKU20hcpmlMuXF4Fou41KkoPSTS2afJT4jFvGB3PIisjMu4cxnMZDe/s9bmWF794veKio+o4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDB8t/VR; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDB8t/VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712560030; x=1744096030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GP/QKxZZWjHjlmtsk2UzScIAfRdaCXGHq6WZJ+hZCU0=;
  b=XDB8t/VRXV9oWW3X8Ox5uL1yOrXZw/uikCGSclJSOTXsb+A2yUldxRK/
   yhg9Rbq0jZRHThsuGkyZ1JxOe6oydaCuw6gyxPhCgj4Wm9vPb9XeRFwmJ
   V7oiWiXiYsdlKi/ujWkZrFTQd3H8hr1FQYoLs/Z5Q2zILZseb3RC0ZetE
   JNzH+J3OeyvXsOVqYJVrazfOb2QBM9TQuOfjthoYR9VBc4vEMAtbMCFAl
   L3DpkqOPNx8/F/RbNjXLtHZXMfT/RhztmgbWEFucRTjMbOeY5xGHNOqdb
   BwTZ2pSjoIPDij62um+BFZXqSggCvuHC3DjftlyzYiiX8V2WVzx2OJojP
   g==;
X-CSE-ConnectionGUID: YICM9hIIRu2k4HAHqNRyrQ==
X-CSE-MsgGUID: 1tSgacvLQZSE7/pxeISFhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7680215"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7680215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 00:07:09 -0700
X-CSE-ConnectionGUID: FCKN3bOHRlyJMpsCHkQdVA==
X-CSE-MsgGUID: fe5WS52ySgqItwHMeIlP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="24264534"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2024 00:07:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtj5t-00052U-1l;
	Mon, 08 Apr 2024 07:07:05 +0000
Date: Mon, 8 Apr 2024 15:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
Message-ID: <202404081507.l6B4s09C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: alpha-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_IWLEGACY-0-0 (https://download.01.org/0day-ci/archive/20240408/202404081507.l6B4s09C-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404081507.l6B4s09C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404081507.l6B4s09C-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
     - MAC80211_LEDS [=y] && NET [=y] && WIRELESS [=y] && MAC80211 [=y] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=MAC80211 [=y])
     - IWLEGACY [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y]
     - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=MAC80211 [=y]) && (IWLMVM [=y] || IWLDVM [=n])
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
