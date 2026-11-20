Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133193;
	b=ECS/eEukSECgFvta22j+uC1ftnHcr9wbSO0/m3ldO84hwYHa/xWIqNpMfeWbdVoI/yle
	 701+p/bZJ4E6TmW6Ml9A4wCXMY6SHAJ+3mDC2pHYeuMrgBp179F1VNZ3Nas6U4T5FysWi
	 qz0XTUK/f6W6eAUrLnFr2kFR6qL44GPDTZDdoDoKlA+JxV/Zabj44uG9CCXDe8sWrhVpD
	 VPELCac/SQt67kCQe8h6vjAWquPDANWH05ldwuaFLRhuq5WKENx0KdObxXQmVTXGlBSr5
	 fFT+6V3ytpMfWkyWVhvo/WgQDK2bvpCr+fxv3gQ4KUjm6MaPJ92ExaiR9ccLogRszlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SwDKggnypwXh1tGxoTkkz8oEjQpr04cKrLTFMWNo9WI=;
	b=IjPzwBX0Sadz/TB3Z0zEzGRa786ArZ8HEGTBYZnA1FMRnaAFf5fgnyw5tWeJU2uMeoVg
	 W1HSl9e5ytvtZLZ/XuangrN0JbQvLm6vPjSHi3616alUKf5dlQAiCMgbQo13Hy9ZDKLZC
	 bZRSt4GxpXg05yABD+UqdSbcr1JBdu8KP4BKgoWPu5X/PZ1k5aiDY+AguP8ltJ3KzoeAJ
	 j7UElEz0lonU48FKAKnj0RLZCB9pHGIJl83+NH6rks6CF7rVypbATXVPxfMjwUPgIUGza
	 zPF+RAtFQZ/Wi+VEVpUvS4WOr709ujjFHC5jQ+iXVCAclhoD2MHBpT8Y41yTCqF9YAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWR1F04e;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D52960A261B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 00:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D52960A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lWR1F04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795133192; x=1826669192;
  h=date:from:to:cc:subject:message-id;
  bh=cm3Bh5FT0GlqKs8rVwCO0J/1cIUGmAakgNiYyM4Rzy4=;
  b=lWR1F04eBq7Z4SxJB2c2YCs4VnxB5YtE9e4hdber8y0rwLrlEWyWq80m
   5LaxOiU7TntYfquOkHzflDXsntcwCczBT2NMOvfKRU7MGIPLdiwQc+KfZ
   wfcOZk+yQILILKfd5sqXxY4zUxAIeMvZTR6PYDDMMKG98zGpytNfZKmCF
   gKLBu416az9sBfwuNazAw93tX9951y2M+n92FWBzK9904oSgKVdaILslK
   UVtyA237THFEA38zKTM5dn4RlP0WblB6ewQckVHKRZJiclT5YrCgODLcR
   ZEH0l4ezvPxzIlbcxTdOxcCxr7J7zDgahPsQKF/YiL8aym5leggmLK+WS
   A==;
X-CSE-ConnectionGUID: 67qfhfs5RwyB0G5gQ2aOcQ==
X-CSE-MsgGUID: r81aiecwToKqCffsSFhpSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4006637"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4006637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 16:06:31 -0800
X-CSE-ConnectionGUID: l76968rDQhq59ZyG8p2/og==
X-CSE-MsgGUID: RhNGcNiFTqCIthXuP5LGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10982282"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2026 16:06:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUC95-000000003tl-0pMQ;
	Fri, 20 Nov 2026 00:06:27 +0000
Date: Fri, 20 Nov 2026 01:06:12 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-zboot-elf 20/22] ld.lld: error:
 ./arch/arm64/kernel/vmlinux.lds:125: unable to move location counter backward
 for: .pgtbl
Message-ID: <20261120005637.8iy6yHZU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-zboot-elf
head:   50323def28f854c0d310b08f2477a1e7ceb1d680
commit: 5f5147424885e9c6b42ac8c3e347b2357952c9d0 [20/22] arm64: Add ELF program headers to vmlinux
config: arm64-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261120/20261120005637.8iy6yHZU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120005637.8iy6yHZU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120005637.8iy6yHZU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:125: unable to move location counter backward for: .pgtbl
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:77: unable to move location counter backward for: .init.data
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:125: unable to move location counter backward for: .pgtbl
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:77: unable to move location counter backward for: .init.data
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:125: unable to move location counter backward for: .pgtbl
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:77: unable to move location counter backward for: .init.data
>> ld.lld: error: ./arch/arm64/kernel/vmlinux.lds:125: unable to move location counter backward for: .pgtbl
>> ld.lld: error: assignment to symbol __clk_of_table does not converge

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
