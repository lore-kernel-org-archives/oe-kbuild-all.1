Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795903;
	b=SGE0xCm+hBj6ROwyrxCHxztia6IETiVAnLaK2qF5f21kBSbn2w1Oe7qSlPhqCB/Fh9nk
	 lg1LFVeF1s5TmA+dZFIpEgE/5yflarQ00UD4KIIC2ImUS6Vstp95idTggW9KbYbnu7BLo
	 6HIgF8JUznUkIhTO59YAVrJSq+6twN1v0W4y1itFDwMn3ghFPftelUu509G2jOx01O4C2
	 grhcpZJyJNMk90xBYmoLrgJ68U0KZf2I7X4OpVdqdWVRk7JoDAOQoTNBcb7BOvL3Hn5l3
	 LReL58Nv23KePOdMP8BCOVfYKQ0SbDdd/oS7vrkMjnDNkqZ6jmWynYKbG1/z/xKlSBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UZ43GznPAD/+LXMcZvWdmJLvt9ySFpDJGV/FRzPWpTQ=;
	b=p/5kaow9VdHSBcLodb0YzLJ2gqbWstFlIw0HWRibzIi/1uj8K6wpUz/JGDWhX31A5c5y
	 E9KdM5MmRlAZq2YVfdSHU23fSkDGfdryyEu2MODALyj8RS0k+CzfDVCFWuRPFomlXijhT
	 K9KmU7WOh3SkWpKsOEsUEvASTLETkfoq34pPeD0jS3fScFDH6Utig/4IYMFW61RLdmZXp
	 mRjSXWxaLfEyh8SJf2sl7SMr7KYL0D2VsPfYGiTPLa+JMNzdRTROyQoIwcSc4yEdlIILP
	 0qAZcj2aHRszb+JiEU4q9UhQjdmhH3zXc2d+RiU/t14CszDGq+qpP1d/dvuJmkIKQNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REkw89Sv;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6195606A32E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 16:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6195606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=REkw89Sv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795795902; x=1827331902;
  h=date:from:to:cc:subject:message-id;
  bh=EMoV7FYHv4hqgZsBfsnFfSu5Q73qvI2wFCR01Eg9mgM=;
  b=REkw89SvNqzHdvIH3d/cgnkLgnbjsDuu/I91ytfIDGERei725v9oc64a
   P2Q7F20pWibohvUwu7JGbw6r3UYqUI71UaKlQJdlQ2eoethUoiJIs4JaF
   t8edjEbacMCj5OBwWPtc9B27yP71Yp+ptQ1vfSkqtGjmHfIZ4vm5kawuK
   qfc/4Hcq70S5tkfhFnxQjIest5Z1P75TvDVVKA7fTr6UUjNbAbY4lZ91a
   I6l+xgv0UrrIBQTxJ8Igg/vp54u15iKu8SBuxrjKQon1i9/RJfsoE55pV
   kwjhOYO+P9sf1oN+4gYl7EoHURru/Ca2amz2hJwMkpBW3VX8G7AjOcSWN
   g==;
X-CSE-ConnectionGUID: /sjW0TIzTFWbdwBTqpN0CA==
X-CSE-MsgGUID: MAPi9LBUT6CTtWZxv1lTTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4801459"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4801459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 08:11:41 -0800
X-CSE-ConnectionGUID: E6N/ZSw3TNuZHhZYzHVVXA==
X-CSE-MsgGUID: /byjLRpgRjSkcaI/Y6HA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="13027073"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2026 08:11:40 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWyXx-000000000E5-3xp1;
	Fri, 27 Nov 2026 16:11:37 +0000
Date: Fri, 27 Nov 2026 17:11:15 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 337/348] Warning:
 net/core/napi_bpf.c:1059 expecting prototype for rx_ext_arrive(). Prototype
 was for rx_ext_gro_finish() instead
Message-ID: <20261127170503.fUnpqTcd-lkp@intel.com>
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
commit: f5e4fd56cb73fb0384533f06c7844c4a387558e5 [337/348] net: Let an extension be the path of a packet through GRO
config: sparc64-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127170503.fUnpqTcd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127170503.fUnpqTcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127170503.fUnpqTcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: net/core/napi_bpf.c:337 function parameter 'cur' not described in '__napi_ext_enter'
   Warning: net/core/napi_bpf.c:337 function parameter 'ops' not described in '__napi_ext_enter'
   Warning: net/core/napi_bpf.c:337 expecting prototype for napi_ext_enter(). Prototype was for __napi_ext_enter() instead
   Warning: net/core/napi_bpf.c:409 function parameter 'cur' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 function parameter 'ops' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 function parameter 'gen' not described in '__napi_ext_poll'
   Warning: net/core/napi_bpf.c:409 expecting prototype for napi_ext_poll(). Prototype was for __napi_ext_poll() instead
>> Warning: net/core/napi_bpf.c:1059 expecting prototype for rx_ext_arrive(). Prototype was for rx_ext_gro_finish() instead
>> Warning: net/core/napi_bpf.c:1172 function parameter 'cur' not described in '__rx_ext_resume'
>> Warning: net/core/napi_bpf.c:1172 expecting prototype for rx_ext_resume(). Prototype was for __rx_ext_resume() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
