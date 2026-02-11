Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCCB27FB3A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797066; cv=none; b=N15k7MnHJkEqDulgRpuU9g3PUbyT2zDXHYxCaCLkbqNw8UebTUHqMEOb9sFOsCPXfegwNzvk2dObY1KkSK197YU+88wHF3p+HKYCIvXz1mKAV2r6qQsGjfaZLyyHFAQNDTMFiWUV2FCIEKDLDVralBaD1G6NAwkCHxNnkYZPNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797066; c=relaxed/simple;
	bh=TirLCx9HbCZTXWKe7tNYwshJMEoWhET77TGrUp0ZSOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i5ePvdOPpAOZHwwGAvjDm0GcWixRCetvE75wAXT2I7v3Z6HhLyOK8CdtIXV/pHB8tYd0htN3bDE0BeWPIet0QrIcGbjqYV4PhtWdgb8w9a+3rEAegm7N2sKPnGbjaQnRrzjR7uP4rZ5wCtHNSTTyym9IBGic9ktUOy2t2Yt1yyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0QPms+l; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0QPms+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770797065; x=1802333065;
  h=date:from:to:cc:subject:message-id;
  bh=TirLCx9HbCZTXWKe7tNYwshJMEoWhET77TGrUp0ZSOk=;
  b=O0QPms+lyrEV8CAd0pix0iqEsH6NuJHiA9Eb1t9SYX5e/TooDrhenhl6
   tQz4d4HGF57ety4RUd4le9b+meaCvj+OlBCcJEUQXU9q5f6BnYCZFprWq
   MOQLVBCACY54ihajlpwp5OmB1nKYsgJr9IeBNjM70AL8neA3hu3gEr7eB
   JCaDenTZ8ikSpJcQD6p1V3S5ggJJ67yFjcOQ2CY6Khq6DZJenB50L7xw0
   WwLgXtZkSzI1z88hkcyO0vNTYUjFO9okVd8gRYc7tCvx81TPCFejWXTh8
   NBbg94e7azxhD1A74kwC8EAXeI+aYeIL0zjTscxXn+la7SB2Wl73spLY8
   w==;
X-CSE-ConnectionGUID: iA10rQyjQpKgXdWo/KquTg==
X-CSE-MsgGUID: PlE7FZf6SNOfZzXiH+9QeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72122157"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72122157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:04:25 -0800
X-CSE-ConnectionGUID: CMn/GIyKTJWx2x7k2rqqSQ==
X-CSE-MsgGUID: m3apI9G4TtC7lIbLJK4ONA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 00:04:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq5Cv-0000000012T-2zTI;
	Wed, 11 Feb 2026 08:04:21 +0000
Date: Wed, 11 Feb 2026 09:03:45 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 userfaultfd.c:373:63: warning: spurious trailing '%' in format
Message-ID: <202602110915.JRP4zyiU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 357700fcc3b51b66e2a790c5bb036d97916086af [203/203] FROMGIT: userfaultfd/selftests: add test exercising minor fault handling
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110915.JRP4zyiU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110915.JRP4zyiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110915.JRP4zyiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:373:65: error: expected ')' before 'PRIx64'
     373 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                                 ^~~~~~~
         |                                                                 )
   userfaultfd.c:60:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      60 | 
   userfaultfd.c:372:24: note: to match this '('
     372 |                 fprintf(stderr,
         |                        ^
>> userfaultfd.c:373:63: warning: spurious trailing '%' in format [-Wformat=]
     373 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                               ^
   userfaultfd.c: In function 'uffd_handle_page_fault':
   userfaultfd.c:597:17: error: unknown type name 'uint8_t'
     597 |                 uint8_t *area;
         |                 ^~~~~~~
   userfaultfd.c:60:1: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      60 | 
   userfaultfd.c:612:25: error: 'uint8_t' undeclared (first use in this function)
     612 |                 area = (uint8_t *)(area_dst +
         |                         ^~~~~~~
   userfaultfd.c:612:25: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:612:25: note: each undeclared identifier is reported only once for each function it appears in
   userfaultfd.c:612:34: error: expected expression before ')' token
     612 |                 area = (uint8_t *)(area_dst +
         |                                  ^
   userfaultfd.c: At top level:
   userfaultfd.c:827:33: error: unknown type name 'uint64_t'
     827 | static int userfaultfd_open_ext(uint64_t *features)
         |                                 ^~~~~~~~
   userfaultfd.c:827:33: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:854:29: error: unknown type name 'uint64_t'
     854 | static int userfaultfd_open(uint64_t features)
         |                             ^~~~~~~~
   userfaultfd.c:854:29: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:1097:13: error: implicit declaration of function 'userfaultfd_open' [-Wimplicit-function-declaration]
    1097 |         if (userfaultfd_open(0) < 0)
         |             ^~~~~~~~~~~~~~~~
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1288:9: error: unknown type name 'uint8_t'
    1288 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1288:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1292:9: error: unknown type name 'uint64_t'
    1292 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1292:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1303:13: error: implicit declaration of function 'userfaultfd_open_ext'; did you mean 'userfaultfd_sig_test'? [-Wimplicit-function-declaration]
    1303 |         if (userfaultfd_open_ext(&features))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             userfaultfd_sig_test
   userfaultfd.c:1332:58: error: 'uint8_t' undeclared (first use in this function)
    1332 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1332:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
