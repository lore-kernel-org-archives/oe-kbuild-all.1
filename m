Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7ECDF49
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765091106; cv=none; b=FOZwj0W8o+zmMRPcD5YN9KCeSjsfLmRSoNX4ql2BMCC2g75YLfx8zQMfLp7+1pdoVEyXyV8hEPEDo6fsf+27cEhJGSuw+K6qALhCbEGWRLXeBfxlK+skwQ4BLfNacpMa0Kg9ZfQD7GfqWL/mDEitKShxDY9tQAbV1nH3mOHrC2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765091106; c=relaxed/simple;
	bh=PRjTucAU3legu1LMDX7VcmKR1w62GOp8/rZcCCwymwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsObZkAypVRjL5LvFnk+WgXsh/iCUqF9jOD4s5vBtDrCKzX0QGrt8g8hFKu3z0MXGSNRTkcHqVErheagucC1ChKbp114dNpxxjAKrfU/SmJyBoHP5oMMkbwU5CwdzE3y+2h8g+Hg9D6lfbltFgf4iV7L5GOyHep6XsSYeiZg+Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRJ+P8Gd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRJ+P8Gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765091105; x=1796627105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRjTucAU3legu1LMDX7VcmKR1w62GOp8/rZcCCwymwk=;
  b=FRJ+P8GdNyt2x44Fp1ilTTcpmidw4kSdf6CGwj7Z87xAG/J2G+RAdKU2
   yL4rsldMfoJvcTLsqTFaOh+y+xlLJymiyv32n3bSbonbAnOe7Fxslt2gm
   jD4PmA42NW52WZYfxuSd1WYItkdnNCusoHPVUONz82w6qUNdRFXr9uji3
   oLlTHXCuSNE+knLFDG7jn/cUifjJiFlGwwsU1lJR2bG4RbZYNoAmhq3Z1
   7TYRewD1nDjxzcsZr1inPlt64+4ChW7YH19d+kiA2wsk40QjYQmqaNt9u
   EZEbKnaPbfvyQmJ6TZKsOD68DMgUcCF2z5vdJjaMQ/ZiOXb8CYPNAzNvP
   Q==;
X-CSE-ConnectionGUID: hPBYq0n8RJOlpJuaywWwSg==
X-CSE-MsgGUID: ppfHyOCuQlSp3xvCXZppMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67105483"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67105483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 23:05:04 -0800
X-CSE-ConnectionGUID: 7W0Cza6/S/iorCviO8YbMQ==
X-CSE-MsgGUID: sEYMKIfxSh6iVzKHBkcAYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="219009840"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Dec 2025 23:05:03 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS8pJ-000000001An-18gk;
	Sun, 07 Dec 2025 07:05:01 +0000
Date: Sun, 7 Dec 2025 08:04:21 +0100
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 52/72] mm/kasan/common.c:601:14: error: use of
 undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
Message-ID: <202512070851.mejaH1Ql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ecc46e02e0abe025a6e840cba2d647f23fd1d721
commit: 6b83afdcfa935db4f836906ca7f0fcafdca8d229 [52/72] kasan: unpoison vms[area] addresses with a common tag
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251207/202512070851.mejaH1Ql-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2222cfe7e11ff3e0434bc696856629199ef0da7c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070851.mejaH1Ql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070851.mejaH1Ql-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/common.c:601:14: error: use of undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
     601 |         if (flags & KASAN_VMALLOC_KEEP_TAG) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   mm/kasan/common.c:615:49: error: use of undeclared identifier 'KASAN_VMALLOC_KEEP_TAG'
     615 |                         __kasan_unpoison_vmalloc(addr, size, flags | KASAN_VMALLOC_KEEP_TAG);
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/KASAN_VMALLOC_KEEP_TAG +601 mm/kasan/common.c

   586	
   587	#ifdef CONFIG_KASAN_VMALLOC
   588	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms,
   589					 kasan_vmalloc_flags_t flags)
   590	{
   591		unsigned long size;
   592		void *addr;
   593		int area;
   594		u8 tag;
   595	
   596		/*
   597		 * If KASAN_VMALLOC_KEEP_TAG was set at this point, all vms[] pointers
   598		 * would be unpoisoned with the KASAN_TAG_KERNEL which would disable
   599		 * KASAN checks down the line.
   600		 */
 > 601		if (flags & KASAN_VMALLOC_KEEP_TAG) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
