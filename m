Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C56A340
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712579001; cv=none; b=lmuwuO5iyr7z/sGUt8NR8ddg/bRQDMbV1uc+MJrQG9s62s01/kxjF5gMHIP70ri2EQNh5v3udfx3vezKE7GFktzAYyJvoOCR6XQqbAnfQP2FRzbUbsYM8oSAnzIEUufNo9El9hWj6FKH+gY/wSpy5lbKiORladzkC/C9inQVhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712579001; c=relaxed/simple;
	bh=lOxX07+2A4IICqmKgGT9DCKtUWHuyJZ9naxOZ/UJkSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIBxVzMemYymZ4p1mtcr8i4r1M4TQToJZjjzwMA5iue/FR4l4O3p4iVbMMHQ2kn5RGU3l1sCkPkqrKeQlPrk8Ft1zqKvTbC0Ganarsk1Z9e/ximHNMU7VkrPxx2lBI6Rs3Zw5e6vulhK+AKq+QHmo0yuXpqvyQGEg8eNyYL+cc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pz4YIV27; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pz4YIV27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712578999; x=1744114999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOxX07+2A4IICqmKgGT9DCKtUWHuyJZ9naxOZ/UJkSQ=;
  b=Pz4YIV27qTl975nNEU7yOOossEu6mdw6Cm1JNWO2Fs4xzsh1a8ifW1v0
   YZoK8K7AwvSO5Rj+sKpU6Qr+cHLJpdlDdBPaY4NPgCuT9pg9XSHHLP4it
   UqZLk6bq2W+EXwN7xOYD7pgVL2WO0ajLELcNZIzQiLG0WNtjubprEjQMJ
   l6V3pwTX3m7xuSyBwXtJ6DAp0wzNUmeGsxttFyRuti5JhvQ9eUgH5oEGR
   ItAe4zyCmRnvGAo701+7Eg0mQyRoFhxdZUOl4Zsm9MqFKBnY6ophC8bFh
   gxTanjnxUE75e0kDDKAzbksj2/dYrEJOoiHJs7eTf+B1r/U4e2QCU0ZQu
   w==;
X-CSE-ConnectionGUID: rwNs+5F+TqOV7vMGbf0OCA==
X-CSE-MsgGUID: wqW5bx4PSTm+MD3cHZXkLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7685858"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7685858"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 05:23:19 -0700
X-CSE-ConnectionGUID: cupv3zpBQHmgV3LuWITrrg==
X-CSE-MsgGUID: Ec9lQbw3SgO0xO/gESpAfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="51049287"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Apr 2024 05:23:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rto1r-0005BK-23;
	Mon, 08 Apr 2024 12:23:15 +0000
Date: Mon, 8 Apr 2024 20:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_TRIGGERS when selected by NETDEV_LEDS
Message-ID: <202404082044.zU3TkSpg-lkp@intel.com>
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
config: alpha-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_NETDEV_LEDS-0-0 (https://download.01.org/0day-ci/archive/20240408/202404082044.zU3TkSpg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240408/202404082044.zU3TkSpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082044.zU3TkSpg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by NETDEV_LEDS
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
