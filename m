Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932AAD21
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693682490; x=1725218490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fW2Fr149UauGIct79SN8IaAERi2CKTZarl3cNi+IsHA=;
  b=KCOAtykRZ4VJAyyk/oxQ21KgUL1L817JxpyIr+VPuNAA78Ah6Dkl64rm
   4Ut+UTG6LB6ONkRjE9rFYmD09xFkBbN+NCwoim1cNbRuvjbOWqOtpPOec
   OGPwV8L7o3AvEIvJ3jIKZ3E0JeZl68XsK5nF20FbOFOM55eOFgCbdskSS
   12W5eVE1PlzzBhudkxm7UIDH98MjNQnH8b3IeuT/6kcQG1E3T4Ze+NVNA
   qhWXH1/hcpe7M8yvUGw+8YxEYWQCEKG4rEM60UhwVKjhy4eOED0mpsKEv
   2I0TWvCSQ692ZL3K7PuxgcCu49UzahT5wZDr4ZFjlCSA9jAIBEPnWN10O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="440362396"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="440362396"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 12:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="733879075"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="733879075"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Sep 2023 12:21:28 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcWBR-0002YF-3C;
	Sat, 02 Sep 2023 19:21:25 +0000
Date: Sun, 3 Sep 2023 03:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/15] lib/spdm_requester.c:1005:60: error: passing argument
 2 of 'spdm_state->validate' from incompatible pointer type
Message-ID: <202309030316.JUkOMFCf-lkp@intel.com>
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
config: parisc-randconfig-r002-20230903 (https://download.01.org/0day-ci/archive/20230903/202309030316.JUkOMFCf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030316.JUkOMFCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030316.JUkOMFCf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/spdm_requester.c:19:
   include/linux/spdm.h:26:36: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                             struct x509_certificate *leaf_cert);
         |                                    ^~~~~~~~~~~~~~~~
   lib/spdm_requester.c: In function 'spdm_validate_certificate':
>> lib/spdm_requester.c:1005:60: error: passing argument 2 of 'spdm_state->validate' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1005 |                 rc = spdm_state->validate(spdm_state->dev, cert);
         |                                                            ^~~~
         |                                                            |
         |                                                            struct x509_certificate *
   lib/spdm_requester.c:1005:60: note: expected 'struct device *' but argument is of type 'struct x509_certificate *'
>> lib/spdm_requester.c:1005:22: error: too few arguments to function 'spdm_state->validate'
    1005 |                 rc = spdm_state->validate(spdm_state->dev, cert);
         |                      ^~~~~~~~~~
   lib/spdm_requester.c: In function 'spdm_create':
>> lib/spdm_requester.c:1458:30: error: assignment to 'int (*)(void *, struct device *, const void *, size_t,  void *, size_t)' {aka 'int (*)(void *, struct device *, const void *, unsigned int,  void *, unsigned int)'} from incompatible pointer type 'int (*)(struct device *, struct x509_certificate *)' [-Werror=incompatible-pointer-types]
    1458 |         spdm_state->validate = validate;
         |                              ^
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pci.h:42,
                    from drivers/pci/cma.c:13:
   include/linux/spdm.h:26:36: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
      26 |                             struct x509_certificate *leaf_cert);
         |                                    ^~~~~~~~~~~~~~~~
   drivers/pci/cma.c: In function 'pci_cma_init':
>> drivers/pci/cma.c:63:61: error: passing argument 5 of 'spdm_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
      63 |                                        PCI_DOE_MAX_PAYLOAD, pci_cma_validate,
         |                                                             ^~~~~~~~~~~~~~~~
         |                                                             |
         |                                                             int (*)(struct device *, struct x509_certificate *)
   include/linux/spdm.h:30:47: note: expected 'int (*)(struct device *, struct x509_certificate *)' but argument is of type 'int (*)(struct device *, struct x509_certificate *)'
      30 |                                spdm_validate *validate, struct key *keyring);
         |                                ~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


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
