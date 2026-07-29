Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051A4446EB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317798; cv=none; b=AuytmEb69FyeChseC2MvE3m/hkaKSilxTTkhrgi/ldNp/KeqJH99kO65vZLh6sLpo3dqfguWGatQtpc+QLdhviEWoXgPPJq6cTFv7c6DrQdEud508PAF1zjWI7sp+GefByQswulpnI7fNpocnaw5Kwcn96Olxy8wF83hLzyMxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317798; c=relaxed/simple;
	bh=AzlBhBYul1dfd1gi3eJqR9EIZFWmnEr/sROl7m0Z9hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r7y2I5kPtNZB946Y8ggJ0tRoOcyGL0pyP6YAxCQ/15gLM5sSznew+AU4v7YYM0fKyppUukZKVgEYoOeG/s/HeXhjoY+CR8oPu7HaGPOiFlftgFvR9MP9wV9aR7SJqgkr5aRolpQYD1156rnR1kG3QkAL/ZEF3Xsg34eMetQn9kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6VA1fBO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6VA1fBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785317797; x=1816853797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AzlBhBYul1dfd1gi3eJqR9EIZFWmnEr/sROl7m0Z9hs=;
  b=l6VA1fBOH+VLPwI2W2N708v/UZSMqUpTCDl1Vp9q5MuDslcP6ziWe/x5
   5zn2RcJKBPqPWkPlE6DMsV9JiPZYZycAQK4d6Bnt9kNwUIl4fjmnm4Taq
   bWdhGI9Pyg4ocEDbYf85KSYEdoD+HdgSIDjXGlvT7AwsBewoIDfdtiLQW
   6BLECvuyGMszvAE85NysbZ6pvowrflhVdrPhkF8LHvpl/Chmy0ml+Dta6
   xyGhMR5lqtT+LtF7Sm6gEA43znvGub38gZW2u9BX0D8jenT9XuCET+NEE
   ZwM1Ie/9WhliXONytronymppFYGRwo4JoyjjW4NDNHqQ5F2uJLZ82XVx+
   w==;
X-CSE-ConnectionGUID: v6eNM8V3R3auk/oadouvJw==
X-CSE-MsgGUID: M/XMeX6bRM+mjJk0drjMCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86108499"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="86108499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 02:36:34 -0700
X-CSE-ConnectionGUID: 4sMLyFyzS+6NmcOM089RUg==
X-CSE-MsgGUID: yc8jocnISWqKgMZBM1DXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="256045623"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 02:36:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp0iD-00000000fEZ-4AFH;
	Wed, 29 Jul 2026 09:36:29 +0000
Date: Wed, 29 Jul 2026 17:35:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Pavel =?utf-8?Q?L=C3=B6bl"?= <pavel@loebl.cz>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>
Subject: [masneyb:clk-misc-round-two-for-v7.3 7/45] Warning:
 drivers/clk/clk-si544.c:89 struct member 'xo_freq' not described in
 'clk_si544_muldiv'
Message-ID: <202607291708.qFSxYL2s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/masneyb/linux clk-misc-round-two-for-v7.3
head:   e2eec03ed313a8180ebe4eb9e32a6b8429f804a5
commit: d36da4cac07ee59507cd3284e4914ac78e9ed8d9 [7/45] clk: si544: add support for si549
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607291708.qFSxYL2s-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291708.qFSxYL2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291708.qFSxYL2s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/clk-si544.c:89 struct member 'xo_freq' not described in 'clk_si544_muldiv'
>> Warning: drivers/clk/clk-si544.c:89 struct member 'xo_freq' not described in 'clk_si544_muldiv'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
