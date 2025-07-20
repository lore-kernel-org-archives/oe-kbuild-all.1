Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A9101E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753012375; cv=none; b=hQaEHcXK8NhlDwieqXiDH3I2860vcm3dj/xETLzeUxf9lsnaK9mAXB/j2HOazodSN7raaRFWNQnH5nIXlJmn65w/QlpMKLHO48YVKQP7X0F9vo+RislTBrgAibi3cr9t+xC/GOK1KeWTeqthRupi181FrRmAAqFc/AoxLkc2F2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753012375; c=relaxed/simple;
	bh=CAfOHOkIVn9qv3UZEw+ScDWxVs0+e5MVovBrDWJp7es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpcbs3ylxyMMOhpiTDVI5SLCxGz+UNr3wocjxdt9GEBJPX3sjTUJH/pw5/yD2M9FZ/yaGWTox2BtXUontxNV0FDGVz4Mo3TG5+fYh8Byke3FYP24/p81Jvv8t2YBlGj11bXjq6kEI3zuRamDqCIwgmv/NGwiKdFLaKEn9P9RfzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD/sjD9d; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD/sjD9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753012373; x=1784548373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAfOHOkIVn9qv3UZEw+ScDWxVs0+e5MVovBrDWJp7es=;
  b=aD/sjD9daq925RyLsYh+HBFIprx7hqE/tcmtIE4SuYGMcuR540sr1TTk
   yXILfBapN8Yuh2+oDmT37EG980U9HnwIE8ij7ayJOSp2fizSLF1Ho9uCG
   klVU2A5KoFaYD3DjpY+rKfD5nRD4wbZSsde4GyW6fnMxtDTxrGchr+hRP
   bhbllK1p+pFtFVHGsESKdj4G27kTVb42EsZWD1bU2D9LLt6IzglaZ77+c
   /oB8LkCK6k4kuOeMbLpgI0IcmEcrQurLD0h9QSUGe66fxlnK6rYVMEasS
   YOUhMjpR/9/s6Ha2ZTzFIGPn9l9WRotykGlgJkiy+VkF9VDT9KAvATTCn
   g==;
X-CSE-ConnectionGUID: bJYqwQZrQVqUF+iaCvfu/A==
X-CSE-MsgGUID: 3tF+vSA4RjqbXhe0CGpWJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55367368"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="55367368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 04:52:53 -0700
X-CSE-ConnectionGUID: IKTySCHITzKIMEP/ea05dg==
X-CSE-MsgGUID: 5Wn4utMBTYqOunJYuezEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; 
   d="scan'208";a="159040673"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 20 Jul 2025 04:52:52 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udSb3-0001G9-2R;
	Sun, 20 Jul 2025 11:52:49 +0000
Date: Sun, 20 Jul 2025 13:52:28 +0200
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
	linux-doc@vger.kernel.org
Subject: [boqun:rust-atomic-impl 3/11] htmldocs: Warning:
 rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist:
 srctree/tools/memory-model/Documentation/explanation.txt
Message-ID: <202507201306.YLYXasdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-impl
head:   9908e69eba39eeef235e409a753621914c6e8926
commit: 11a9b090ab621b5fabb49e8fef45c81b042bd2d3 [3/11] rust: sync: atomic: Add ordering annotation types
reproduce: (https://download.01.org/0day-ci/archive/20250720/202507201306.YLYXasdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507201306.YLYXasdv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
>> Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
