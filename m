Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807612;
	b=XJkIlyQVrlnaSry2tajbDzhfRWCPJukYxYqhkDJRH/g24z43j6aESU3+ALyamXnvIynF
	 O84WERPJyIc8rKTXuIVkVjt/s49beB0+wTb6WsOmsAOicXnx/bEpyq4CRLxOkfecBeSE+
	 iMvrSPGR8q30wotyTP2uVlrLULGbYxl7Lb2rYWiDfRnUHmzRTXSJuch71NyZ87Gi0XWWM
	 IrmHOg/ppHu6rX6XpzLktHNrk/HL9Bk8FQn85xJ+rj2QUpACmTBA1bIb6Pj7tu8T6VO8s
	 O3KlMWce0VsKIfsobpSr76RklZgsM3NYFAvlq+pKVjkGV/EdMev0d66xomNlhRlwROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807612;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=n95trsI9f4mBVr50GvDM1EM+XbJkNdgLoHYefwjGymA=;
	b=qD0nZAVy6xn9LI4OFRTiweMEV2Nm+0DkhJ/TOI4Y+6yRcndANneuDO+1EspGWc4QECEd
	 nJSMpdQsKQxjB7Pfi6bp9ZDaa23HCsVP1BneaOo1tfkMUWXQ/rU8i2jQyF05y4Sc8e5/U
	 v956sdKcPf32uNHUXi+mxZa/9Dk/mintoAHajA1eDYfmpg0HifxdnPYvid0zHgqk1NFjP
	 2W9k5IBSUBR1l5lkk4dAzyRKsUm3RNjpdzQeelIlZzB2UdzicUS7QbL6oMBU1HkIRwJyE
	 4DXnJ9NqTXgQAnVdC8ajJF7BBiQFFsZPqH7IzZy5qQTDL3lB7J7lHKRefOJqa5DB/jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="d7gJ/nBL";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C67E606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 19:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C67E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7gJ/nBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795807611; x=1827343611;
  h=date:from:to:cc:subject:message-id;
  bh=HXaQwL5Ah2QPLsJi/G+XXhdXxUAUzTg3LAJDgEsAbqU=;
  b=d7gJ/nBLKbXXIAm/Cs+VDAF8dp8NtOX4/WwAX0T6Nd8QSEIaPjeSEoLW
   tO9/gQ8MRfRF+iAInb6YHw6zq6U+1nq0OhJBHYOLuXqPjbz2rXjJgLlzd
   1Nj9hTAY/vf+40Hul16J3ppB9E1zaokaKzleCWZpj/gi7IZo8+O0D1t/R
   k8wX56svL8koxxfJcVbBgnFbGyF8I5cKGmCPlFmEExkDendPEQXjFZKw6
   6lY6Mh1UVsudSqlJbxmLUOtmJSCWGcM+pGLULg/Mw7fqx8nhRCDacoPSw
   rsKWJNaXyjS8ZH0ZXtkm6Rz75mA6HDdKF07Gg0qIhOXS1Q/ON6GSa/Nax
   Q==;
X-CSE-ConnectionGUID: QwgIhOFORHaftkVMzx04lQ==
X-CSE-MsgGUID: w2Us4KRVRou27yS9L2aafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4566865"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4566865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 11:26:50 -0800
X-CSE-ConnectionGUID: dTelvbXCRb29qLMjXN6wcg==
X-CSE-MsgGUID: 7DzPRTZpTtiA6b4ydZktzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12472784"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2026 11:26:48 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX1ao-000000000Ki-0I6b;
	Fri, 27 Nov 2026 19:26:46 +0000
Date: Fri, 27 Nov 2026 20:26:21 +0100
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [lee-mfd:for-mfd-next 66/72] drivers/mfd/cs42l43.c:557:9:
 error: implicit declaration of function 'sdw_slave_signal_unattach'
Message-ID: <20261127202132.lWC2UNEW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   5a9a62afea200df7189a9bfc4dd5794c178f407c
commit: 54b3632c8ec08735d3f6235d80005aa0b648c7dd [66/72] mfd: cs42l43: Move to core detach helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261127/20261127202132.lWC2UNEW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127202132.lWC2UNEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127202132.lWC2UNEW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/cs42l43.c: In function 'cs42l43_soft_reset':
>> drivers/mfd/cs42l43.c:557:9: error: implicit declaration of function 'sdw_slave_signal_unattach' [-Wimplicit-function-declaration]
     557 |         sdw_slave_signal_unattach(cs42l43->sdw);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sdw_slave_signal_unattach +557 drivers/mfd/cs42l43.c

   545	
   546	/*
   547	 * If the device is connected over SoundWire, as well as soft resetting the
   548	 * device, this function will inform the SoundWire core the device is about
   549	 * to detach from the bus.
   550	 */
   551	static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
   552	{
   553		static const struct reg_sequence reset[] = {
   554			{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
   555		};
   556	
 > 557		sdw_slave_signal_unattach(cs42l43->sdw);
   558	
   559		/*
   560		 * Apply cache only because the soft reset will cause the device to
   561		 * detach from the soundwire bus.
   562		 */
   563		regcache_cache_only(cs42l43->regmap, true);
   564		regmap_multi_reg_write_bypassed(cs42l43->regmap, reset, ARRAY_SIZE(reset));
   565	
   566		msleep(CS42L43_RESET_DELAY_MS);
   567	
   568		return -EAGAIN;
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
