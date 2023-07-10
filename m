Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699941426F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 17:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689011364; x=1720547364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfKIin4Ab4J0Azl7sALbsNGIR4kkGuomlyDS2k9QcoM=;
  b=TmRXO2/I67CojBSd6vxVue366CK2obZfbApj72Z5O9NLq3c0J1C8MV39
   Vj8RHW1YD31vjHY43UCu4FnkoAHl0MB56W0TjHQt1ao0HoUAgAl72kixA
   UrOJJXxd/UTGx9ZFrNPGclqfkExZfhkDz2PusMDENJ5RTI3UkePGCBRRD
   XpXqwRyE8JqovBihjryKv9ACMvXKBUe7qIw5hX3WKOsKWMdgkbpAUkOJ4
   L91xxPwKlx3jl2LsVMOIPSgmHrTiO8YgtmbyiXLYCJO/VDoZ1JnAfv9Kn
   y5C0m3u2eAgdJ7NFAMuvVMDIMh6XxaGmRbw63X0ymXy1Cpr6mjJQ62ZIv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354274077"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="354274077"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 10:49:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756073697"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="756073697"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 10:49:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIv0k-0003rY-05;
	Mon, 10 Jul 2023 17:49:22 +0000
Date: Tue, 11 Jul 2023 01:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 10/11] lib/spdm_requester.c:831:54: error: 'SPDM_DHE_ALGOS'
 undeclared; did you mean 'SPDM_ASYM_ALGOS'?
Message-ID: <202307110140.0FbB3luU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   3ede6444266ab205eecedafc0aa581feea48879e
commit: 2546df7ab17a6e232d246ed0313554c5ce59d5c5 [10/11] spdm: Add support for key exchange
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230711/202307110140.0FbB3luU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110140.0FbB3luU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110140.0FbB3luU-lkp@intel.com/

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
                    from lib/spdm_requester.c:14:
   lib/spdm_requester.c: In function 'spdm_negotiate_algs':
>> lib/spdm_requester.c:831:54: error: 'SPDM_DHE_ALGOS' undeclared (first use in this function); did you mean 'SPDM_ASYM_ALGOS'?
     831 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm_requester.c:831:42: note: in expansion of macro 'cpu_to_le16'
     831 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
   lib/spdm_requester.c:831:54: note: each undeclared identifier is reported only once for each function it appears in
     831 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm_requester.c:831:42: note: in expansion of macro 'cpu_to_le16'
     831 |                         .alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
         |                                          ^~~~~~~~~~~
>> lib/spdm_requester.c:836:54: error: 'SPDM_AEAD_ALGOS' undeclared (first use in this function); did you mean 'SPDM_ASYM_ALGOS'?
     836 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                                      ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:36:51: note: in definition of macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)(__u16)(x))
         |                                                   ^
   lib/spdm_requester.c:836:42: note: in expansion of macro 'cpu_to_le16'
     836 |                         .alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
         |                                          ^~~~~~~~~~~


