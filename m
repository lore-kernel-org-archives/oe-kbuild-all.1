Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F2812
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 07:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692343022; x=1723879022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jXFPs82QKcYshkolySkqUubj8bOC7Ha9x5dUaT3Qsc=;
  b=jZWSa5eIa+pQn3mrpO+K+7LVc/fSDg86kIwrcMaXQAzucgSiAXEgRGTn
   ucwKebWrrDxImOMtUMjEzY2vE8IKHfzHhDPi8g+V43/6hzxecZOslwSji
   jIoiO0XFaoCUaEyAMX+k+kmPAYZdXgkdCULzroAzSIuO0jpDZE2pz9DSz
   GM4MczhhkjX5R+TamVE3wmN5cFabXCOutL4Vp0GoHo7EgSn5RUvgQ5rxI
   ICScUW/2zFg85Z3mldhor9gqSOAjvTku3KPUn0DjY5iXK5oj9nPe1goOC
   okbl+31J16I5lxWBmHwQlrEKUTL5x96pDJuOmB49Ho0xMRVh15UHxnc0A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="404017499"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="404017499"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800379630"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="800379630"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 00:16:42 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWtir-0002D6-2W;
	Fri, 18 Aug 2023 07:16:41 +0000
Date: Fri, 18 Aug 2023 15:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [davejiang:cxl-ide 5/24] lib/spdm_requester.c:501: warning: Function
 parameter or member 'leaf_key' not described in 'spdm_state'
Message-ID: <202308181526.l7us0AP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   c9d8239de44d5eec0e327a398ff46ffe078d3d4d
commit: 752393333819ccb7794d8021f03585203b6d6055 [5/24] PCI/CMA: Authenticate devices on enumeration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308181526.l7us0AP7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181526.l7us0AP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181526.l7us0AP7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/spdm_requester.c:501: warning: Function parameter or member 'leaf_key' not described in 'spdm_state'


vim +501 lib/spdm_requester.c

