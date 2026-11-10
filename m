Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324221;
	b=JBpM7313LKR+iMiOzkof6ye+Acj83sXnsNadifrX4QbU1yZSQ8N46V6E1kIo5POtzzXR
	 NBr/HqwK9z9MTI3ZAUZdtUGpPB3l+AufdRF5Ft/7kQUpdvREXA/Ta4ZcXOkti44Dy5531
	 DoUZHAmwCdkHP27ahJI3G/WIOY/QAQEtM7aR2mxWyQ2aYVS69zI60HPdvqvj24PkQrIVQ
	 1PJQhu6cFESZJWatMOZco04O7XIkWDmOETNbFY6qCx7dHgO0lEhqptlg7atHhAgbj+yNB
	 p7XoCVmZIhWcIun4K8UHASBHpdKN1WuLx0ZFya0DI6geTb/dul/GmahmMRPvD1C4EuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=cqLAUu90WQmmhtd5DoqEWVs3jQTDsE1Syk/ElCX7mns=;
	b=HTQLZI5V4khcZSin2ko0/IzKle+HmL5sQ6UnkLSWbP6URDMELEsEGqYjyp2bkRIt1/bH
	 E4rfEYGbXFuPKjB8BiPYOI9sXuRYA4rRbdMnLoVACFJxU1IsDWQGDihbpxE1RYnLvGyHz
	 4EzksbKFxUpEnBG1RVYbJNT4UiDXAbo/kRFvJkWQsYGbUxmT2JVMgfUcJhI4gEO6pUY4J
	 WaRbtKPq0J2qhjfOKthpRqKvn+Y54/nnktK0Fo2RWZBzeC4IUYHqt+FOVTgViOWaRxPvg
	 7AO4ev60UX1+wDG7CEA7H2/xH86nct/6qsXwd5t5gt8jGOnpXY7mwB+bWo8VNKkxeuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+jUYxp1;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B42606A325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 15:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B42606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K+jUYxp1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794324219; x=1825860219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2R9gIMVbgGRUZ+f/2/9yi0jjLxD4ntX+ZhYNTju8YQ=;
  b=K+jUYxp18AfrhdmUJ/aTx9QpUU4yADoOYwL2SqI2HtiKWMkKm6tos4yF
   LR7SQPcyAD//BEjyt4g2rLTk/lrbrw25zoA/w1LTVE75iLXCf/Zch1TAB
   ZUog2Wf7hHinQiQ2X+ZfoYu7oDITP62DvzIQZ5CiD/bAaubiVGWUnzk5w
   wyHOzHGADDWsAvPc2RL77cqg4x4pdkklYQBncp5Y0dMN7FdjZ/hwN0EG/
   nvZp5NmOTsyzlMiLkM0RA0Nlnh8hXLxSduWjPi2B9rZj9pwmHYjdUPvRL
   wbhcgZC22XstMQyyMPJNHjH5kDrSIjSTIWvo1gbh+ndHm2APxuD+CfKUY
   Q==;
X-CSE-ConnectionGUID: cnDu+CXwRGCug1Ta6f2k2w==
X-CSE-MsgGUID: NVrFYuJpRRayzgWcDJKVaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2966319"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2966319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:23:39 -0800
X-CSE-ConnectionGUID: H1RqkyYcSVSNjy41hdhXGA==
X-CSE-MsgGUID: nOI+NhzoQ+mFQPzQvRD3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8039880"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Nov 2026 07:23:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQnh9-000000000IN-1wUS;
	Tue, 10 Nov 2026 15:23:35 +0000
Date: Tue, 10 Nov 2026 16:22:44 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 5/7]
 test-libbfd.c:2:10: fatal error: bfd.h: No such file or directory
Message-ID: <202611101653.L1tbBkfF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-vmlinux-h
head:   1f2193e366db8daf101725c9f0b0db6c0527d068
commit: 3a5205833034e9c21ebb9295a139c769b651be33 [5/7] bpf: generate vmlinux.h during the build
config: microblaze-randconfig-r2102-20261110 (https://download.01.org/0day-ci/archive/20261110/202611101653.L1tbBkfF-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101653.L1tbBkfF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101653.L1tbBkfF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> test-libbfd.c:2:10: fatal error: bfd.h: No such file or directory
    #include <bfd.h>
             ^~~~~~~
   compilation terminated.
--
>> nlattr.c:9:10: fatal error: errno.h: No such file or directory
    #include <errno.h>
             ^~~~~~~~~
   compilation terminated.
>> btf.c:4:10: fatal error: byteswap.h: No such file or directory
    #include <byteswap.h>
             ^~~~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/nlattr.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf.o] Error 1 shuffle=1618092038
