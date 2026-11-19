Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057270;
	b=4XLHZUX56RSsbNUM5+rrRXtz4j8uGovv7pw6d+sPLafp4rBuno63w4hpbcmIrHNL3wDQ
	 ADusrnQ5GilfD5Rkpi6P/nUtAi/G+PwjRzXUTjjvwjRFctmzCPzS0ObqUFR68mooD/oKs
	 5xyoqa8WovUOHTsqHt/RbWqb300ESnWVOMqiJxVMqC1cZck5Gug4suxPpFs3IaxyTKSkv
	 EI35mbHVkoNgSKiF0/UXhlq3hQMLA4SN2xaJ2wpJl41fj60W9Tdb9nehowyiFhoSvJhKt
	 hsFrcHTytKQiqUQRlbbprhXjE6zv8fBMyI6UMNUFzSnLjpv/beqD2sBjlpKpoBvnbpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fyD54+TZXyAvAwoOdvMPt3+fHLrtkT2OYi5cYRINn8Q=;
	b=GvXjJkSlbFjIPweQP+YsFW3hIrd6kiRghsyDjK5pwGoaq/cFh+SU5KfMLaylQE3Lcr0U
	 +JkokhtGW0hVAgSWoJwM6M5zvFa582AWj0VqvCjufu1a0wy3szQ8Sh8/mb0QPvPLDWgU3
	 GiWhgEWTf0YVOFRHmShe+nc5M29hBY27O8EoHvfvF/fdgLOlw9NsamSZ7bSdXM+yVFfZn
	 18AVrYHE6s86j/On8QNQ6IIkYIqBKe0zoDlVEOK/ERp2ViJ8g5imyZJQ32v2p62kBOIFB
	 K0Ds3xiv4JULEri16I7oe3SnZYv0mFaHqjhyCTEcbhbkY+miRtw3+utIQ2tMj2XJi/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AloqPnds;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711A606A339
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 03:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AloqPnds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795057269; x=1826593269;
  h=date:from:to:cc:subject:message-id;
  bh=ZcLObOLViAskcE9Yyj1flqp8MUg4VaAyFk0GubN0nWM=;
  b=AloqPnds6EprlW8Lfu3R0zZn5+czvmrCTC2iVI8vHscaHqE78K3YJ2zv
   HTB2M2LeMxv7iihOpwp7/jTlE7d32fzf3PviBmH1CiBnk0tHByn5/4WbD
   ojqCa6utxu9QC/F+G9fvHko0O8vLUnJK+HlSGz2f7s91ZSgnUr5MelIUy
   p2VO+J17/ktYGyF7PWYGT9ooNtD8GQFdVkp8J+EV03A0SFwPUFO37zw+S
   QCKADaES27FRC29dDaRr18v5kpTmtsAHwMmG1CokQJfC2ie8NntWIhpct
   BZxD4/M1IJzFqthVT8xVR/P0vZZaUyn5HNtB7361DDP0aVmSYJz5/9pq4
   g==;
X-CSE-ConnectionGUID: EYyXkEclRkatjgncBsJb5w==
X-CSE-MsgGUID: Z0ZbIvoFS123YAwxiXUKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3905717"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3905717"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 19:01:07 -0800
X-CSE-ConnectionGUID: Ozt7oaEuSUekhTOclNxnyw==
X-CSE-MsgGUID: hMzA1s2IS+eR0EyECEHX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10189929"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2026 19:01:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTsOV-000000003bl-301x;
	Thu, 19 Nov 2026 03:01:03 +0000
Date: Thu, 19 Nov 2026 04:00:49 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:xdp-tcp 94/107] net/core/xdp.c:1180:18: sparse:
 sparse: symbol 'bpf_xdp_frame_dtor' was not declared. Should it be static?
Message-ID: <20261119035554.mYtmA3xj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux xdp-tcp
head:   a80dbed970ebe4f7d8b2f6be334b64b30cfc5014
commit: c1ffc7ccc416e1208cf3c2a5471789df7185c0f7 [94/107] xdp: Let a program take a frame out of XDP and keep it
config: powerpc-randconfig-r2306-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119035554.mYtmA3xj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119035554.mYtmA3xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119035554.mYtmA3xj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/xdp.c:907:17: sparse: sparse: symbol 'bpf_xdp_metadata_rx_timestamp' was not declared. Should it be static?
   net/core/xdp.c:929:17: sparse: sparse: symbol 'bpf_xdp_metadata_rx_hash' was not declared. Should it be static?
   net/core/xdp.c:962:17: sparse: sparse: symbol 'bpf_xdp_metadata_rx_vlan_tag' was not declared. Should it be static?
>> net/core/xdp.c:1180:18: sparse: sparse: symbol 'bpf_xdp_frame_dtor' was not declared. Should it be static?

vim +/bpf_xdp_frame_dtor +1180 net/core/xdp.c

  1178	
  1179	/* The destructor of a kptr field holding a frame. */
> 1180	__bpf_kfunc void bpf_xdp_frame_dtor(void *frame)
  1181	{
  1182		bpf_xdp_frame_put(frame);
  1183	}
  1184	CFI_NOSEAL(bpf_xdp_frame_dtor);
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
