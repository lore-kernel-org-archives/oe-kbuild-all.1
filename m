Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184469;
	b=ytPu7LHEDuzY7j3TvjcZJnRmk8BIP1Co2fcx4aswARd7AoZVbEuQABeIEO0ZMvFpEeJU
	 TwUZAUtkvXyBm1MkUxLHfXoBWALLtqcQ/NtmQRX4pIMlEvYPcVHQ1kXtGIZuJXwBGYWi+
	 4CrjhmWJgdqNnltahBHRXG6I+j9sbrK1yb4rBx71dFnOvl+BVtvMrOMnJHbnHMmI7FDp4
	 a9Bu+CvniuxsXDTfhYslmvL9eAVmK+VhZm92O8oGmw79EpRDPo0LHqXccrC+B3PCxKFT1
	 F/5ZVvl2/SVKwDVzi94aGYbCs9C97hCK5RdOfC2f0hDTKZYnoSV0GTK94YZiOPB6Lug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184469;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=N0Tuu5uDOCQs+TZfslsReW/XWhsem9UX92W0Y7noVv4=;
	b=trNoVGg/wGsXi4F0YTZcXDv9qgoImmzXuY0YhXZgMAg/2Vk28Kb8Ft5p/6u+kStM335W
	 2xx58a8nRORkiuA4puRWFmUwQoXutfBbdsISXSABT96Md5Iabl8Fwyk8QgqvQ4mZYZdWo
	 qpKa9WS5xN7RO9zGcgwLK9gHCvsmvjqBA9/VUz4qUhB4pZRSnbogD4tUTC+Y8+gGaEWav
	 rTKGG/cMPirmtYRwC+aG7fpKLGcu+hj/mbinzrhBz8kbqoT+eLZnrFKSu+D+Ur+Qi4xaG
	 hWeKATKnVujiimh1mmi3TDzCaf7Z2P0lb6epaboMmNXuxAQUy+tacaezD7TApH4cgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Icb68cwU;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719E606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 10:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5719E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Icb68cwU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793184468; x=1824720468;
  h=date:from:to:cc:subject:message-id;
  bh=XClwrusllkS7wj9ZQ5zgS3ICZlxgGJPrTfe17iNDrEM=;
  b=Icb68cwUio0fas5w3KFPi60S7nJ+AnCdK2jcM5P15eg4SGPDleyW/40K
   iLiW7b09rnO/UpMDKXxBxD2iDFUF6kp5ZEDyE4T9G+qH7/CsqzBe46UwH
   EeBG4+hY9CK1EftWau9djeaIfYSqbsHuxzirf9RyoOjzuzh892nFRC5Nv
   1Ojk5J9P1CHjv1KYovqZg/mmpcHK8N6vu9dkGG1nezmeqPsSOkVl4f2uI
   09fzvf8ODk6HtaSS/flZK/ApTIyRmQ/VCgsJUDweFZCH/dL7cNCo97ltB
   CT9ya/c+L5OK2T7B1jeHWINeYhCfBWwDSD550SCs5NrJxmglq67kD6CKj
   Q==;
X-CSE-ConnectionGUID: IRCJ3b6vQfiEjIu/yj79Lg==
X-CSE-MsgGUID: CiSqMk30Tu+jDPVTAZ/B8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1786486"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1786486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:47:47 -0700
X-CSE-ConnectionGUID: i43uK4PURq6dHXlSMYNCUA==
X-CSE-MsgGUID: Qd6VTyiTSz6rZJ9b9WBnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4773703"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2026 03:47:45 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1C2-000000004qB-395y;
	Wed, 28 Oct 2026 10:47:42 +0000
Date: Wed, 28 Oct 2026 11:47:41 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/large_folio 19/19] fs/f2fs/f2fs.h:2303:3:
 error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610281130.8xOnZsGi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/large_folio
head:   5b72086892ee05798082621df69a27afeff2b233
commit: 6d9668b701d81625696253d7d736b79d7c704a13 [19/19] diff: fix patch 1
config: s390-randconfig-r2102-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281130.8xOnZsGi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281130.8xOnZsGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281130.8xOnZsGi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/hash.c:18:
>> fs/f2fs/f2fs.h:2303:3: error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2303 |                 f2fs_bug_on(F2FS_F_SB(folio), 1);
         |                 ^
   fs/f2fs/f2fs.h:38:4: note: expanded from macro 'f2fs_bug_on'
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^
   fs/f2fs/f2fs.h:2303:3: note: did you mean 'set_cpu_flag'?
   fs/f2fs/f2fs.h:38:4: note: expanded from macro 'f2fs_bug_on'
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^
   arch/s390/include/asm/processor.h:64:29: note: 'set_cpu_flag' declared here
      64 | static __always_inline void set_cpu_flag(int flag)
         |                             ^
   1 error generated.


vim +/set_sbi_flag +2303 fs/f2fs/f2fs.h

  2290	
  2291	static inline bool f2fs_folio_has_ffs(const struct folio *folio)
  2292	{
  2293		unsigned long private = (unsigned long)folio->private;
  2294	
  2295		if (!folio_test_large(folio) || !private)
  2296			return false;
  2297	
  2298		/*
  2299		 * A large folio should always carry f2fs_folio_state rather than
  2300		 * non-pointer private flags at its folio->private.
  2301		 */
  2302		if (unlikely(test_bit(PAGE_PRIVATE_NOT_POINTER, &private))) {
> 2303			f2fs_bug_on(F2FS_F_SB(folio), 1);
  2304			return false;
  2305		}
  2306		return true;
  2307	}
  2308	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
