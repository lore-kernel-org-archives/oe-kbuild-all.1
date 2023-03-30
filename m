Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3DE1101
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 04:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680150993; x=1711686993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C6aU5vIeyhUg/RMUo+wDdEtvDzd6yoZCDzIcU1cDIHM=;
  b=Z+tIU5jxyI78RnNphsN78BdmPojwQgcRgSGUnnqhr1iTO1bWtG35q+js
   Jgk1m9BOcXbMYgzpBAXCIo1bAK3eARNNyCkv1FooVgCjxYg6p068a0KVf
   tEDIQyo/Owd8OiekHPpd70A8meHM5KowEB2WdYU3jte5NZd4E+T84QR/B
   S/ef38b3al2N8za7iQ6qt1pXbMxpRP0SWX445oyPeymrnBNxaFXAzn3wP
   ZETN893XfwLNoRrkuxrsJ2zVSw6e/CRJuU7oyAge/7bWh+LKDOXdfrK1R
   LuM32YxL3KDuhhNodtxH1gKu3DpDRqYhzQWHtd+PYkoqvAEn/p/l3gL/l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338564746"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="338564746"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 21:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717162089"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717162089"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 21:36:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phk1U-000KLE-1J;
	Thu, 30 Mar 2023 04:36:28 +0000
Date: Thu, 30 Mar 2023 12:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 21/25] lib/spdm.c:1033:62: sparse: sparse: restricted
 __le16 degrades to integer
Message-ID: <202303301212.pfxsnqBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux doe
head:   3abb52b5d5cce7377ba61b4352eeab21eb0bc871
commit: 2647c9ea13f2e3ac4cb8993131aa275f1c115f0f [21/25] PCI/CMA: Authenticate devices on enumeration
config: alpha-randconfig-s052-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301212.pfxsnqBc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/l1k/linux/commit/2647c9ea13f2e3ac4cb8993131aa275f1c115f0f
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout 2647c9ea13f2e3ac4cb8993131aa275f1c115f0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301212.pfxsnqBc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/spdm.c:1033:62: sparse: sparse: restricted __le16 degrades to integer

vim +1033 lib/spdm.c

