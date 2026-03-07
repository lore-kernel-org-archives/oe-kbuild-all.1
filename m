Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C33392C45
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772895929; cv=none; b=G2F8/IWkR8yjrWz7MwJJnRuZwDjOGwW1Q7VeegP6gaHS4ldhkTWYdVqdG3rXP+rc1RNHXdq0uaIphNNr5ZeYYrNUfr64tRuuJNzxaqUB2ICvB7EAyskWYoKj8XWbPuYPglgJmofGmFpJQMfrH3MkJKldfitmlW3f38LwxJMtKDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772895929; c=relaxed/simple;
	bh=SXTXiaTG4+ZryaYukFFiMzr1slrujXgLKw/gsumpA1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hxt8wIAqdVAH+9digKmsIND3Jw5was1t4OXKUEVid2Tr/3OXm+KICHJawOby1FJhObtE7n9NwWpo/2tWzvtvE6OJxmisYd/QYHWMfEf8Hhj3a4hDrw317eqvnXr556K0Jps5cJEUhNfJC/yGFxAlVkPrUaaAMV19lPWrX8s9kT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGKuw1IS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGKuw1IS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772895927; x=1804431927;
  h=date:from:to:cc:subject:message-id;
  bh=SXTXiaTG4+ZryaYukFFiMzr1slrujXgLKw/gsumpA1o=;
  b=nGKuw1ISh856ifpCUJbnv/GtkQCEcFcqWUd0H0W+Ytg7wUtNEe4zrZf1
   e6gE7nzDxbN1kjfxcxnu/GtVQ2K6I+fQ7EVPxLNo+khe57ug0rTaJjb1i
   mvswB4Vf7ZZXwea9mw7Z4DmsdHhxfTC9lPYWyHrr7pzcO5o23g7y2VCk2
   gaxRAcdi0cI8yhR7qtNVko301HShBLqB7LeTIWreQl1lDV6t5BLcVslYO
   yOXr1VZQsz3oFi3m2xSM0laKo1PSysUwAl4hSqvwfv1GwohiB4bxSd6R+
   fbTE/BUWLdhY0N7WdZSBFFeWY3KQXqjcqP6TfqsbDnNITEUrytXjEp6Su
   g==;
X-CSE-ConnectionGUID: DTar9OiuQWmwtK+8SxeTCg==
X-CSE-MsgGUID: omFqxiY/RjO5QsRLAxI4iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85458253"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="85458253"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 07:05:26 -0800
X-CSE-ConnectionGUID: XjxhJbi0SKqavOwEq6y+qA==
X-CSE-MsgGUID: jeZmsSm+SUGGwb8OoiPiBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223410617"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Mar 2026 07:05:24 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vytDU-0000000027J-3hdo;
	Sat, 07 Mar 2026 15:05:20 +0000
Date: Sat, 07 Mar 2026 23:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
 Jiri Kosina <jikos@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [hid:for-7.1/lenovo 10/16]
 drivers/hid/hid-lenovo-go-s.c:164:73: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202603072210.hUL7ptt2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.1/lenovo
head:   d2c424e80caf8237bda4c94bc2e25398967243f9
commit: 4325fdab5dbbfd467df6797e018c9dd0e5c3ae75 [10/16] HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver
config: arc-randconfig-r113-20260307 (https://download.01.org/0day-ci/archive/20260307/202603072210.hUL7ptt2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603072210.hUL7ptt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603072210.hUL7ptt2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-lenovo-go-s.c:164:73: sparse: sparse: Using plain integer as NULL pointer

vim +164 drivers/hid/hid-lenovo-go-s.c

   159	
   160	static void cfg_setup(struct work_struct *work)
   161	{
   162		int ret;
   163	
 > 164		ret = mcu_property_out(drvdata.hdev, GET_VERSION, FEATURE_NONE, 0, 0);
   165		if (ret) {
   166			dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU Version: %i\n", ret);
   167			return;
   168		}
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
