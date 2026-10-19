Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB14EF15C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412852; cv=none; b=L8NuwGYGrpkF/NEfWZOqfkK1U/AYAinhRmZEKdHMRhkb0VkCvVYdw39LLT4XEIHBvAtoTbteA1SOkg8M0ZdD05iyRnWs7KdS44vYkZlRlzWgo2H+9V+gSYXlaN9p+kk2eiKu61ihmhqINGrz7H/B3WylNzAmADpQ8iKKenUJa1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412852; c=relaxed/simple;
	bh=Odb9d4Z85rusoP7skAsjD1n18LS/Nr5LpQbhVYsOsZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tanwmytarXm9YACxJfZ2TbwPuXIPFIoRGHag2PVsphGpnVH5KwxUjUo5EPIOUKrztk+c1GZ2CAIL1n9Y5myIszwxEWHsrGC52BeaHE3xjj1Nc4G6CcU7sNqdi6qKtPRMcw9IriazYu7War9ke9EsjqYpu5LdQiTnfPjMPE1NvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPm90+ZA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPm90+ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792412844; x=1823948844;
  h=date:from:to:cc:subject:message-id;
  bh=Odb9d4Z85rusoP7skAsjD1n18LS/Nr5LpQbhVYsOsZU=;
  b=WPm90+ZAZv+Hd52I5wisCCz1Hx6ysRsf+2Dbv7ok4yf+yRqLpAIFBHKF
   5pYxvC3DxIsDodnOpdHyYAi4GtzAgx1M91JS53tc5mwzHcaUf4JOz63gY
   MFcGTiZ19BSbOah6Yfv6H6X7+p3GMswDZmRRUjayk7hfusOtrHW1jYoYI
   KCeVOwSuhvEUrSj6P8ELhf9M+f8NxrdUC43B8HGFXdFlCapN+A8lv9SxP
   sAOccC69CydGIRzMw+pQ1mt4HRc6zcR9L+hp0FR6g73WwdyWHXWIvK68S
   clYk6nbgavP7LItMhfwKCbX8dObEOPupmC36KMTeLr9QwTqSVkvKwt7lm
   g==;
X-CSE-ConnectionGUID: zc2vwVp/Tyq4GsJUEs561g==
X-CSE-MsgGUID: owTG35qDSzqOEZ4dlLlKrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1126748"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1126748"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 05:27:22 -0700
X-CSE-ConnectionGUID: UB4Vy0q8Q4uHwB5pTZKRfg==
X-CSE-MsgGUID: mF0FkKigQbWZ4jycbsXyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2406812"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Oct 2026 05:27:20 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xImSS-000000005cN-3NnO;
	Mon, 19 Oct 2026 12:27:16 +0000
Date: Mon, 19 Oct 2026 14:26:47 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 0/5]
 kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for function
 'bpf_iter_dmabuf_new'
Message-ID: <202610191449.tkmi4ivk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   7c8257790178445b5011cbbb3eff43cea716ddc1
commit: 755db8b11c512ff80570c0a57821350f2ba67937 [0/5] BACKPORT: bpf: Add open coded dmabuf iterator
config: i386-randconfig-2102-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191449.tkmi4ivk-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191449.tkmi4ivk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191449.tkmi4ivk-lkp@intel.com/

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
