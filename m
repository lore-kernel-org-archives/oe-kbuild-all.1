Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792559219;
	b=P/UiacYHVOUCNkV4DbFKbWN7lZ8fLbJB8ruIBhAMaR9/6OBTtNHhr2LUUVz9MHuClucD
	 lzZ3ur8/RNZavPG6zTZkHbojf+OH73awSs3+/Ayq4C9gxe0HLtuGV7Qf9xHYDUoR9FLfx
	 QxCszD01ssCU4AM01/V498omosT/ATxj7oGiIEsLD8P9ZrVN++YqXJcPC/tatIjB86/2s
	 pswp9I4DNosR78Ta/337Zm5BPzO+b5B1vVZ8+pC5V1/s7ckujpuIlI39LUiS5YbPv8HgI
	 avt7ZtQe6Fbsn6GMcaVMBu5GiwbfkdmHMfj5xxcuwVE+fhzu5pqvGZx0KbYkC1N0bOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559219;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aPIqXMW9ArcrByiPMHYnhXD7ZzUebzRTZdvWpKBgeV4=;
	b=qh0Pi4Nx0hRxpXSZTwPkgTZVjb52E/g4Yns+2/S6V8uiGv/VpIy1O/cpuFKofWBkTT2w
	 bvJy1pTLwHFZD3ZxCx84cAt8Ky5HDU8rwB0v51wUuH4x0od5fIIJCGfDYebZ4rpG8R8t+
	 33/Y9AYSnhnHbFgbDLplUok20TeJQXEdbPXyIRxI+cAik6/k21MdABuEaqJu4k+RUKhfF
	 I1DanUhU0dvEUqE4ZGo8xvFp/WECgAU+PjsTcw43KsRsMANJZmQ5rcNqavedFboNtaUJx
	 s8MzpeEmUPP1OD6FKuLQPyYvYo9qzYdKSPzC1nljiGkobwJunnP9/+tXS7bj+e0izmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gdVQKSzQ;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4A606A319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 05:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F4A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gdVQKSzQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792559218; x=1824095218;
  h=date:from:to:cc:subject:message-id;
  bh=AkeHxg+vlBWfMZhv2OZGkSvfLCbq2itfPPI3pv4Yr8s=;
  b=gdVQKSzQrxgF8Pw5wMRQBiVMLcvE2saATJRjhda2YQBNy7vcCDggfZAO
   P/mCH4tvuRWw2GKwHtQnjMPDEbxPfVRVdGQaWV/1iHCkXAEGFPUXPc/CP
   QlTMZFtJ+k8hBGtRq3/35cmrkNVnqJDo9yrxUiLCj66o8D7anTVDM9/X9
   2B1cjmH3zm7bmZbKUAb7QZgjS6+5X9yaGcAtGfKSoF4CyuAp5bI+kh1Jx
   oFzc/gQQEymQ+Pxjcptp59r+O3MAHHR94M+d1LNFAbtVGSDl5d/wdfjUg
   QkvhIrApdyRJz186P/+5ebSg20XsWeH1HU6yJNkNfh0nRxQ78khc1tj//
   g==;
X-CSE-ConnectionGUID: nVa7sEDSRoCwNLNUIc5TRg==
X-CSE-MsgGUID: XuTdhKuiSZi6BAQCdf/X3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1313849"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1313849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 22:06:58 -0700
X-CSE-ConnectionGUID: hpm3DHzISJaVy/HOlkMgEA==
X-CSE-MsgGUID: 7Rmp3RABT8mq/SXZonQHWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3338461"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2026 22:06:56 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJOXN-000000006dv-3gG3;
	Wed, 21 Oct 2026 05:06:53 +0000
Date: Wed, 21 Oct 2026 07:06:17 +0200
From: kernel test robot <lkp@intel.com>
To: stephen.smalley.work@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ssmalley-selinuxns:working-selinuxns 62/70]
 security/selinux/include/security.h:445:6: warning: no previous prototype for
 function 'security_compute_av_user'
Message-ID: <202610210751.vA7045dH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/stephensmalley/selinux-kernel working-selinuxns
head:   0e1151d851eec2f37b587f6f5a319e1e7021f463
commit: a47b908c78b6c2c8b187be4e0b6c789fd8f339e7 [62/70] selinux: switch selinuxfs over to using global sidtab
config: i386-randconfig-2200-20261021 (https://download.01.org/0day-ci/archive/20261021/202610210751.vA7045dH-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210751.vA7045dH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210751.vA7045dH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/selinux/nlmsgtab.c:21:
>> security/selinux/include/security.h:445:6: warning: no previous prototype for function 'security_compute_av_user' [-Wmissing-prototypes]
     445 | void security_compute_av_user(struct selinux_state *state, u32 ssid, u32 tsid,
         |      ^
   security/selinux/include/security.h:445:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     445 | void security_compute_av_user(struct selinux_state *state, u32 ssid, u32 tsid,
         | ^
         | static 
   1 warning generated.


vim +/security_compute_av_user +445 security/selinux/include/security.h

   444	
 > 445	void security_compute_av_user(struct selinux_state *state, u32 ssid, u32 tsid,
   446				      u16 tclass, struct av_decision *avd)
   447	{
   448		selinux_ss_compute_av_user(state, ssid, tsid, tclass, avd);
   449	}
   450	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
