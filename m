Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1033DEED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015853; cv=none; b=h4+4wE5RCD6gWg0CfdvyathhffIQLP3A+sKCf6HiAeHeA/DvOoHX/jy3cPEnTUe5KU8qNPj9QLfm+RoU09YM35jQRNKWnBTVtA9uNkYdHw0CLmMS86VtNPlu9aXbuqBpGvXnXWW9yqMH7S7rXVXEaNow1gpGhRpw0kCKJycqEZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015853; c=relaxed/simple;
	bh=6hvRTdwJcP6kPlQZo3FAbMHn9czTgztjOnHkUoOx7nU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bkQbX+UgzdX7wOMrxFmxazj3U+A/ACGIFFmHGgik8asGK9jUaF/qZHde3Wi65J9rxNEG1o2OytH0wvFQlvXM5kQop0HD/ZtPM2HYiXb7u+dlDUesvQW0rMwFsLSB2z48DIyrOwgo91aAMA8sYKHZN4cFO6Le/PdpPvCQYr4Q+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnUn9vzT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnUn9vzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769015851; x=1800551851;
  h=date:from:to:cc:subject:message-id;
  bh=6hvRTdwJcP6kPlQZo3FAbMHn9czTgztjOnHkUoOx7nU=;
  b=BnUn9vzTTYxPmnp2OMki6E5JVGF4wP1hPfFzMwDuCkQN68DW/Luzpde7
   3fiT6XStbFLko8zhqSVrhn7zEI9r1+E1K9Kw1gmx8gXEIziTAfOWB1ENi
   dPVqX5J95EstOTHNsGiQUE9WrYDGt+t4IiMGsORxawhiQ8jCPcKO0HAAC
   vXZjt6Nn8ZsYl89jxwFEUTUqLNyWklp5KW80+h7DmbyY5TN1q5SpRBue4
   nf1CcX9YKXxRtOKRmUM4C095wLO6tiyZEHY1RFQLwN5a9/02SR60qD4Mq
   /bNE4LgNvYQndyvDJopDb7SVcqYu4tfv5TFHXAcY2EgJRLRTFLtHapgBB
   w==;
X-CSE-ConnectionGUID: MSoGHwrFQgCzef1vmp8r0g==
X-CSE-MsgGUID: wlCBDWKLRUuvrh9ybb5BOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80873875"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80873875"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 09:17:30 -0800
X-CSE-ConnectionGUID: 4JPko6xwRHKCM4EyQSeNoQ==
X-CSE-MsgGUID: 9BPYPVo7RfC/9yUQCzHDJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205638790"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2026 09:17:28 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vibpd-000000000Kj-2Lxe;
	Wed, 21 Jan 2026 17:17:25 +0000
Date: Wed, 21 Jan 2026 18:17:01 +0100
From: kernel test robot <lkp@intel.com>
To: Alex Mastro <amastro@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
 David Matlack <dmatlack@google.com>
Subject: [linux-next:master 7345/8302]
 tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:102:3: warning:
 format specifies type 'unsigned long' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <202601211830.aBEjmEFD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 080723f4d4c3c6fb0720aae614deb1f30ee9ef2e [7345/8302] vfio: selftests: Add vfio_dma_mapping_mmio_test
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260121/202601211830.aBEjmEFD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211830.aBEjmEFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211830.aBEjmEFD-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:6:
   tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:49:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      49 |         VFIO_ASSERT_EQ(__iommu_unmap(iommu, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:6:
   tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:56:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      56 |         VFIO_ASSERT_EQ(__iommu_unmap_all(iommu, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:6:
   tools/testing/selftests/vfio/lib/include/libvfio/iommu.h:56:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      56 |         VFIO_ASSERT_EQ(__iommu_unmap_all(iommu, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:8:
   tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h:78:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      78 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:8:
   tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h:78:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      78 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:8:
   tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h:81:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      81 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   In file included from tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:11:
   In file included from tools/testing/selftests/vfio/lib/include/libvfio.h:8:
   tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h:81:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      81 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:102:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     102 |                 VFIO_ASSERT_NE(__iommu_map(iommu, &region), 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
>> tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:102:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     102 |                 VFIO_ASSERT_NE(__iommu_map(iommu, &region), 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:103:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     103 |                 VFIO_ASSERT_NE(__iommu_unmap(iommu, &region, NULL), 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:103:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     103 |                 VFIO_ASSERT_NE(__iommu_unmap(iommu, &region, NULL), 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:132:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     132 |         VFIO_ASSERT_NE(vaddr, MAP_FAILED);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:132:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     132 |         VFIO_ASSERT_NE(vaddr, MAP_FAILED);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:33:37: note: expanded from macro 'VFIO_ASSERT_NE'
      33 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:136:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     136 |         VFIO_ASSERT_EQ(munmap(vaddr, size), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:4: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c:136:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     136 |         VFIO_ASSERT_EQ(munmap(vaddr, size), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:32:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      32 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/libvfio/assert.h:27:22: note: expanded from macro 'VFIO_ASSERT_OP'
      26 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      27 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   18 warnings generated.


vim +102 tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c

    82	
    83	static void do_mmio_map_test(struct iommu *iommu,
    84				     struct iova_allocator *iova_allocator,
    85				     void *vaddr, size_t size)
    86	{
    87		struct dma_region region = {
    88			.vaddr = vaddr,
    89			.size = size,
    90			.iova = iova_allocator_alloc(iova_allocator, size),
    91		};
    92	
    93		/*
    94		 * NOTE: Check for iommufd compat success once it lands. Native iommufd
    95		 * will never support this.
    96		 */
    97		if (!strcmp(iommu->mode->name, MODE_VFIO_TYPE1V2_IOMMU) ||
    98		    !strcmp(iommu->mode->name, MODE_VFIO_TYPE1_IOMMU)) {
    99			iommu_map(iommu, &region);
   100			iommu_unmap(iommu, &region);
   101		} else {
 > 102			VFIO_ASSERT_NE(__iommu_map(iommu, &region), 0);
   103			VFIO_ASSERT_NE(__iommu_unmap(iommu, &region, NULL), 0);
   104		}
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
