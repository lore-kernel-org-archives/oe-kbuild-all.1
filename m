Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800825;
	b=idgm4sDo/+xxcSInqVUf4MFiXbcGDT1gjDWN4HdaSOe1Dl1rJrjwjG7D2hSFHcgQ3W2N
	 gP+FuWjoBs40PNfXJVBsv86L59QKUHNlci3AxatC/twhLi2W96dqs3EhQQJoHIkmngNR2
	 45SxNTTuU7lWe0fd5Dq+WWakANDpL83tQjMGSKbaaEG4MePYy0Jw8NkFK8lQ21j4AMVnq
	 zMwc/3DeknRWcGhg0HChpXYJyzKbUrDvBu1TrXDCHjnkHhKQeM/TyELlBF+kcyyL1AB/d
	 023CAMhtJGl+TtIs2/OUv8ySHwV/ItACeyd9D0Vx+HmT8gSzcV9ioGf7jUzECGpyJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800825;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=61g4/X9MkIhBS0oWam3kPf7wbL2FTXJ9Vtakoq7A4Hs=;
	b=E0zk3AuuOze5AcE9sZmI1kPii+JbG9WKkAXgIAdqNW297DRTprTsBqCJ+qsZgc5FjR3G
	 UsHKIvzJ1NbyUWxQJCrkQN3obV9Eym9xsN52SrnybA9RuEFjenAt3do1wt2mw9nI1nxAW
	 CI1X7nZRdKqvCwDGzJ7TsLdmJFuXVk7mJE6/h8BMmeY3/bLMVLrL1vU5O9Kf9NpkpmiXL
	 f/VLLBtb7AduT/YefYP4whk7Mkc/8i7Jd57zBBo9MLm7JmeVhqUBOOJYVfxDYLmxmr+WZ
	 0+XsJ6TYl1+gtCQwHzkRGQriDe3Z+3948HmMFZO9+N6cTqbBpeNdgzE9pcqg0PPUc4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4wDcfAc;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F00606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 17:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4wDcfAc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800824; x=1827336824;
  h=date:from:to:cc:subject:message-id;
  bh=0iIkf8jIckHC7qTijnpTMgcQOsYVOmj/4Nma7JkZGh0=;
  b=Y4wDcfAc0hdSTae4Nsgto3ljcJQRY8Er2apRzq0N/dXYijUYcxKcjCRX
   7hKEwcj0RyBVGv04qKK6bc6sJU30KVvZDpR0MLFHVPesYqSW1sdLesmDk
   fSoi+JkNg36bqg+1N6cvHa0dPxeq3wq+Gapx0GutDWUpUFhVKmhgBeVLl
   ZLa0bLogV6NRXpJOW6rlyVPmdiQeouWOw+8w52Pxw+ywLSDToPc87lzJP
   dQhpajlMOsBuiZ1euEPuHOrfpvjNfLqsltwX/fALq+zQPCbFfFibmyKdd
   Ks98KWkQaH4Z8+fw82XhRkwt+o2tsTEqHqQwZ/7Nu5V8jMEHcIhuUd8MX
   Q==;
X-CSE-ConnectionGUID: 3JZl9a7+QTGsAoE+fJQYSw==
X-CSE-MsgGUID: pkR1ymqjTPyVWLWxn1UTFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4617778"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4617778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:33:44 -0800
X-CSE-ConnectionGUID: naBnTKR2Rf2bQk1KjeTX7g==
X-CSE-MsgGUID: rO7WlOe4RHerFKaqrg3Yiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12455938"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2026 09:33:43 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWzpM-000000000Go-2uBM;
	Fri, 27 Nov 2026 17:33:40 +0000
Date: Fri, 27 Nov 2026 18:33:32 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 341/348] Warning:
 net/core/napi_bpf.c:1213 function parameter 'ctx' not described in
 '__rx_ext_resume'
Message-ID: <20261127182727.1Qrlw9xk-lkp@intel.com>
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
commit: 0f214068c51f164f8becf246c29952472bae4b4d [341/348] net: Let an extension defer a packet to the backlog of a CPU
config: sparc64-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127182727.1Qrlw9xk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127182727.1Qrlw9xk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127182727.1Qrlw9xk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: net/core/napi_bpf.c:337 function parameter 'cur' not described in '__napi_ext_enter'
   Warning: net/core/napi_bpf.c:337 function parameter 'ops' not described in '__napi_ext_enter'
   Warning: net/core/napi_bpf.c:337 expecting prototype for napi_ext_enter(). Prototype was for __napi_ext_enter() instead
   Warning: net/core/napi_bpf.c:409 function parameter 'cur' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 function parameter 'ops' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 function parameter 'gen' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 expecting prototype for napi_ext_poll(). Prototype was for __napi_ext_poll() instead
   Warning: net/core/napi_bpf.c:1100 expecting prototype for rx_ext_arrive(). Prototype was for rx_ext_gro_finish() instead
   Warning: net/core/napi_bpf.c:1213 function parameter 'cur' not described in '__rx_ext_resume'
>> Warning: net/core/napi_bpf.c:1213 function parameter 'ctx' not described in '__rx_ext_resume'
   Warning: net/core/napi_bpf.c:1213 expecting prototype for rx_ext_resume(). Prototype was for __rx_ext_resume() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
