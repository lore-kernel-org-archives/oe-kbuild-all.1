Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8A8F57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693519812; x=1725055812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5XmwhQg8OgoLpBGMp+4+H8HLiXrNKnNLXxltru0eaM=;
  b=jm0PZdDXT0jJefoBKCsP166pMWmoL8+MyB8uy+Gee9IX9UZW0KCDZvIw
   Rk1JuWheMeSgVcx6emzc7v2PkNrI01UZ1AxgJI9iS2EBs1HOgoxz3Kn2/
   fIZAf3ee7QPwoSdT+Yc+fGjCl1Go++oIzGI3WRqPCM7gSpCONEHxoOh5+
   9a31Q7HEsQ5YNnGSpR3113lktF0STg0qVjD8CB42SO2Vffk54PEX4h4Y5
   zgU5uAaRXA0wY6B/4YcXQWEaDCLAx7yzyQyNS6dU49qV2lb81FTPhWNkq
   LGT2Cg/IAJsqSlbBEi1qrBK9d9MMAia9ntL4xqrI+I+DBOMdbey10F8/d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373476768"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="373476768"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774749873"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="774749873"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2023 15:10:09 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbprb-0000aZ-28;
	Thu, 31 Aug 2023 22:10:07 +0000
Date: Fri, 1 Sep 2023 06:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6175/24603] csky-linux-gcc: error:
 unrecognized command-line option '-mtune=cortex-a9'
Message-ID: <202309010516.NczcYB6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/24603] Merge branch 'mxc/next' into next
config: csky-allyesconfig (https://download.01.org/0day-ci/archive/20230901/202309010516.NczcYB6q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010516.NczcYB6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010516.NczcYB6q-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   csky-linux-gcc: note: valid arguments to '-march=' are: ck801 ck802 ck803 ck807 ck810 ck860
   csky-linux-gcc: error: unrecognized argument in option '-mfpu=neon'
   csky-linux-gcc: note: valid arguments to '-mfpu=' are: auto fpv2 fpv2_divd fpv2_sf fpv3 fpv3_hf fpv3_hsf fpv3_sdf
>> csky-linux-gcc: error: unrecognized command-line option '-mtune=cortex-a9'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
