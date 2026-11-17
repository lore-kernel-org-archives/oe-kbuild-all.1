Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877533;
	b=ETfoUyiWycWt27FgYcmQbw9gPo5j7m68vdRZ0t/1YFc7kyTprSP7+FzyS2mg5G0lKbFX
	 t1WDWklY1Wqtq19hVybABW8Vsp0l4SZTBYOdcqU/ypaDhqho/sYRI6DS5xKlvZ2xMNRBe
	 k4bfoHiUN3mGWxP/5vSmL9M/LcTo0QnqaAk74JppKPQ9/TgvQGWo37ZGkpetplSHw9YxU
	 SmtdgjdGy/0I9U9dvIi7E1Cn1nE0HPgslyMk2L+QMRG6+N4LTP+ZWeyqc7QFeh90G9laB
	 14fGci+G/1nUtbnym3noR3nmH/q+2+yZNswdkaxus2+AfwKfILvAGANwMHV36/XOadg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877533;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=c8vpMrJvAI9b5K2c5/QoPtHo30BfgMb1jNapE8nHnb0=;
	b=ktnQK9URyOJJzZpF363w39QWGvxKvdqwoSJCG3zZv8wJ+pjeeFG7fPxr6Ig+oIFO1Sax
	 /ygjnWzFgexnjEjlWUEPJRK88ZpO1QoCHDeTaVIy2+RMQoi3FCvlRrtaT1f+/zL6GMcVm
	 8Mf/G1FyLCZ6SSqq4NYpfH7XnuGq04G+3dWxXMiL+HvRyYePlOymIQCkewxMn25f5XMka
	 Tq/QxXAw0XWH9ojAtoQEnmsvI13eGfVA5zmY8gXM6dNzVJYA4K/cedBQxN8LAMf27StMV
	 Zd4dfe8O6+4hjsKPts6AkNlcvvz6HS1facAkbdls1ZctfVtXgE6txk/1+TXEfjn8lMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLX+Ujg5;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AABA60A5BE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 01:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AABA60A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLX+Ujg5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794877532; x=1826413532;
  h=date:from:to:cc:subject:message-id;
  bh=I72BCpC0QmftX2AEg7KmyAzOXbsqiETACJVenO41R+8=;
  b=TLX+Ujg5SJHmn6Xm5c3nZ3x1/C4Ph3/aX+1oFzF35MKoK3wZcLYimOqQ
   F2+XiOOnjJ7uRxbS7C2wTiIiGxvdlnjn7CNYefchy35P3A2lsP72zPwOC
   Djfrfiva1Lq9z3rYq86DUoD7OQgYmluGp4Wma3lDkTMq6eVgeiG8Iaejv
   0UpAPscA13gOMyg1RttPaSo/brtMmkpxUNI7bfEoWDiF7Z6S713Js0Rso
   TXZmh+EnldzNoFRqzANkH+qDu1uzRq/R+dhqbbEbG0nT6/wo1Ty3L7sXX
   LJOvn4HepDB4V4YN7RqGBHsbrC9E70iwZp57vQk6RYIhfy+s1YnctuxtY
   A==;
X-CSE-ConnectionGUID: b8lOnJqUQiqVO2XaxMZ0Nw==
X-CSE-MsgGUID: 1h6Vi+l/RRCNse9M5UssBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3712496"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3712496"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:05:31 -0800
X-CSE-ConnectionGUID: IxZR9whmSEawwyecs+OoJg==
X-CSE-MsgGUID: L0O7nPJiR9mE/cB8FaZc7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9628958"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Nov 2026 17:05:30 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT7dY-000000002u2-0eXK;
	Tue, 17 Nov 2026 01:05:28 +0000
Date: Tue, 17 Nov 2026 02:05:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 1/1]
 vmscan.c:undefined reference to `folio_total_mapcount'
Message-ID: <202611170106.7JTddn5c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   72c13ffe75dfb4b732147ff48ad7b64d69fead3d
commit: 093bce68a3d77381073cf569c91da0c78a0fa8c6 [1/1] BACKPORT: mm: vmscan: put rotation-missed folios at the LRU tail
config: arm-randconfig-2002-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170106.7JTddn5c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170106.7JTddn5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170106.7JTddn5c-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/vmscan.o: in function `move_folios_to_lru':
>> vmscan.c:(.text+0x1844): undefined reference to `folio_total_mapcount'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
