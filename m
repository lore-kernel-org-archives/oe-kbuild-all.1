Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3C1155A5F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712684034; cv=none; b=LnW/qYvYsm/GL2KgOHfzjKDAbqPOcNO7IU+u/6TxeSAVcqfstD06mqgj622iwUyaYNEGyD6fzXkWUtEdhl+Tjpn6tzA8UHvxS9pctSmY7ZDO3RYY82DUzmnsQLOpYNdpQBx+LCW5xUGwKYHFP3E1b57SyKFSMnKoWtHNavbu9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712684034; c=relaxed/simple;
	bh=nm5VpD0WmRTWMml47uMqjIl3SZDQZxiXHv6HA8oin2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8snqJQPhhwG1jASxOy19BFKSslCVjliBu90ng5d62eaiB2x8o8N62iM3mjfySEuWa7kjVWo1nKadPqO2uB6DoVzgR3aTAX1QS14iBO0dZyD8a4Iqo/dQ4Z8EY4zCHW6lCOWxKpAjFikXGd3fCzKlL58R6nPL3Qx4tMyq08rI/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=griuzFm3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="griuzFm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712684033; x=1744220033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nm5VpD0WmRTWMml47uMqjIl3SZDQZxiXHv6HA8oin2w=;
  b=griuzFm35XOZAXRM1BCpT4quQWkGYclkFEv/elMjVQI6yO04CIsE3FyJ
   GphFJ2lErhUgeyxZxpTSPtcXfT5CiEZcXr1sSCi2PfotTv2T9pyk8i8D1
   ns+7BXOxvy2IL0vUzvojyyI9pAoMVXPST1MaPRR1czq/y0llP24V1RMVb
   iJHcIltOuVXjzW0+QM6UPJXEbWkxCfwkNxBQKVW2UWBpoF0bbM3F0hSbJ
   pXrSantQ1HCKI97pRBNozIix5mZKDZzd5FaMKmuRPDUtLVWM46KCbNNGd
   cNMiSiRz+iWETnkxJ2oR2LzeQNAAk9LfATPRbWVdW73r4GEy5oMqZ2je/
   g==;
X-CSE-ConnectionGUID: AI0ufukjTtCuDxJEEUTskA==
X-CSE-MsgGUID: CC4uz5mhTu6yB1RscznVrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8240159"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8240159"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 10:33:52 -0700
X-CSE-ConnectionGUID: SZ/xA4mTS1uydG9DKtFQkA==
X-CSE-MsgGUID: 0H/ayI9ARwuE5Q+vUaxycQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="43518223"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Apr 2024 10:33:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruFLw-0006MV-0k;
	Tue, 09 Apr 2024 17:33:48 +0000
Date: Wed, 10 Apr 2024 01:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 42/45] lib/spdm/req-authenticate.c:283:19: error:
 no member named 'responder_caps' in 'struct spdm_state'
Message-ID: <202404100150.A8uOsfJ9-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20240410 (https://download.01.org/0day-ci/archive/20240410/202404100150.A8uOsfJ9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100150.A8uOsfJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100150.A8uOsfJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/spdm/req-authenticate.c:283:19: error: no member named 'responder_caps' in 'struct spdm_state'
     283 |             (spdm_state->responder_caps & SPDM_MEAS_CAP_MASK &&
         |              ~~~~~~~~~~  ^
   1 error generated.


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
