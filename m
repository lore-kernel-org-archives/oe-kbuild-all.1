Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891C623
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 00:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693702481; x=1725238481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xI5qDO4HsgXqXjCDoj7XvSlzmsKJNT7qXFe5U2Qf5cc=;
  b=bv/FrsTIuPnbrt0KzAdDSo0zviA92vfPojyKHJcn9YbkMzCSH7Ff8msj
   rkeVAIvvqyYvKZDRKnCfKSez7r8p9/EQt+HPy8Na0yFyaDyCfsCFEoGsi
   IoxImeohqH/3aq9ZmGvB5tPhKJeKYpda5MywLMejtt/eBmxsr9HEd99Br
   oUSflyyDdfcktXz1FYkplytwc0av1VyZoOXvcWf5tqYB5PbmErm++G+Kh
   /1QF08+QC5CPkp82wCvsMJBxg7nusHD0QEJdo4mf+IqExhGY/uT2UtLdr
   FYlLSs3comqKVT+Y+jzDyVip/S4m0LO5EPODD20RfjEVmpoFW4GDwSvPi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="379131532"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="379131532"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987102185"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="987102185"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 17:54:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcbNr-0002lH-0u;
	Sun, 03 Sep 2023 00:54:35 +0000
Date: Sun, 3 Sep 2023 08:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/15] lib/spdm_requester.c:1005:50: error: too few
 arguments to function call, expected 6, have 2
Message-ID: <202309030823.m5zCI2ta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   134b3cb0cca6924ac200763fa64b27b2587f2cd9
commit: d8617e4f95e9e3c4979d5b423486f03da5ea5f41 [8/15] PCI/CMA: Validate Subject Alternative Name in certificates
config: arm64-randconfig-r006-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030823.m5zCI2ta-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030823.m5zCI2ta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030823.m5zCI2ta-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/spdm_requester.c:1005:50: error: too few arguments to function call, expected 6, have 2
                   rc = spdm_state->validate(spdm_state->dev, cert);
                        ~~~~~~~~~~~~~~~~~~~~                      ^
>> lib/spdm_requester.c:1458:23: error: incompatible function pointer types assigning to 'spdm_transport *' (aka 'int (*)(void *, struct device *, const void *, unsigned long, void *, unsigned long)') from 'spdm_validate *' (aka 'int (*)(struct device *, struct x509_certificate *)') [-Wincompatible-function-pointer-types]
           spdm_state->validate = validate;
                                ^ ~~~~~~~~
   2 errors generated.


vim +1005 lib/spdm_requester.c

   940	
   941	static int spdm_validate_certificate(struct spdm_state *spdm_state, u8 slot,
   942					     u8 *certs, size_t total_length)
   943	{
   944		struct x509_certificate *cert, *prev = NULL;
   945		size_t offset = 0;
   946		struct key *key;
   947		int rc, length;
   948	
   949		while (offset < total_length) {
   950			rc = x509_get_certificate_length(certs + offset,
   951							 total_length - offset);
   952			if (rc < 0) {
   953				dev_err(spdm_state->dev, "Malformed certificate "
   954					"at slot %hhu offset %zu\n", slot, offset);
   955				goto err_free_prev;
   956			}
   957	
   958			length = rc;
   959	
   960			cert = x509_cert_parse(certs + offset, length);
   961			if (IS_ERR(cert)) {
   962				rc = PTR_ERR(cert);
   963				dev_err(spdm_state->dev, "Certificate parse error %d "
   964					"at slot %hhu offset %zu\n", rc, slot, offset);
   965				goto err_free_prev;
   966			}
   967	
   968			if (!prev) {
   969				/* First cert in chain, check against root_keyring */
   970				key = find_asymmetric_key(spdm_state->root_keyring,
   971							  cert->sig->auth_ids[0],
   972							  cert->sig->auth_ids[1],
   973							  cert->sig->auth_ids[2],
   974							  false);
   975				if (IS_ERR(key)) {
   976					dev_info(spdm_state->dev, "Root certificate "
   977						 "for slot %hhu not found in %s "
   978						 "keyring: %s\n", slot,
   979						 spdm_state->root_keyring->description,
   980						 cert->issuer);
   981					rc = PTR_ERR(key);
   982					goto err_free_cert;
   983				}
   984	
   985				rc = verify_signature(key, cert->sig);
   986				key_put(key);
   987			} else {
   988				/* Subsequent cert in chain, check against previous */
   989				rc = public_key_verify_signature(prev->pub, cert->sig);
   990			}
   991	
   992			if (rc) {
   993				dev_err(spdm_state->dev, "Signature validation error "
   994					"%d at slot %hhu offset %zu\n",
   995					rc, slot, offset);
   996				goto err_free_cert;
   997			}
   998	
   999			x509_free_certificate(prev);
  1000			offset += length;
  1001			prev = cert;
  1002		}
  1003	
  1004		if (spdm_state->validate) {
> 1005			rc = spdm_state->validate(spdm_state->dev, cert);
  1006			if (rc)
  1007				goto err_free_cert;
  1008		}
  1009	
  1010		spdm_state->leaf_key = cert->pub;
  1011		cert->pub = NULL;
  1012		prev = NULL;
  1013	
  1014	err_free_cert:
  1015		x509_free_certificate(cert);
  1016	err_free_prev:
  1017		x509_free_certificate(prev);
  1018		return rc;
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
