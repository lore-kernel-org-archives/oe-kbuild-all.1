Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB17FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 00:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3imkMXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697416941; x=1728952941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79M9xiEpv6sK8pBVZYt5Vc8at58b6njwMmQbzn1jt+k=;
  b=X3imkMXEqgPTeIWvVQmzpjxOL7o29QEiIKC/LNFgYuGpb5MXrpecBECe
   uaT0BRTi2GkcCyqnKdPurMeUNV1X0Irru2tl4qr93rRcWYX6wk+PIPlNa
   pc856nNWDYiO+zqbl4VBoi6aLaJ/brOfWk5HESfkTOUVz2HB9JWoqVohd
   yY2VR13qxbBHMWfNEmjX1ORNRAgk8z8ShS33vJ2vijfYMkW6trTdL/uX2
   olGMNnYRmaM45b+uX+HgTQwZ3mhZa1nRmFTCxV4H2R5ZnMbkxGOfkFthc
   +hv2Wyu+D5TApE6TE1CLTtRCSI45Wgx5aMkW48uFeyWXuKK4G6P8mgKjs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449631390"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="449631390"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 17:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749110107"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="749110107"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2023 17:42:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsBgX-0007ye-1O;
	Mon, 16 Oct 2023 00:42:17 +0000
Date: Mon, 16 Oct 2023 08:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 146/206] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310160800.BGQjekFG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: ae723e076e0a0e0b091931365ef94785e10cc7d1 [146/206] ASoC: apple: mca: Support FEs being clock consumers
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160800.BGQjekFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160800.BGQjekFG-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#95: FILE: sound/soc/apple/mca.c:392:
+		int port = mca_fe_get_port(substream);
+		writel_relaxed(port + 6 + 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
