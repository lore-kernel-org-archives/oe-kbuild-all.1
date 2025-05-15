Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518920297C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322036; cv=none; b=GAlb9Bz2kNSNebE7KH3on7/Np2dzWg0HrWDYnRDc881LcrwyG6po2KN6s147QyhINNPIoyjylxP1dEkkOsuLrt94UcMLHuyHXLIcWsVGXOANcnSb8RpCbVHIRXl1b0G6GieHQPNPwoElt/cDItUEQfwC8B5Z3jTO9f19SyVrI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322036; c=relaxed/simple;
	bh=7M7y/Y0ezdKr0iSriTPvtTugwTZ7WTX1rglfg5YhM/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZfLlzz3Fu+yy7HSzVeoMgFgoLhbOxgXZ3Zrn7IzXD3n8Fx/Y2PbmJq5Yicud3Ue30tBTP1ltUlCFb3OKylS2ZPM1VBYFhPPvezovxZ5XZ0xM480sPyhg1uIJHfbQXCyN3L7CSzYZCMjDt29aY29DPfnQAbtqhRIvh101jEw/K9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQT3iI/n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQT3iI/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747322034; x=1778858034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7M7y/Y0ezdKr0iSriTPvtTugwTZ7WTX1rglfg5YhM/8=;
  b=GQT3iI/noeYx0/y8x1/5Waz6VN67qAv0116vrw0doHSWBYUwRK48u3tv
   eNniyExKBZFiLGCXm2bw4NC0U2f4DHjlkC2YynTR8knRmaiHCOGyB5NCO
   qugHIE+Dmn5cs/V+/n8QGhKPIb3aVfwzOMNtCXH1kqIH5Vl+bthoQCtIM
   E84TcnH2o840FFv+zGQGzYImwNUG/MaJ7hmnUtIdB/ztSfM1u2fgchhJD
   spj/e6PLAk0o51pAROjWmjtrT7Wi/2RDKYqQeEPhOp7OjKtwKWCXSu9e4
   bARyZj1IvFUUn2ki/AUpAQ8yTGh0EvtiWW5GdM2Q2F+a8KseMZ2CZXBNr
   Q==;
X-CSE-ConnectionGUID: RR/Gl2E2S72eor7hLMTtww==
X-CSE-MsgGUID: AWIgR7ZNTb6KOzTco6cxHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53078565"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="53078565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 08:13:54 -0700
X-CSE-ConnectionGUID: 3O1NvBONR6K8LV9/zv7L8w==
X-CSE-MsgGUID: qKq8Z9wNRSml7XkOr81/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="169474966"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 08:13:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFaHO-000IUB-08;
	Thu, 15 May 2025 15:13:50 +0000
Date: Thu, 15 May 2025 23:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>
Subject: [linux-next:master 10717/11408]
 include/uapi/asm-generic/mman-common.h:16:25: error: expected identifier
 before numeric constant
Message-ID: <202505152329.ZRMQwmrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   484803582c77061b470ac64a634f25f89715be3f
commit: e9fda188b61524e6426fee21fe939ebc13866fc5 [10717/11408] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
config: s390-alldefconfig (https://download.01.org/0day-ci/archive/20250515/202505152329.ZRMQwmrx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152329.ZRMQwmrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505152329.ZRMQwmrx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/asm-generic/mman.h:5,
                    from ./arch/s390/include/generated/uapi/asm/mman.h:1,
                    from include/linux/huge_mm.h:509,
                    from include/linux/mm.h:1016,
                    from include/linux/kvm_host.h:16,
                    from arch/s390/kvm/kvm-s390.h:17,
                    from arch/s390/kvm/gaccess.c:18:
>> include/uapi/asm-generic/mman-common.h:16:25: error: expected identifier before numeric constant
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^~~
   arch/s390/kvm/gaccess.c:321:9: note: in expansion of macro 'PROT_NONE'
     321 |         PROT_NONE,
         |         ^~~~~~~~~
   arch/s390/kvm/gaccess.c: In function 'trans_exc_ending':
>> arch/s390/kvm/gaccess.c:344:17: error: duplicate case value
     344 |                 case PROT_TYPE_LA:
         |                 ^~~~
   arch/s390/kvm/gaccess.c:337:17: note: previously used here
     337 |                 case PROT_NONE:
         |                 ^~~~
   In file included from include/linux/compiler_types.h:89,
                    from <command-line>:
   include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough' not preceding a case label or default label
     214 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   arch/s390/kvm/gaccess.c:343:25: note: in expansion of macro 'fallthrough'
     343 |                         fallthrough;
         |                         ^~~~~~~~~~~


vim +16 include/uapi/asm-generic/mman-common.h

5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15   9  
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  10  #define PROT_READ	0x1		/* page can be read */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  11  #define PROT_WRITE	0x2		/* page can be written */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  12  #define PROT_EXEC	0x4		/* page can be executed */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  13  #define PROT_SEM	0x8		/* page may be used for atomic ops */
d41938d2cbee92 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  14  /*			0x10		   reserved for arch-specific use */
d41938d2cbee92 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  15  /*			0x20		   reserved for arch-specific use */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @16  #define PROT_NONE	0x0		/* page can not be accessed */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  17  #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  18  #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
5f6164f3092832 include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  19  

:::::: The code at line 16 was first introduced by commit
:::::: 5f6164f3092832e0d9b12eed52e09a76bf39c64a [PATCH] add asm-generic/mman.h

:::::: TO: Michael S. Tsirkin <mst@mellanox.co.il>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
