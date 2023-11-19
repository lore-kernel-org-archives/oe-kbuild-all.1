Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE453D6A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPuC4dzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700387447; x=1731923447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQ59txGEvObqniOr2imRGVw6QGyUXzXEujBVnXBFFX4=;
  b=ZPuC4dzKsF3bDwDUTKs8jz83qAeIaYLx+6GZslZb6oLa2uXsvZG8OidS
   +DECaBXgfS/cGPjKnxbpFPv+nFY7bwYNcAYm9T8/Ws6CIP2iGobgwoXlW
   TuYMMPfbM0yR2IBL/Q2tfunapdhJumUYgNfGfXCfG8tEH9crsBXHF6383
   oGAJdYVg7jiIhXpgMeI2uCyRAj0bM6Jrj8iIL3VlFwnE0eRx3F33oxp+3
   hWu5dySKIGyBO8CkyqPQNJrDTGeIB1brcPQ13BNVLvrmg1JYP/NYiR4Km
   G0HT4FdwWDPbp0a963YiL0aV7cQShHWlmq8ryFfv1LW4S9m4/Ox/k2BOi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="13033253"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="13033253"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 01:50:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="856728390"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="856728390"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2023 01:50:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4eRt-0004w7-3A;
	Sun, 19 Nov 2023 09:50:41 +0000
Date: Sun, 19 Nov 2023 17:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [kabel:realtek-sfp-work 4/20] kismet: WARNING: unmet direct
 dependencies detected for RTC_CLASS when selected by TURRIS_OMNIA_MCU
Message-ID: <202311191705.lMU2H1E5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git realtek-sfp-work
head:   a7931b1e7b8bdade3975606bc26446fdccc6a40e
commit: d376d0b02052843cca976767c77d25c0f4fc541b [4/20] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
config: s390-kismet-CONFIG_RTC_CLASS-CONFIG_TURRIS_OMNIA_MCU-0-0 (https://download.01.org/0day-ci/archive/20231119/202311191705.lMU2H1E5-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191705.lMU2H1E5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191705.lMU2H1E5-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RTC_CLASS when selected by TURRIS_OMNIA_MCU
   
   WARNING: unmet direct dependencies detected for RTC_CLASS
     Depends on [n]: !S390 [=y]
     Selected by [y]:
     - TURRIS_OMNIA_MCU [=y] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
