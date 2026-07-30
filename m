Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380AD218E91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 05:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391128; cv=none; b=SVGgQL9zfSJit9xWhMiTOLEBWybuXmxIivmzszh8mY+h5Sb4B3QdwY1OoDvl018v2NlZRbGt+FH2eh78ltajhfLWKThP07Eh08UNkJOOaD7y6WE0lwZMB50tRd/6XSyjXp3LEJxY/v3SXikU3Wq2vNCHFXWf6jnxCY8QvHcjH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391128; c=relaxed/simple;
	bh=6XF+pAhJRXvn85kuDpDuEWm25QSM2ObTwjxAKMX/pXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ex8WHflyA1e9zuQxagZkbnxCowfWNmRRtN99Gq0Vx5ErkaaNbcZEgksc0eUxvTaf4APD3Z0PxGsy3l8jisb95NOU9HLdMRc96z0BQOo0gL66ne0Y7FC9lIy5XebV4FFRnOzDtJp5A8kGyYyp6//a2eq5r+FbKVZbuINlPDrkxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6NE6iU9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6NE6iU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785391126; x=1816927126;
  h=date:from:to:cc:subject:message-id;
  bh=6XF+pAhJRXvn85kuDpDuEWm25QSM2ObTwjxAKMX/pXc=;
  b=f6NE6iU9m6SF39LvMXPNB7+orCtthfbNNNRffSE03QKR+E/8HTOwED+J
   MJtUZfvD72NxupOgwxhUTa/JjnN39K+IrkegqPBKyCkNAakRFwoWUgsPH
   p8VoT3DgUq0lyFtuZqoiN3y0MYvp0/5A5ZSs+bRYGyd48EFdLg2tYpkXs
   61mCtkVqHNRB1Bs6iSzOH+TLMdkIZLzpDJIpXXsHaMnSA3YAK6plEKVys
   G9V1M8IC9NI4DCG+u6OjOs83uHoss9tJdj5d2tiKtxiRSALOD13tiYMun
   t5k0Ez/7MRKF3Iak3MirbBPmYf/wqWZy7sAmBixQZz4yZQWfn4/QOxUyB
   g==;
X-CSE-ConnectionGUID: SrCOBgYIRPabV0Okhy9rZw==
X-CSE-MsgGUID: 5nrzazlFSLCCLr1aPC2epA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111549075"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="111549075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 22:58:45 -0700
X-CSE-ConnectionGUID: HRKT9zn+T/Ky1SIpMpez7w==
X-CSE-MsgGUID: 1lJDPQsfTX2QPTmVi+y/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="260262436"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Jul 2026 22:58:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpJmh-00000000g7i-3lDl;
	Thu, 30 Jul 2026 05:58:28 +0000
Date: Thu, 30 Jul 2026 13:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tzuyi Chang <tychang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 "Yu-Chun Lin" <eleanor.lin@realtek.com>
Subject: [linux-next:master 965/10444] Warning:
 drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in
 'rtd1625_gpio_info'
Message-ID: <202607301323.TOXqOMwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tzuyi,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   78bc8af4affb9a732504eb22eeac7d1e50883853
commit: a57e27c43b0315ee86c6896510d69be5257e093e [965/10444] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260730/202607301323.TOXqOMwp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301323.TOXqOMwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301323.TOXqOMwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'
>> Warning: drivers/gpio/gpio-rtd1625.c:72 struct member 'base_offset' not described in 'rtd1625_gpio_info'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
