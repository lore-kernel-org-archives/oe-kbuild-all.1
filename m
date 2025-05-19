Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880F73F9D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 14:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665394; cv=none; b=lTXlxaNzz3YmyvGpXg/m7dKJQjzr7GNL1AqHWSlMFEWXQtSLPrTE/PLqQ9MpSBLyPzmp4Fi0LamGi/MAWJgVpakJyeKa0GkPPbIamqOV+UJLKL8JTU9fddIXhKScBwRHdW5utbGfaaOxisCXFeAUuN6oJm10bWButtg8gAoUvTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665394; c=relaxed/simple;
	bh=so4E6xMlqZAH0HlWHxJoqK3evGVG722NWKD6IohHkXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGgtpBHmo4U0rF//sAFX7skowmoSr7vltl+Z/wdXVebgZZwqxCuMcRs8Ts6ZuVbD08rQkAIVoG5FXvjvzTRIDO37YcIee16E5xOnZvU/Dc/oLZs/pHmK79X6daT0VyTgBqUnjgWSQuTVd+vlbnqeqWWftmkGgwSaY5YaFXd44vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2Y1Cslu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2Y1Cslu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747665393; x=1779201393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=so4E6xMlqZAH0HlWHxJoqK3evGVG722NWKD6IohHkXA=;
  b=H2Y1CsluBovRuMm6uO9P7tcbNpc4h6u6E8nabQl6YvKCJFxDPg5+wLDx
   vkNNsZ0nJ5mudzsjh/kqboH8Zs9igPDRWz6NinyvqTl2LGVFnqni0bXXP
   lJs4u252HuAEbv1RD1vFQAx4uT+8B45iVt2Ul+nayOHJr9VzIDhmQ1Hiy
   g5EU4Es+AyxGeYGSF6Vyj5y8U4Jacv4i5dfcYtn4+JH16uSQ0MDgUZ34K
   MGiLkpO+zqLVsNaLqL9+11M4xNxAR08E0xHG2VLiiGz86/PUaXYBYNR3P
   IhvpTYAX1zHhnWQKfdm4Wv8bKso1NIIgcNWCquQ6Aql0DyOPkIKeab5K4
   g==;
X-CSE-ConnectionGUID: iClSNnSZSM2Sy3bGwoyCQA==
X-CSE-MsgGUID: TUYiLex2T0SHZVECEModYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49721808"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49721808"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:36:32 -0700
X-CSE-ConnectionGUID: wfnHcMgMTrOYpmVht6HwEA==
X-CSE-MsgGUID: cqRAjY5rRa+oDtLRg1kkKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="140276796"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2025 07:36:31 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH1bQ-0000qV-2j;
	Mon, 19 May 2025 14:36:28 +0000
Date: Mon, 19 May 2025 22:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 0/1]
 drivers/hid/i2c-hid/i2c-hid-core.c:522:60: error: no member named 'reset' in
 'struct hid_driver'
Message-ID: <202505192253.c8Dd8AmL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: 05ecf1e093a2ac5fb4de3e229165c101fc1d2281 [0/1] FROMLIST: HID: add HID device reset callback
config: i386-buildonly-randconfig-2001-20250519 (https://download.01.org/0day-ci/archive/20250519/202505192253.c8Dd8AmL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505192253.c8Dd8AmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505192253.c8Dd8AmL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/i2c-hid/i2c-hid-core.c:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:33:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hid/i2c-hid/i2c-hid-core.c:522:60: error: no member named 'reset' in 'struct hid_driver'
     522 |                 if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
         |                                                       ~~~~~~~~~~~~~~~~~  ^
   drivers/hid/i2c-hid/i2c-hid-core.c:523:23: error: no member named 'reset' in 'struct hid_driver'
     523 |                         ihid->hid->driver->reset(ihid->hid);
         |                         ~~~~~~~~~~~~~~~~~  ^
   1 warning and 2 errors generated.


vim +522 drivers/hid/i2c-hid/i2c-hid-core.c

   496	
   497	static void i2c_hid_get_input(struct i2c_hid *ihid)
   498	{
   499		u16 size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
   500		u16 ret_size;
   501		int ret;
   502	
   503		if (size > ihid->bufsize)
   504			size = ihid->bufsize;
   505	
   506		ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
   507		if (ret != size) {
   508			if (ret < 0)
   509				return;
   510	
   511			dev_err(&ihid->client->dev, "%s: got %d data instead of %d\n",
   512				__func__, ret, size);
   513			return;
   514		}
   515	
   516		/* Receiving buffer is properly aligned */
   517		ret_size = le16_to_cpup((__le16 *)ihid->inbuf);
   518		if (!ret_size) {
   519			/* host or device initiated RESET completed */
   520			if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
   521				wake_up(&ihid->wait);
 > 522			if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
   523				ihid->hid->driver->reset(ihid->hid);
   524			return;
   525		}
   526	
   527		if ((ihid->quirks & I2C_HID_QUIRK_BOGUS_IRQ) && ret_size == 0xffff) {
   528			dev_warn_once(&ihid->client->dev,
   529				      "%s: IRQ triggered but there's no data\n",
   530				      __func__);
   531			return;
   532		}
   533	
   534		if (ret_size > size || ret_size < sizeof(__le16)) {
   535			if (ihid->quirks & I2C_HID_QUIRK_BAD_INPUT_SIZE) {
   536				*(__le16 *)ihid->inbuf = cpu_to_le16(size);
   537				ret_size = size;
   538			} else {
   539				dev_err(&ihid->client->dev,
   540					"%s: incomplete report (%d/%d)\n",
   541					__func__, size, ret_size);
   542				return;
   543			}
   544		}
   545	
   546		i2c_hid_dbg(ihid, "input: %*ph\n", ret_size, ihid->inbuf);
   547	
   548		if (test_bit(I2C_HID_STARTED, &ihid->flags)) {
   549			if (ihid->hid->group != HID_GROUP_RMI)
   550				pm_wakeup_event(&ihid->client->dev, 0);
   551	
   552			hid_input_report(ihid->hid, HID_INPUT_REPORT,
   553					ihid->inbuf + sizeof(__le16),
   554					ret_size - sizeof(__le16), 1);
   555		}
   556	
   557		return;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
