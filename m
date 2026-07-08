Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A86437131
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529540; cv=none; b=k6roUDQNz/fnXUnIXW62zFqmcRKa0yu9el8HVwlGA6Se63T3JJBTAC6BP7ZoBVeJxrumjdF5YtxNlXa7oPk/jGiuFwP1skWgd8NPY2tRgVSExO7TG/biQwYUSeELIkFPJVg5Q05A21+ZuCD4HH6Wey5a6pLGcCcNUUboGk0NgN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529540; c=relaxed/simple;
	bh=TVoTchNUY6F7IzwOOEi/DVJeKrRptluqYxqEQUTajA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=puyoKK4DzBLZMX1RuK98n5idQX4TVla4V7QIwlafiU6kiQF40S+vT1J4xj2szS8+lKXVzTG6OTzcKcTQFfYwjGUYaDXJk8uaan9zj8DL7EcIak95OiGQ6q1lP0r6J5dloaaDiMdO5DT/7HKOGsS8VxSe2B9JmhXC9ILTjP2szN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLXrc+o3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLXrc+o3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783529533; x=1815065533;
  h=date:from:to:cc:subject:message-id;
  bh=TVoTchNUY6F7IzwOOEi/DVJeKrRptluqYxqEQUTajA4=;
  b=aLXrc+o3cPzks4/jVU2+6+2KNB5bgWGHrZcAk5mlw0OraNzqoCsyRTG1
   JqJqoMwGDRKPPrxjhmPbmIUJxh5ncj+H4OgO/lQLhgakEgnnoRCJNTuS9
   zJ2WSS0UXaalKWkESzp1r8dSWxQ/SETTngDv4SEPrELmwi2OGY6X9Au4/
   OI6TpTVfnmap5T7s56DWJU3mWSN7IS4y3mFqli51t/TpwU7iCI7XKZahd
   +RIy2o+oQX6kzhf1bOedVsAbUpQyunhmQ6sHkYl95QZWO+KIng7eVkIgT
   Pco1tgtSB4xmkNrUj2M1ZoSKORz3colunIH1GgIRKKdEWWuD5aZqR0QEd
   g==;
X-CSE-ConnectionGUID: rIu2WLFLS4aKOetMZd5CtA==
X-CSE-MsgGUID: N+I0iNFeS8W+qBZYdtYcCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94553442"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94553442"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 09:52:05 -0700
X-CSE-ConnectionGUID: mjuAoKx4QMmKIFY3NoJy3w==
X-CSE-MsgGUID: 9VuGQxtnTB+vH5C6bus+Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277558099"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 09:52:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whVVA-00000000GdH-2MZ9;
	Wed, 08 Jul 2026 16:52:00 +0000
Date: Thu, 09 Jul 2026 00:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 1/1]
 kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for function
 'bpf_iter_dmabuf_new'
Message-ID: <202607090141.RMFcN5KQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   438a142b9dc1da06a555c9853456f23e76cfb744
commit: 755db8b11c512ff80570c0a57821350f2ba67937 [1/1] BACKPORT: bpf: Add open coded dmabuf iterator
config: i386-buildonly-randconfig-001-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090141.RMFcN5KQ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090141.RMFcN5KQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090141.RMFcN5KQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for function 'bpf_iter_dmabuf_new' [-Wmissing-prototypes]
     117 | __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
         |                 ^
   kernel/bpf/dmabuf_iter.c:117:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
         |             ^
         |             static 
>> kernel/bpf/dmabuf_iter.c:128:29: warning: no previous prototype for function 'bpf_iter_dmabuf_next' [-Wmissing-prototypes]
     128 | __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
         |                             ^
   kernel/bpf/dmabuf_iter.c:128:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
         |             ^
         |             static 
>> kernel/bpf/dmabuf_iter.c:140:18: warning: no previous prototype for function 'bpf_iter_dmabuf_destroy' [-Wmissing-prototypes]
     140 | __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
         |                  ^
   kernel/bpf/dmabuf_iter.c:140:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
         |             ^
         |             static 
   3 warnings generated.


vim +/bpf_iter_dmabuf_new +117 kernel/bpf/dmabuf_iter.c

   116	
 > 117	__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
   118	{
   119		struct bpf_iter_dmabuf_kern *kit = (void *)it;
   120	
   121		BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
   122		BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));
   123	
   124		kit->dmabuf = NULL;
   125		return 0;
   126	}
   127	
 > 128	__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
   129	{
   130		struct bpf_iter_dmabuf_kern *kit = (void *)it;
   131	
   132		if (kit->dmabuf)
   133			kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
   134		else
   135			kit->dmabuf = dma_buf_iter_begin();
   136	
   137		return kit->dmabuf;
   138	}
   139	
 > 140	__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
