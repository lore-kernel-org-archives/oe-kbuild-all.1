Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF8242D88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551493; cv=none; b=fcJHxfv7Y9RKiZdpO/SkkQTmlNhz6qe2q8leTaw2AOElrt0qh9Cq+O4YfHPFF0kEmCxACDiMWp47f62zshH4xGN2G2dyIx/sNs8g7BlwoMTVLu2GWZXbo3Q+o4RtnX8+ecMVPaHtVGf0P7//tcs4ic4ApGWNjHWjBa8/l+ZbXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551493; c=relaxed/simple;
	bh=eWC9VMalkeM2+UuxIieLEuhSKFlIVgwh79FdWZSTaAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RNCrLcACGwrx/q46PlfHOX72rEmW2/NmGfVHTXCE32EoIks2jS9sN03iup3IC9reX6kzF6n8c4ovihonIYOmIMZRiqOdWr7xMVMX9y2O24LXvU3dfHcjvLV0x9nAlj9x/Mp9ToWYnmZXaApkZPn/BTHzujibr4bFLYKfKHeaI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab39iWdg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab39iWdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766551491; x=1798087491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWC9VMalkeM2+UuxIieLEuhSKFlIVgwh79FdWZSTaAI=;
  b=Ab39iWdgbRNT4I8Rp1xXt/ItfHVadixHg37uFFQ5xib6CkXcgWcD23q/
   W5/HMWSi2NIbtpXnfd54IiVZWf/KtIVKOB8mviYVFnOXV+mnTJ2er7/TL
   C4W8FC2ieen9W2a96U9172gP7JZsslMRCWo1aUBVeLrSEdIKrnPjNVLbU
   1mDuJkYkEzsVBC9Ds2tbWDJkjxftY5CpvgxxGOE5CXsEz/csEYcywqzWJ
   x7z1boiQ1VL4pP5jogVr1oQwbkbiax08ntpwW6myd5pvy7aZ2YDw1LjS4
   ttQL5khkFgFH/oY3+hjpzBywRKdXJaLte0L5yXJOggE2zwvNT0p4W5L5w
   Q==;
X-CSE-ConnectionGUID: 5epJa2UdQ1S4co8S8P9HDw==
X-CSE-MsgGUID: STQVpMSdT0aH+XOGZrGJUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79756327"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79756327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:44:50 -0800
X-CSE-ConnectionGUID: Jw/yPRqTSkmlbNomdzN6SQ==
X-CSE-MsgGUID: CLqwHGgiRMKTGFkEG1wl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204478077"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 20:44:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGju-0000000067E-3QpR;
	Wed, 24 Dec 2025 04:44:46 +0000
Date: Wed, 24 Dec 2025 05:44:36 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning:
 comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long
 long *') and 'typeof (size - 1) *' (aka 'unsigned int *'))
Message-ID: <202512240509.rQR5v4SQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6832dd96d0d16d34251480faa62e76d84c661c2d
commit: ce0e3c403e00e9e03e80aca6570bf936a44279e2 [2/2] vfio: selftests: add iova allocator
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251224/202512240509.rQR5v4SQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240509.rQR5v4SQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240509.rQR5v4SQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     249 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:257:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     257 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:342:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     342 |         VFIO_ASSERT_TRUE(index == VFIO_PCI_MSI_IRQ_INDEX ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     343 |                          index == VFIO_PCI_MSIX_IRQ_INDEX,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     344 |                          "Unsupported IRQ index: %u\n", index);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:43:35: note: expanded from macro 'VFIO_ASSERT_TRUE'
      43 | #define VFIO_ASSERT_TRUE(_a, ...) VFIO_ASSERT_NE(false, (_a), ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'


vim +249 tools/testing/selftests/vfio/lib/vfio_pci_device.c

   232	
   233	iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
   234	{
   235		VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
   236		VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
   237	
   238		for (;;) {
   239			struct iommu_iova_range *range;
   240			iova_t iova, last;
   241	
   242			VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
   243				       "IOVA allocator out of space\n");
   244	
   245			range = &allocator->ranges[allocator->range_idx];
   246			iova = range->start + allocator->range_offset;
   247	
   248			/* Check for sufficient space at the current offset */
 > 249			if (check_add_overflow(iova, size - 1, &last) ||
   250			    last > range->last)
   251				goto next_range;
   252	
   253			/* Align iova to size */
   254			iova = last & ~(size - 1);
   255	
   256			/* Check for sufficient space at the aligned iova */
   257			if (check_add_overflow(iova, size - 1, &last) ||
   258			    last > range->last)
   259				goto next_range;
   260	
   261			if (last == range->last) {
   262				allocator->range_idx++;
   263				allocator->range_offset = 0;
   264			} else {
   265				allocator->range_offset = last - range->start + 1;
   266			}
   267	
   268			return iova;
   269	
   270	next_range:
   271			allocator->range_idx++;
   272			allocator->range_offset = 0;
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
