Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793512008;
	b=2GJ161gbS5tZsTpCe4M7Peoq+NUcafNAXvc+uz0RyW8MGDe+/YNeW7TAkrI//fTkKEpk
	 7uS6Gf03zzYKBVsGsFCadZrrT5M4o0Hc+IG9jrCFuKJj4aB6RfqcaMbgI97KuPWv/ppEt
	 8kHRdkH6typIagu67Klpk35QMnsq5XpGx41w62GHTHGyZcwtC/6gvx7EvAQD5AeyDPCb5
	 Uc8rcmsy27fslO9iG5vz56Hpi6Tm1rBxDUzTFNqT4Ju7ri+WyuEuZU+cvpnRBwz0WfKZ8
	 0pAV25+lcI2OSoZpSOaBnsKhSV0VV0U5I0B/5omd7VQD2fvn0Vt22zqyp4KTtooN6Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512008;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZbWk5taZTqKic7rjStevY8VnrV5OyhCPzjqcOS0n/x8=;
	b=Catz5/q2pGxvoGs/jVuYovC2zHkLQ2C7NnKazC96vI+kHr7ipybqYmHpzTo8HMGTfy0+
	 gXb/aRgDuvrd8a7DnBGhWJLqJ5IX3O9EFHpxQeAbffO7sTYy/ADpeoaxs32G7yn49MGzO
	 qfw8pBg7FGOAiNAhQyYcaATcS9r1hQKTMPPOsduS1NXQQueXJ+Pzw/LJ0JUjwwLaGMy2w
	 yDW4H5BTxTLlAR/dAxe6y/y077NpHtQvScUjwghcWzoWHz/qiW2VFfB2N/1oYTq4YkMI0
	 WZAx+xado8AObq1N7JP0MMBm1Kj9XwumJH8wzt6SZ2Wb/YVFyOa8xtD4avPsUJV5jGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UFKoJFbc;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556FA606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 05:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 556FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UFKoJFbc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793512007; x=1825048007;
  h=date:from:to:cc:subject:message-id;
  bh=SXC252qXtMeCoFRuqHuCVK/7qyce8RvO6JqwYT4Dw24=;
  b=UFKoJFbcMVsaXb7R+K2hxKyf3815CCCykQ50bFt52uE1lgDMt6FJjtnX
   cpeAkbj1YAx50cOGzpJ520az+SVYcIrqdDYlB+A5MfjnIHm62+DJRofR6
   pR4OVwAYKicxch+mBuFj4ACNDDUwn/2FLizq012sRr9QYI8fMuQyezfDS
   G4Q7xAWvn+79lgmY6hdhwlbQhHVdNQ/33+bL1URX2eMiMvtHMuT+OnNye
   71LgEscGy30fajjrUtbfFaoubr0ym7uQRZ2uzUNoX/Nu4UprO5moaa+9p
   8U0aWrxMQqwkBYv+3GG4+nwKM6Adq9gITAe6Q0/yKoSdwWhPiSwrueQ+a
   w==;
X-CSE-ConnectionGUID: CgA1W4hrRguyeeqPcoNuyQ==
X-CSE-MsgGUID: uqp/2LpLRBmayGFIa4qIuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2131474"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2131474"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 22:46:46 -0700
X-CSE-ConnectionGUID: wdlqkpeXQg+B9IVg5Iw6IQ==
X-CSE-MsgGUID: gyXajfbSSqeNv0limLBUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5757825"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2026 22:46:43 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNOOv-000000006N1-0oTG;
	Sun, 01 Nov 2026 05:46:41 +0000
Date: Sun, 01 Nov 2026 06:46:36 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 842/842] kismet: WARNING:
 unmet direct dependencies detected for PTP_1588_CLOCK when selected by
 SXE2_VF
Message-ID: <202611010624.rTG05PS9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   72211702f642336d084c9cb7a986b6c351449c6f
commit: e0244015478adde7baee3a127e43091668d91289 [842/842] anolis: net: update linkdata ethernet driver features.
config: x86_64-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_SXE2_VF-0-0 (https://download.01.org/0day-ci/archive/20261101/202611010624.rTG05PS9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261101/202611010624.rTG05PS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010624.rTG05PS9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by SXE2_VF
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - SXE2_VF [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]
     Selected by [m]:
     - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
     - SXE2 [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && X86 [=y] && PCI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
