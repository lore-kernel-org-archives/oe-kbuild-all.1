Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920401;
	b=WVcWqgj8LIT/2/Q/WN5kHbhMWn+VutNdct64thyjDkpSrdQHfcRFCNiuHa+rOZSikq9V
	 qPzNETDycGclJ8nNGeIOEjpjcazkv8BInjQuiAz7D3kxo28PCIeVr8cOf0Qhu6kcp2t7K
	 x4Q/ChrkhnA7BfS/LN/Hw5ACvY+pjg/ygJbRnbuzCKsKrru4okUp/K9Z9anYXXRIbUsB0
	 Wbnf6HvJkugOH3am1+NoxX3AkY6spRLRBci/WLEwzCsPMgjf0oli8H2Axy5Ty2GNbnpzE
	 3SPJE6rzkEafKoMCRp+r2U2oiMsF5xRSWj2bJGaS2/PHtVl6C1JRNiGRpf+hEL8GTwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1Q92je3JCo6qhG2LBi/vnQZwBvA/f/cxIAwQ4gwsFqI=;
	b=XN1pScSoe4wi0lvAp+Arg5qRjpyoThQhfGn1j4nK4cocW1jh2gj/36TvnFPUtnCGx8Xj
	 KBVcbcl1YZaJKlJgMGThwFOAT6b5LdHb6fTFTNoIJVEFspQZQ/tHZF3D9u6i38kA5xpx5
	 z9JbdREs6+mzSbuKzN/d5i3VZ0gjI5GW2MBDqwoV98ENNct19QyQPvCoN5reDYoQs8Oz7
	 BuABNF15Yf01XDT3RUd24pu3KK/gdzLZVetG8oABvRTBKtSP75GUH33DiNCtLZ0DrN6bE
	 GKbnNjFwBCz5V8kQTnOVWRvD3K79VO+ll402Br68/5Mw2faUd9NDuFi/cyhlW10uMRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fN0FDPSf;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D582606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 23:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D582606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fN0FDPSf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793920399; x=1825456399;
  h=date:from:to:cc:subject:message-id;
  bh=3m5YJxT45jJsMZgi6fCN2NOxcn8tnw5gTGWZtaex9JE=;
  b=fN0FDPSffOur3/bqEE/x5ajC0P4kbpPxGz7s5LQMAhlAi3uUmwBrUv8T
   mjrCy27QYkN9TsbehSzxZltwhMi8KWMMx7QD8VmAeDVyN1r60cGqDjQvy
   ICZCRwWdcWjzV1P/51NqAmLlFQD2Aiw8/n7TalCd5AYKJUz+XzH1/+gBN
   H2IgUPJ1Hs7bTc0TnTKtajmQas98ljrbD+4Va/tmHNI8vALBzpPcM9Zx/
   MyWj+lubh2KJoh7HYUee/8IN0zxRUtlIrp2oMMvSIFRkkrLADs72YGLI+
   1QTlf9RtbWNkeSq6QKNFZ/clENIA6xYUgsnHgSZfufBwDMxFxrKp4id4/
   A==;
X-CSE-ConnectionGUID: ld8ZFnHWRZOdN0z8DCVrKQ==
X-CSE-MsgGUID: zfbyBGerTjW+6z2X4fSHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2758543"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2758543"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 15:13:17 -0800
X-CSE-ConnectionGUID: hfaxpErAS5iVQi4d/QHaFA==
X-CSE-MsgGUID: swb4HPHJRj20A6gpDcas7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7120511"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2026 15:13:14 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP6dr-000000009s3-2u4e;
	Thu, 05 Nov 2026 23:13:11 +0000
Date: Fri, 06 Nov 2026 00:12:21 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 20/56]
 include/sound/memalloc.h:110:undefined reference to
 `snd_devm_alloc_dir_pages'
Message-ID: <202611060005.eBnLKlRD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: fe14e02c46f52dd6e08b7e070f82849d8ae1a500 [20/56] ALSA: rust: pcm: Add DmaBuffer wrapper for snd_devm_alloc_pages
config: um-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060005.eBnLKlRD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060005.eBnLKlRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060005.eBnLKlRD-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: rust/helpers/helpers.o: in function `snd_devm_alloc_pages':
>> include/sound/memalloc.h:110:(.text+0x9212): undefined reference to `snd_devm_alloc_dir_pages'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +110 include/sound/memalloc.h

a25684a956468e Takashi Iwai 2021-10-17   96  
37af81c5998f4b Takashi Iwai 2021-06-09   97  dma_addr_t snd_sgbuf_get_addr(struct snd_dma_buffer *dmab, size_t offset);
37af81c5998f4b Takashi Iwai 2021-06-09   98  struct page *snd_sgbuf_get_page(struct snd_dma_buffer *dmab, size_t offset);
37af81c5998f4b Takashi Iwai 2021-06-09   99  unsigned int snd_sgbuf_get_chunk_size(struct snd_dma_buffer *dmab,
37af81c5998f4b Takashi Iwai 2021-06-09  100  				      unsigned int ofs, unsigned int size);
37af81c5998f4b Takashi Iwai 2021-06-09  101  
427ae2689db0fb Takashi Iwai 2021-07-15  102  /* device-managed memory allocator */
a25684a956468e Takashi Iwai 2021-10-17  103  struct snd_dma_buffer *snd_devm_alloc_dir_pages(struct device *dev, int type,
a25684a956468e Takashi Iwai 2021-10-17  104  						enum dma_data_direction dir,
427ae2689db0fb Takashi Iwai 2021-07-15  105  						size_t size);
427ae2689db0fb Takashi Iwai 2021-07-15  106  
a25684a956468e Takashi Iwai 2021-10-17  107  static inline struct snd_dma_buffer *
a25684a956468e Takashi Iwai 2021-10-17  108  snd_devm_alloc_pages(struct device *dev, int type, size_t size)
a25684a956468e Takashi Iwai 2021-10-17  109  {
a25684a956468e Takashi Iwai 2021-10-17 @110  	return snd_devm_alloc_dir_pages(dev, type, DMA_BIDIRECTIONAL, size);
a25684a956468e Takashi Iwai 2021-10-17  111  }
a25684a956468e Takashi Iwai 2021-10-17  112  

:::::: The code at line 110 was first introduced by commit
:::::: a25684a956468ee8bbbee44649e41e5d447e5adc ALSA: memalloc: Support for non-contiguous page allocation

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
