Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602A0368287
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805768; cv=none; b=WD5TufevmVysASMZVwa0K4wUAd4X6l6QqBCSRakFzuSR13JacyeXAkWTlrLG5QeoCesb+3oPtmRz44AhIonMMPZxz5ETo66Ww+fUGS3oZVzcU2SqwCb/GVN+TGNimm9gsdgy5n0beZcfYiQgr3oZrt3GONDxh759LC4zz/v++ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805768; c=relaxed/simple;
	bh=9byRlOtNpWpAGvU8q9yGyYnyxfs04b2nJHBWI7V1gtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lsljyiicWKuHUtxEJSY7n2hQ7OXk+S1aPg9vmFOLrGD1aOYCsGt/DMJHHNoR+5VxPor4+7RyRHXbiZWwTD51b2TAWAD3Wkhw9UI4yvWt7TvU44Xb0JLzfbgv1qrloQA+AjBks1BztZex99jnkqUuGiJn2kVhh33wKZpPbWBIaBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaF1Oi6q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaF1Oi6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770805766; x=1802341766;
  h=date:from:to:cc:subject:message-id;
  bh=9byRlOtNpWpAGvU8q9yGyYnyxfs04b2nJHBWI7V1gtE=;
  b=DaF1Oi6qlBl2t73E/Rtn4SInSQgQdVLOB/wcCC6ZzG+ejaC5YJ78sFpA
   TeDt3OGmS2t5eeiUweRsdI3lo9VqAcES+RHm1tFe1nIrJrVSWFLITBOWL
   a3m1pORm9QDMlcoNbdUy82GZ0izut3mQOM6ZwMOX3DBoDQ7aU/MBGzELP
   qPgpZYfYYTtQQ3tPbfEZ3jVkFWkMXPniQjIfZ65M43Mi6sUn4PEl1wasW
   BG4ZQDnIBKOnnhKiN7FArSVrxj8R9u421gknOPiTSJX+IJJa30Yh8tNjj
   nTaMLhr6q4BdBNqut2FYQ3Rd7DOI1Wo+MteesWqpDuKTPO6ffL7EsEENk
   g==;
X-CSE-ConnectionGUID: OZIFWeOPTTGUG0eWdr8xdA==
X-CSE-MsgGUID: /XacO9DMQlmGTozpv7OBrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71848262"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71848262"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 02:29:26 -0800
X-CSE-ConnectionGUID: 9xpu6vONT4KYzxRebjAZ/g==
X-CSE-MsgGUID: 8T53r3SBSZGQLZ55LZsavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="235191151"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Feb 2026 02:29:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq7TG-0000000013d-2izk;
	Wed, 11 Feb 2026 10:29:22 +0000
Date: Wed, 11 Feb 2026 11:28:59 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used
Message-ID: <202602111129.OkJgaX7w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: c2c081d009b3f82013b4c3fdcd6104340fef2201 [203/203] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111129.OkJgaX7w-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111129.OkJgaX7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111129.OkJgaX7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~
   userfaultfd.c:976:25: note: in expansion of macro 'err'
     976 |                         err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                         ^~~
   userfaultfd.c:979:47: error: expected ')' before 'PRId64'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:979:47: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__uffdio_zeropage':
   userfaultfd.c:1003:55: error: expected ')' before 'PRId64'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:1003:55: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:1037:9: error: implicit declaration of function 'uffd_test_ctx_init'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1037 |         uffd_test_ctx_init(0);
         |         ^~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1180:9: error: unknown type name 'uint8_t'
    1180 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1180:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1184:9: error: unknown type name 'uint64_t'
    1184 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1184:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1192:9: error: implicit declaration of function 'uffd_test_ctx_init_ext'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1192 |         uffd_test_ctx_init_ext(&features);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c:1216:58: error: 'uint8_t' undeclared (first use in this function)
    1216 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1216:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: At top level:
>> userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used [-Wunused-function]
     374 | static void uffd_test_ctx_clear(void)
         |             ^~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
