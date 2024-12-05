Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8914286
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 01:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361105; cv=none; b=MdXQ8R2Ot0rPPnD6cOhkByhhGasQR8Xwa8BCIcdD60211l6/YpZbV/wnn9m5Tg/wE0daBK2YNlS8NGJJspPnHpB8MQkTDz94AgPICV7K7FYvJ2MeZgOCgHLyRC8IAmyjH6FnSXBMOK8thapfH/L0I6Sc3/aeTDSr+s4SB8xQiVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361105; c=relaxed/simple;
	bh=gEZdEdNoKf5uTX532jaGQuk+Fdml9nZi57DxpaMVYLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSdxB+K1TojfyrcAY/S9N3PClydGU9869NuszenW4r5Lpulrk/y5SM8efTeeLS5PnZxA50S0dO3/bGMb1GeVA+W09hWXFJN0E/8abSXEpqBXEKZQg2A+KxmpByprOPVZZ8gFjUsQIKb4bUktDGZqiYnaXa5qcwZ9Uj3dgMgJey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrMBKaeT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrMBKaeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733361104; x=1764897104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gEZdEdNoKf5uTX532jaGQuk+Fdml9nZi57DxpaMVYLY=;
  b=hrMBKaeTeHMXDeotwpxtomUDPw7Uks6waZp6G9KIYnVSNkdEWSOgjI6J
   yHt+lYAhfi/HcM1oTxYJbJU7YgphvMPgiVveovMVRH/uUOXYKoTcePcj+
   Q09fqbI1lwgM0u+dyoEOzzTjuFPcI/MCFEJXWbj8VKnxK1BZXchjPXJ7l
   YH3JSdHVDWIsA1K5+cnYKqMHLaNIs1KWE3F6OohwzvEhV2BN6PGmBKB9T
   bDVdrNJpNw1OmwlKwBK+WY7eTosKOVzNGfXxcmzwVV/mHTCdIzvpmXSsc
   v0bcOPSGuX89GXY6MlwtRydMiEss+6nJNpkr5t4fImkPvRWlc5+4a5S4u
   g==;
X-CSE-ConnectionGUID: 4h5x4G6PTSGLnnzMM53LdQ==
X-CSE-MsgGUID: GyKx/Ue+Rq+LOxGtRVYnwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33010630"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33010630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 17:11:43 -0800
X-CSE-ConnectionGUID: yb9zyFMlSImOkONMOMGBCw==
X-CSE-MsgGUID: F/8OwehiRGKXugBEP8Jl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94014319"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 17:11:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ0Oa-0003dV-2l;
	Thu, 05 Dec 2024 01:11:18 +0000
Date: Thu, 5 Dec 2024 09:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_6 3/12]
 include/uapi/linux/swab.h:115:21: error: passing argument 4 of
 'uprobe_write_opcode' makes pointer from integer without a cast
Message-ID: <202412050840.1GUtvMUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_6
head:   0c979434b43f72eae07adcc1ead90f252e87a308
commit: 80a56926c17a6c3a59d709e771e9e963025cfe0b [3/12] uprobes: Add nbytes argument to uprobe_write_opcode
config: arm-randconfig-002-20241205 (https://download.01.org/0day-ci/archive/20241205/202412050840.1GUtvMUm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050840.1GUtvMUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050840.1GUtvMUm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:20,
                    from include/linux/bitfield.h:11,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/irqflags.h:7,
                    from include/linux/irqflags.h:18,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from arch/arm/probes/uprobes/core.c:6:
   arch/arm/probes/uprobes/core.c: In function 'set_swbp':
>> include/uapi/linux/swab.h:115:21: error: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     |
         |                     unsigned int
   include/linux/swab.h:8:17: note: in expansion of macro '__swab32'
       8 | # define swab32 __swab32
         |                 ^~~~~~~~
   arch/arm/include/asm/opcodes.h:88:29: note: in expansion of macro 'swab32'
      88 | #define ___opcode_swab32(x) swab32(x)
         |                             ^~~~~~
   arch/arm/include/asm/opcodes.h:100:32: note: in expansion of macro '___opcode_swab32'
     100 | #define __opcode_to_mem_arm(x) ___opcode_swab32(x)
         |                                ^~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from arch/arm/probes/uprobes/core.c:9:
   include/linux/uprobes.h:185:49: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     185 |                                uprobe_opcode_t *insn, int nbytes);
         |                                ~~~~~~~~~~~~~~~~~^~~~
   arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:184:12: note: declared here
     184 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr,
         |            ^~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^


vim +/uprobe_write_opcode +115 include/uapi/linux/swab.h

607ca46e97a1b65 David Howells 2012-10-13  109  
607ca46e97a1b65 David Howells 2012-10-13  110  /**
607ca46e97a1b65 David Howells 2012-10-13  111   * __swab32 - return a byteswapped 32-bit value
607ca46e97a1b65 David Howells 2012-10-13  112   * @x: value to byteswap
607ca46e97a1b65 David Howells 2012-10-13  113   */
7322dd755e7dd34 Arnd Bergmann 2016-05-05  114  #ifdef __HAVE_BUILTIN_BSWAP32__
7322dd755e7dd34 Arnd Bergmann 2016-05-05 @115  #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
7322dd755e7dd34 Arnd Bergmann 2016-05-05  116  #else
607ca46e97a1b65 David Howells 2012-10-13  117  #define __swab32(x)				\
d30dfd490f7dc4c Justin Stitt  2022-06-08  118  	(__u32)(__builtin_constant_p(x) ?	\
607ca46e97a1b65 David Howells 2012-10-13  119  	___constant_swab32(x) :			\
607ca46e97a1b65 David Howells 2012-10-13  120  	__fswab32(x))
7322dd755e7dd34 Arnd Bergmann 2016-05-05  121  #endif
607ca46e97a1b65 David Howells 2012-10-13  122  

:::::: The code at line 115 was first introduced by commit
:::::: 7322dd755e7dd34bc5359aa27abeed1687e0f628 byteswap: try to avoid __builtin_constant_p gcc bug

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
