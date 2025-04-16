Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66517225A3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793959; cv=none; b=UW9INp7b1Chr6F5bsOsV3MBSbFTeSV70oONmcFKr0q2cdExtS5DiirLRPDW6AeOjE0PV1hS09pSAh803OWA9hCdnGiDE+5hnqJxqTO2hHaiqk3u1rTOEmvxLp/RU5GicWYIb7fsiUmzibMDVMw+4ZEDPTkPbTFCCGuL6RPCYNSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793959; c=relaxed/simple;
	bh=6uPKSK4QoYP/KJbGhSMgC0wgluL0bDBshJAkhyDqvFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrRk5rhptZl+DvGbaufdPUWEH2u0VJEANLUIWj1ih0pS4bjShZRdJ0i9XiAbrJPN5AlS3wmozdTpuH3Jz90pbodit4rF9ZvVMN52E8sCoDqLC8Pv7jhVnoz6WemlkRIRELtBvTystZiGGCX27Pc1Z1bFZDLpQH/O8fXz6F5EUXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUVy7AgS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUVy7AgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744793958; x=1776329958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uPKSK4QoYP/KJbGhSMgC0wgluL0bDBshJAkhyDqvFs=;
  b=WUVy7AgSFCskKsaUVdUgCfZHORbPtvSGujzKSv0KQhAZtMhhp+BchSHU
   A1AYXaXInH4qnzLNl14eavTZ6+3Z2qmWgtTKtzlhpKiZqlXZjFNbbmOGO
   WPlf1E+vHGAoN2F8RJD0WyBTYo0TwoT6Izj/dM5skgfViL9vySFa6FLV2
   q+gkcjIDtuO1gaB+kunoXgAof8HiE2EMota6JcUvjVHHQ3fWPys3+dmU+
   U/0wHleE7In9t2O0fVQxyQ8a30JsF4OqK3Gu7InXxYbjgfqQkeDpwzv7M
   FXgzKPZys9Cke+iSV4vgP9i7NDXnGxNePjq4Glu0XdP0r4w2cjXAi9b7L
   A==;
X-CSE-ConnectionGUID: onBq/xUeTMmC6mogjrDAMg==
X-CSE-MsgGUID: hLwnfTEtSeaF8l0b21pTUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="49026485"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="49026485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:59:17 -0700
X-CSE-ConnectionGUID: ynYo4QzcRMWZvnIZjb7rYQ==
X-CSE-MsgGUID: dRJZNTfESzepU2CRi5ir0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130237445"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 01:59:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4ybw-000JOK-0a;
	Wed, 16 Apr 2025 08:59:12 +0000
Date: Wed, 16 Apr 2025 16:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 195/196] mm/zblock.c:369:33: error: initialization
 of 'int (*)(void *, size_t,  gfp_t,  long unsigned int *, const int)' {aka
 'int (*)(void *, unsigned int,  unsigned int,  long unsigned int *, const
 int)'} from incompatible pointer type 'int (*)(void *, size_t,  ...
Message-ID: <202504161606.b5FstdkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   13ef12753ee527caca620af5ab72ef6249c20622
commit: 40d54ac31c6e801d94f2563158650b69c15fbf82 [195/196] mm: add zblock allocator
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250416/202504161606.b5FstdkD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161606.b5FstdkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161606.b5FstdkD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zblock.c:369:33: error: initialization of 'int (*)(void *, size_t,  gfp_t,  long unsigned int *, const int)' {aka 'int (*)(void *, unsigned int,  unsigned int,  long unsigned int *, const int)'} from incompatible pointer type 'int (*)(void *, size_t,  gfp_t,  long unsigned int *)' {aka 'int (*)(void *, unsigned int,  unsigned int,  long unsigned int *)'} [-Wincompatible-pointer-types]
     369 |         .malloc =               zblock_zpool_malloc,
         |                                 ^~~~~~~~~~~~~~~~~~~
   mm/zblock.c:369:33: note: (near initialization for 'zblock_zpool_driver.malloc')


vim +369 mm/zblock.c

   363	
   364	static struct zpool_driver zblock_zpool_driver = {
   365		.type =			"zblock",
   366		.owner =		THIS_MODULE,
   367		.create =		zblock_zpool_create,
   368		.destroy =		zblock_zpool_destroy,
 > 369		.malloc =		zblock_zpool_malloc,
   370		.free =			zblock_zpool_free,
   371		.obj_read_begin =	zblock_zpool_read_begin,
   372		.obj_read_end =		zblock_zpool_read_end,
   373		.obj_write =		zblock_zpool_obj_write,
   374		.total_pages =		zblock_zpool_total_pages,
   375	};
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