519d4abbcdff966 Jonathan Cameron 2022-09-06   938  
519d4abbcdff966 Jonathan Cameron 2022-09-06   939  static int spdm_get_certificate(struct spdm_state *spdm_state, u8 slot)
519d4abbcdff966 Jonathan Cameron 2022-09-06   940  {
519d4abbcdff966 Jonathan Cameron 2022-09-06   941  	struct spdm_get_certificate_req req = {
519d4abbcdff966 Jonathan Cameron 2022-09-06   942  		.code = SPDM_GET_CERTIFICATE,
519d4abbcdff966 Jonathan Cameron 2022-09-06   943  		.param1 = slot,
519d4abbcdff966 Jonathan Cameron 2022-09-06   944  	};
519d4abbcdff966 Jonathan Cameron 2022-09-06   945  	struct spdm_get_certificate_rsp *rsp;
519d4abbcdff966 Jonathan Cameron 2022-09-06   946  	size_t rsp_sz, total_length, header_length;
519d4abbcdff966 Jonathan Cameron 2022-09-06   947  	u16 remainder_length = 0xffff;
519d4abbcdff966 Jonathan Cameron 2022-09-06   948  	u16 portion_length;
519d4abbcdff966 Jonathan Cameron 2022-09-06   949  	u16 offset = 0;
519d4abbcdff966 Jonathan Cameron 2022-09-06   950  	u8 *certs = NULL;
519d4abbcdff966 Jonathan Cameron 2022-09-06   951  	int rc, length;
519d4abbcdff966 Jonathan Cameron 2022-09-06   952  
519d4abbcdff966 Jonathan Cameron 2022-09-06   953  	/*
519d4abbcdff966 Jonathan Cameron 2022-09-06   954  	 * It is legal for the responder to send more bytes than requested.
519d4abbcdff966 Jonathan Cameron 2022-09-06   955  	 * (Note the "should" in SPDM 1.1.0 margin no 239.)  If we allocate
519d4abbcdff966 Jonathan Cameron 2022-09-06   956  	 * a too small buffer, we can't calculate the hash over the (truncated)
519d4abbcdff966 Jonathan Cameron 2022-09-06   957  	 * response.  Only choice is thus to allocate the maximum possible 64k.
519d4abbcdff966 Jonathan Cameron 2022-09-06   958  	 */
519d4abbcdff966 Jonathan Cameron 2022-09-06   959  	rsp_sz = min_t(u32, sizeof(*rsp) + 0xffff, spdm_state->transport_sz);
519d4abbcdff966 Jonathan Cameron 2022-09-06   960  	rsp = kvmalloc(rsp_sz, GFP_KERNEL);
519d4abbcdff966 Jonathan Cameron 2022-09-06   961  	if (!rsp)
519d4abbcdff966 Jonathan Cameron 2022-09-06   962  		return -ENOMEM;
519d4abbcdff966 Jonathan Cameron 2022-09-06   963  
519d4abbcdff966 Jonathan Cameron 2022-09-06   964  	do {
519d4abbcdff966 Jonathan Cameron 2022-09-06   965  		/*
519d4abbcdff966 Jonathan Cameron 2022-09-06   966  		 * If transport_sz is sufficiently large, first request will be
519d4abbcdff966 Jonathan Cameron 2022-09-06   967  		 * for offset 0 and length 0xffff, which means entire cert
519d4abbcdff966 Jonathan Cameron 2022-09-06   968  		 * chain (SPDM 1.1.0 margin no 238).
519d4abbcdff966 Jonathan Cameron 2022-09-06   969  		 */
519d4abbcdff966 Jonathan Cameron 2022-09-06   970  		req.offset = cpu_to_le16(offset);
519d4abbcdff966 Jonathan Cameron 2022-09-06   971  		req.length = cpu_to_le16(min_t(size_t, remainder_length,
519d4abbcdff966 Jonathan Cameron 2022-09-06   972  					       rsp_sz - sizeof(*rsp)));
519d4abbcdff966 Jonathan Cameron 2022-09-06   973  
519d4abbcdff966 Jonathan Cameron 2022-09-06   974  		rc = spdm_exchange(spdm_state, &req, sizeof(req), rsp, rsp_sz);
519d4abbcdff966 Jonathan Cameron 2022-09-06   975  		if (rc < 0)
519d4abbcdff966 Jonathan Cameron 2022-09-06   976  			goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06   977  
519d4abbcdff966 Jonathan Cameron 2022-09-06   978  		length = rc;
519d4abbcdff966 Jonathan Cameron 2022-09-06   979  		if (length < sizeof(*rsp) ||
519d4abbcdff966 Jonathan Cameron 2022-09-06   980  		    length < sizeof(*rsp) + le16_to_cpu(rsp->portion_length)) {
519d4abbcdff966 Jonathan Cameron 2022-09-06   981  			dev_err(spdm_state->dev,
519d4abbcdff966 Jonathan Cameron 2022-09-06   982  				"Truncated certificate response\n");
519d4abbcdff966 Jonathan Cameron 2022-09-06   983  			rc = -EIO;
519d4abbcdff966 Jonathan Cameron 2022-09-06   984  			goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06   985  		}
519d4abbcdff966 Jonathan Cameron 2022-09-06   986  
519d4abbcdff966 Jonathan Cameron 2022-09-06   987  		portion_length = le16_to_cpu(rsp->portion_length);
519d4abbcdff966 Jonathan Cameron 2022-09-06   988  		remainder_length = le16_to_cpu(rsp->remainder_length);
519d4abbcdff966 Jonathan Cameron 2022-09-06   989  
519d4abbcdff966 Jonathan Cameron 2022-09-06   990  		/*
519d4abbcdff966 Jonathan Cameron 2022-09-06   991  		 * On first response we learn total length of cert chain.
519d4abbcdff966 Jonathan Cameron 2022-09-06   992  		 * Should portion_length + remainder_length exceed 0xffff,
519d4abbcdff966 Jonathan Cameron 2022-09-06   993  		 * the min() ensures that the malformed check triggers below.
519d4abbcdff966 Jonathan Cameron 2022-09-06   994  		 */
519d4abbcdff966 Jonathan Cameron 2022-09-06   995  		if (!certs) {
519d4abbcdff966 Jonathan Cameron 2022-09-06   996  			total_length = min(portion_length + remainder_length,
519d4abbcdff966 Jonathan Cameron 2022-09-06   997  					   0xffff);
519d4abbcdff966 Jonathan Cameron 2022-09-06   998  			certs = kvmalloc(total_length, GFP_KERNEL);
519d4abbcdff966 Jonathan Cameron 2022-09-06   999  			if (!certs) {
519d4abbcdff966 Jonathan Cameron 2022-09-06  1000  				rc = -ENOMEM;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1001  				goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1002  			}
519d4abbcdff966 Jonathan Cameron 2022-09-06  1003  		}
519d4abbcdff966 Jonathan Cameron 2022-09-06  1004  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1005  		if (!portion_length ||
519d4abbcdff966 Jonathan Cameron 2022-09-06  1006  		    (rsp->param1 & 0xf) != slot ||
519d4abbcdff966 Jonathan Cameron 2022-09-06  1007  		    offset + portion_length + remainder_length != total_length)
519d4abbcdff966 Jonathan Cameron 2022-09-06  1008  		{
519d4abbcdff966 Jonathan Cameron 2022-09-06  1009  			dev_err(spdm_state->dev,
519d4abbcdff966 Jonathan Cameron 2022-09-06  1010  				"Malformed certificate response\n");
519d4abbcdff966 Jonathan Cameron 2022-09-06  1011  			rc = -EPROTO;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1012  			goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1013  		}
519d4abbcdff966 Jonathan Cameron 2022-09-06  1014  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1015  		memcpy(certs + offset, rsp->cert_chain, portion_length);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1016  		offset += portion_length;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1017  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1018  		rc = crypto_shash_update(spdm_state->desc, (u8 *)&req,
519d4abbcdff966 Jonathan Cameron 2022-09-06  1019  					 sizeof(req));
519d4abbcdff966 Jonathan Cameron 2022-09-06  1020  		if (rc)
519d4abbcdff966 Jonathan Cameron 2022-09-06  1021  			goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1022  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1023  		rc = crypto_shash_update(spdm_state->desc, (u8 *)rsp,
519d4abbcdff966 Jonathan Cameron 2022-09-06  1024  					 sizeof(*rsp) + portion_length);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1025  		if (rc)
519d4abbcdff966 Jonathan Cameron 2022-09-06  1026  			goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1027  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1028  	} while (remainder_length > 0);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1029  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1030  	header_length = sizeof(struct spdm_cert_chain) + spdm_state->h;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1031  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1032  	if (total_length < header_length ||
519d4abbcdff966 Jonathan Cameron 2022-09-06 @1033  	    total_length != ((struct spdm_cert_chain *)certs)->length) {
519d4abbcdff966 Jonathan Cameron 2022-09-06  1034  		dev_err(spdm_state->dev, "Malformed certificate chain\n");
519d4abbcdff966 Jonathan Cameron 2022-09-06  1035  		rc = -EPROTO;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1036  		goto err_free_certs;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1037  	}
519d4abbcdff966 Jonathan Cameron 2022-09-06  1038  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1039  	rc = spdm_validate_certificate(spdm_state, slot, certs + header_length,
519d4abbcdff966 Jonathan Cameron 2022-09-06  1040  				       total_length - header_length);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1041  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1042  err_free_certs:
519d4abbcdff966 Jonathan Cameron 2022-09-06  1043  	kvfree(certs);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1044  	kvfree(rsp);
519d4abbcdff966 Jonathan Cameron 2022-09-06  1045  
519d4abbcdff966 Jonathan Cameron 2022-09-06  1046  	return rc;
519d4abbcdff966 Jonathan Cameron 2022-09-06  1047  }
519d4abbcdff966 Jonathan Cameron 2022-09-06  1048  

:::::: The code at line 1033 was first introduced by commit
:::::: 519d4abbcdff9661846ff0a685292183476728ec spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
