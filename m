Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD01A9B46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765695295; cv=none; b=ZrXnEUZTzSVSIUl5r5aUjt1Aa4yu8nwp2rSmfU5nMG6+WHvLQBHxJBS3zQeYlsRDcls8yvcVhxUjH0ZP1wmsKuXbwMuHAmAErgtWmetzQxOUGoXf49P0RNJ9NZ+CJjUWTRYXS/l9XJAQBxM6ZQFvH1XdZ3N89k3BJ+YtEIPsOy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765695295; c=relaxed/simple;
	bh=2baHdiLjN368xW9TXXcKB+cgAoUovU0UHlUGYZYvcWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYroGkAiZ7mLPWdLLdxWGkOBAYyvvoXb1ay1GL42cQ0zrurUvcoWDZZ7Mhimv5ALE3hNgXqeN3z7fBrfuLQ9dnupvv/+9LKl5T4/A4rFIBVJ5860vSs2GgTlOa91fTnGuECIU859o9TvfXARCo8Fx4uEWxp3tSEslDLmkXHdX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDV9IhYg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDV9IhYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765695293; x=1797231293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2baHdiLjN368xW9TXXcKB+cgAoUovU0UHlUGYZYvcWA=;
  b=nDV9IhYgdOoO2rTimUd4MnAxBRRA1yWI28+ILd7zHAHy7zDMhFo66OUL
   RdpIMX0B+xzdhkS+ldGyT2dA5x40IAq3ZRlKIZeV6xCxQadaURYr/8PVk
   4rkMQyPBsiDdnWgw0+S934fjcoF8hnxbuJVHDxy+Rk1NRw0roOmS+p/3J
   SM8B8c1HK8Fm88cR8KTCbcfn2QUDApG6LRTsvY9qRBuJTYpWEzMz3EnYF
   2Q/Ch9N3EMpIuao8vwYyr+QB+IRqYEFWz20cXD6moLgVFL9g12W/CYobm
   upCSVbbFBU/KkwmR0dTG9Y3Qg7mfldEfkKkB8r1nS56qCy+MoYV3hWKAF
   Q==;
X-CSE-ConnectionGUID: av8//ZfuSYC9t+4qTMcgbg==
X-CSE-MsgGUID: 31gky6n6SPW6Z+Xg2ch68A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71262445"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71262445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 22:54:52 -0800
X-CSE-ConnectionGUID: srbEmpiDSDGYf5I1wrWFAw==
X-CSE-MsgGUID: qoA/cPyfTWWfFaxHyTTCdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197959033"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 22:54:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUg0H-000000008ld-2WCv;
	Sun, 14 Dec 2025 06:54:49 +0000
Date: Sun, 14 Dec 2025 14:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/bluetooth/.tmp_btmtkuart.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202512141453.S1UQNjLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 7237c4c9ec92e1a4f6ef1f712bf9105d7b392c6a [1942/1942] Bluetooth: mediatek: Add protocol support for MediaTek serial devices
config: x86_64-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141453.S1UQNjLI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141453.S1UQNjLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141453.S1UQNjLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/.tmp_btmtkuart.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
