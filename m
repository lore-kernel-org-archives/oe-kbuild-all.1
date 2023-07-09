Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCAA2574
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jul 2023 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688910592; x=1720446592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2oTbZuIJieeoRDSl4GR/H/lnUkHY6YsgUpZmqL7W+ak=;
  b=NTunX3gOI7dgKYpQYClrtDAAHSlcYEaPAsELgqc0X6X66zIBmFfJECpF
   nUs0p0KugWbPx0T+2lzz39epEo/Lcmo9x5ZsFxsyOqMfJzcMiEZxkJKHS
   g4l2IiYLHp1KizXKoEOur5VNe4M90DKv9Gc2CQFQl/t6O447BaCTTNe3Z
   cwfBDks1GYBe6z40A/87aKCVyA4ieig1DdDQsEbaxzadFQGrzBJJsJh//
   ZNDykyDiUXEpJ5Hyug+bp7rZ9Dd+GoPuZyF5+SL6yfyEnkDAeKvEZ/0w9
   v4iU6aILQL6QdE1oukMRRD0Z9J7hMrALPSBYGXnTf9UxumZcpiYbJCCuF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427857607"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="427857607"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 06:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="967157467"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="967157467"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2023 06:49:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIUnL-0003EM-0F;
	Sun, 09 Jul 2023 13:49:47 +0000
