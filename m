Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966928;
	b=B7drVSpS+VRNwwedOUYhKC9pzEOCbYqyeWtXCCQ8Y301byLMG6JNMqvtq4VoT0rftmp6
	 bYqN3fFqVCJF/GRITnyuFMquh5Z68WBkiwxpRiPhdjO8712v/PgZIx3qe2RS/ZpsGgjsb
	 TjP8aVKxHnOyEKOSAcT4T2xXHm2H/qoJrYCKwZq/ccxJE+WG//0Iy9luJjcw2dSHbJpS0
	 99LmDlsRol2L54qDgNp4ZnLTzFxtJT99Bm25keWSCr234cLM5u4BEOv7fUOD4I1Ua/E5n
	 oZSboPsL3Q3JoWs+19JmiG7qphnLBjkrABThiYQ1e5+PDar3WBcnK34sIhSWggCu0PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966928;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=MlXRyYwBoTAXp2tQGy95RIZk7QndDlvDdIgBmLp9pLw=;
	b=FnpJcBoqrzVoiPmuwr+Jcls44itJnpZUpOMRAH2qOGVmbtIlOKFrswtM6lkxjWi50hXB
	 2bw8YbcKDYuw3fFwqW8BAh9U2JR7mCcO95UIahSmb40z1d6edKeCPQLjf31QyjLn/BpXm
	 014JTXv4J26H1IoNs7H/s4EWhYl87woGyST8k1QnNPkgSYUJ8TbP3nqtH1Pkv/i5CUVXa
	 MrcEBA3+Kuth8bFCzJQodz9sIL7H+cvJl33UNEgOLIRDNxsI36dvMspZp6joekTDTTUgC
	 2DZOG/j2+DNNtYjrXhHlVn/cpCi8lWkWIr+rXEBkjpLXkxjUwaml56iXBdvVM35RDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKVoBimX;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28138606D806
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 12:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28138606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKVoBimX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793966927; x=1825502927;
  h=date:from:to:cc:subject:message-id;
  bh=s45ac4JsesmUhWf8OzUcSiPVphE1c0O61NuIIbBDgiA=;
  b=oKVoBimXuVCBV9KSHz7kznh8Aofbu8d9CvXuroiDmlx+YjpVNid2skOq
   mVxJtz4KLziUbxbx5DKmtE4R9uR16BVP135Dz/hxGcAJ9SB3M7ZuG9rPQ
   6C+fwfEZ1/xQYNp5GbZOHSxMdOKfYRxktJ+WrknD1TWVV5P0Y0R4RY+Jh
   PMLlK3+wqRwY+id9SfBxqxKZLvhwVHMeRnAx8OVzSILt8GSxpNuhVGRhA
   PXRtZfBVwCAIqoKQP0qwCB8D6W77VuSYzBQfbunuoR52O+wb0xH6h03aF
   60iIJ5h1i8ClqQPpFPRQmDi0TfObOmY+c1mJ+RLI/Jb+kKa6miLKG0Ze/
   g==;
X-CSE-ConnectionGUID: 8RTvqLcURXS8m0WmJ2pJlQ==
X-CSE-MsgGUID: +XdtMnGeTSyWFOSmVZ3Llw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2878684"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2878684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 04:08:47 -0800
X-CSE-ConnectionGUID: ATp/hbA0R4a/mjbnCAID2Q==
X-CSE-MsgGUID: cMBgb3tYRtyR2rA0dhqKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7255630"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 04:08:45 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPIkN-00000000AEz-0Foe;
	Fri, 06 Nov 2026 12:08:43 +0000
Date: Fri, 06 Nov 2026 13:08:32 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: fs/f2fs/cache.c:147:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 148.
Message-ID: <202611061201.znvqT1oN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 4e80250bcfbc689efc6fd4d1b4e9d581ac3a7ea1 f2fs: cache: implement metadata cache
date:   7 weeks ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611061201.znvqT1oN-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e80250bcfbc ("f2fs: cache: implement metadata cache")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061201.znvqT1oN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/f2fs/cache.c:147:5-24: WARNING: atomic_dec_and_test variation before object free at line 148.

vim +147 fs/f2fs/cache.c

   143	
   144	static bool f2fs_cache_put(struct f2fs_cached_block *entry)
   145	{
   146		WARN_ON_ONCE(!f2fs_cache_refcount(entry));
 > 147		if (atomic_dec_and_test(&entry->refcount)) {
 > 148			f2fs_free_cache(entry);
   149			return true;
   150		}
   151		return false;
   152	}
   153	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
