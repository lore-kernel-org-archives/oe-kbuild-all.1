Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EDEF9D4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713835791; cv=none; b=QdRdG7iPuiiC2aekwRot6x7OyrSAlzEZ/Roi8oGKFNXuoPCMWhZ5B1cmtbvbvw4kSACuib3ulePjMMeuHXJqDSvw9rP4ebDw1XbKkBpT4Vapf0A3tYX6CvGPXeYUq1dXkzwj2ndkQjtN92Cq9XmiuQju8SiPVnLR+C3kFh9cMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713835791; c=relaxed/simple;
	bh=n5hVwDP5xckdXxeh/XTYs2PzM6sBAUgy1MMszmE8Crw=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3PS4pfOSospfX440nv0QFugaHcfPkobug5XRmCiavQ7arlEh2nOD9qNm3RuZtLur7hshBfj7LTOsOcFGCHGODHfNJOZgSHioW77W3+q/REucJwO4rAwP+WMgi+7ICUTOzb0S1pQVdrsnIfCwy9ycxlE6+/xhERrgUkefM74iR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDjuHqLJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDjuHqLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713835789; x=1745371789;
  h=date:from:cc:subject:message-id:mime-version;
  bh=n5hVwDP5xckdXxeh/XTYs2PzM6sBAUgy1MMszmE8Crw=;
  b=GDjuHqLJyNygHrFfBXopYFDBdYu2GY2qxBbUYEHEpmQCgVA6DOMaPSy1
   q2C3zvICtj0FI+G8bskw72ymRXO3NEs0BBh/hkja6RRBpLKxXAYq5JnAq
   w4j/GbTvbg3CP3N8kcNpsanbBg9JHb3wQe82HWaNrjvIzzh+B20N0CdIF
   uDB3Y+VxjRYUC6wA35sM2mRyHsW92DLwd78w4GkCOy6HyxIWJaMtkTK6L
   wezBlC13lvGm52Hy+pV9RDgRXigjFmMgFKbV1FA0UZ19r/ulgoFd+NNzf
   KmqBg400wG4lthR1Xoip03kNuwO3rdHmidxBvpSiXjPYkMwnp2YXYntH8
   A==;
X-CSE-ConnectionGUID: oKGv3noHTtCpZxif++4JWg==
X-CSE-MsgGUID: uezePnkzTW6WO/dCeqREBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9231664"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9231664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:29:48 -0700
X-CSE-ConnectionGUID: J73a1GwYRxCPP5gVXm5oDw==
X-CSE-MsgGUID: AVmLmRfgRNWBbomNLUh+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47483636"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 18:29:47 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz4yf-0000NO-0l
	for oe-kbuild-all@lists.linux.dev;
	Tue, 23 Apr 2024 01:29:45 +0000
Date: Tue, 23 Apr 2024 09:29:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2863/6555]
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202404230910.oBHIYd6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: aa651c1c6639f7dced6205e5c347a238c6d0e843 [2863/6555] UPSTREAM: drm/msm/a6xx: Poll for HFI responses
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240423/202404230910.oBHIYd6u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240423/202404230910.oBHIYd6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404230910.oBHIYd6u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c: note: in included file:
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression

vim +90 drivers/gpu/drm/msm/adreno/a6xx_hfi.c

    81	
    82	static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
    83			u32 *payload, u32 payload_size)
    84	{
    85		struct a6xx_hfi_queue *queue = &gmu->queues[HFI_RESPONSE_QUEUE];
    86		u32 val;
    87		int ret;
    88	
    89		/* Wait for a response */
  > 90		ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
    91			val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
    92	
    93		if (ret) {
    94			dev_err(gmu->dev,
    95				"Message %s id %d timed out waiting for response\n",
    96				a6xx_hfi_msg_id[id], seqnum);
    97			return -ETIMEDOUT;
    98		}
    99	
   100		/* Clear the interrupt */
   101		gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_CLR,
   102			A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ);
   103	
   104		for (;;) {
   105			struct a6xx_hfi_msg_response resp;
   106	
   107			/* Get the next packet */
   108			ret = a6xx_hfi_queue_read(queue, (u32 *) &resp,
   109				sizeof(resp) >> 2);
   110	
   111			/* If the queue is empty our response never made it */
   112			if (!ret) {
   113				dev_err(gmu->dev,
   114					"The HFI response queue is unexpectedly empty\n");
   115	
   116				return -ENOENT;
   117			}
   118	
   119			if (HFI_HEADER_ID(resp.header) == HFI_F2H_MSG_ERROR) {
   120				struct a6xx_hfi_msg_error *error =
   121					(struct a6xx_hfi_msg_error *) &resp;
   122	
   123				dev_err(gmu->dev, "GMU firmware error %d\n",
   124					error->code);
   125				continue;
   126			}
   127	
   128			if (seqnum != HFI_HEADER_SEQNUM(resp.ret_header)) {
   129				dev_err(gmu->dev,
   130					"Unexpected message id %d on the response queue\n",
   131					HFI_HEADER_SEQNUM(resp.ret_header));
   132				continue;
   133			}
   134	
   135			if (resp.error) {
   136				dev_err(gmu->dev,
   137					"Message %s id %d returned error %d\n",
   138					a6xx_hfi_msg_id[id], seqnum, resp.error);
   139				return -EINVAL;
   140			}
   141	
   142			/* All is well, copy over the buffer */
   143			if (payload && payload_size)
   144				memcpy(payload, resp.payload,
   145					min_t(u32, payload_size, sizeof(resp.payload)));
   146	
   147			return 0;
   148		}
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
