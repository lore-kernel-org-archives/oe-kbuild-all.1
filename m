Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02311522F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981129; cv=none; b=AMIG32pV6VfDe7gMFzgE75lrSYoFgzLn9gRkGKgdt5LhvEfdW6I/96Lcz29P+/eGDYA204tcvJhv1tsAEveQSTZtUaDq+n09LiW8KJ5+VCr9Rt2QJeifsfGq8TGjtBvasVqdWtauso81eEOd80pKsBfeqfh87h8Off/NMnnj/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981129; c=relaxed/simple;
	bh=T2HvLjfSeMSfET2D5z8vjhVS4IYIqKQHIMG9Nnt1auQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIHilbYF5J7H7aj32Op8O8MkoxZh5N/4JFJv8HsEoATF/uy7tUG7q/DMgXXkzCdtLaIQjBPDQ45thmiY6pV9oOHKZSP+bbfH5D9l1jLouPhbU7JO7GejVDgRwz63uGdAcThxm00azTO5GjQ85Kt4Ja6DMVvFHsuGbYlFeYQDx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5nuOL7+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5nuOL7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738981127; x=1770517127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2HvLjfSeMSfET2D5z8vjhVS4IYIqKQHIMG9Nnt1auQ=;
  b=i5nuOL7+3HD42lD76mgeOmyeCMZVeqedn4Fpn5Nh4Jrkamkh5t45yZZC
   sOdwh2/6SWPMwZbyu/THIVu9zbaOwmsGi+lgQj9ko7NMChJ0v+nx1jiUI
   7ABOjnXk4fx6rS5ddRyPBFfTy0VnDBSqfEt80z/BwDdU0qj6Ch0TAf3qO
   etRlp0jgMO0PXPFLcNFhqGkYYfwyw4gDhEqFUy6a1CU/RJo4qI7TLbygk
   WUFNNoA8vHC54ayvDZ9uFSPBpAaXUBebwNXwnodLvA+9+CToC8RLWd+wL
   Ryx7Z/bHFHvFe6yylZt/bhA62abfXQxeIk8XLD6oXMt0qw9usgKzIdRCo
   A==;
X-CSE-ConnectionGUID: jKnrjAG2TG66LqnrdC+AGA==
X-CSE-MsgGUID: a1wSSWTQRfOSQFGPzDHlDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42476218"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="42476218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 18:18:46 -0800
X-CSE-ConnectionGUID: HLmNvLJ9T/mYS/sOw7KLbg==
X-CSE-MsgGUID: sDtLx0AtQeWDmx9xk8axxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="112197966"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2025 18:18:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgaQd-000zP5-06;
	Sat, 08 Feb 2025 02:18:43 +0000
Date: Sat, 8 Feb 2025 10:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bigeasy-staging:kernfs_v7 5/6] progs/profiler.inc.h:226:44: error:
 no member named 'parent' in 'struct kernfs_node'; did you mean '__parent'?
Message-ID: <202502081033.oXNqalmk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git kernfs_v7
head:   9563b911cf5983754f9d262a127c0fb9be5dc0ed
commit: adc5172c1c2323ec3f2998a0343eb7397692fefd [5/6] kernfs: Use RCU to access kernfs_node::parent.
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081033.oXNqalmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081033.oXNqalmk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/profiler1.c:5:
>> progs/profiler.inc.h:226:44: error: no member named 'parent' in 'struct kernfs_node'; did you mean '__parent'?
     226 |                 cgroup_node = BPF_CORE_READ(cgroup_node, parent);
         |                                                          ^~~~~~
         |                                                          __parent
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:520:17: note: expanded from macro 'BPF_CORE_READ'
     520 |         ___type((src), a, ##__VA_ARGS__) __r;                               \
         |                        ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:391:38: note: expanded from macro '___type'
     391 | #define ___type(...) typeof(___arrow(__VA_ARGS__))
         |                                      ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:389:64: note: expanded from macro '___arrow'
     389 | #define ___arrow(...) ___apply(___arrow, ___narg(__VA_ARGS__))(__VA_ARGS__)
         |                                                                ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:380:28: note: expanded from macro '___arrow2'
     380 | #define ___arrow2(a, b) a->b
         |                            ^
   tools/testing/selftests/bpf/tools/include/vmlinux.h:91481:22: note: '__parent' declared here
    91481 |         struct kernfs_node *__parent;
          |                             ^
   In file included from progs/profiler1.c:5:
>> progs/profiler.inc.h:226:44: error: no member named 'parent' in 'struct kernfs_node'; did you mean '__parent'?
     226 |                 cgroup_node = BPF_CORE_READ(cgroup_node, parent);
         |                                                          ^~~~~~
         |                                                          __parent
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:521:34: note: expanded from macro 'BPF_CORE_READ'
     521 |         BPF_CORE_READ_INTO(&__r, (src), a, ##__VA_ARGS__);                  \
         |                                         ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:429:20: note: expanded from macro 'BPF_CORE_READ_INTO'
     429 |                      dst, (src), a, ##__VA_ARGS__)                          \
         |                                  ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:420:18: note: expanded from macro '___core_read'
     420 |                                                       src, a, ##__VA_ARGS__)
         |                                                            ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:413:38: note: expanded from macro '___core_read0'
     413 |         ___read(fn, dst, ___type(src), src, a);
         |                                             ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:394:61: note: expanded from macro '___read'
     394 |         read_fn((void *)(dst), sizeof(*(dst)), &((src_type)(src))->accessor)
         |                                                                    ^
   tools/testing/selftests/bpf/tools/include/bpf/bpf_core_read.h:312:79: note: expanded from macro 'bpf_core_read'
     312 |         bpf_probe_read_kernel(dst, sz, (const void *)__builtin_preserve_access_index(src))
         |                                                                                      ^
   tools/testing/selftests/bpf/tools/include/vmlinux.h:91481:22: note: '__parent' declared here
    91481 |         struct kernfs_node *__parent;
          |                             ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
