Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347623;
	b=Yx4ROsvJstiLMrevYV5qUcUWVrAYdg9DFiHw484RtPc5RnXD4V9syObcu8sgLoVEFoY6
	 ky8VDOJDcHUrFp9V3C2jvBZYrFB9lmfa4oZctOHSJQnuUL91qN78y2ILUcRRoVGe/Ymd+
	 z6QGv+fuvk2QIuyNofTYtut27k9xMmrjGKzrWNZz2aERfK3aZQZFD7q4dGhIEfRxL35fO
	 sOzUfjpc1q+26BdlY1UEyQepefjfdvt+4ZtHfoEEHe4xyibe+neAKVdvBziG+LgJ6mdnB
	 klnHLC0Mks6wZIbZ540qSEQaaeHdHqeITb1iKHMNp9krj86r8PArTs8mH0fx2v3lHBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347623;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s6gHaPNXzrpMXPWZHcpaCxOpM6AFYiCdkkI4ngR1KIM=;
	b=Vme8y3YUwdNTTdNZGXfxxayRoQTatNzFyNdrJDa6LtdmBoblJHqqCWjBBzdfP4vymITs
	 ZcufxgEsM2+UA3HY5JoSJ5dNeKilnUHqGAv5awq4mqK2OVgvRTIrfl1i7fj11IDZh32K+
	 oBlO2sjfI3z1U+jdx6zVo4TKZYafSA6tSMrAtAw3Nyh8PLH0RJMvfgYVr+MW8DOm76qz2
	 wjIwc9d/KVrXawu6cykbigZC4XLit8wUKzrZLP3U0ZJGnZOqVgcCbeTNwAr0GrRh2Mgrj
	 i6Bp8tdTnT3VKhvnIqvL15k+ZzO1GZDDVSdiB7FYfb4NzagwSyUZJaZHnyfnD2H+X4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMfaivQb;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC6606A325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 21:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMfaivQb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794347622; x=1825883622;
  h=date:from:to:cc:subject:message-id;
  bh=jSBIG8Q7i1e3unqcqlilbqxA9z17M6e4aQOfBizvU4g=;
  b=mMfaivQbK9fwq/hylrv5tMp6Fk6gZrJBEThehfLPltj3sws6aY54wqLj
   4hNT+xSp5c9Ah7CB9nPaY5+QIp/WIHUpLWJrvncoj7gPRCRYrk/wX2cmr
   28mbHD477meiu7kRdVqmLDtSEYcd7NCnXSd9TLUjhb26WQpXrV1RSlBQn
   yoWHxS4+kDqPo4ml4zD1fI1gR+iVb+/TpqnjOXX6a1hV8T/UTDryeEKEc
   rAVFTQafo/eGk3dgtR3PZ4kw79lMoSRhIvRHMf98Lm6T5Tx5aq7Z8RjUR
   3by2jLUOmj2vICd/ifiNHzSsylab+cNogDd4fkXg3oDhIQPdM9TlalHM3
   w==;
X-CSE-ConnectionGUID: zZeI0mfwSda7BYZSf5aR/w==
X-CSE-MsgGUID: hJfcLaNpQfChpmgT85y8Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3138145"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3138145"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 13:53:42 -0800
X-CSE-ConnectionGUID: v/rR0Q2ESZS+IWkp0+4U2g==
X-CSE-MsgGUID: BuE4U57IR5CGvtg7hNsoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8405262"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2026 13:53:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQtmb-000000000NJ-0AV3;
	Tue, 10 Nov 2026 21:53:37 +0000
Date: Tue, 10 Nov 2026 22:53:33 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-napi 38/46] kthread.c:undefined reference to
 `tcp_bpf_tx_release_task'
Message-ID: <202611102252.SAO3V95y-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux bpf-napi
head:   447e73927e821b61da411e58b9444d831373f359
commit: 0a47dcf5aa0f1dd0aee9752660a0d38e0b462a62 [38/46] tcp: Do not leave sockets on an xmit queue that its thread neglects
config: m68k-randconfig-r2100-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102252.SAO3V95y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102252.SAO3V95y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102252.SAO3V95y-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/kthread.o: in function `bpf_kthread_release_work.isra.4':
>> kthread.c:(.text+0x3e): undefined reference to `tcp_bpf_tx_release_task'
   m68k-linux-ld: net/ipv4/tcp_output.o: in function `__tcp_push_pending_frames':
   tcp_output.c:(.text+0x66be): undefined reference to `__tcp_bpf_tx_defer'
   m68k-linux-ld: net/ipv4/tcp_output.o: in function `tcp_push_one':
   tcp_output.c:(.text+0x679e): undefined reference to `__tcp_bpf_tx_defer'
   m68k-linux-ld: net/ipv4/tcp_output.o: in function `tcp_tsq_write':
   tcp_output.c:(.text+0x77e6): undefined reference to `__tcp_bpf_tx_defer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
