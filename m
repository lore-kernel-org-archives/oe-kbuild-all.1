Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060DC1CAA65
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766310600; cv=none; b=sJuLtHJ3ivqsLB9h9fZeUDc73dUNALob6Ai9wnnFKPJSZ7Pn5RBVx+/AhpWwmudIwtzbNz6yCxCC2aeAiUtYPptq7X5T+g+kAfpOebXhRIgYVTOhWr7KY5qaZKVxGj4No4wt0QN9QvzkqvAGUUDfyGwjxfT4Q6s7iREzRaIalVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766310600; c=relaxed/simple;
	bh=+VZIveRn4m6cJxSttsq0QVPfmaAFj1nD39nZd4+U0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcrDUnvSZXh2pbzCA0XxS6eW+3OpmuFyphfzeYaVlqG7nQTZvNws7zqM1YVsRemKjtVFrEsXglOQQ+YOmBJ0SuqNF9pngHaRLmNo9rqCA49mlS6uinJUm8bh2UmMCCDOUF1D+HZk6nuyjL6xxCOXW25oCJ6y53Bz6L75gts5XCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgjTR9ja; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgjTR9ja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766310599; x=1797846599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VZIveRn4m6cJxSttsq0QVPfmaAFj1nD39nZd4+U0P4=;
  b=LgjTR9ja0O/t89pRj1QwwByQft6I4FqqhdJr1KHmFmTlWe9fJT3mz4jC
   xAPPFT2+xgx+rzAi+nXT8unt3IqJF3N1s0BlJR5DFRzOpDFptQ01rSW9g
   ahZ9mbXodgjp/F+dnw16cO+f5GyGy12ZIABkZD+alm+pt0QYaLe5kooZz
   nv/7TGkXINCTt2q3vlKStGKS0GvQZngx+Z5eEl6COoL3YFtjB/4vtncTD
   LqNqbLD2p7jFd54GEbm2wslZrwSWFPPaOCIkzIHaCmlkx9snuF7I3I2ih
   Xlt+AIt8FX/R7mVBnpgIpItzbpUnjRBCtud/5orKQBzWx1LvMawOpIZwW
   w==;
X-CSE-ConnectionGUID: IrQOcCOhR9iBrhhPockmJg==
X-CSE-MsgGUID: XWS7ypESSKCA3AT9IbDnHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85617449"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85617449"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 01:49:58 -0800
X-CSE-ConnectionGUID: /QyQSHNhSheUWBHfPdLRig==
X-CSE-MsgGUID: KoC7+QUqSza6PhAvGNZrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199566234"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2025 01:49:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXG4Z-0000000050G-1guQ;
	Sun, 21 Dec 2025 09:49:55 +0000
Date: Sun, 21 Dec 2025 10:49:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kernel/bpf/dmabuf_iter.c:128:29:
 warning: no previous prototype for 'bpf_iter_dmabuf_next'
Message-ID: <202512211046.chAx6DtB-lkp@intel.com>
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
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512211046.chAx6DtB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211046.chAx6DtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211046.chAx6DtB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for 'bpf_iter_dmabuf_new' [-Wmissing-prototypes]
     117 | __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
         |                 ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/dmabuf_iter.c:128:29: warning: no previous prototype for 'bpf_iter_dmabuf_next' [-Wmissing-prototypes]
     128 | __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
         |                             ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/dmabuf_iter.c:140:18: warning: no previous prototype for 'bpf_iter_dmabuf_destroy' [-Wmissing-prototypes]
     140 | __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_dmabuf_next +128 kernel/bpf/dmabuf_iter.c

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
