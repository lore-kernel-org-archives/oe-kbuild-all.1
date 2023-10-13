Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18723107B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH/RCMV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697185134; x=1728721134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSSc2KFrPCOBUhwp5G8HK9vxnHa0bF4CzG8aPnGbobs=;
  b=YH/RCMV7sfVYh12qD+T66OPmCMaT1TmuyC/JrhgBRGDC3oqlifmUIFZS
   QfQrh7GTZo4Xkvy/BjVcUfKw0OJmRgtkoF5opl4uBfIu2p7xgz5RUhH7J
   dTJkWr1uYISqHhKc1GQkvNMRvdwhwmuh334fBpGmqTxz3wovNWiJ5170i
   fsN5RrXiQn8GZhulTkrY7RnZWFRV6TTVS9D+ICC1BK5H4gaoYcoYX+/eJ
   v23ZSBId6IhiMoVvU1PmmBHUSvIh8SH0mJrl9Fpedcdfgovd+YhTyRtP9
   C1twGzqP9QtdKPvfIPYAdql7x07gQn9ylFS5/9+zlXGseTEr5rZwmQMap
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449320968"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="449320968"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928331013"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="928331013"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 01:18:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDNf-0004Vp-2z;
	Fri, 13 Oct 2023 08:18:47 +0000
Date: Fri, 13 Oct 2023 16:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [klassert-ipsec:master 2/6] checkpatch: WARNING: Possible repeated
 word: 'Google'
Message-ID: <202310131607.bqihylFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git master
head:   513f61e2193350c7a345da98559b80f61aec4fa6
commit: f7c4e3e5d4f6609b4725a97451948ca2e425379a [2/6] xfrm: interface: use DEV_STATS_INC()
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131607.bqihylFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131607.bqihylFC-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#83: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