>> usdt.c:3:10: fatal error: ctype.h: No such file or directory
    #include <ctype.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/usdt.o] Error 1 shuffle=1618092038
   In file included from tools/include/linux/types.h:7,
                    from tools/include/uapi/linux/btf.h:6,
                    from btf.h:10,
                    from btf_iter.c:12:
>> /opt/cross/gcc-8.5.0-nolibc/microblaze-linux/lib/gcc/microblaze-linux/8.5.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory
    # include_next <stdint.h>
                   ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_iter.o] Error 1 shuffle=1618092038
>> libbpf.c:16:10: fatal error: stdlib.h: No such file or directory
    #include <stdlib.h>
             ^~~~~~~~~~
   compilation terminated.
>> gen_loader.c:3:10: fatal error: stdio.h: No such file or directory
    #include <stdio.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf.o] Error 1 shuffle=1618092038
>> ringbuf.c:10:10: fatal error: stdlib.h: No such file or directory
    #include <stdlib.h>
             ^~~~~~~~~~
   compilation terminated.
   In file included from strset.c:3:
>> /opt/cross/gcc-8.5.0-nolibc/microblaze-linux/lib/gcc/microblaze-linux/8.5.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory
    # include_next <stdint.h>
                   ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/gen_loader.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/ringbuf.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/strset.o] Error 1 shuffle=1618092038
>> netlink.c:4:10: fatal error: stdlib.h: No such file or directory
    #include <stdlib.h>
             ^~~~~~~~~~
   compilation terminated.
>> btf_dump.c:11:10: fatal error: stdlib.h: No such file or directory
    #include <stdlib.h>
             ^~~~~~~~~~
   compilation terminated.
>> bpf.c:24:10: fatal error: stdlib.h: No such file or directory
    #include <stdlib.h>
             ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/netlink.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_dump.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/bpf.o] Error 1 shuffle=1618092038
   In file included from hashmap.c:8:
>> /opt/cross/gcc-8.5.0-nolibc/microblaze-linux/lib/gcc/microblaze-linux/8.5.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory
    # include_next <stdint.h>
                   ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/hashmap.o] Error 1 shuffle=1618092038
>> linker.c:13:10: fatal error: stdio.h: No such file or directory
    #include <stdio.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/linker.o] Error 1 shuffle=1618092038
>> bpf_prog_linfo.c:4:10: fatal error: string.h: No such file or directory
    #include <string.h>
             ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/bpf_prog_linfo.o] Error 1 shuffle=1618092038
>> libbpf_probes.c:4:10: fatal error: errno.h: No such file or directory
    #include <errno.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf_probes.o] Error 1 shuffle=1618092038
>> zip.c:8:10: fatal error: errno.h: No such file or directory
    #include <errno.h>
             ^~~~~~~~~
   compilation terminated.
>> relo_core.c:58:10: fatal error: stdio.h: No such file or directory
    #include <stdio.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/zip.o] Error 1 shuffle=1618092038
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/relo_core.o] Error 1 shuffle=1618092038
   In file included from tools/include/linux/types.h:7,
                    from tools/include/uapi/linux/btf.h:6,
                    from btf.h:10,
                    from btf_relocate.c:29:
>> /opt/cross/gcc-8.5.0-nolibc/microblaze-linux/lib/gcc/microblaze-linux/8.5.0/include/stdint.h:9:16: fatal error: stdint.h: No such file or directory
    # include_next <stdint.h>
                   ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_relocate.o] Error 1 shuffle=1618092038
>> libbpf_utils.c:11:10: fatal error: stdio.h: No such file or directory
    #include <stdio.h>
             ^~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf_utils.o] Error 1 shuffle=1618092038
>> elf.c:6:10: fatal error: libelf.h: No such file or directory
    #include <libelf.h>
             ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/elf.o] Error 1 shuffle=1618092038
   In file included from features.c:3:
   tools/include/linux/kernel.h:7:10: fatal error: assert.h: No such file or directory
    #include <assert.h>
             ^~~~~~~~~~
   compilation terminated.
   make[8]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/features.o] Error 1 shuffle=1618092038
   make[8]: Target '__build' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
