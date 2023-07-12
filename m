Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB81F959
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689163556; x=1720699556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7k4aTtCwetzSXpFxUgora9yiQNqSnwzUiN77wYy0nY=;
  b=ZW8yId7fj9vLrsO8/QFXy4oK8txMfjLPegDCJdLeE5p3dLAFHUD4j00m
   cSklltOY85UiL+8ey62dVMELnwInLFMJir3vaUQ5BgxtY0gEMxIMmzt9J
   jodgVXkA63dFrH9k8wk+Df0UuIojuixvmF75nTTopJR3Gevwy1Oey0pec
   1+hpq4OoyerQ9MZ7NAbPPWRLYJ+hOKsNifX0KRDvzjV5P1MXlGgfdRygK
   9LtsHOf8ea7nQXREMsBwfE3M7xRx6MgSG4hvX8C0CBCZsxxLTPlPqYCaS
   E5/lD/SLjxRQ6G+NpOK4UBRD1MALjmFF4cNljl4NcRrFUHxJ++HyZjLef
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367491367"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="367491367"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 05:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="724864475"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="724864475"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2023 05:05:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJYbR-0005fJ-0Q;
	Wed, 12 Jul 2023 12:05:53 +0000
Date: Wed, 12 Jul 2023 20:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bobrik:ivan/tcp-listen-drop-tracepoint 1/1] ERROR: modpost:
 "tcp_listendrop" [net/smc/smc.ko] undefined!
Message-ID: <202307122028.iDYTQ55P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bobrik/linux ivan/tcp-listen-drop-tracepoint
head:   ec65eacb29485b1a871ad01eba86d91a29d3e3b0
commit: ec65eacb29485b1a871ad01eba86d91a29d3e3b0 [1/1] tcp: add a tracepoint for tcp_listen_queue_drop
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230712/202307122028.iDYTQ55P-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307122028.iDYTQ55P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307122028.iDYTQ55P-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tcp_listendrop" [net/smc/smc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
