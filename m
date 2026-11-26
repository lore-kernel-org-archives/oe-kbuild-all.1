Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699319;
	b=R80yxrCfM4nxKWoLRXI97Z0n0a8ZKt8qxKOWCZV5D4+BTCxO5g+2h+Kf62U82zLeaL9b
	 p7lh2d0RgOfkMLKC+lJfLK4Cx6Y+caAFkmEVrMjth+CrImAr2npIQx/SX8FkYTdK5hRFj
	 FWrb1aooIvls8pTHHyEyRetUmNk9lZpgfK935QVzXe72xQhBhwgfJqkwsYksWmTHMH+m1
	 ZliqNIZ/5io3xnLR3bPZd5M0/NUPXEoqij65QPgcAnhbT9V7dCMnGkWZXKubMnVtS08SE
	 WyjXN16uBdbAzgl+UtpGwfVjAJFk/cjHoSWWMMWNZv2IcuEmsTjnv0fTPpQji3KEr6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699319;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o+IKGY33LI/4UR2T1ioV9Lsm4KUenYJk3L8LJu2oAqU=;
	b=wmXhkU6YfQF9fQZAMJxnszLuEGNaTKfQcAUb4gBDmJCR9RHT/E7ZrqG7lFI4ljREyTCu
	 CKo2Jop2wvO7M1bh4vEGF5vAHwVJmBhkkGumm+TuHbI3qp9IyUS+nGgxKdfDM2JepH5PQ
	 oxBMl4d/6iycZK8/ipwzJ1mV0LWsLoihWpJ5Au2pdPGs8DMv6lKB7nKzu4R2/XzjUoM8O
	 Ll02rl0DVFMNzf5S0Fk2wfsm++8uiu327KOu7+mSMZuJ1g6YK29frWXkQKXW284tPTxOs
	 a7Z7f2TgVebTSFos5f9uB45386ANs8qoocrbMW7jCgCPa6omirar39RUzDw0caVQ+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ElDfkkUv;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C3606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 13:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ElDfkkUv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795699319; x=1827235319;
  h=date:from:to:cc:subject:message-id;
  bh=BJZD9yPKbvcN6W9D+zXkNm8VNP24d/zalauFK05dNqc=;
  b=ElDfkkUvH0HfbAgk/Wv0fDrTmsujKe8kndfxT37KWwsRkTieHkPAMo09
   uGbAea5qDA0y+fVgabigMRcbof97B39focGJXl/+XVhYQHtbSugRz1TEJ
   T/mRHz7Il9ZSIjLXGSDkbCyCXZJdlGws6bhQ+zwTDaH/5FqEZuQ2KpbUh
   H7DIvc37ZoWfDeeSEkX7o0YE2zkPiKFSnVAuiiETricPDvOKDptVrjymZ
   Ro+6Uee1RGr1LnIHLhiVxLLbhFwxWknoG46mCAjRKEN4kmGzB6KgCGGrs
   Es3snk9F8Wn02XdPHgzdcmaDT46T7CSVUHfXLNAAG8ToqRNHJmgQUlTxk
   g==;
X-CSE-ConnectionGUID: C4urjQW1TcSooY7Y+b7DoA==
X-CSE-MsgGUID: Bseh6ZSmQPaFA7kKMUcCGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4616500"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4616500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:21:59 -0800
X-CSE-ConnectionGUID: cECIvfpvQG+oNcmH5SEn6Q==
X-CSE-MsgGUID: tUQGsGwpRv+hJ53B5qU3bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12498960"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2026 05:21:57 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWZQA-00000000046-35Kx;
	Thu, 26 Nov 2026 13:21:54 +0000
Date: Thu, 26 Nov 2026 14:20:55 +0100
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [qais-yousef:schedqos 11/13] htmldocs:
 Documentation/scheduler/sched-qos.rst:23: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <20261126141810.r4m9XARc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/qais-yousef/linux schedqos
head:   8e826d3d7ebbfa9b3452a017ddcd4b827e318436
commit: 75e514d56a40feee2576d4a204338c724916c690 [11/13] sched/qos: Add a new sched-qos interface
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261126/20261126141810.r4m9XARc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126141810.r4m9XARc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/runtime_pm:312: ./include/linux/pm.h:3: WARNING: Duplicate C declaration, also defined at driver-api/pm/types:290.
   Declaration is '.. c:struct:: dev_pm_info'. [duplicate_declaration.c]
   Documentation/power/runtime_pm:323: ./drivers/base/power/runtime.c:1266: WARNING: Duplicate C declaration, also defined at driver-api/media/camera-sensor:117.
   Declaration is '.. c:function:: int pm_runtime_get_if_active (struct device *dev)'. [duplicate_declaration.c]
   Documentation/scheduler/sched-qos.rst:20: ERROR: Unexpected indentation. [docutils]
>> Documentation/scheduler/sched-qos.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/trace/events-landlock:359: ./include/trace/events/landlock.h:210: ERROR: Unexpected section title.


vim +23 Documentation/scheduler/sched-qos.rst

    17	
    18	  @sched_qos_type	what QoS hint to apply
    19	  @sched_qos_cookie	magic cookie to tag a group of tasks for which the QoS
    20				applies. If 0, the hint will apply globally system
    21				wide. If not 0, the hint will be relative to tasks that
    22				have the same cookie value only.
  > 23	  @sched_qos_value	value of the QoS hint
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
