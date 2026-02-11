Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A682216E24
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770815430; cv=none; b=cq5Iq9Eh4vEEMUd0m+VAgrM1BwkY/PYgZ+PxnHl1VttJjqIkhnotdW3hLjy+/0+2xse/g8s8bwDbbDjyJQCeuRNPt0JdV1To5Pa6vYusY7UVff5164aXFx7t4P7mkzQiwf5pUtVQ2dOA1BJEnPkvRSAw96vWamx187S0FHgyPy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770815430; c=relaxed/simple;
	bh=KXpq6sfo7fNCWC0k9QEyhECCHgKvP+330d6c59q6Dls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qf0fJTsy/uXtBnOdkcr6IQhAiaMB3KzHqw1oVm2ACxdwhww6d8QHJkiVD4q+nmhHxTi1zusb6C3tmVhlRiLopY7etjKHqBqH9YssbvgM3icuWgbq085KhrrOU3ijmS1pgyLuELGW23lN4p44RFLxim0dAuWij9yh8/oh40k+BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfxLDaZA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfxLDaZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770815428; x=1802351428;
  h=date:from:to:cc:subject:message-id;
  bh=KXpq6sfo7fNCWC0k9QEyhECCHgKvP+330d6c59q6Dls=;
  b=DfxLDaZAQUitQH+nucpiC0fFsC+71fZcVWN7/lFREHvqyZGAjQciAf6K
   Mhsbk0qXed6QjDO26q8jrlvgMduO0Icj2UpaF0h/RRFLoLc3UkqWPBep4
   RSSr7vjiXot3BCpMLcCsMavgwL9Eop0AokQjGm2YRmlhExD0zM31s82fz
   wn66x0QhId2pYcHy6T/EiAfwJdGCGjHhAkKXwjlIn+9fBGOF1s8j9TD50
   inC9LCjsSgSvrs2pCJvv2rzXaKE285qf7iNVXBTud6q3bdGfNiq+lsiPE
   LgS3J+rdUacmYBk77tvra0z9js77pLceEH+MtNertYNFJSFZJCLik490j
   Q==;
X-CSE-ConnectionGUID: pS2zdE6+RJWVKbQ69wDsXA==
X-CSE-MsgGUID: OvCZtCcQQ8akRTGvcbmL8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82282829"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82282829"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:10:28 -0800
X-CSE-ConnectionGUID: NdA3vJWTS+ihofcpA2zB/A==
X-CSE-MsgGUID: VQbnnGa5T1ausEUDHDJEFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249892348"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2026 05:10:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq9z5-0000000015N-3ek5;
	Wed, 11 Feb 2026 13:10:23 +0000
Date: Wed, 11 Feb 2026 14:10:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument
Message-ID: <202602111436.liFG5BLw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 72863addaa15829a3fb85b34053b2620db0dbb10 [203/203] FROMGIT: userfaultfd/selftests: exercise minor fault handling shmem support
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602111436.liFG5BLw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111436.liFG5BLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111436.liFG5BLw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c:445:39: error: unknown type name 'uint64_t'
     445 | static inline void uffd_test_ctx_init(uint64_t features)
         |                                       ^~~~~~~~
   userfaultfd.c:445:39: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'wp_range':
   userfaultfd.c:470:51: error: expected ')' before 'PRIx64'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:60:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      60 | 
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:483:62: error: expected ')' before 'PRIx64'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:483:62: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:494:91: error: expected ')' before 'PRId64'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:494:91: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
>> userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c: In function 'retry_copy_page':
   userfaultfd.c:558:57: error: expected ')' before 'PRId64'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:558:57: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:561:54: error: expected ')' before 'PRId64'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:561:54: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__copy_page':
   userfaultfd.c:583:51: error: expected ')' before 'PRId64'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:583:25: note: in expansion of macro 'err'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
