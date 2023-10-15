Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43904EDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjpDY6MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697379776; x=1728915776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8eS1IP7hwXL2PUtV+Q3mqUDh6yLjuckxtsjkyUmyrq4=;
  b=hjpDY6MAUgjj8LF97DFx1stUDXsAGNcSra7mrX+oCVCJ+kh3OWnNXLZE
   Rvj96Gh8YP9yUbrj34OgiQyiflyWstDQYxTd/DOexYiD4Bj+ehg7Y5apN
   E0GJOy6gmaM+E0LlofqDfCI40XnyrFhuzJDiyCB2VpcTijExqUWQJbSGV
   /YUaeac7NpPiSR2921hORNfpdFK/LfGLX3qjnS/ku5iu/z2SO+zo4yoPm
   qXJz/TgijP7Ov3zzclFBqAxPrWhUoIeAs/HMiV2QCDMq4lF0Ywn/a2Wmr
   L3O/t9riKb63IOMxgxNglTw/85xE3VusV5gydH45YFM9unOWyeiqwtQJC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375755712"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375755712"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 07:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821273007"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="821273007"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2023 07:22:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs215-0007TN-2c;
	Sun, 15 Oct 2023 14:22:51 +0000
Date: Sun, 15 Oct 2023 22:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 257/24603] make[5]: *** No rule to make
 target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by
 'sound/soc/sof/intel/built-in.a'.
Message-ID: <202310152213.tuGAoB0t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 51b86bcaf08f3cd48122cdbee63e8f469dcb3e64 [257/24603] LF-3774-1 ASoC: sof: Make Intel IPC stream ops generic
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310152213.tuGAoB0t-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152213.tuGAoB0t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152213.tuGAoB0t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by 'sound/soc/sof/intel/built-in.a'.
   make[5]: *** [scripts/Makefile.build:277: sound/soc/sof/intel/pci-tng.o] Error 1
   make[5]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
