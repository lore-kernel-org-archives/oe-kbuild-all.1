Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011801;
	b=2y/v/4zuhxQWCbDvYqufAMYVMOf58b/zMvlor4f9ufPsx/ReLK5R3Sg/7K7vKkE8G9rn
	 TZMJ3IuR9VK4AeFLdPLlU9LlhDzQWu6guRvSr2gP9NPQH7E9w2HXdihMlcr7En+gmk5Kb
	 7Ktqr4I+vE9Z5W5Eb28lebNIs4uhOzQk9GPUuQVrOdNv9sHoGjvyvjiMYZsOn56wcqpfm
	 vkO9UirDyHinYvmJrOwEj47gbq/o8tFJgXbKd3QkEq8YG1aMr4ruMwFPZoAsK8hhrlRRy
	 6QDLAVXRtdq9HOV5N+ZRGfd9Zkvbt3sy+QrKLmtNbukac6NI612eFZGdNLCBiBoN8xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011801;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MMstLJhU9hcQH0yKhMlaHG2fjPmupxkeWJjvO0lNCH4=;
	b=Fy61zCT6BMP4M/kJ+WPBP4kmzJ1vQtItTGIROnoaEt6pl2YbieY9mMc+nnUAH7zjxFfl
	 AibcBkEa27JgPLgN1wYZo2dWofQBPYG90nV9QjES2VTPNK4dw3gEiwRDmlL8/ot1XkV12
	 Z51r978ADKBZ01FygbGDEOaTdUBoDy6moWySr1oSlvUqEUHFt89CFk/5IG5N0CfvzHxf6
	 ySg/MMeMmVWAMXp7+BKbch4JPq3qZd1cHtxMZDQe/ayutxTf+XGaSnef16dZuhzgHp1kg
	 oiv9ocEtPNgsGBhQYaz6hdNd4WbXU/ObwWSxBuH7V5ScedVo13zbGkIoEL1WCdglxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eInxSWnJ;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E9606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 00:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B4E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eInxSWnJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794011801; x=1825547801;
  h=date:from:to:cc:subject:message-id;
  bh=0YADm/1YrunoEwrHqUP0efaiXVrHnQvCWK9Cz8sqlx4=;
  b=eInxSWnJNeD4jZGB9jULcxTT4m8erbQUuI7MTdVr6cI9GvLQmIDiCujw
   FOgvBnGH2DWuTAmi0nhEyoBGidGZbIGl28ri3jCt4ahAo0E3+35C34Xau
   7CagkEgyGeLbx7nQ4KNaIvwuOSmQ6y+EwbD8HcFi0Pe9+qqCej08Yksz4
   /A/DGf/qr2FE6CVO4GTyTH9k8IVV2HuS4yQGTaqOiXWGz/cFQ7KYOUDbS
   edn/S5Pu56W+JK+b9x7QWP+uK50LPm6oSCPPV08+YLJEXuMbchHPC8OW/
   D1yliGr4NDrWFIo07nBfrzjRMCMRm1pF2iFNwMzLBb9n4laS6g1UFKinA
   Q==;
X-CSE-ConnectionGUID: RvOt0rbbQuWvNSWSRH23/w==
X-CSE-MsgGUID: WQEqSpWuTX254iPoMUExOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2873729"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2873729"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 16:36:40 -0800
X-CSE-ConnectionGUID: sIFUZ3fJQgeO8WmDFiRMog==
X-CSE-MsgGUID: ReNPexlcTteOM2d2nkqMKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7510244"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 16:36:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPUQ8-00000000q8h-0o6c;
	Sat, 07 Nov 2026 00:36:36 +0000
Date: Sat, 07 Nov 2026 08:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 4/13] timekeeping.c:undefined reference to
 `__udivdi3'
Message-ID: <202611070840.ybbU24tp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   025c1312a0fa1a7672a6d1c89a3309e2f1196787
commit: 1f36afc1245c31ae40c5c261829f85c6a4200f29 [4/13] timekeeping: Reinstate proportional correction of ntp_error
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611070840.ybbU24tp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070840.ybbU24tp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070840.ybbU24tp-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: kernel/time/timekeeping.o: in function `accumulate_nsecs_to_secs.constprop.0':
>> timekeeping.c:(.text+0x1190): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
