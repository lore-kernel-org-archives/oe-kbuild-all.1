Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA432D033
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKsAZhL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374039; x=1730910039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zkMo+HpQGCbO0MtOJkujMZfNqlJvSgM/gWD3DT2ip3Q=;
  b=fKsAZhL/EHRfKf9zp1iuN51LrroX3hBKeqMIY2nqqU0l54XrjXI4KtCA
   5iBxwK0vYKKmRbZ3+LtNOwejIAuVjchTdFHmmrwRFa/lMpnukW+O3WY6H
   KyJjmHQIVOV5g10Z0PRnaF7nme1mOW1dOX0N5SUyQM9H5jfKYNDMlMBZM
   m6p7B3N99k/tWwRS6OYM7WfksfQXIFLEDRddOtrkDVG4OrwPif/6K0Q+Z
   9b2+LAlhd3fw42q954S5C3JykkpR84zIH3fdxT7th13Wyo+yY8QQmlkGA
   mJE4jWmXYw5f4unH08BwQdYjD1gF9IDsm942Z+ZmfIH1x+Rn6ZgpI2mh8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368882822"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="368882822"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="906472038"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="906472038"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2023 08:20:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Ooc-0007Cu-2J;
	Tue, 07 Nov 2023 16:20:34 +0000
Date: Wed, 8 Nov 2023 00:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast
 truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
Message-ID: <202311072357.a2ejf6Jb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: c3c510ce431cd99fa10dcd50d995c8e89330ee5b bpf: Add 'owner' field to bpf_{list,rb}_node
date:   4 months ago
config: powerpc64-randconfig-r113-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072357.a2ejf6Jb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311072357.a2ejf6Jb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072357.a2ejf6Jb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c: note: in included file (through arch/powerpc/include/asm/pgtable-be-types.h, arch/powerpc/include/asm/page.h, arch/powerpc/include/asm/mmu.h, ...):
>> arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   arch/powerpc/include/asm/cmpxchg.h:628:48: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
>> arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   arch/powerpc/include/asm/cmpxchg.h:628:48: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2424:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +626 arch/powerpc/include/asm/cmpxchg.h

ae3a197e3d0bfe3 David Howells    2012-03-28  619  
ae3a197e3d0bfe3 David Howells    2012-03-28  620  static __always_inline unsigned long
da58b23cb976ab8 Michael Ellerman 2016-11-24  621  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
ae3a197e3d0bfe3 David Howells    2012-03-28  622  	  unsigned int size)
ae3a197e3d0bfe3 David Howells    2012-03-28  623  {
ae3a197e3d0bfe3 David Howells    2012-03-28  624  	switch (size) {
d0563a1297e234e Pan Xinhui       2016-04-27  625  	case 1:
d0563a1297e234e Pan Xinhui       2016-04-27 @626  		return __cmpxchg_u8(ptr, old, new);
d0563a1297e234e Pan Xinhui       2016-04-27  627  	case 2:
d0563a1297e234e Pan Xinhui       2016-04-27  628  		return __cmpxchg_u16(ptr, old, new);
ae3a197e3d0bfe3 David Howells    2012-03-28  629  	case 4:
ae3a197e3d0bfe3 David Howells    2012-03-28  630  		return __cmpxchg_u32(ptr, old, new);
ae3a197e3d0bfe3 David Howells    2012-03-28  631  #ifdef CONFIG_PPC64
ae3a197e3d0bfe3 David Howells    2012-03-28  632  	case 8:
ae3a197e3d0bfe3 David Howells    2012-03-28  633  		return __cmpxchg_u64(ptr, old, new);
ae3a197e3d0bfe3 David Howells    2012-03-28  634  #endif
ae3a197e3d0bfe3 David Howells    2012-03-28  635  	}
10d8b1480e6966b pan xinhui       2016-02-23  636  	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg");
ae3a197e3d0bfe3 David Howells    2012-03-28  637  	return old;
ae3a197e3d0bfe3 David Howells    2012-03-28  638  }
ae3a197e3d0bfe3 David Howells    2012-03-28  639  

:::::: The code at line 626 was first introduced by commit
:::::: d0563a1297e234ed37f6b51c2e9321accebd1839 powerpc: Implement {cmp}xchg for u8 and u16

:::::: TO: Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
