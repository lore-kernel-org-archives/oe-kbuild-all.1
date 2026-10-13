Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5E33DEC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871919; cv=none; b=mhcVNBfE0u/iOj59UxWuyJHUeWadtjLWho2JfrDLx2/JBtjntBhkA4nPvFxdK6knWFjys1+QfSpy0WXf1mLcyzUpVj5rI0O2kzvYYb/bV/PliFGJ4bWqGZOVpY4f8F7heYmyA7gSn6OsQA6j9X7aemOJfhViniUYlHWZDE489Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871919; c=relaxed/simple;
	bh=caDWAt8VmpZoZR0FNeUlO9g8x8i6EQz/qNrHqYkMoA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jW2fFNs+MGWCD1GPZUSgcaalCMWNssil+rr/r1ocVT8ilS/Dp9dx9c8hGBUMQJ+38YOyQezscIoRli5RkW7sEMxYhdBFD8KFQig0waR6jvxaMcaNRd5ZRk8AFZEPg63k8IAXRa68iOWnhCUHsrRkrPfP7/4FPakfDmImee5Pg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXvV4KON; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXvV4KON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791871916; x=1823407916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caDWAt8VmpZoZR0FNeUlO9g8x8i6EQz/qNrHqYkMoA4=;
  b=SXvV4KONCa3ybWJt7QVsAmhkgyPGXrIJfcO0qhFzAiGTy01urc+ZwHUn
   RfmjMtbMYMpwQcDE4sPIxmzMJe/EtdF9/vWg03ggS9qKMBBsLy3aKmKGI
   y7LcxUOUH6wJoWuw+ShXy1QNtO/gB6GNhlfg3uFQNECNiv6riEg+6JLou
   5AI2qFjIyfSivimtkg48JVDlACXmDZegWeAL6KAg2SsOXjAtb0E1TodWb
   GqqK+0XvH/Tp8cLzkWUmxN6SzNVmVpTnNLzHAliZs1UIc9VrSxDxAZEsI
   m0Y2APy6320uKE8QUTnLErbXmOTa1imyG3cMLabHgAcKPnJ3iqMQ5oy+F
   g==;
X-CSE-ConnectionGUID: uwbzvf23QeaUjIcEi+efaw==
X-CSE-MsgGUID: fGF6goqFTFyCvr88lg57vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="487789"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="487789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:11:55 -0700
X-CSE-ConnectionGUID: pnjMV5ARTM2I/+qjSjSSUQ==
X-CSE-MsgGUID: nNiSgCoNQTyOED40llIkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1397973"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 12 Oct 2026 23:11:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGVjr-00000000APL-26a9;
	Tue, 13 Oct 2026 06:11:51 +0000
Date: Tue, 13 Oct 2026 08:11:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 3/6]
 /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this
 target
Message-ID: <202610130814.nGh85q5e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-vmlinux-h
head:   6d13a8ed32e98298dc6df34e02935bca4e3422bb
commit: 08c5d549fb5c02a74a4893bfa9af23d29df857a2 [3/6] vmlinux.h
config: powerpc-randconfig-r2100-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130814.nGh85q5e-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130814.nGh85q5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130814.nGh85q5e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from hashmap.c:9:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from netlink.c:4:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from libbpf.c:16:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from zip.c:11:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from btf.c:6:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from usdt.c:4:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from linker.c:13:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from nlattr.c:11:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from elf.c:9:
   In file included from tools/include/linux/kernel.h:11:
   In file included from tools/include/linux/panic.h:6:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from bpf.c:24:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from gen_loader.c:3:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from ringbuf.c:10:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from btf_dump.c:11:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from bpf_prog_linfo.c:5:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from libbpf_probes.c:7:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from libbpf_utils.c:11:
   In file included from /usr/include/stdio.h:437:
   /usr/include/bits/floatn.h:97:9: In file included from error: relo_core.c__float128 is not supported on this target:
   58:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef _   _97f | ltoyapte12d8e f_ F__lfolaota1t2182;
   8       | _        ^F
   loat128;
         |         ^
   In file included from strset.c:4:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from btf_iter.c:13:
   In file included from ./libbpf_internal.h:12:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from features.c:3:
   In file included from tools/include/linux/kernel.h:11:
   In file included from tools/include/linux/panic.h:6:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from btf_relocate.c:31:
   In file included from ./libbpf.h:14:
   In file included from /usr/include/stdio.h:437:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/hashmap.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/zip.o] Error 1 shuffle=1409175667
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/usdt.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/elf.o] Error 1 shuffle=1409175667
   1 error generated.
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/nlattr.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/netlink.o] Error 1 shuffle=1409175667
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/linker.o] Error 1 shuffle=1409175667
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_relocate.o] Error 1 shuffle=1409175667
   1 error1 error generated.
    generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_iter.o] Error 1 shuffle=1409175667
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf_utils.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/strset.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf_probes.o] Error 1 shuffle=1409175667
   1 error generated.
   1 error generated.
   1 error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/bpf_prog_linfo.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/features.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/relo_core.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/bpf.o] Error 1 shuffle=1409175667
   11 error generated.
    error generated.
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/libbpf.o] Error 1 shuffle=1409175667
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/btf_dump.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/ringbuf.o] Error 1 shuffle=1409175667
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/bpftool/libbpf/staticobjs/gen_loader.o] Error 1 shuffle=1409175667
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:153: tools/bpf/bpftool/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=1409175667
   make[5]: Target 'tools/bpf/bpftool/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:40: tools/bpf/bpftool/libbpf/libbpf.a] Error 2 shuffle=1409175667
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:77: bpf/bpftool] Error 2 shuffle=1409175667
   make[2]: *** [Makefile:1648: tools/bpf/bpftool] Error 2 shuffle=1409175667
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1409175667
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1409175667
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
