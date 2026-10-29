Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793248476;
	b=cN/MRwoLRmHieHJI2OYbzvUQzLlf39o0kKnbn+JlGmbIWHLVpY5VgRFUipy5BhyfWA/A
	 pKZud8qTCNrCYi5yGFFBPcuNx0Gi0O/B4YkZ0xausNOkExcFvuPGzlPyBgajSQ+LutSny
	 CZWV7Jp/jNIe4p4asBcmnOcwk9K/eDGjII9e4BjkETVcNf9DJJFuQvgyhnGRS0bBlWptG
	 DKeQ0qsFUld7vBIfb/C5nzX7xPy1F544zDeqDo7dOe7g5RYll+JHK1mQEQEP0GluwvX1a
	 2ddwrXl1dsbqWEwcoTb3O/3d7lLieeLRU6RCWb8dyMSraNNlm4oP5WWe8bFKVM0Rnug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793248476;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sKuNCsRMWpe9gQWqL2d1H/93/1i9nCrdPIfWiyy2Zkw=;
	b=dlpWK2r88oNe2dmFZh3SckSU7+zwe8nKbYg+HGxnol40SKIkD5Dt5cdpmHClNW1FJSN3
	 M/8UOhIXlr387QLJCYBdxfLl5M7l8eSnWTOR6sGVYN3K+K3zij24X47dstrMfMrSjoRuW
	 BuaLfBU/Ut53YVxhVz79ecvW/SkKJjIfFVeDqQfiCCL+gDsQ/E/0+SFAKGJ/WpjSURd+0
	 DYSJ3IcVKMOeI/TQ0AH45bUkNMRwJFPZ71zSa0t6Xu7/X3fjW14+xmZZvU5JipjcNf471
	 cVSj6u/riWu/AwHIXWk6GAYlFqzX8ndg4UGUR6v4s3bvO0UjvvP+NFXD5RsRt6ENlUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3iHLnrV;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A42606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 04:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3iHLnrV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793248473; x=1824784473;
  h=date:from:to:cc:subject:message-id;
  bh=QNW09L29CAYqdn/EbKRkcxYf8IK4YWN3/u0FPrYXoNM=;
  b=E3iHLnrV39Gdkq4qAyzTZF58R+4BajYB9MRaqkxnGx45Lsv6deHYJapD
   LG7/0e55JcSaEs3MCm84pEqdoJLxKaZN0ImtAxjBCZULvGQnBWhjgLh0H
   iSojOkqj4buh25sQ475wpeu1lEC3vyePvLE4kvBwB2cyUjTjzHyttdUT0
   mRlHv/mevLneem13IvBLgxj8Rfd/bVZmQRttJAMyj2BoUIEEBvHQrXWtU
   nalZDsaDIsgmw6JVV2VBDhJfiO1S2pDjXMlnHxqyvVEp+PZy+FAj72eMS
   byBOYEhfKDh5gr3pczOwWiIjtjiaDgummSpxQAzIwt03IRiknBm+XfyxG
   A==;
X-CSE-ConnectionGUID: 3aR+0U5WQBGc9QrVdLVyqg==
X-CSE-MsgGUID: c2/NWi45S8ODkQ9hlLu8XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1879686"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1879686"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 21:34:33 -0700
X-CSE-ConnectionGUID: Stbq01D8QlCvZOiDjwkEfQ==
X-CSE-MsgGUID: 23aAoDLfTDyDFmOb7ArAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5043575"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Oct 2026 21:34:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMHqP-00000000Zbi-25QP;
	Thu, 29 Oct 2026 04:34:29 +0000
Date: Thu, 29 Oct 2026 12:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 1/1]
 mm/memblock.c:2164:13: warning: variable 'memsize_memmap' set but not used
Message-ID: <202610291221.kPhlng8F-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   7aa62a531907e90da2a2bcd2aa20be3e26c4d37e
commit: 072e0f68d1fe520c676146dfe87f9fc483564c7e [1/1] ANDROID: memblock: print kernel internal size
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261029/202610291221.kPhlng8F-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1da436a23e613c425fc9b868fc8deb979ede47a4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291221.kPhlng8F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291221.kPhlng8F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memblock.c:2164:13: warning: variable 'memsize_memmap' set but not used [-Wunused-but-set-global]
    2164 | static long memsize_memmap;
         |             ^
>> mm/memblock.c:2165:22: warning: variable 'memsize_code' set but not used [-Wunused-but-set-global]
    2165 | static unsigned long memsize_code __initdata_memblock;
         |                      ^
>> mm/memblock.c:2166:22: warning: variable 'memsize_data' set but not used [-Wunused-but-set-global]
    2166 | static unsigned long memsize_data __initdata_memblock;
         |                      ^
>> mm/memblock.c:2167:22: warning: variable 'memsize_ro' set but not used [-Wunused-but-set-global]
    2167 | static unsigned long memsize_ro __initdata_memblock;
         |                      ^
>> mm/memblock.c:2168:22: warning: variable 'memsize_bss' set but not used [-Wunused-but-set-global]
    2168 | static unsigned long memsize_bss __initdata_memblock;
         |                      ^
   5 warnings generated.


vim +/memsize_memmap +2164 mm/memblock.c

  2161	
  2162	static struct memsize_rgn_struct memsize_rgn[CONFIG_MAX_MEMBLOCK_MEMSIZE] __initdata_memblock;
  2163	static int memsize_rgn_count __initdata_memblock;
> 2164	static long memsize_memmap;
> 2165	static unsigned long memsize_code __initdata_memblock;
> 2166	static unsigned long memsize_data __initdata_memblock;
> 2167	static unsigned long memsize_ro __initdata_memblock;
> 2168	static unsigned long memsize_bss __initdata_memblock;
  2169	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
