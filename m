Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C7154C16
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712683373; cv=none; b=V0WRFs3Gfkpfj2AJHPSxPZ5anuieOpAq0ITGFE1ft1d464t9tQB2fClsWCPe+8n3TH390KxsI7hiIBroLcvd4cPeh+7ffonHTQYGaVDi2cdIP+HN6N0fbprzHwze0xucbReiAr+ERZYzmjczgbxsXLGOdQ2jaPnV2qbKgmblO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712683373; c=relaxed/simple;
	bh=8I4XScpF2Xyw22E+xVs/2k9/PLIiCB+mgSB12M/LgKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGw+HgGv+1BBkXoyHLAkEsyxVONc7PQez8mxRbpNreEjnC7jS29k8NKQ9wWDInxeIbRm9EuQm3KvzZs/1ADUEGc3+fYa0pl8I4BEM+iAdX73+OK8SKuLFzQSQwHSPtnwSu78uTZ35SlalG3M72y6i6B6L1UKkCUjWNMUTrpKjxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9GpVjYe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9GpVjYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712683371; x=1744219371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8I4XScpF2Xyw22E+xVs/2k9/PLIiCB+mgSB12M/LgKI=;
  b=K9GpVjYenRVQzAr66KtshTbrUuw6r+duTfHFtoWaEzmoXzFEI4ijcjym
   Iw2/GUL/zDbkRDaeiZFn4qXFdj0ki/6LIN9hRlALDnDJ7aOSiUJ9cIhuc
   Pjbqhx9ycacJi38pinyRluznNdFQWOysqB/qZV31mGZC+jD94j5vzIt6J
   lo25vxDcDKtUDiQ5+6QDLmLcNfpSNdJmMJAnmx31s/WcnVDaD9+9FSln3
   ICRSJ6k5ymnIggXinZrKsjdNNJY+rDz+ndtGuYmiDDsgancC0eNtOynTF
   EDWlUNLNrfkrq+YHhBJ4wydz3ZdQg5dXe1+epODL5cFukJYP/nnE8oiMF
   A==;
X-CSE-ConnectionGUID: UNt7PbFmRMWrK5m0msqWuQ==
X-CSE-MsgGUID: QCNe/j6tTmC/GxMqIJEv6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11804733"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11804733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 10:22:51 -0700
X-CSE-ConnectionGUID: LOMyk7ifRuijzb2Drl4HjQ==
X-CSE-MsgGUID: cjXTq1LVTrGnDZ+qWezhOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43515207"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2024 10:22:49 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruFBH-0006LG-1w;
	Tue, 09 Apr 2024 17:22:47 +0000
Date: Wed, 10 Apr 2024 01:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 42/45] lib/spdm/req-authenticate.c:283:24: error:
 'struct spdm_state' has no member named 'responder_caps'
Message-ID: <202404100144.PBX8M3cj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   e34fc0844ba3e83c6adb7c32e2677a13cf9acd73
commit: edd9d2dc2d525f6a5f18f5dead5be78b80ccd7e1 [42/45] spdm: Add support for measuring devices
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404100144.PBX8M3cj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100144.PBX8M3cj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100144.PBX8M3cj-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/spdm/req-authenticate.c: In function 'spdm_negotiate_algs':
>> lib/spdm/req-authenticate.c:283:24: error: 'struct spdm_state' has no member named 'responder_caps'
     283 |             (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
         |                        ^~


vim +283 lib/spdm/req-authenticate.c

   225	
   226	static int spdm_negotiate_algs(struct spdm_state *spdm_state)
   227	{
   228		struct spdm_negotiate_algs_req *req = spdm_state->transcript_end;
   229		struct spdm_negotiate_algs_rsp *rsp;
   230		struct spdm_req_alg_struct *req_alg_struct;
   231		size_t req_sz = sizeof(*req);
   232		size_t rsp_sz = sizeof(*rsp);
   233		int rc, length;
   234	
   235		/* Request length shall be <= 128 bytes (SPDM 1.1.0 margin no 185) */
   236		BUILD_BUG_ON(req_sz > 128);
   237	
   238		*req = (struct spdm_negotiate_algs_req) {
   239			.code = SPDM_NEGOTIATE_ALGS,
   240			.length = cpu_to_le16(req_sz),
   241			.measurement_specification = SPDM_MEAS_SPEC_DMTF,
   242			.base_asym_algo = cpu_to_le32(SPDM_ASYM_ALGOS),
   243			.base_hash_algo = cpu_to_le32(SPDM_HASH_ALGOS),
   244		};
   245	
   246		rsp = spdm_state->transcript_end += req_sz;
   247	
   248		rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
   249		if (rc < 0)
   250			return rc;
   251	
   252		length = rc;
   253		if (length < sizeof(*rsp) ||
   254		    length < sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct)) {
   255			dev_err(spdm_state->dev, "Truncated algorithms response\n");
   256			return -EIO;
   257		}
   258	
   259		/*
   260		 * If request contained a ReqAlgStruct not supported by responder,
   261		 * the corresponding RespAlgStruct may be omitted in response.
   262		 * Calculate the actual (possibly shorter) response length:
   263		 */
   264		spdm_state->transcript_end +=
   265			     sizeof(*rsp) + rsp->param1 * sizeof(*req_alg_struct);
   266	
   267		spdm_state->base_asym_alg = le32_to_cpu(rsp->base_asym_sel);
   268		spdm_state->base_hash_alg = le32_to_cpu(rsp->base_hash_sel);
   269		spdm_state->meas_hash_alg = le32_to_cpu(rsp->measurement_hash_algo);
   270	
   271		if ((spdm_state->base_asym_alg & SPDM_ASYM_ALGOS) == 0 ||
   272		    (spdm_state->base_hash_alg & SPDM_HASH_ALGOS) == 0) {
   273			dev_err(spdm_state->dev, "No common supported algorithms\n");
   274			return -EPROTO;
   275		}
   276	
   277		/* Responder shall select exactly 1 alg (SPDM 1.0.0 table 14) */
   278		if (hweight32(spdm_state->base_asym_alg) != 1 ||
   279		    hweight32(spdm_state->base_hash_alg) != 1 ||
   280		    rsp->ext_asym_sel_count != 0 ||
   281		    rsp->ext_hash_sel_count != 0 ||
   282		    rsp->param1 > req->param1 ||
 > 283		    (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
   284		     (hweight32(spdm_state->meas_hash_alg) != 1 ||
   285		      rsp->measurement_specification_sel != SPDM_MEAS_SPEC_DMTF))) {
   286			dev_err(spdm_state->dev, "Malformed algorithms response\n");
   287			return -EPROTO;
   288		}
   289	
   290		return spdm_parse_algs(spdm_state);
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
