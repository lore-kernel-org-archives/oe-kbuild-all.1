Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9F2917
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jul 2023 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688914310; x=1720450310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+HZVQD2ODu2bevbHRnChJQNiYDVgzNIS37Wu/Axkdg=;
  b=AUShRiZUe21c5TyOw1pIQrEmcoNo/VRSCytRjuyXORsgbS5uIZMm3BZ9
   Zx4mLBeMQt9RBXvEtfAUFSlC5c3bPO2nBE7/15HEJne3Juw/sr0g8Ax8M
   CJijmbUuTTaoOtWVNq9QEgUqtnRpYQ26FqDYsJuvuIKdKp0zyC1AqEoAj
   9JiIEogPcpHPTvBFKDiYN2byfvW4HJ1SsyBAQ0HJeZ21b7GPaTaEJfLe4
   XxfzIzOfi/TW4J/vXbLk7xeMMuzUZmYTDRYw3txdmKd7MHRP/g6mB0Ohh
   GIJzDbe0xrykxLtgRUKSzMZWLzfT75guiaJrZK+hgZatYt9+obCdYOm4n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427863008"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="427863008"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 07:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="790526933"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="790526933"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jul 2023 07:51:48 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIVlL-0003Fy-2r;
	Sun, 09 Jul 2023 14:51:47 +0000
Date: Sun, 9 Jul 2023 22:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 11/11] lib/spdm.c:823:54: error: 'SPDM_ASYM_ALGOS'
 undeclared