vim +831 lib/spdm_requester.c

   799	
   800	static int spdm_negotiate_algs(struct spdm_state *spdm_state,
   801				       void *transcript, size_t transcript_sz)
   802	{
   803		struct spdm_req_alg_struct *req_alg_struct;
   804		struct spdm_negotiate_algs_req *req;
   805		struct spdm_negotiate_algs_rsp *rsp;
   806		size_t req_sz = sizeof(*req) +
   807				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   808		size_t rsp_sz = sizeof(*rsp) +
   809				sizeof(*req_alg_struct) * SPDM_MAX_REQ_ALG_STRUCT;
   810		int rc, length, i = 0;
   811	
   812		/* Request length shall be <= 128 bytes (SPDM 1.1.0 margin no 185) */
   813		BUILD_BUG_ON(req_sz > 128);
   814	
   815		req = kzalloc(req_sz, GFP_KERNEL);
   816		if (!req)
   817			return -ENOMEM;
   818	
   819		req->code = SPDM_NEGOTIATE_ALGS;
   820		req->measurement_specification = SPDM_MEAS_SPEC_DMTF;
   821		req->base_asym_algo = cpu_to_le32(SPDM_ASYM_ALGOS);
   822		req->base_hash_algo = cpu_to_le32(SPDM_HASH_ALGOS);
   823		if (spdm_state->version >= 0x12)
   824			req->other_params_support = SPDM_OPAQUE_DATA_FMT_GENERAL;
   825	
   826		req_alg_struct = (struct spdm_req_alg_struct *)(req + 1);
   827		if (spdm_state->responder_caps & SPDM_KEY_EX_CAP) {
   828			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   829				.alg_type = SPDM_REQ_ALG_STRUCT_DHE,
   830				.alg_count = 0x20,
 > 831				.alg_supported = cpu_to_le16(SPDM_DHE_ALGOS),
   832			};
   833			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   834				.alg_type = SPDM_REQ_ALG_STRUCT_AEAD,
   835				.alg_count = 0x20,
 > 836				.alg_supported = cpu_to_le16(SPDM_AEAD_ALGOS),
   837			};
   838			req_alg_struct[i++] = (struct spdm_req_alg_struct) {
   839				.alg_type = SPDM_REQ_ALG_STRUCT_KEY_SCHEDULE,
   840				.alg_count = 0x20,
   841				.alg_supported = cpu_to_le16(SPDM_KEY_SCHEDULE_SPDM),
   842			};
   843		}
   844		req->param1 = i;
   845		req->length = cpu_to_le16(sizeof(*req) + i * sizeof(*req_alg_struct));
   846		WARN_ON(i > SPDM_MAX_REQ_ALG_STRUCT);
   847	
   848		rsp = kzalloc(rsp_sz, GFP_KERNEL);
   849		if (!rsp) {
   850			rc = -ENOMEM;
   851			goto err_free_req;
   852		}
   853	
   854		rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
   855		if (rc < 0)
   856			goto err_free_rsp;
   857	
   858		length = rc;
   859		if (length < sizeof(*rsp) ||
   860		    length < sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct)) {
   861			dev_err(spdm_state->dev, "Truncated algorithms response\n");
   862			rc = -EIO;
   863			goto err_free_rsp;
   864		}
   865	
   866		spdm_state->measurement_hash_alg =
   867			le32_to_cpu(rsp->measurement_hash_algo);
   868		spdm_state->base_asym_alg =
   869			le32_to_cpu(rsp->base_asym_sel) & SPDM_ASYM_ALGOS;
   870		spdm_state->base_hash_alg =
   871			le32_to_cpu(rsp->base_hash_sel) & SPDM_HASH_ALGOS;
   872	
   873		/* Responder shall select exactly 1 alg (SPDM 1.1.0 margin no 193) */
   874		if (hweight32(spdm_state->base_asym_alg) != 1 ||
   875		    hweight32(spdm_state->base_hash_alg) != 1 ||
   876		    rsp->ext_asym_sel_count != 0 ||
   877		    rsp->ext_hash_sel_count != 0 ||
   878		    rsp->param1 > req->param1 ||
   879		    rsp->other_params_sel != req->other_params_support ||
   880		    (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
   881		     (hweight32(spdm_state->measurement_hash_alg) != 1 ||
   882		      rsp->measurement_specification_sel != SPDM_MEAS_SPEC_DMTF))) {
   883			dev_err(spdm_state->dev, "Malformed algorithms response\n");
   884			rc = -EPROTO;
   885			goto err_free_rsp;
   886		}
   887	
   888		rc = spdm_parse_algs(spdm_state);
   889		if (rc)
   890			goto err_free_rsp;
   891	
   892		/*
   893		 * If request contained a ReqAlgStruct not supported by responder,
   894		 * the corresponding RespAlgStruct may be omitted in response.
   895		 * Calculate the actual (possibly shorter) response length:
   896		 */
   897		rsp_sz = sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct);
   898	
   899		rc = spdm_start_hash(spdm_state, transcript, transcript_sz,
   900				     req, req_sz, rsp, rsp_sz);
   901	
   902	err_free_rsp:
   903		kfree(rsp);
   904	err_free_req:
   905		kfree(req);
   906	
   907		return rc;
   908	}
   909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
