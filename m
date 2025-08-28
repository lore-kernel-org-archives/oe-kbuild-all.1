Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC54A00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 01:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756343315; cv=none; b=hHjLyaX8zkigKDHNoqph20PpjUinjIAHzHsPubZTFnO3VmPYrxflky2dMND995z/JixNuL36f85q0sInOnSkc0p+UNc00esnC4bU0oskAnCt+Vt7S0GtNPqbDelmwcyMqY35vkZxLkx0qQcTXWAPFQKoDHvdyWTLUGia1G0QJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756343315; c=relaxed/simple;
	bh=Vy33ylMTaFBjxSSmDiN610bi/7MhmQFuXGlJsJ5Ix9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NB+BaLyhSNAULCRQ9cGl1kA4DTnIYnB1iBEXx7aXGBCHtqFwUvTs5ghkhSXMao8Zd3yoMY5oYdodE3KL5NbKePB+x5q+z+/cU64qFk8gA+7VZAgAfurnIHX2y7MiEAtF+T4L9XmE1qFKObuTcY/kyi2ZNOyJA1wzOReJw39N938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+uXM1Ag; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+uXM1Ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756343313; x=1787879313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vy33ylMTaFBjxSSmDiN610bi/7MhmQFuXGlJsJ5Ix9A=;
  b=k+uXM1AgnM8uVFE6oRcyVO+IXMopZYAGsFqSLkizBLFKg4JYrQ8NIQEA
   gmabefK25BoDxhHNRkHzkUzzg9aWgy+CxI2riDBno09mwTW+ktvww5v8d
   HgwyqLB5LJNHACMmCipig9M2e6km5tGiedEJLHSCjgGsr99SDRboFu6Kr
   yab557yJ6Rnm7t3FuhniZ/Wuf1+a1G4qGPS8+OKrceIEcthK/s6mCbRjQ
   bsqO44Lu2RXx2qZEwvgXE//WqzJao/lCabd/1RQPN0Asuyb4kexjbikbs
   ag+YRDoX5oVd4E8rfxnSVFZbytJzFfUkNCQofA4MuNEQeqk8xWqwg6j9+
   A==;
X-CSE-ConnectionGUID: tp4+6FcTTcm1Nx2LLYoM/g==
X-CSE-MsgGUID: dpw+l6RoSbae4pYUGDcVQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="46179649"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="46179649"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 18:08:32 -0700
X-CSE-ConnectionGUID: 8xcPJp7KSnSJn9z9rgmqeA==
X-CSE-MsgGUID: r9qIYlb1T6CD7+YIdu1flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="200875163"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2025 18:08:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urR7t-000TJT-1U;
	Thu, 28 Aug 2025 01:08:29 +0000
Date: Thu, 28 Aug 2025 09:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 7/7] kernel/bpf/dmabuf_iter.c:117:17:
 warning: no previous prototype for function 'bpf_iter_dmabuf_new'
Message-ID: <202508280936.7Jw8RFrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   deae7333e0dabc64c2e169695e5093332a142fbc
commit: 755db8b11c512ff80570c0a57821350f2ba67937 [7/7] BACKPORT: bpf: Add open coded dmabuf iterator
config: arm64-randconfig-001-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280936.7Jw8RFrU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280936.7Jw8RFrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280936.7Jw8RFrU-lkp@intel.com/

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