12e29e750c4583 Jonathan Cameron 2022-09-06  436  
12e29e750c4583 Jonathan Cameron 2022-09-06  437  /**
12e29e750c4583 Jonathan Cameron 2022-09-06  438   * struct spdm_state - SPDM session state
12e29e750c4583 Jonathan Cameron 2022-09-06  439   *
12e29e750c4583 Jonathan Cameron 2022-09-06  440   * @lock: Serializes multiple concurrent spdm_authenticate() calls.
12e29e750c4583 Jonathan Cameron 2022-09-06  441   * @dev: Transport device.  Used for error reporting and passed to @transport.
12e29e750c4583 Jonathan Cameron 2022-09-06  442   * @transport: Transport function to perform one message exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  443   * @transport_priv: Transport private data.
12e29e750c4583 Jonathan Cameron 2022-09-06  444   * @transport_sz: Maximum message size the transport is capable of (in bytes).
12e29e750c4583 Jonathan Cameron 2022-09-06  445   *	Used as DataTransferSize in GET_CAPABILITIES exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  446   * @version: Maximum common supported version of requester and responder.
12e29e750c4583 Jonathan Cameron 2022-09-06  447   *	Negotiated during GET_VERSION exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  448   * @responder_caps: Cached capabilities of responder.
12e29e750c4583 Jonathan Cameron 2022-09-06  449   *	Received during GET_CAPABILITIES exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  450   * @base_asym_alg: Asymmetric key algorithm for signature verification of
12e29e750c4583 Jonathan Cameron 2022-09-06  451   *	CHALLENGE_AUTH messages.
12e29e750c4583 Jonathan Cameron 2022-09-06  452   *	Selected by responder during NEGOTIATE_ALGORITHMS exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  453   * @base_hash_alg: Hash algorithm for signature verification of
12e29e750c4583 Jonathan Cameron 2022-09-06  454   *	CHALLENGE_AUTH messages.
12e29e750c4583 Jonathan Cameron 2022-09-06  455   *	Selected by responder during NEGOTIATE_ALGORITHMS exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  456   * @slot_mask: Bitmask of populated certificate slots in the responder.
12e29e750c4583 Jonathan Cameron 2022-09-06  457   *	Received during GET_DIGESTS exchange.
12e29e750c4583 Jonathan Cameron 2022-09-06  458   * @base_asym_enc: Human-readable name of @base_asym_alg's signature encoding.
12e29e750c4583 Jonathan Cameron 2022-09-06  459   *	Passed to crypto subsystem when calling verify_signature().
12e29e750c4583 Jonathan Cameron 2022-09-06  460   * @s: Signature length of @base_asym_alg (in bytes).  S or SigLen in SPDM
12e29e750c4583 Jonathan Cameron 2022-09-06  461   *	specification.
12e29e750c4583 Jonathan Cameron 2022-09-06  462   * @base_hash_alg_name: Human-readable name of @base_hash_alg.
12e29e750c4583 Jonathan Cameron 2022-09-06  463   *	Passed to crypto subsystem when calling crypto_alloc_shash() and
12e29e750c4583 Jonathan Cameron 2022-09-06  464   *	verify_signature().
12e29e750c4583 Jonathan Cameron 2022-09-06  465   * @shash: Synchronous hash handle for @base_hash_alg computation.
12e29e750c4583 Jonathan Cameron 2022-09-06  466   * @desc: Synchronous hash context for @base_hash_alg computation.
12e29e750c4583 Jonathan Cameron 2022-09-06  467   * @h: Hash length of @base_hash_alg (in bytes).  H in SPDM specification.
12e29e750c4583 Jonathan Cameron 2022-09-06  468   * @leaf_key: 
12e29e750c4583 Jonathan Cameron 2022-09-06  469   * @root_keyring: Keyring against which to check the root certificate of a
12e29e750c4583 Jonathan Cameron 2022-09-06  470   *	certificate chain.
12e29e750c4583 Jonathan Cameron 2022-09-06  471   */
12e29e750c4583 Jonathan Cameron 2022-09-06  472  struct spdm_state {
12e29e750c4583 Jonathan Cameron 2022-09-06  473  	struct mutex lock;
12e29e750c4583 Jonathan Cameron 2022-09-06  474  
12e29e750c4583 Jonathan Cameron 2022-09-06  475  	/* Transport */
12e29e750c4583 Jonathan Cameron 2022-09-06  476  	struct device *dev;
12e29e750c4583 Jonathan Cameron 2022-09-06  477  	spdm_transport *transport;
12e29e750c4583 Jonathan Cameron 2022-09-06  478  	void *transport_priv;
12e29e750c4583 Jonathan Cameron 2022-09-06  479  	u32 transport_sz;
12e29e750c4583 Jonathan Cameron 2022-09-06  480  
12e29e750c4583 Jonathan Cameron 2022-09-06  481  	/* Negotiated state */
12e29e750c4583 Jonathan Cameron 2022-09-06  482  	u8 version;
12e29e750c4583 Jonathan Cameron 2022-09-06  483  	u32 responder_caps;
12e29e750c4583 Jonathan Cameron 2022-09-06  484  	u32 base_asym_alg;
12e29e750c4583 Jonathan Cameron 2022-09-06  485  	u32 base_hash_alg;
12e29e750c4583 Jonathan Cameron 2022-09-06  486  	unsigned long slot_mask;
12e29e750c4583 Jonathan Cameron 2022-09-06  487  
12e29e750c4583 Jonathan Cameron 2022-09-06  488  	/* Signature algorithm */
12e29e750c4583 Jonathan Cameron 2022-09-06  489  	const char *base_asym_enc;
12e29e750c4583 Jonathan Cameron 2022-09-06  490  	size_t s;
12e29e750c4583 Jonathan Cameron 2022-09-06  491  
12e29e750c4583 Jonathan Cameron 2022-09-06  492  	/* Hash algorithm */
12e29e750c4583 Jonathan Cameron 2022-09-06  493  	const char *base_hash_alg_name;
12e29e750c4583 Jonathan Cameron 2022-09-06  494  	struct crypto_shash *shash;
12e29e750c4583 Jonathan Cameron 2022-09-06  495  	struct shash_desc *desc;
12e29e750c4583 Jonathan Cameron 2022-09-06  496  	size_t h;
12e29e750c4583 Jonathan Cameron 2022-09-06  497  
12e29e750c4583 Jonathan Cameron 2022-09-06  498  	/* Certificates */
12e29e750c4583 Jonathan Cameron 2022-09-06  499  	struct key *leaf_key;
12e29e750c4583 Jonathan Cameron 2022-09-06  500  	struct key *root_keyring;
12e29e750c4583 Jonathan Cameron 2022-09-06 @501  };
12e29e750c4583 Jonathan Cameron 2022-09-06  502  

:::::: The code at line 501 was first introduced by commit
:::::: 12e29e750c4583393be0d37dc3fcab85e17c5c0e spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
