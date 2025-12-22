Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C7C1FE44A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373257; cv=none; b=sKweAf2Inf2r19Ic31DAPhI5lJXAP8GJViflAK6iKLkp6kliIHIj9psAC/St8gEKLYO/4ycsvN08vZuP9vXEq1xQ6N2Q0xk8jd9TNsV3JEu5asMiuTEnFijXSw47JMiwxFuw8tCJNR1oxCnQpzunD/6ucZsJ7Mj31+KiGJW/Lg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373257; c=relaxed/simple;
	bh=/qHyHxs1apoqrpxbL7TkNvag/rihBiNiEwbBYn9lWIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azRsH8r7eet1RcR0yD6dJe5U7YUKbPwjTbjLT97NfDN9tIOcNvTP+DdetIpSJ97qiP14W75uKrmp9DPgAT/GrHYo018kjVs7MEF7bGe1vR1TIOvGxotrkDPPfsm1olbGZuhSL8fiA2SLPSFpM0ZFB/B03jdCDVm08qyZdSWnW6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR/RAU/v; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR/RAU/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766373255; x=1797909255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qHyHxs1apoqrpxbL7TkNvag/rihBiNiEwbBYn9lWIQ=;
  b=IR/RAU/vUfmcCBx17oKrOMJ2CHRUVFxcbHkiX5Gn+ZBEb/jkpC7ZNT4K
   aFRWo2hqqJAVw0vrOQtDwZEtjonKbz4z6XlkbYNO8OVtPDPLDg4QOTwM0
   axGUjlCLQWCgNzT+KAeTHIG+J54MFTvdt/O+gZESooBXbjiXeOeuVG34q
   6jlctFESCX1kBX15lmfVyvRNL/xSgXo51Y/JX7YR5083F5XBmvI1YLD0q
   dQfKDunUoY3e1OWTs2I6+iFfhhlL1Eh+b93rBCNgyI+N3d4dCXFhc8VYJ
   TPTN9omsZR/IKdL5pRq4DTsEvZHMxBw0f8i51/eZft1JDfD6y9e1Gohq8
   Q==;
X-CSE-ConnectionGUID: zJ+IeUp3SD+98yN3+3O+Ow==
X-CSE-MsgGUID: Sa32CwLORDu2mGE1Pfy8zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67224190"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67224190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 19:14:14 -0800
X-CSE-ConnectionGUID: w/RhgIfMSE+SMrpDiuESNg==
X-CSE-MsgGUID: vymeWy42Rt2oH4JzkFbXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204481699"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 19:14:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXWN8-000000005LY-2oxQ;
	Mon, 22 Dec 2025 03:14:10 +0000
Date: Mon, 22 Dec 2025 04:13:14 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/bpf/dmabuf_iter.c:117:17:
 warning: no previous prototype for function 'bpf_iter_dmabuf_new'
Message-ID: <202512220445.WGFWREG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: 755db8b11c512ff80570c0a57821350f2ba67937 [1/1] BACKPORT: bpf: Add open coded dmabuf iterator
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220445.WGFWREG8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220445.WGFWREG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220445.WGFWREG8-lkp@intel.com/

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
   kernel/bpf/dmabuf_iter.c:140:18: warning: no previous prototype for function 'bpf_iter_dmabuf_destroy' [-Wmissing-prototypes]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
