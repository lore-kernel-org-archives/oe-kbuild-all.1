Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E7739AFA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712509520; cv=none; b=oVghYsArQ/5O6PJBq9/as+bNkBT/QJLqD7PRZ1hFDohihZxRJnxGOrAQo6uf/5vT1+Z7lrXVShsBJgtkwOeHvcW2nX/aRT3LTiJqwojUtilPjh21T7zwzj6V1AO2810tZ1A6MJslLz0cG0VEuokYa7h3O/UVMsNl9S1og/p3wJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712509520; c=relaxed/simple;
	bh=DsMH9oVYOTcSlxOnvsl6ICrVvgINDb5kCkLuN4aBYd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcW8+nHFQlU8RfL88uvLWDyiwL85qXl/Mh/HL5QjOzvRgvhLGO+mX4A0qdtskmRaViADmco0FXNe1KoT6naSNRKxz/pqoEquBSvoYAjP/h148mqR4mNFSbbiUGwV4ixNvg86k4nSrEuIqKhDcTpDL0PoQ+ZLTA0wImuGnebRwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAmLdCfo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAmLdCfo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712509517; x=1744045517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DsMH9oVYOTcSlxOnvsl6ICrVvgINDb5kCkLuN4aBYd4=;
  b=AAmLdCfo9yMAgrBVQx4He5+/s73J9zU1+9cRY9Mq8eSEAmFAc8bx5T3u
   vf8R4jpA8jeORyw44zzCFQBiKFyswefcDW8Zc7+/JGQVlshgdr6MWbMts
   lWeVYvUmscoT8RKrs1SgOvPpqpvCGGpKfTXLhd6a6noFsCHHMp5MdE1AO
   v9Z2KI09Sb9GauOqW5Lv0yoz7xDnF9RagbyeE20/SILQzfQCsxW0d9f3R
   uvSevMNeADsmHdCMRSPqSd2JN+Rie/EOcvhkXJZth82ivZ+TFlCgmnCWP
   W3y5cpPul2NoZdAKpseDJkVXWaxs2/cQjb8BALvadWISJ/u8OBLQufnw6
   g==;
X-CSE-ConnectionGUID: /T0LpfCyR2mRKblOnEj+/Q==
X-CSE-MsgGUID: UQErV65pSUC5qjGS3h0d1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7692693"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="7692693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 10:05:16 -0700
X-CSE-ConnectionGUID: A3ncOyv/QnKnTyRrqcVimw==
X-CSE-MsgGUID: 5lMPXpUUQp2hIK9eQ83uNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="19780831"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2024 10:05:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtVxA-0004V8-1G;
	Sun, 07 Apr 2024 17:05:12 +0000
Date: Mon, 8 Apr 2024 01:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_TRIGGERS when selected by IWLEGACY
Message-ID: <202404080044.1dFi4SVd-lkp@intel.com>
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
config: alpha-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_IWLEGACY-0-0 (https://download.01.org/0day-ci/archive/20240408/202404080044.1dFi4SVd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404080044.1dFi4SVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404080044.1dFi4SVd-lkp@intel.com/

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
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
