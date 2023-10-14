Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C134715EBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFS32BA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697300018; x=1728836018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRmBKF4R7rFSEg/folx266HZKXlzgkihO/XktNCOK1M=;
  b=IFS32BA1o1qxwahk8vAb9R4wE13GvDEPt52DZcYIVWvCc5lQgZ6SLTSt
   SkEY0fZpXFwZCogbcGZCbb0m7WhRFHkHu7ICAUD8guSPzKfEOG9hNqFBz
   adkP3Sqrb3kpBg8rMj0OFMgqf04kI9d/a4ADHjsHJbTIYDwDKC7t1zjpS
   x3DDs45uv9NicjO+AUC0RKfmHb7UL+cUg9KHziSO9n0b0Sr/susXs21/r
   7aPp0Ynln2qcWAJVv/JC7anut16Sy+QdhyIdEQQPvS2dJvaqCT4VMbFDd
   YA7efnsufMwgcE+Umi4lZAkCc24npHQ3koZzHAtVKoERfb2NDOOO5nUlA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389193954"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389193954"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="758833719"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758833719"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 09:13:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhGg-0006Lx-0F;
	Sat, 14 Oct 2023 16:13:34 +0000
Date: Sun, 15 Oct 2023 00:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [netdev-net:main 2/13] checkpatch: WARNING: Possible repeated word:
 'Google'
Message-ID: <202310150026.LOzT54Fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   2d1c882d4434a27a026b98b602f232c7919849c5
commit: 8702cf12e6ba91616a72d684e90357977972991b [2/13] tcp: Fix listen() warning with v4-mapped-v6 address.
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150026.LOzT54Fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150026.LOzT54Fv-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#58: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
