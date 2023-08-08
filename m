Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A03710F5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691479314; x=1723015314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaCHBmEgVdFvHrcDnmw1PLTEDcoQk6CHQIyaiISwC5E=;
  b=X2PWKX2XGLWAmsx/Nc3R+O0W0cpbXMajvXcbno8u8Ai4oEQtHOGyqras
   ps+5werATCDzPu8hFSzd4hkXtOaMEWcb7OMKGA/8ctEQcG1eonYx3vKWo
   3fW4wx0o7KopjAAf04+i69CjabPUlhJqWNHUaluFe5ixiOYxrhg2d8WoS
   h6RhVX/V+WGaQGyFTaQrLEXrA35KGl4dlHnGZAVch7RngSKEH9TW+RNKv
   gwS7lypqv8vWv9EuFdnkyIJQAis/lNA8fdS+8lpCTWwPNRaaCjG+tuThj
   Be0Azt2bJVZ4mEuD3KHF8L7is6S2Y/B4kx6FhXzY4y0o9v0Ar09lPdkpx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360834602"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360834602"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681140891"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="681140891"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 00:21:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTH2M-0005CQ-26;
	Tue, 08 Aug 2023 07:21:50 +0000
Date: Tue, 8 Aug 2023 15:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 1/18] lib/iov_iter.c:582:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202308081520.3nhfaFPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5
commit: f008e454544ebdcf3742c4d4e3d06abe5868be00 [1/18] iov_iter: Add function to see if buffer is all zeros
config: x86_64-randconfig-r071-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081520.3nhfaFPs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081520.3nhfaFPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081520.3nhfaFPs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:582:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got void [noderef] __user *[assigned] base @@
   lib/iov_iter.c:582:9: sparse:     expected void const *const p
   lib/iov_iter.c:582:9: sparse:     got void [noderef] __user *[assigned] base
   lib/iov_iter.c:582:9: sparse: sparse: subtraction of different types can't work (different address spaces)
   lib/iov_iter.c:582:9: sparse: sparse: subtraction of different types can't work (different address spaces)
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +582 lib/iov_iter.c

   568	
   569	/**
   570	 * iov_iter_is_zero - Return true if the buffer is entirely zeroed
   571	 * @i: The iterator describing the buffer
   572	 * @count: Amount of buffer to scan
   573	 *
   574	 * Scans the specified amount of the supplied buffer and returns true if only
   575	 * zero bytes are found therein and false otherwise.
   576	 */
   577	bool iov_iter_is_zero(const struct iov_iter *i, size_t count)
   578	{
   579		struct iov_iter j = *i, *pj = &j;
   580		void *p;
   581	
 > 582		iterate_and_advance(pj, count, base, len, count,
   583				    ({ p = memchr_inv(base, 0, len); p ? p - base : len; }),
   584				    ({ p = memchr_inv(base, 0, len); p ? p - base : len; })
   585		)
   586	
   587		return !count;
   588	}
   589	EXPORT_SYMBOL(iov_iter_is_zero);
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
