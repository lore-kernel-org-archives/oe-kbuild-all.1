Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827743CB2FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903092; cv=none; b=Qr3dP4tbCfX2B4nrhocvt9MPVBqv3+YqoelueflIsiayEmiZsrQBLh5EG9SG0TY77BwZfcoUxoMYG0jJRrheag/V1t+RLgCLMZbjOnYudWHh6TxZolyVd/l7M+ZZNCe8DM5415lfTikRwwLHBrxwN8rn9JpK57xQzFGvbFLtzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903092; c=relaxed/simple;
	bh=/5NDfsw8EDNqZoSKLTFKyARJ+L+ElCDE3/+IfOcuAFI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhItfWejZNGHpkO1oCJalTsKiwNecpXZ5hXiTEF9RpDiyJ9zleT+P95Bye1HOPMs1iyBOIqjvqBO3CZ3tU99q7HrWuG1HICX/cXsG7H9YQyngDoyi75gyyJOo+GDpsgQm1lhIoAdDwkStSs+hd4X08fBHNpFQ0VCMTFUa13t0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAahs7yr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAahs7yr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791903091; x=1823439091;
  h=date:from:to:cc:subject:message-id;
  bh=/5NDfsw8EDNqZoSKLTFKyARJ+L+ElCDE3/+IfOcuAFI=;
  b=DAahs7yrpEbBPJ0voNkyeglUrIQyfpq/RsOLVWvuiT0zYrT1Nbvsu8r2
   a4fLkd2EmD/HkAwLemxGuBIvyNV0LQoGChtvPiNAtniy/yeZNnmE+Ytu9
   dcGMhguUT7PpMQsGTy6AaNZRRKgFgHOBw7mCWBk8mClobmNBTGrtHKg2G
   r3oSKtvDR9rYfO6Qv58hxhJ2Kl9UGNuqJsikc/NIS7BbdmHpJLToyv/ko
   DOedUnymmC5g8pRDt8iyeuQ2P+aHCEg/hUWwj/BF0hny+6lFDZcNZmsoH
   6haihvgaPEQojx1sYF8nvQlbkXUlP7IRddjNx9+4Kj0edNhbT379puVQo
   Q==;
X-CSE-ConnectionGUID: +rCbtYiZQAqdzKuMcUpWxQ==
X-CSE-MsgGUID: jms5EpbhQkidqsLHP4SHkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="532195"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="532195"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 07:51:30 -0700
X-CSE-ConnectionGUID: k1+8Ebw3Qzy2Om+gM/KhoA==
X-CSE-MsgGUID: qFVp/MepRPqATrhFtDfVVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1124218"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Oct 2026 07:51:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGdqg-00000000AWl-2GEV;
	Tue, 13 Oct 2026 14:51:26 +0000
Date: Tue, 13 Oct 2026 16:50:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 288/288]
 drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of
 function 'mv88e6xxx_g2_eeprom_wait'
Message-ID: <202610131623.KEdHxv2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   a00189220f1bc09e180c783559651d077b994b37
commit: d44346dda7d4faca4a64b6233a3ea0a09dc615e4 [288/288] net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
config: i386-randconfig-r2111-20261013 (https://download.01.org/0day-ci/archive/20261013/202610131623.KEdHxv2Z-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610131623.KEdHxv2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610131623.KEdHxv2Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mv88e6xxx/chip.c:2320:4: error: implicit declaration of function 'mv88e6xxx_g2_eeprom_wait' [-Werror,-Wimplicit-function-declaration]
    2320 |                         mv88e6xxx_g2_eeprom_wait(chip);
         |                         ^
   drivers/net/dsa/mv88e6xxx/chip.c:2320:4: note: did you mean 'mv88e6xxx_g2_pvt_write'?
   drivers/net/dsa/mv88e6xxx/global2.h:457:19: note: 'mv88e6xxx_g2_pvt_write' declared here
     457 | static inline int mv88e6xxx_g2_pvt_write(struct mv88e6xxx_chip *chip,
         |                   ^
   1 error generated.


vim +/mv88e6xxx_g2_eeprom_wait +2320 drivers/net/dsa/mv88e6xxx/chip.c

  2306	
  2307	static void mv88e6xxx_hardware_reset(struct mv88e6xxx_chip *chip)
  2308	{
  2309		struct gpio_desc *gpiod = chip->reset;
  2310	
  2311		/* If there is a GPIO connected to the reset pin, toggle it */
  2312		if (gpiod) {
  2313			/* If the switch has just been reset and not yet completed
  2314			 * loading EEPROM, the reset may interrupt the I2C transaction
  2315			 * mid-byte, causing the first EEPROM read after the reset
  2316			 * from the wrong location resulting in the switch booting
  2317			 * to wrong mode and inoperable.
  2318			 */
  2319			if (chip->info->ops->get_eeprom)
> 2320				mv88e6xxx_g2_eeprom_wait(chip);
  2321	
  2322			gpiod_set_value_cansleep(gpiod, 1);
  2323			usleep_range(10000, 20000);
  2324			gpiod_set_value_cansleep(gpiod, 0);
  2325			usleep_range(10000, 20000);
  2326	
  2327			if (chip->info->ops->get_eeprom)
  2328				mv88e6xxx_g2_eeprom_wait(chip);
  2329		}
  2330	}
  2331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
