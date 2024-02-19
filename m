Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3F3FF4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 05:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708318984; cv=none; b=XMihjxKHtyeBDfySjx/72BsdwhG5MbOs+6D52PaXK3Xi4qVF3jO8bxV4Or+UMjhlRpoXXYU6oOkH71bhU5ZT/2c73dZbJM2wNcdiBl/bMN1S37HiGICyeYfj3i5zFNuU57ga19B1dPacq33FJAXjI2HmUSOgCLND6gDL8nHC0HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708318984; c=relaxed/simple;
	bh=i4g3fPQnoIqi0jkXlz1nDbUhT5eT+Jt69tOW2F8S28k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0SwpM/4g0zZPwTieIxY6O7PDSiORXPGMCmtLvv3Es3AvuJ8RTAoICkkZqINfj7B1jSrJWBxwBFCYSZzg3znwZJgEBjIhSmEKJJQnxzdeQDrSe/aQtPwaLz/1Ld6KCgtlkCD2DWnExsSS2xdr54UK8p8mAD4Vc3S2rDhqAvMo4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVrAS2yj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVrAS2yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708318982; x=1739854982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i4g3fPQnoIqi0jkXlz1nDbUhT5eT+Jt69tOW2F8S28k=;
  b=DVrAS2yjrB7AG/aGfB4YjHVDLweoZQjsgud2iWwB2JERLltd9IPIGnbp
   wZq/6G1bRSoSdL5T1fl8uRn1ZP2fbdSkdyw22qNnT6GRvI42Er/hkSgcb
   Fowm8v2PurauFVCzQzQED1Ee3zQk+CFM9M0uVXQzJ45iq98zTUkf/I7Xf
   LJZVIDB+SRBTHjCroRFH7x6xyjz9auiLqOuQSNRGXhwzlYVgfmq1dVUnS
   XkGHjeRfrdA9z5hG/UlNzCC7RBXj7g/3gigDjBp+ssSypVKKrenl4a4qw
   dfsFqpBLhXoZbhFZs77QIVpbs+po6vq/WjJOfKsB5pMMHIaF+3W9wxQRM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19910965"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="19910965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 21:03:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4532098"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Feb 2024 21:03:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbvnu-0003XC-0S;
	Mon, 19 Feb 2024 05:02:58 +0000
Date: Mon, 19 Feb 2024 13:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena 18/20]
 tools/testing/selftests/bpf/prog_tests/arena_list.c:49:23: error: 'struct
 arena_list' has no member named 'arena'
Message-ID: <202402191246.bYaTaQdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena
head:   4e726b87a660bf893d79aaea4e22f1bc9fc03774
commit: aa31e8a044a62529f5afa3275d63b5019142c901 [18/20] selftests/bpf: Add bpf_arena_list test.
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191246.bYaTaQdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191246.bYaTaQdS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/bpf/prog_tests/arena_list.c:3:
   tools/testing/selftests/bpf/prog_tests/arena_list.c: In function 'test_arena_list_add_del':
>> tools/testing/selftests/bpf/prog_tests/arena_list.c:49:23: error: 'struct arena_list' has no member named 'arena'
      49 |         ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:16: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
>> tools/testing/selftests/bpf/prog_tests/arena_list.c:49:23: error: 'struct arena_list' has no member named 'arena'
      49 |         ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:34: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~
   tools/testing/selftests/bpf/prog_tests/arena_list.c:50:23: error: 'struct arena_list' has no member named 'arena'
      50 |         ASSERT_EQ(skel->arena->test_val, cnt + 1, "num of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:16: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/arena_list.c:50:23: error: 'struct arena_list' has no member named 'arena'
      50 |         ASSERT_EQ(skel->arena->test_val, cnt + 1, "num of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:34: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~
   tools/testing/selftests/bpf/prog_tests/arena_list.c:57:23: error: 'struct arena_list' has no member named 'arena'
      57 |         ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:16: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/arena_list.c:57:23: error: 'struct arena_list' has no member named 'arena'
      57 |         ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
         |                       ^~
   tools/testing/selftests/bpf/test_progs.h:239:34: note: in definition of macro 'ASSERT_EQ'
     239 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~


vim +49 tools/testing/selftests/bpf/prog_tests/arena_list.c

   > 3	#include <test_progs.h>
     4	#include <sys/mman.h>
     5	#include <network_helpers.h>
     6	
     7	#define PAGE_SIZE 4096
     8	
     9	#include "bpf_arena_list.h"
    10	#include "arena_list.skel.h"
    11	
    12	struct elem {
    13		struct arena_list_node node;
    14		__u64 value;
    15	};
    16	
    17	static int list_sum(struct arena_list_head *head)
    18	{
    19		struct elem __arena *n;
    20		int sum = 0;
    21	
    22		list_for_each_entry(n, head, node)
    23			sum += n->value;
    24		return sum;
    25	}
    26	
    27	static void test_arena_list_add_del(int cnt)
    28	{
    29		LIBBPF_OPTS(bpf_test_run_opts, opts);
    30		struct arena_list *skel;
    31		int expected_sum = (u64)cnt * (cnt - 1) / 2;
    32		int ret, sum;
    33	
    34		skel = arena_list__open_and_load();
    35		if (!ASSERT_OK_PTR(skel, "arena_list__open_and_load"))
    36			return;
    37	
    38		skel->bss->cnt = cnt;
    39		ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.arena_list_add), &opts);
    40		ASSERT_OK(ret, "ret_add");
    41		ASSERT_OK(opts.retval, "retval");
    42		if (skel->bss->skip) {
    43			printf("%s:SKIP:compiler doesn't support arena_cast\n", __func__);
    44			test__skip();
    45			goto out;
    46		}
    47		sum = list_sum(skel->bss->list_head);
    48		ASSERT_EQ(sum, expected_sum, "sum of elems");
  > 49		ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
    50		ASSERT_EQ(skel->arena->test_val, cnt + 1, "num of elems");
    51	
    52		ret = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.arena_list_del), &opts);
    53		ASSERT_OK(ret, "ret_del");
    54		sum = list_sum(skel->bss->list_head);
    55		ASSERT_EQ(sum, 0, "sum of list elems after del");
    56		ASSERT_EQ(skel->bss->list_sum, expected_sum, "sum of list elems computed by prog");
    57		ASSERT_EQ(skel->arena->arena_sum, expected_sum, "__arena sum of elems");
    58	out:
    59		arena_list__destroy(skel);
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
