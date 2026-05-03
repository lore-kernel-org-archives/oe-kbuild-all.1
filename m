Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CEA26059D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 19:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777836681; cv=none; b=Fj3LNm1TZ7tdA1J5ZuZTtws8HQXE7G10r7izNKv5vhDIZ55ly/6thxCLivSqlHpa6Csc1NMO6Ji9d+44EpT2WfhA1qIQOLb8T+K0aDsW+dADRwB+QCU81P2aYSTE0Nf411Z3tKJ8x1it/aLIrHoR3Er+kIX/wxTVP9obLMdRLI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777836681; c=relaxed/simple;
	bh=t9jocURxGOfbR6VAYcSA56+zaJUseaCY9IZdvtCBYfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SQxEiNmUbf2hpopoX+9m2QCLAKf+/gP2xwYT9mCHM8qujRu4ZiE1tkzf+4p1cIN1jVkKgQO5Y1TZ6Ygauyem9OURR2YiUOWYCq9g8cGWSFv3858NYuMcR3YOJob5y9uTT3A7XnDTFTphVfxnJltJXg2Uql83Q8qeLuIkmUM/S0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtvXnFdn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtvXnFdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777836680; x=1809372680;
  h=date:from:to:cc:subject:message-id;
  bh=t9jocURxGOfbR6VAYcSA56+zaJUseaCY9IZdvtCBYfU=;
  b=GtvXnFdntKZJEi4/oAe7TRWd41aiDbXm5ggKDTp1jGEjpk5GeutblSir
   wf/L9klavoNd28zBxYIVMu9zpGT8L88k6uGW8PuSEfkJ9Xen7Izq5Nt1h
   iMPgiv9+ZAbH4pxD/dcR9T+RS4uWZALYcKI6ofyK2O/JYhcPnytjialsk
   QrU9AvJ6dBnNhhi1rfT7HCPXaq87u2YcqxCYOddVgB0mlcnwdtJr8xxKj
   RS2H98uDOvwiYrM6xrgUYF7XTSnV+XW1gDWxIPneRoL8iUAr16+C0LzGZ
   6n7EvZ+1UpLH3OpVvVBcgDFcG2lshj9CN8h8m7i31U1KbTaKJjuNHnnZY
   w==;
X-CSE-ConnectionGUID: bZyLTKBJToC1heIsFOypyg==
X-CSE-MsgGUID: 4IfoA9pfSKiHy4ewHWbRIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82321837"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82321837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 12:31:20 -0700
X-CSE-ConnectionGUID: 4qi6YtN0RYmLF/1BN08TVA==
X-CSE-MsgGUID: ngpRIyO8Sua8Hydu0I2V/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="234307807"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2026 12:31:18 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJcWs-000000002wJ-3KWh;
	Sun, 03 May 2026 19:31:04 +0000
Date: Mon, 04 May 2026 03:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9:
 warning: 'CAUSE' redefined
Message-ID: <202605040340.6rml3fNr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: c1918196427b917d1fbf064b07538410807f8b03 iwlwifi: pcie: simplify MSI-X cause mapping
date:   4 years ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260504/202605040340.6rml3fNr-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040340.6rml3fNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c1918196427b ("iwlwifi: pcie: simplify MSI-X cause mapping")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040340.6rml3fNr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/intel/iwlwifi/pcie/trans.c:1093:9: warning: 'CAUSE' redefined
    1093 | #define CAUSE(reg, mask)                                                \
         |         ^~~~~
   In file included from arch/mips/include/asm/ptrace.h:19,
                    from include/linux/sched/signal.h:14,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from arch/mips/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/pci.h:37,
                    from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
   arch/mips/include/uapi/asm/ptrace.h:18:9: note: this is the location of the previous definition
      18 | #define CAUSE           65
         |         ^~~~~


vim +/CAUSE +1093 drivers/net/wireless/intel/iwlwifi/pcie/trans.c

  1092	
> 1093	#define CAUSE(reg, mask)						\
  1094		{								\
  1095			.mask_reg = reg,					\
  1096			.bit = ilog2(mask),					\
  1097			.addr = ilog2(mask) +					\
  1098				((reg) == CSR_MSIX_FH_INT_MASK_AD ? -16 :	\
  1099				 (reg) == CSR_MSIX_HW_INT_MASK_AD ? 16 :	\
  1100				 0xffff),	/* causes overflow warning */	\
  1101		}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
