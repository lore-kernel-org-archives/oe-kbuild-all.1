Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A713BC3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758919065; cv=none; b=ZzlTOclwnda7SSCbEzDYcrcRywacCxzbTfLxGEM399k/jTM1wykUsScBHe7DCjTs6r+oDXuCgPAbuWhFgCBgiFflFK2vlvM+wdgDtjxrjYrkdgnqKBGcXcQfRkVU32da8E3Kpf2p9FO2TmvL1CNW7ilTR36febaeJZ6N+Rt1qT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758919065; c=relaxed/simple;
	bh=Dvvamr8NOveyIoa7uJTmMpv/j/9E4i+7Zb2s/MhDsso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMieyWfYhoX0ots2JZi+Nl9eUQ/ySmdn5vHN9wXNVhWqq+wZ3uPKpkYXR4T/BHU0XliGgQIKbtN/0JeeMb/xMPOfe4HhUdyS6RCE11DT3rqbeLCyibaMqqqaAFvYzJ4gKcwRfkKfyWwUnUc9YEe/k8SYYxsoFjCfw9RSeOhDI7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8I8gC7r; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8I8gC7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758919062; x=1790455062;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dvvamr8NOveyIoa7uJTmMpv/j/9E4i+7Zb2s/MhDsso=;
  b=Y8I8gC7rhSfYETyxyhDYr1Fus2RsE+Q2gW8jbKQxEDe7rMcSYFG7kEJo
   BQHvCTo4AtVabvCAZIsdUNUsVw8qhAwbioRD/m+fQB4DFiylQ+Wky/yWz
   yscNqNp0MtYgMrW1inhIX6H5Rr2NG6SfZClT9ArxJiEWYg9DOI5HBl5x6
   peA8fk+ueXPEYRGgXVRPA5v/8sKRJo00k+RQazJlzDD6y0Rbzr6xwf20j
   4a5Snjc5V4tQlM/eQtV+nwNg6dwRmbG65CXxP4yErO+BqL8cjgnwsJ58F
   wBJj6tkQOtFgT2DADCiBoTUpkPa0spCYBnZneZKLEYncB0hFaB4HmO1Gi
   A==;
X-CSE-ConnectionGUID: JXKq3kHxRpC46U+uTBWzKA==
X-CSE-MsgGUID: 7YUe0mZcTWCMegJvDiXc7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60959863"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="60959863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 13:37:42 -0700
X-CSE-ConnectionGUID: 2S9HA3ybRfKgK79I70ns1A==
X-CSE-MsgGUID: 5oo5FJqVQ7Cf2Acou7kVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="208450855"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2025 13:37:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2FCE-0006ad-27;
	Fri, 26 Sep 2025 20:37:38 +0000
Date: Sat, 27 Sep 2025 04:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11811/12740]
 drivers/firewire/core-transaction.c:1255: undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202509270428.FZaO2PPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   262858079afde6d367ce3db183c74d8a43a0e83f
commit: 8ec6a8ec23b9529d6203cab50a22fab3a5fd0d80 [11811/12740] firewire: core: suppress overflow warning when computing jiffies from isochronous cycle
config: arm-randconfig-003-20250927 (https://download.01.org/0day-ci/archive/20250927/202509270428.FZaO2PPq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270428.FZaO2PPq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270428.FZaO2PPq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/firewire/core-transaction.o: in function `update_split_timeout':
>> drivers/firewire/core-transaction.c:1255: undefined reference to `__aeabi_uldivmod'


vim +1255 drivers/firewire/core-transaction.c

473d28c730e2de drivers/firewire/fw-transaction.c   Kristian Høgsberg 2007-03-07  1239  
ae57988f68acdc drivers/firewire/fw-transaction.c   Stefan Richter    2007-08-02  1240  static const struct fw_address_region registers_region =
cca6097713c62e drivers/firewire/fw-transaction.c   Jarod Wilson      2008-03-08  1241  	{ .start = CSR_REGISTER_BASE,
cca6097713c62e drivers/firewire/fw-transaction.c   Jarod Wilson      2008-03-08  1242  	  .end   = CSR_REGISTER_BASE | CSR_CONFIG_ROM, };
d60d7f1d5ce83d drivers/firewire/fw-transaction.c   Kristian Høgsberg 2007-03-07  1243  
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1244  static void update_split_timeout(struct fw_card *card)
b5725cfa4120a4 drivers/firewire/core-transaction.c Takashi Sakamoto  2025-09-16  1245  __must_hold(&card->split_timeout.lock)
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1246  {
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1247  	unsigned int cycles;
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1248  
b5725cfa4120a4 drivers/firewire/core-transaction.c Takashi Sakamoto  2025-09-16  1249  	cycles = card->split_timeout.hi * 8000 + (card->split_timeout.lo >> 19);
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1250  
4ec4a67aa10026 drivers/firewire/core-transaction.c Stefan Richter    2011-09-19  1251  	/* minimum per IEEE 1394, maximum which doesn't overflow OHCI */
4ec4a67aa10026 drivers/firewire/core-transaction.c Stefan Richter    2011-09-19  1252  	cycles = clamp(cycles, 800u, 3u * 8000u);
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1253  
b5725cfa4120a4 drivers/firewire/core-transaction.c Takashi Sakamoto  2025-09-16  1254  	card->split_timeout.cycles = cycles;
b5725cfa4120a4 drivers/firewire/core-transaction.c Takashi Sakamoto  2025-09-16 @1255  	card->split_timeout.jiffies = isoc_cycles_to_jiffies(cycles);
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1256  }
8e4b50f94e8c14 drivers/firewire/core-transaction.c Clemens Ladisch   2010-06-10  1257  

:::::: The code at line 1255 was first introduced by commit
:::::: b5725cfa4120a4d234ab112aad151d731531d093 firewire: core: use spin lock specific to timer for split transaction

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
