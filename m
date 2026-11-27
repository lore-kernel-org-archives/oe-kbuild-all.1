Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788945;
	b=uNgP2U9p/Fm8FtGg6CPO7WvNVr30YrzBV52yqaOiSmnp5jt2hP3VzbUr0Azf97BwPBd/
	 kab7FrJ+s/KbSckAFZ5BuVntRy9XlbJjCPpTEnTXr65zgCH+QkO6N3sB+3MglXScMnad0
	 uwSvZK1C/SNUELGLpYZctUNeFWo9IxljYEyYxVlMj74ENKvFWc/WvLXNKERKqJjKTTfgX
	 NjFbZ99kgCwg3Ah6VedFMdGSKp70C6LVBLgRiZJcNOYxKHk5VlhcZkdq76c7t1/TOp7hF
	 6hysg7QnnUMgTGdzWvfbnsqGLeig/koC5HmLu7UCW3udVe9JP4DJB4WB8Shp9BOBDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788945;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VgHAkzDXTeP2fkUfi1ZKUcEqhD0GDhEUPPKmjc8F1lY=;
	b=YurGya+IlPjw4wE4tvkEMpNZGKL9k4M3+/+UZDhuwmcBocitYp/S2IsQorFBvKF9bYBx
	 gW9q9xx4HY/sToG1ULwYYNXdfKXdvN2OyYRgplncYMKx3ivP6pQEUKWoRHyBmqrYlEKRJ
	 NhQXmEdqhfX7oTX7hGAd/r9IxTr1KrxQfi2ism4GC3/yHyDLGmPayEA8300PX+uU8mW6+
	 i5Rr4rqDMXs1cZFdetY3XxnOM0jBRWyGoSBCchQcxahNeGPpVYEzPt8/hNoR16jNiiaHK
	 Vxg68RM9Vg3xTv3HUp+VhcjsG7vowhTnnP/tUQ/3Pu57cH61iDa0W97m5hzuHQI3W3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D14L9Ztq;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E3606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 14:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D14L9Ztq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795788944; x=1827324944;
  h=date:from:to:cc:subject:message-id;
  bh=k6Qy26RWqxLQMDEM0gsylXXXO/6VvXOaPYJjPYZe3EU=;
  b=D14L9ZtqE8RCvFz4FMBph3DgxWnlQH4eplr/C2JpSxA4n1Py6jgY1zqj
   Jj54Bldou+Rtd+WBVylrj6zOpmK+01BLBiSWDTKfWBekEBrf7VOZ6fSM3
   F6TB6paY1pzLZxYYTxS8JzkcFGg+SY6WamTqop0gU8730azXu0E374oyv
   O/iprA8rm6RYJTd1SjaPfoqcmgsBNW6yC1AQUsfcmXujjUUR4ZdRwRoRJ
   boYufEi5MjQ05EBRVnQV3VXrreNo+kjGy8IVXHg/DD68T8LzPgJykbQk2
   666XlePvPGCaD0vt+gZ69/EWUi0TVKL3cug2KuoQtN4QrlmcmmZUzv3aA
   A==;
X-CSE-ConnectionGUID: XVSLcqFYRxyz67jNEdAHQw==
X-CSE-MsgGUID: +6DWUQR4RZa1VmDden7ZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4700733"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4700733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:15:39 -0800
X-CSE-ConnectionGUID: 83E50hoXQIiR8T60wYZSDQ==
X-CSE-MsgGUID: Ku2G1otuToOZZ6hZ5yAWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12295301"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2026 06:15:38 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWwjf-000000000Ch-3KLV;
	Fri, 27 Nov 2026 14:15:35 +0000
Date: Fri, 27 Nov 2026 15:15:21 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 260/348] kernel/bpf/coro.c:46:15: error:
 static assertion failed due to requirement 'sizeof(struct bpf_coro_frame_hdr)
 == 24': sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR
Message-ID: <20261127151440.58qXWP9A-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   1d98f92a7b37670e804415b13c1d5d039706d4ce
commit: d2483ddc31994982d3337aa5d7edcabe4e6bc61f [260/348] bpf: Register the kfuncs that give out a coroutine frame in a host
config: loongarch-randconfig-2000-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127151440.58qXWP9A-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127151440.58qXWP9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127151440.58qXWP9A-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/coro.c:46:15: error: static assertion failed due to requirement 'sizeof(struct bpf_coro_frame_hdr) == 24': sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR
      46 | static_assert(sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   kernel/bpf/coro.c:46:49: note: expression evaluates to '16 == 24'
      46 | static_assert(sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +46 kernel/bpf/coro.c

    45	
  > 46	static_assert(sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR);
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
