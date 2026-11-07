Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020115;
	b=uIF1/4HzSA4zLt/hDyQFd0dDHq05SbvmwMsjZDlmQ59drqtig6wjGPcAlyBtZiShnTCi
	 pvBh52WWuzW8TOST+Q7tuPxpzgIENuYWC+ytiLOSwYPs1pT1lq8N1VFCFui64Zf9xoJeb
	 TyMuih8NU3jTse42LkCuPfHoNhW3d/JO6WMctsDhyXWX9QbW9XO7kEkOqYJmgpo1IlPYw
	 Pkoj7WnxAUxd5fxBOFIHsC7t2TbLFyKYIhV9MLgnuZ9sI2Qj9KbGeSvAi8FsvfFSxSt+x
	 4SoNrReq3UGFhDGtvU9ynEn3BJx6h7Ts6izGgxcBboRPSECrzpVdwFfHi+O/ptrwB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9M4aEEOmRcxaFJr2SwJJZb4p5we2wslepcu/7fbpgoc=;
	b=h4AupxxAaTFKpM58KUyaLaIJD561aGuKU64sXf2/UkIgZ/MluVTRyWqkIr2TgNhTZP9W
	 1zmzXLVmcgsxh6F1FChKI27/Uhe3uZ346LHD91AQqwXIzkFIAFXeH9zWg2Cn/0P8+nDpn
	 PdfcfG7CUwmBBA3ouT6VEIvgfnn/x3i2dkJx/q+nmBDqLRTT6dSb0/02D1oSbD/F6HPyS
	 8F9vpdtb/y7P/LMa5UfqUbh1va7Q5drZ+UsGNCrY7Q7PrMGl94qFp0FWrtI2fGPoat3Kf
	 i1s2TurGKNCRJ+TmINV4gxStr+5mIiwjnWra6AqY1ZNk0h2fQMZj5bmw5P0L0dfY8qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IgZ8cMgy;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F6606A336
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 02:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245F6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IgZ8cMgy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794020113; x=1825556113;
  h=date:from:to:cc:subject:message-id;
  bh=UXSD7m5hlTU4pVYzS0/Lol9EUAmn4j9CJgTa9hwK/YI=;
  b=IgZ8cMgywJ7HAE77ECmn1QkRJrhRYSqHy1nkEclUbQrSNDpefBX/OFtX
   zL1RPF2kx7vYDG0SN2+NsmOXAkcM2uQnbxBDxR1EF573EFH7MTu/MxRXa
   T8gKNZRqrl8CjQ33yOA0QiCpciQo5HpBVMvuZBNHPN4KaJubIlVO8p1i8
   qcohjqsanEoIS2QZMgfpT53CI2Lq2itY3ArX5NzyxZnqXBiHRgcfA/rcR
   qKewRsybGaeOcNQ9B9qxZTumoWo2k0LlhlYr3H6aU9X3p9u8sYboCL+E4
   /Qa9YUanW3EgxEBvlvdvOqta4TTRhjxw9MrmyH/BS25952VITef00BLNS
   A==;
X-CSE-ConnectionGUID: i8Xp8ORjTaKwdpUOKgqhSw==
X-CSE-MsgGUID: L+PpHzMFSTC4cTc9GzSaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2866153"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2866153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 18:55:13 -0800
X-CSE-ConnectionGUID: /gvrc2zEQ2+JJJpQqOQxwg==
X-CSE-MsgGUID: mBUIt1RYSOK8zBWoXk/BPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7411012"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 18:55:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPWaD-00000000qHL-0WNC;
	Sat, 07 Nov 2026 02:55:09 +0000
Date: Sat, 07 Nov 2026 10:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 9/13] Warning: kernel/time/ntp.c:581 function
 parameter 'ntpdata' not described in 'ntp_update_skew_delta'
Message-ID: <202611071043.CN7v7akE-lkp@intel.com>
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
commit: 5792dafb02651cc76646401c954e8289987b04bf [9/13] timekeeping: Add absolute reference for feed-forward clock discipline
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261107/202611071043.CN7v7akE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071043.CN7v7akE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071043.CN7v7akE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/ntp.c:581 function parameter 'ntpdata' not described in 'ntp_update_skew_delta'
>> Warning: kernel/time/ntp.c:581 function parameter 'settle' not described in 'ntp_update_skew_delta'
>> Warning: kernel/time/ntp.c:581 expecting prototype for ntp_set_time_offset(). Prototype was for ntp_update_skew_delta() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
