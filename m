Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADE12B88
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANZN6o4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697323552; x=1728859552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdpMlITS3vcut3fZrvnel6qQI40poujaSz1h/LBnr9s=;
  b=ANZN6o4xRLuszBviczSyyMBNILztncXDEtReg34uUibziI+xRTq2gZ1z
   CCa3Zdj340FtoGr/WF31+B5QW2ym6XY4FKF1HD6oOEAybGY/GzY2ivU81
   /qf+LMsvWjMqn7WmsmGn+/uOIn1fbJqI68HzOd0D098Tt0L1x8G3EQ94M
   4mK8RRPmaG283pxc4c1zsUtqWywCRf9UM3xpqNucky8wChCR9AHy1vl6l
   II9obvrBCdmnWo0l0I4NmcMZKa8S5ouU3sp/+2A4L9TV/ZTT3uvfh3ejN
   fjBrG7WcPbBY007/30k5tz7zf5YR6gY+UyhaSnIl/ObUI1Bkg7mn8s6TK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389211005"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389211005"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 15:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871565774"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="871565774"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 15:45:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrnOG-0006lB-19;
	Sat, 14 Oct 2023 22:45:48 +0000
Date: Sun, 15 Oct 2023 06:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [horms-ipvs:main 2/13] checkpatch: WARNING: Possible repeated word:
 'Google'
Message-ID: <202310150648.Ih5Zi7RA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git main
head:   2d1c882d4434a27a026b98b602f232c7919849c5
commit: 8702cf12e6ba91616a72d684e90357977972991b [2/13] tcp: Fix listen() warning with v4-mapped-v6 address.
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150648.Ih5Zi7RA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150648.Ih5Zi7RA-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#58: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
