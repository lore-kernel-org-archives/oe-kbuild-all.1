Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43592C9C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692262286; x=1723798286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1niKEiLvCBbH2AAc2v6sPoLisTjYgM2SdVp2rWJEK0=;
  b=RKosU0ppaGXxATyarK0buslN3figSkA1EctIWvozsb5XhPXrMXqdULOc
   g15jcpcOaBR3phW6vjGPTVebAvF0JmCpSwhlT1PuqKTALojDilkue6wDz
   vh2PihPX+X2z+TE8dMwMlDwRc7D8DKw4p1QF7lug+CGPQkb8tFpZHEb1R
   KPFzQVSnsrWCtiaJCJZl8X3PYVn75ycS7nB5Hu5dQu02kDnfmz/Zd1GbA
   LrseZ6sFszusmlUWCQRfQqUyDD9oUlUaOEIoqNr3LTWdUE+g/1gvjDmSX
   z4TgExNH+M53p6e8CxhhVshcsbf13rwOhoA36tk5VSXjFWV1MPiWqyQUR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371652464"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="371652464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878137466"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 01:51:25 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWYiu-0000yB-2O;
	Thu, 17 Aug 2023 08:51:20 +0000
Date: Thu, 17 Aug 2023 16:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: arch/powerpc/boot/decompress.c:132: undefined reference to
 `__decompress'
Message-ID: <202308171639.9kwRxWZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Justin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 788183a6e8b098b90e15214e800ae5194591018a docs: usb: fix literal block marker in usbmon verification example
date:   1 year, 2 months ago
config: powerpc-randconfig-r005-20230816 (https://download.01.org/0day-ci/archive/20230817/202308171639.9kwRxWZR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171639.9kwRxWZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171639.9kwRxWZR-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8544ds has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.tqm8555 has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8555cds has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8572ds has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8560ads has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.tqm8548 has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.tqm8540 has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.tqm8541 has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8548cds_32b has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8541cds has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
--
   powerpc-linux-ld: warning: div64.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: arch/powerpc/boot/cuImage.mpc8568mds has a LOAD segment with RWX permissions
   powerpc-linux-ld: arch/powerpc/boot/wrapper.a(decompress.o): in function `partial_decompress':
>> arch/powerpc/boot/decompress.c:132: undefined reference to `__decompress'
..


vim +132 arch/powerpc/boot/decompress.c

1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
1b7898ee276b39 Oliver O'Halloran 2016-09-22  104   * @skip         number of output bytes to ignore
1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,

:::::: The code at line 132 was first introduced by commit
:::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API

:::::: TO: Oliver O'Halloran <oohall@gmail.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
