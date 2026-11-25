Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570207;
	b=Rttj0L6gN5xFoUJjjMJpgir2GCuYMIG43l58dl8OaV05a3fRaopyGDeXmhhvuvMjj12P
	 xzB52JJVwTPW0qlrDrS3Ld9bx2ejslfWyJoqQTDJ/HKprsB69CaMmDKQoVHU30MKQqEuF
	 fGXfEM9zQ6aqeDvrN6ZFbp1iwo7CMmIc805WMCG9gzJ8QQpXWQzK9dUcveZrFIkQ3nw9M
	 Vk5yW/7oUnZuVjatfMLH+3DjmGh3PdPfkxH+mWvJPGVo1OJ0iN0hBNGeLTyEGabgOLH51
	 2HCX8Al+gNzBCpuG16j7J2NsAnQTN40a/vX95Rimiaf2NNwN1RQI1euSGXkXYI49taQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=KIdj0G/r6ViSxQk82z/N/vDo+p0kZ2t/Qmw8nvqC9BY=;
	b=5kYzHF62Zo5j4cC4Ee0JxV64XmtPMYssCEijfd0aZXA5YTCSG1HNa6Zx++TkdnMZ9L02
	 Fgb1BCJYLH+83zL9B3PAUevoFF/B2HS9ab/EGY/mMxZGJ6q9cM6lR8dOdazwosI/xWoMC
	 S06KQZ2gJLAwG+VT9IEo/2wbrM3Hmd506pXaD8JCuuyUylrQVSwsuHKl0dplsZJvcc4x9
	 oZ8TNFdYo03OGozxOEf5gtZk6LAA/JxuwFzJdq0QH9De1kR6tsgQWUAGbTGmkNLxMV2K2
	 X67wRj/56MArJSWuarDRVXRQ9A6hadoKVHvFO5NDJqegAmp16sDNaMzXzwkdYeJK36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ijXCRyqj;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169C606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 01:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6169C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ijXCRyqj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795570206; x=1827106206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BX+iS+mb6FjoqZGRZ0cI6py0zGxzcHJt79IhSRCoLxA=;
  b=ijXCRyqj4oKPpV862wc5Urmsh7pYGkyuyxvHgRciYQOAWT93i7lUJ7vj
   fIbwgFOIwv0yoyBcahiJymBXxZMSlM9hTwYrXTWQjbjGk6FNLA+Jxaf/C
   5vR3dOP4AVfgLH8ua1/JZue7/KpHV8GJ+nguFR3TZjHXKkEvfCru50ab0
   wUuD34BDyUAL1AGuHtcctR1RSVzn4WbpEKD1wIR3xtObwpQbkcYIVvv9Y
   vLac8NBwmL52WTzxq9dgERNqqdkE0jRC5dKLRtyVG45CrMOcF/OiafYqA
   0PH/C8FN7vg7ToR7ODXQXQ/aZ4ayTup7FQHfciLKIzbxh8mKon1Uks+u4
   w==;
X-CSE-ConnectionGUID: Rsv/U5SnQpCDwIPWJpB/vg==
X-CSE-MsgGUID: o9zCUUs4Qa+LIMznS8c+2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4344973"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4344973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 17:30:05 -0800
X-CSE-ConnectionGUID: 2x+tvK4ER7iKY7YfJ8z86Q==
X-CSE-MsgGUID: EXl+qfGLQuSduR/qjAHH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11625588"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Nov 2026 17:30:03 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW1ph-000000005Tk-2gqE;
	Wed, 25 Nov 2026 01:30:01 +0000
Date: Wed, 25 Nov 2026 02:29:57 +0100
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: [linux-next:master 10834/11500]
 drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x |
 y
Message-ID: <20261125014128.XDoRk1Dy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3dd8c790a7b7027abdd568e36db5e82ffaea7c77
commit: 1a6684ee830ff0a15147e332991e1a5d34c55592 [10834/11500] drm/i915/de: Optimize the mmio_debug checks in intel_de_{read,write}()
config: i386-randconfig-r2300-20261124 (https://download.01.org/0day-ci/archive/20261125/20261125014128.XDoRk1Dy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125014128.XDoRk1Dy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125014128.XDoRk1Dy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y
>> drivers/gpu/drm/i915/display/intel_de.c:350:16: sparse: sparse: dubious: !x | y

vim +350 drivers/gpu/drm/i915/display/intel_de.c

   345	
   346	static __always_inline bool
   347	__mmio_debug_is_enabled(struct intel_display *display)
   348	{
   349		/* with || gcc emits two branches for this */
 > 350		return unlikely(!!READ_ONCE(display->params.mmio_debug) |
   351				READ_ONCE(display->mmio.mmio_debug_oneshot));
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