Message-ID: <202307092224.hCGhPHZ3-lkp@intel.com>
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
commit: bb8dcae54e81779980c746964e43e4db92c03b81 [11/11] spdm: Add support for mutual authentication
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230709/202307092224.hCGhPHZ3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307092224.hCGhPHZ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307092224.hCGhPHZ3-lkp@intel.com/

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
   lib/spdm.c:144:73: error: invalid operands to binary | (have 'char *' and 'char *')
     144 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:801:43: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     801 |         req->base_asym_algo = cpu_to_le32(SPDM_SUPPORTED_ASYM_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:147:73: error: invalid operands to binary | (have 'char *' and 'char *')
     147 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:802:43: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     802 |         req->base_hash_algo = cpu_to_le32(SPDM_SUPPORTED_HASH_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:811:54: error: 'SPDM_DHE_ALGOS' undeclared (first use in this function)
     811 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:811:42: note: in expansion of macro 'cpu_to_le16'
     811 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm.c:811:54: note: each undeclared identifier is reported only once for each function it appears in
     811 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:811:42: note: in expansion of macro 'cpu_to_le16'
     811 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm.c:816:54: error: 'SPDM_AEAD_ALGOS' undeclared (first use in this function); did you mean 'SPDM_AEAD_SM4_GCM'?
     816 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:816:42: note: in expansion of macro 'cpu_to_le16'
     816 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                          ^~~~~~~~~~~
>> lib/spdm.c:823:54: error: 'SPDM_ASYM_ALGOS' undeclared (first use in this function)
     823 |                         .alg_supported = cpu_to_le16(SPDM_ASYM_ALGOS),
         |                                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm.c:823:42: note: in expansion of macro 'cpu_to_le16'
     823 |                         .alg_supported = cpu_to_le16(SPDM_ASYM_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm.c:144:73: error: invalid operands to binary | (have 'char *' and 'char *')
     144 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:856:51: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     856 |                 le32_to_cpu(rsp->base_asym_sel) & SPDM_SUPPORTED_ASYM_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:147:73: error: invalid operands to binary | (have 'char *' and 'char *')
     147 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:858:51: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     858 |                 le32_to_cpu(rsp->base_hash_sel) & SPDM_SUPPORTED_HASH_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c: In function 'spdm_parse_algs':
   lib/spdm.c:776:1: error: control reaches end of non-void function [-Werror=return-type]
     776 | }
         | ^
   cc1: some warnings being treated as errors


vim +/SPDM_ASYM_ALGOS +823 lib/spdm.c

   779	
   780	static int spdm_negotiate_algs(struct spdm_state *spdm_state,
   781				       void *transcript, size_t transcript_sz)
   782	{
   783		struct spdm_req_alg_struct *req_alg_struct;
   784		struct spdm_negotiate_algs_req *req;
   785		struct spdm_negotiate_algs_rsp *rsp;
   786		size_t req_sz = sizeof(*req) +
   787				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   788		size_t rsp_sz = sizeof(*rsp) +
   789				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   790		int rc, length, i = 0;
   791	
   792		/* Request length shall be <= 128 bytes (SPDM 1.1.0 margin no 185) */
   793		BUILD_BUG_ON(req_sz > 128);
   794	
   795		req = kzalloc(req_sz, GFP_KERNEL);
   796		if (!req)
   797			return -ENOMEM;
   798	
   799		req->code = SPDM_NEGOTIATE_ALGS;
   800		req->measurement_specification = SPDM_MEAS_SPEC_DMTF;
   801		req->base_asym_algo = cpu_to_le32(SPDM_SUPPORTED_ASYM_ALGOS);
   802		req->base_hash_algo = cpu_to_le32(SPDM_SUPPORTED_HASH_ALGOS);
   803		if (spdm_state->version >= 0x12)
   804			req->other_params_support = SPDM_OPAQUE_DATA_FMT_GENERAL;
   805	
   806		req_alg_struct = (struct spdm_req_alg_struct *)(req + 1);
   807		if (spdm_state->responder_caps & SPDM_KEY_EX_CAP) {
   808			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   809				.alg_type = SPDM_REQ_ALG_STRUCT_DHE,
   810				.alg_count = 0x20,
   811				.alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
   812			};
   813			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   814				.alg_type = SPDM_REQ_ALG_STRUCT_AEAD,
   815				.alg_count = 0x20,
   816				.alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
   817			};
   818		}
   819		if (spdm_state->responder_caps & SPDM_MUT_AUTH_CAP)
   820			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   821				.alg_type = SPDM_REQ_ALG_STRUCT_REQ_BASE_ASYM_ALG,
   822				.alg_count = 0x20,
 > 823				.alg_supported = cpu_to_le16(SPDM_ASYM_ALGOS),
   824			};
   825		if (spdm_state->responder_caps & SPDM_KEY_EX_CAP)
   826			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   827				.alg_type = SPDM_REQ_ALG_STRUCT_KEY_SCHEDULE,
   828				.alg_count = 0x20,
   829				.alg_supported = cpu_to_le16(SPDM_KEY_SCHEDULE_SPDM),
   830			};
   831		req->param1 = i;
   832		req->length = cpu_to_le16(sizeof(*req) + i * sizeof(*req_alg_struct));
   833		WARN_ON(i > SPDM_MAX_REQ_ALG_STRUCT);
   834	
   835		rsp = kzalloc(rsp_sz, GFP_KERNEL);
   836		if (!rsp) {
   837			rc = -ENOMEM;
   838			goto err_free_req;
   839		}
   840	
   841		rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
   842		if (rc < 0)
   843			goto err_free_rsp;
   844	
   845		length = rc;
   846		if (length < sizeof(*rsp) ||
   847		    length < sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct)) {
   848			dev_err(spdm_state->dev, "Truncated algorithms response\n");
   849			rc = -EIO;
   850			goto err_free_rsp;
   851		}
   852	
   853		spdm_state->measurement_hash_alg =
   854			le32_to_cpu(rsp->measurement_hash_algo);
   855		spdm_state->base_asym_alg =
   856			le32_to_cpu(rsp->base_asym_sel) & SPDM_SUPPORTED_ASYM_ALGOS;
   857		spdm_state->base_hash_alg =
   858			le32_to_cpu(rsp->base_hash_sel) & SPDM_SUPPORTED_HASH_ALGOS;
   859	
   860		/* Responder shall select exactly 1 alg (SPDM 1.1.0 margin no 193) */
   861		if (hweight32(spdm_state->base_asym_alg) != 1 ||
   862		    hweight32(spdm_state->base_hash_alg) != 1 ||
   863		    rsp->ext_asym_sel_count != 0 ||
   864		    rsp->ext_hash_sel_count != 0 ||
   865		    rsp->param1 > req->param1 ||
   866		    rsp->other_params_sel != req->other_params_support ||
   867		    (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
   868		     (hweight32(spdm_state->measurement_hash_alg) != 1 ||
   869		      rsp->measurement_specification_sel != SPDM_MEAS_SPEC_DMTF))) {
   870			dev_err(spdm_state->dev, "Malformed algorithms response\n");
   871			rc = -EPROTO;
   872			goto err_free_rsp;
   873		}
   874	
   875		rc = spdm_parse_algs(spdm_state);
   876		if (rc)
   877			goto err_free_rsp;
   878	
   879		/*
   880		 * If request contained a ReqAlgStruct not supported by responder,
   881		 * the corresponding RespAlgStruct may be omitted in response.
   882		 * Calculate the actual (possibly shorter) response length:
   883		 */
   884		rsp_sz = sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct);
   885	
   886		rc = spdm_start_hash(spdm_state, transcript, transcript_sz,
   887				     req, req_sz, rsp, rsp_sz);
   888	
   889	err_free_rsp:
   890		kfree(rsp);
   891	err_free_req:
   892		kfree(req);
   893	
   894		return rc;
   895	}
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