Date: Sun, 9 Jul 2023 21:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 10/11] lib/spdm.c:809:54: error: 'SPDM_DHE_ALGOS' undeclared
Message-ID: <202307092119.pLhXoWU8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   bb8dcae54e81779980c746964e43e4db92c03b81
commit: c131a14ecfc3924a9f2ac7b109cca2cf722cb0f0 [10/11] spdm: Add support for key exchange
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230709/202307092119.pLhXoWU8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307092119.pLhXoWU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307092119.pLhXoWU8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from arch/x86/include/asm/orc_types.h:49,
                    from arch/x86/include/asm/unwind_hints.h:6,
                    from arch/x86/include/asm/nospec-branch.h:13,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/cred.h:13,
                    from lib/spdm.c:14:
   lib/spdm.c: In function 'spdm_negotiate_algs':
   lib/spdm.c:142:73: error: invalid operands to binary | (have 'char *' and 'char *')
     142 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:799:43: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     799 |         req->base_asym_algo = cpu_to_le32(SPDM_SUPPORTED_ASYM_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:145:73: error: invalid operands to binary | (have 'char *' and 'char *')
     145 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:800:43: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     800 |         req->base_hash_algo = cpu_to_le32(SPDM_SUPPORTED_HASH_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/spdm.c:809:54: error: 'SPDM_DHE_ALGOS' undeclared (first use in this function)
     809 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:809:42: note: in expansion of macro 'cpu_to_le16'
     809 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm.c:809:54: note: each undeclared identifier is reported only once for each function it appears in
     809 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:809:42: note: in expansion of macro 'cpu_to_le16'
     809 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
>> lib/spdm.c:814:54: error: 'SPDM_AEAD_ALGOS' undeclared (first use in this function); did you mean 'SPDM_AEAD_SM4_GCM'?
     814 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:814:42: note: in expansion of macro 'cpu_to_le16'
     814 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm.c:142:73: error: invalid operands to binary | (have 'char *' and 'char *')
     142 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:847:51: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     847 |                 le32_to_cpu(rsp->base_asym_sel) & SPDM_SUPPORTED_ASYM_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:145:73: error: invalid operands to binary | (have 'char *' and 'char *')
     145 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:849:51: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     849 |                 le32_to_cpu(rsp->base_hash_sel) & SPDM_SUPPORTED_HASH_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c: In function 'spdm_parse_algs':
   lib/spdm.c:774:1: error: control reaches end of non-void function [-Werror=return-type]
     774 | }
         | ^
   cc1: some warnings being treated as errors


vim +/SPDM_DHE_ALGOS +809 lib/spdm.c

   777	
   778	static int spdm_negotiate_algs(struct spdm_state *spdm_state,
   779				       void *transcript, size_t transcript_sz)
   780	{
   781		struct spdm_req_alg_struct *req_alg_struct;
   782		struct spdm_negotiate_algs_req *req;
   783		struct spdm_negotiate_algs_rsp *rsp;
   784		size_t req_sz = sizeof(*req) +
   785				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   786		size_t rsp_sz = sizeof(*rsp) +
   787				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   788		int rc, length, i = 0;
   789	
   790		/* Request length shall be <= 128 bytes (SPDM 1.1.0 margin no 185) */
   791		BUILD_BUG_ON(req_sz > 128);
   792	
   793		req = kzalloc(req_sz, GFP_KERNEL);
   794		if (!req)
   795			return -ENOMEM;
   796	
   797		req->code = SPDM_NEGOTIATE_ALGS;
   798		req->measurement_specification = SPDM_MEAS_SPEC_DMTF;
   799		req->base_asym_algo = cpu_to_le32(SPDM_SUPPORTED_ASYM_ALGOS);
 > 800		req->base_hash_algo = cpu_to_le32(SPDM_SUPPORTED_HASH_ALGOS);
   801		if (spdm_state->version >= 0x12)
   802			req->other_params_support = SPDM_OPAQUE_DATA_FMT_GENERAL;
   803	
   804		req_alg_struct = (struct spdm_req_alg_struct *)(req + 1);
   805		if (spdm_state->responder_caps & SPDM_KEY_EX_CAP) {
   806			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   807				.alg_type = SPDM_REQ_ALG_STRUCT_DHE,
   808				.alg_count = 0x20,
 > 809				.alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
   810			};
   811			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   812				.alg_type = SPDM_REQ_ALG_STRUCT_AEAD,
   813				.alg_count = 0x20,
 > 814				.alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
   815			};
   816			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   817				.alg_type = SPDM_REQ_ALG_STRUCT_KEY_SCHEDULE,
   818				.alg_count = 0x20,
   819				.alg_supported = cpu_to_le16(SPDM_KEY_SCHEDULE_SPDM),
   820			};
   821		}
   822		req->param1 = i;
   823		req->length = cpu_to_le16(sizeof(*req) + i * sizeof(*req_alg_struct));
   824		WARN_ON(i > SPDM_MAX_REQ_ALG_STRUCT);
   825	
   826		rsp = kzalloc(rsp_sz, GFP_KERNEL);
   827		if (!rsp) {
   828			rc = -ENOMEM;
   829			goto err_free_req;
   830		}
   831	
   832		rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
   833		if (rc < 0)
   834			goto err_free_rsp;
   835	
   836		length = rc;
   837		if (length < sizeof(*rsp) ||
   838		    length < sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct)) {
   839			dev_err(spdm_state->dev, "Truncated algorithms response\n");
   840			rc = -EIO;
   841			goto err_free_rsp;
   842		}
   843	
   844		spdm_state->measurement_hash_alg =
   845			le32_to_cpu(rsp->measurement_hash_algo);
   846		spdm_state->base_asym_alg =
   847			le32_to_cpu(rsp->base_asym_sel) & SPDM_SUPPORTED_ASYM_ALGOS;
   848		spdm_state->base_hash_alg =
   849			le32_to_cpu(rsp->base_hash_sel) & SPDM_SUPPORTED_HASH_ALGOS;
   850	
   851		/* Responder shall select exactly 1 alg (SPDM 1.1.0 margin no 193) */
   852		if (hweight32(spdm_state->base_asym_alg) != 1 ||
   853		    hweight32(spdm_state->base_hash_alg) != 1 ||
   854		    rsp->ext_asym_sel_count != 0 ||
   855		    rsp->ext_hash_sel_count != 0 ||
   856		    rsp->param1 > req->param1 ||
   857		    rsp->other_params_sel != req->other_params_support ||
   858		    (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
   859		     (hweight32(spdm_state->measurement_hash_alg) != 1 ||
   860		      rsp->measurement_specification_sel != SPDM_MEAS_SPEC_DMTF))) {
   861			dev_err(spdm_state->dev, "Malformed algorithms response\n");
   862			rc = -EPROTO;
   863			goto err_free_rsp;
   864		}
   865	
   866		rc = spdm_parse_algs(spdm_state);
   867		if (rc)
   868			goto err_free_rsp;
   869	
   870		/*
   871		 * If request contained a ReqAlgStruct not supported by responder,
   872		 * the corresponding RespAlgStruct may be omitted in response.
   873		 * Calculate the actual (possibly shorter) response length:
   874		 */
   875		rsp_sz = sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct);
   876	
   877		rc = spdm_start_hash(spdm_state, transcript, transcript_sz,
   878				     req, req_sz, rsp, rsp_sz);
   879	
   880	err_free_rsp:
   881		kfree(rsp);
   882	err_free_req:
   883		kfree(req);
   884	
   885		return rc;
   886	}
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
