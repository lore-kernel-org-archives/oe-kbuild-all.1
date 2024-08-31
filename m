Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045542745D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725072528; cv=none; b=R2/xNSyVcLpps78r+cR+Mjgc5H4sJKXo8B+X32lZSUkq5t+OJ/dteDvrjiBlPqOXtFScvXk5fEO8VBFzjxURG+jjFK+ycrsF6IqAA93Y0pdz3GmvHF7YwxE3bgG5EL0AVQs75B10vSHNW4QaNUXjW3rSYoVjUZQZxzpNCM8pU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725072528; c=relaxed/simple;
	bh=Ztx+YFvZwzlnpKUvCJfFPhHlkC0LdekyZRGy+nkC/aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehbnUjzNR0h37xt+5v/mPHwgykRHyFGgWMc2ZcXJBnuemHcdP1XzPjunPMU9Biz3JsTt439DhGMIiYq0a4KHM8SK4O+dO4/2cm06gZeDeLJHfZR1TLeXgEaMX31KFPlvZxx8cpPFCDMDAqnyqUhrPdneWS5ieijI57yTpi+Q+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsfgBUZn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsfgBUZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725072527; x=1756608527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ztx+YFvZwzlnpKUvCJfFPhHlkC0LdekyZRGy+nkC/aM=;
  b=OsfgBUZnQXNOJzax1ktMDMczaAJ5NH1sRlw9cHXcjQxsqfW1UE2l8J/h
   /5WvsVxn0bpDTtxrwyXBQIxhhgnDtaZt2aR4v6GYI+5sj0D6KmJC3OmyE
   zLZcCrRiPIXp3vfUz1EVtkQv+wlxr4RUBOaof79Vp1dgVPnN6Ik8ts4Zl
   GcMD9zwhCImLrhOF7jzMlYB/mRl6fSszFnbiDLTsoGn5XWWuEeVXU/NTV
   XA+FlAhB1wSLK3/sQTkeDX3D3Cu8XvjEbvYOtQzyraIoNjnbHsUSVfYQk
   VIm4C4LTDy+m1RAouyOk5cb0AW8TDhY+06AWaDJwJPnKwrl1TXm8jkOfT
   w==;
X-CSE-ConnectionGUID: jJub/QtmRjCcZEzO1f6tJA==
X-CSE-MsgGUID: yVFV2RoQTkmxQEtj25QzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34391383"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="34391383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 19:48:46 -0700
X-CSE-ConnectionGUID: Y/bewig4R2ufLo+vuCaRtw==
X-CSE-MsgGUID: 7t21cODzROelKNBWRZy9Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; 
   d="scan'208";a="68215380"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2024 19:48:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skEAM-0002Is-28;
	Sat, 31 Aug 2024 02:48:42 +0000
Date: Sat, 31 Aug 2024 10:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pr/6 1/1] lib/spdm/req-authenticate.c:121:30: sparse: sparse:
 restricted __le32 degrades to integer
Message-ID: <202408311037.jpTXc6Pq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pr/6
head:   5fc03a9652f9ba343eea37f13afa99bc36726efe
commit: 5fc03a9652f9ba343eea37f13afa99bc36726efe [1/1] spdm: large-transfer: set chunk capability
config: loongarch-randconfig-r111-20240830 (https://download.01.org/0day-ci/archive/20240831/202408311037.jpTXc6Pq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408311037.jpTXc6Pq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311037.jpTXc6Pq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/spdm/req-authenticate.c:121:30: sparse: sparse: restricted __le32 degrades to integer
   lib/spdm/req-authenticate.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +121 lib/spdm/req-authenticate.c

    96	
    97	static int spdm_get_capabilities(struct spdm_state *spdm_state)
    98	{
    99		struct spdm_get_capabilities_req *req = spdm_state->transcript_end;
   100		struct spdm_get_capabilities_rsp *rsp;
   101		size_t req_sz, rsp_sz;
   102		int rc, length;
   103	
   104		*req = (struct spdm_get_capabilities_req) {
   105			.code = SPDM_GET_CAPABILITIES,
   106			.ctexponent = SPDM_CTEXPONENT,
   107			.flags = cpu_to_le32(SPDM_REQ_CAPS),
   108		};
   109	
   110		if (spdm_state->version == 0x10) {
   111			req_sz = offsetofend(typeof(*req), param2);
   112			rsp_sz = offsetofend(typeof(*rsp), flags);
   113		} else if (spdm_state->version == 0x11) {
   114			req_sz = offsetofend(typeof(*req), flags);
   115			rsp_sz = offsetofend(typeof(*rsp), flags);
   116		} else {
   117			req_sz = sizeof(*req);
   118			rsp_sz = sizeof(*rsp);
   119			req->data_transfer_size = cpu_to_le32(spdm_state->transport_sz);
   120			req->max_spdm_msg_size = cpu_to_le32(UINT_MAX);
 > 121			req->flags = cpu_to_le32(req->flags | SPDM_CHUNK_CAP);
   122		}
   123	
   124		rsp = spdm_state->transcript_end += req_sz;
   125	
   126		rc = spdm_exchange(spdm_state, req, req_sz, rsp, rsp_sz);
   127		if (rc < 0)
   128			return rc;
   129	
   130		length = rc;
   131		if (length < rsp_sz) {
   132			dev_err(spdm_state->dev, "Truncated capabilities response\n");
   133			return -EIO;
   134		}
   135	
   136		spdm_state->transcript_end += rsp_sz;
   137	
   138		spdm_state->rsp_caps = le32_to_cpu(rsp->flags);
   139		if ((spdm_state->rsp_caps & SPDM_RSP_MIN_CAPS) != SPDM_RSP_MIN_CAPS)
   140			return -EPROTONOSUPPORT;
   141	
   142		if (spdm_state->version >= 0x12) {
   143			u32 data_transfer_size = le32_to_cpu(rsp->data_transfer_size);
   144			if (data_transfer_size < SPDM_MIN_DATA_TRANSFER_SIZE) {
   145				dev_err(spdm_state->dev,
   146					"Malformed capabilities response\n");
   147				return -EPROTO;
   148			}
   149			spdm_state->transport_sz = min(spdm_state->transport_sz,
   150						       data_transfer_size);
   151		}
   152	
   153		return 0;
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
