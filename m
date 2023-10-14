Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0E101CE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DANxHh/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697283681; x=1728819681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rbOtlQdcwPSIXa9Xn/d2YUe6A6TmK7v4LkqU65aaL50=;
  b=DANxHh/Gv2DgpmdafoOqPki2zCVnx89ZzoCvSiwrHp7hpjczdW0bAQ14
   i3N2K5RVsH5BMaBSGVSTzlb75UjtrkBk/ux7CHJ/CRdElnLWtxceQS8Xg
   gBUWgEN3JIJoT/ns9M+/G68+bjMl22GlKPcMnRGqy339cJWB4XSoAYphe
   C/5i1USTwXbqGqxjHR+Jk9pj6kMgikwYH9hLocvODgEtrXi7RYjOnp5tK
   iKMS2HbPCi4k2r4vPILr6k/1o0M15yyOhNdGHXdBln9Pj7MTPgerPZHOa
   KVShyQqZObHASUJ5FQEmwEqWLypLf0avlTfys6l7ZY4Tvt5ZLtfaEgLCT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365586224"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365586224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 04:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898863772"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898863772"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 04:39:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrd1B-000681-0i;
	Sat, 14 Oct 2023 11:41:17 +0000
Date: Sat, 14 Oct 2023 19:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [netfilter-nf:main 2/13] checkpatch: WARNING: Possible repeated
 word: 'Google'
Message-ID: <202310141940.sWVl1jc7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
head:   2d1c882d4434a27a026b98b602f232c7919849c5
commit: 8702cf12e6ba91616a72d684e90357977972991b [2/13] tcp: Fix listen() warning with v4-mapped-v6 address.
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141940.sWVl1jc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141940.sWVl1jc7-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Google'
#58: 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
