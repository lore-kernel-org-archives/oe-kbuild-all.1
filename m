Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7575C1CFBD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKM08v3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700493810; x=1732029810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lu9RovSORki4bzxPOhqn7yeqxvsuyv64tegt6OJdMxI=;
  b=NKM08v3pJlgMsJ6Wse/wY5DxGMSRBcN0v0tYdD1EFc3WF2TDaPtuum1C
   YL9dBE2nN/YfEGJ2uzkbU8f8sEFTVO51MssPvv4YmdK+f4YILtJ2ncxKw
   p8+C4oBM69o0apA8Vo35diMKAHG5QBNmNX4W2P/G/pfuptBITGa3Ub4Zj
   3ddEvHE7n+xaVzAGNOawYv53ATb/OcnGzZhDhGjE959AT3e8trhYN0dgm
   VC0Wn4ryUB6kUx3JjREYcbBMhqJwz3onnB3GWJvzOcoVw9aoFN6vG2OZA
   lnJlVd++jpedhKFoz0QJN6e9ZJFnelbWxWLlilOh07I2zqoQPiUy+kEuj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4754334"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4754334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716236151"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="716236151"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Nov 2023 07:23:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r567R-0006ZY-2A;
	Mon, 20 Nov 2023 15:23:25 +0000
Date: Mon, 20 Nov 2023 23:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-ops-cleanup 4/8] kernel/dma/mapping.c:121:9: warning:
 return makes pointer from integer without a cast
Message-ID: <202311202246.z8Pp9rKm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-ops-cleanup
head:   5ab735c803b75be08ec98ef185b2df10bf41475a
commit: 5b95bda81e5c3a8365de492b8bb19a65591c5df4 [4/8] dma-mapping: make get_dma_ops private
config: i386-randconfig-012-20231120 (https://download.01.org/0day-ci/archive/20231120/202311202246.z8Pp9rKm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202246.z8Pp9rKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202246.z8Pp9rKm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/dma/ops_helpers.c: In function 'dma_common_alloc_pages':
   kernel/dma/ops_helpers.c:64:34: error: implicit declaration of function 'get_dma_ops'; did you mean 'set_dma_ops'? [-Werror=implicit-function-declaration]
     const struct dma_map_ops *ops = get_dma_ops(dev);
                                     ^~~~~~~~~~~
                                     set_dma_ops
>> kernel/dma/ops_helpers.c:64:34: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   kernel/dma/ops_helpers.c: In function 'dma_common_free_pages':
   kernel/dma/ops_helpers.c:87:34: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
     const struct dma_map_ops *ops = get_dma_ops(dev);
                                     ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   kernel/dma/mapping.c: In function 'get_dma_ops':
   kernel/dma/mapping.c:121:9: error: implicit declaration of function 'get_arch_dma_ops'; did you mean 'get_dma_ops'? [-Werror=implicit-function-declaration]
     return get_arch_dma_ops();
            ^~~~~~~~~~~~~~~~
            get_dma_ops
>> kernel/dma/mapping.c:121:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return get_arch_dma_ops();
            ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +121 kernel/dma/mapping.c

   115	
   116	#ifdef CONFIG_DMA_OPS
   117	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
   118	{
   119		if (dev->dma_ops)
   120			return dev->dma_ops;
 > 121		return get_arch_dma_ops();
   122	}
   123	#else /* CONFIG_DMA_OPS */
   124	static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
   125	{
   126		return NULL;
   127	}
   128	#endif /* CONFIG_DMA_OPS */
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
