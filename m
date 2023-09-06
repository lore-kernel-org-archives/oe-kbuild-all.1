Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A011CB8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694035688; x=1725571688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOQTGLygTqHaocHPBvVjP+sApZ4u4aF5OBa1517uUO0=;
  b=hiLvNdPR1tLpF0cuGW1gLLULhT6U+1TerXbFJDUuvYcfpnHe2HE0aNaK
   /jvYOL8nmhP4/ea0GJKfmLXkvCNDfSpGtb5kU+BpY/jrY1AhvAd1etFAP
   4SQiWZ+KtRMw+E9LbSLmC/LeZ7HRQ2Oih31ZLfxmHY3sKkRwcUkrNrPqE
   s4rNUgmH8dUzWq06/fUq5TQHJzBvrSHRO3QJGwxXeXH5OFKvnexXWSIBk
   WC71dGq/R4R9yjN9eAXjwUq3IraJiuDnlSfQqO5UQyEfe0yM28OgsDKOj
   I8A06HysHt/uj8/d4UO+HYQkdEZG2XnM4VeS9/SykJvGGsQ140PclHHtP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379898112"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379898112"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 14:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691458858"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="691458858"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Sep 2023 14:28:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe04A-0000bh-11;
	Wed, 06 Sep 2023 21:28:02 +0000
Date: Thu, 7 Sep 2023 05:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 257/24604] make[5]: *** No rule to make
 target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by
 'sound/soc/sof/intel/snd-sof-intel-ipc.mod'.
Message-ID: <202309070534.xDe68qD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: 51b86bcaf08f3cd48122cdbee63e8f469dcb3e64 [257/24604] LF-3774-1 ASoC: sof: Make Intel IPC stream ops generic
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20230907/202309070534.xDe68qD4-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070534.xDe68qD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070534.xDe68qD4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by 'sound/soc/sof/intel/snd-sof-intel-ipc.mod'.
   make[5]: *** [scripts/Makefile.build:277: sound/soc/sof/intel/pci-tng.o] Error 1
   make[5]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
