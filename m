Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790861;
	b=5tLh6y+QTxEPcRunEmtlEnXRdfYiaRHkptc+Zljgbg+xKj/KEg1+WQ2EZLczbPhDhF+r
	 Ke+iqyK9RMnyoOmdqD4dnO6z3b+6AE8YHhwnNnO9mv0Ft83jziCX+njTdxUB9Gy0LQg4M
	 lbRBfrXw9nTgrGbiFEJPWkpLAVIe8xLTOcVug1J/mscvzdpusoZl/LCxuLS9W4Rzpe2fC
	 sXZjbAG9b9jJaK5hHwi2tSZ4QVUsTTJbWjdH6nwG1wyZ+mFmpKzs3jepLeqP3PmmACBl7
	 dXlWw/Vw3bw3Zx7+lJdrOnZDtq2H3T6UQ4hcnR7igdEcPvctU9cyTEHsvC6348Bu4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790861;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ov8Kb1jIQRfmXmJBsEw2EhHEMma3NfRGiU2gqkTKY4M=;
	b=fHgBUgcw4EufNCnRLwgfE5NCCh4TrAhbmBFSUIDeCf5nrrd/+DTwt0uEFHZhQIc4W8XT
	 aJJlTw6h5RmCw54dNaoAQh31CFf2NIzqWaO9RPjiUzaWtS5BHYnNNTpbTxyzzArHhhEpV
	 2RGvDEllBDXDrm4XdZD5eHEWWieJ7RTKxS23nlnde8BK5pbX/zRTYeFKScC3rhH/ujLoC
	 vdKYC98X/UbgvS0k2N1YbLTO7VpqZJ0aGU5Pc0eDgSj5/HpJ7vuJ6jn3wYQiulV+OQaAc
	 PHdhrUparJrg/zeW3D29rbnaJlqscr5lLAdKHa+iI7CWcyqkzC6CTwR7JTvMkQzNyyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4xsWJ8q;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C0606A321
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 14:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27C0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4xsWJ8q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795790861; x=1827326861;
  h=date:from:to:cc:subject:message-id;
  bh=F+kAw45dkseeKUpsxoNRI7oY7rx3c5iWtBxt1xOMMDk=;
  b=g4xsWJ8q6VJfYaRjJLY3F0tyCmLEoZ2pia1ngWTKBklNuZw0Z00G9kk7
   dFCEP8zHiIYIc6zTZKbeu9uqb3MAL6WYRXpqGAX6yvT/zzH0p044d1Kzd
   pi/9U5DK8aZuG91IFk9W7DiAmd2/sFiJrhBh7jpOsd5FJovPkUW3CD7co
   r/5kcD4i2B8Q28/tED8iziu6KZSbUNlIzj4+OADvV201pfXNOgx5hdJrP
   uGXwrEn73v2vOcuoL939pnKjCMCr2SQVCAdh0Iw11/B4OM8ykMNMhZd/m
   0egE8LXRK8pMz0djoT1UlVRZv4H08jELMTRulrY9wCOGycgqDnsMDXBxw
   A==;
X-CSE-ConnectionGUID: Iv+xwDxIRrWx/0cYpm1C3A==
X-CSE-MsgGUID: j5H60urXQniIFwM2tM619w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4594097"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4594097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:47:39 -0800
X-CSE-ConnectionGUID: qdDV0z4YTj+4QOeVSacAvA==
X-CSE-MsgGUID: Wb3pr0SCQMGK5KIPB0ybug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12828002"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2026 06:47:38 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWxEe-000000000D3-0UM1;
	Fri, 27 Nov 2026 14:47:36 +0000
Date: Fri, 27 Nov 2026 15:46:42 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 335/348] Warning: net/core/napi_bpf.c:333
 function parameter 'cur' not described in '__napi_ext_enter'
Message-ID: <20261127154044.SGgEfLec-lkp@intel.com>
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
commit: d1b6c1f23aa8eadaca672ae3be7fa0b982b84b5b [335/348] net: Let an extension be the step where a NAPI is scheduled
config: sparc64-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127154044.SGgEfLec-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127154044.SGgEfLec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127154044.SGgEfLec-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/core/napi_bpf.c:333 function parameter 'cur' not described in '__napi_ext_enter'
>> Warning: net/core/napi_bpf.c:333 function parameter 'ops' not described in '__napi_ext_enter'
>> Warning: net/core/napi_bpf.c:333 expecting prototype for napi_ext_enter(). Prototype was for __napi_ext_enter() instead
>> Warning: net/core/napi_bpf.c:405 function parameter 'cur' not described in '__napi_ext_poll'
>> Warning: net/core/napi_bpf.c:405 function parameter 'ops' not described in '__napi_ext_poll'
>> Warning: net/core/napi_bpf.c:405 function parameter 'gen' not described in '__napi_ext_poll'
>> Warning: net/core/napi_bpf.c:405 expecting prototype for napi_ext_poll(). Prototype was for __napi_ext_poll() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
