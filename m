Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574DF3C1E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 21:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693690594; x=1725226594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nQFvkGLLzZDV9vOcyR5zQ86JIXltpy7Xt8h5TdJD4g=;
  b=WDyURv+H99/mp3uHY0lIOn0rc6Kck6Dt9ff3IU+lxnKmJyRJe4p3+CBb
   fbbp/VzK00HZguRy1Fx4OnAP1fRuE/KDXeoh5htJVH31yGelOkhH/SSOL
   oalBa87r+AJSU38xaNnBbis9A6CojOXtVdnsORaB9VKnerxWACLOTbECU
   LJwvC2hUlaLF+CO8xE6jLYXnobKUFqizJFsRKH3yBx9tEVdLyfk0/QMS7
   70ts9X3+bIRrQtNAEjIdZa6jPU01bdtePRx2I+rkwyj8PcA+B1QPEnIoX
   PX7fItYWkDvYRr6DqtVbJ3tHPFSl4RIHNclWR0H7BwHOyv6ifAmU4/h/8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366629554"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="366629554"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 14:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987074514"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="987074514"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 14:36:31 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcYI9-0002cZ-32;
	Sat, 02 Sep 2023 21:36:29 +0000
Date: Sun, 3 Sep 2023 05:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/15] lib/spdm_requester.c:1458:30: error: assignment to
 'int (*)(void *, struct device *, const void *, size_t,  void *, size_t)'
 {aka 'int (*)(void *, struct device *, const void *, long unsigned int,
  void *, long unsigned int)'} from incompatible pointer ty...
Message-ID: <202309030536.3s8Nwny3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   ed763a31e6c59b6da2def6097fb0463b710121af
commit: e1b1c6bba0267c230d1776987b241dfd53a00305 [8/15] PCI/CMA: Validate Subject Alternative Name in certificates
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230903/202309030536.3s8Nwny3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030536.3s8Nwny3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030536.3s8Nwny3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/spdm_requester.c:19:
   include/linux/spdm.h:26:36: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                             struct x509_certificate *leaf_cert);
         |                                    ^~~~~~~~~~~~~~~~
   lib/spdm_requester.c: In function 'spdm_validate_certificate':
   lib/spdm_requester.c:1005:60: error: passing argument 2 of 'spdm_state->validate' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1005 |                 rc = spdm_state->validate(spdm_state->dev, cert);
         |                                                            ^~~~
         |                                                            |
         |                                                            struct x509_certificate *
   lib/spdm_requester.c:1005:60: note: expected 'struct device *' but argument is of type 'struct x509_certificate *'
   lib/spdm_requester.c:1005:22: error: too few arguments to function 'spdm_state->validate'
    1005 |                 rc = spdm_state->validate(spdm_state->dev, cert);
         |                      ^~~~~~~~~~
   lib/spdm_requester.c: In function 'spdm_create':
>> lib/spdm_requester.c:1458:30: error: assignment to 'int (*)(void *, struct device *, const void *, size_t,  void *, size_t)' {aka 'int (*)(void *, struct device *, const void *, long unsigned int,  void *, long unsigned int)'} from incompatible pointer type 'int (*)(struct device *, struct x509_certificate *)' [-Werror=incompatible-pointer-types]
    1458 |         spdm_state->validate = validate;
         |                              ^
   cc1: some warnings being treated as errors


vim +1458 lib/spdm_requester.c

  1431	
  1432	/**
  1433	 * spdm_create() - Allocate SPDM session
  1434	 *
  1435	 * @dev: Transport device
  1436	 * @transport: Transport function to perform one message exchange
  1437	 * @transport_priv: Transport private data
  1438	 * @transport_sz: Maximum message size the transport is capable of (in bytes)
  1439	 * @validate: Function to validate additional leaf certificate requirements
  1440	 *	(optional, may be %NULL)
  1441	 * @keyring: Trusted root certificates
  1442	 *
  1443	 * Returns a pointer to the allocated SPDM session state or NULL on error.
  1444	 */
  1445	struct spdm_state *spdm_create(struct device *dev, spdm_transport *transport,
  1446				       void *transport_priv, u32 transport_sz,
  1447				       spdm_validate *validate, struct key *keyring)
  1448	{
  1449		struct spdm_state *spdm_state = kzalloc(sizeof(*spdm_state), GFP_KERNEL);
  1450	
  1451		if (!spdm_state)
  1452			return NULL;
  1453	
  1454		spdm_state->dev = dev;
  1455		spdm_state->transport = transport;
  1456		spdm_state->transport_priv = transport_priv;
  1457		spdm_state->transport_sz = transport_sz;
> 1458		spdm_state->validate = validate;
  1459		spdm_state->root_keyring = keyring;
  1460	
  1461		mutex_init(&spdm_state->lock);
  1462	
  1463		return spdm_state;
  1464	}
  1465	EXPORT_SYMBOL_GPL(spdm_create);
  1466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
