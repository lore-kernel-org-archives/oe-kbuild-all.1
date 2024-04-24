Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26D743AB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713943925; cv=none; b=J80ZqI/QAXdx+sqXJU5wTYHDRBMuLMOdtRSHfmpspHJj+wraNQx2Z/T2PI8JnT7KU93oJhg6Z0gf2P/pBe08eIuoO8qq7FbTu1BSfWOFxKMjN8/dSOr/EAf1IgC2Eae4nMmnyc5Pe4krgNNJpuZPIwkj+5l0RnWGVfTtGwtw1qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713943925; c=relaxed/simple;
	bh=ZmGtqWjv91JYgzovBOkUbO8H6OtR8EguWlzt+FTDydk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWDD0pa6TP6yH7qe9Q/c2ujoDRKp971hrYGDYj2hyeNC5h9enUOASbyITLObyt2y1BLtQeDuc5ltNaW8pvHfRjPbZTAYTOpKxBZKQl7rE9/a0DV1mTRHVHTyAle/uYlCOCMJ4pD8rPhFvWyNGcod6bZz3gVSiOFJeC8ni9KGU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAeAV1VQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAeAV1VQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713943924; x=1745479924;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZmGtqWjv91JYgzovBOkUbO8H6OtR8EguWlzt+FTDydk=;
  b=SAeAV1VQlGcXwcH3OICn90lvbLqMbcJKtIx/fFBpsfOKl2po1phG0SRL
   tmKs7B9xqbHnzzsM7nTFWLwm1guIUvA6VlDRWnQNrf5yBjx6YicOp0f8a
   1yo8vucws/k/5IXpu7PZ+uFtfloGqOusCyXdzdRCbbn2HlQ64Gn3iB2eF
   GdO+JDtVopuNKwINUqDT/mRj0zWVrx8Dv0f2hfcQAw6t18JWJwApieFWo
   Dy+g8IcCsYQIstOkdOyoV2M2bv3IY1DM+pYDdh2PY7QszumT8eSKoV6e3
   ciMYstMDoZQj8LKj7HRqOhxbgARCKoPrTdUFwS4T0JLZ4Lpmc7DDRjVGH
   A==;
X-CSE-ConnectionGUID: u7N9JzHhSLiKKx7Mt0Pt9w==
X-CSE-MsgGUID: F3s+nZmYRJm42pAo23j/3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20174957"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20174957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 00:32:02 -0700
X-CSE-ConnectionGUID: 5SRI2Cc2TtWgFpVFLGa23A==
X-CSE-MsgGUID: A9g+NiohS1qmkHORz0/gEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="47882644"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2024 00:32:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzX6l-0000zM-0u
	for oe-kbuild-all@lists.linux.dev;
	Wed, 24 Apr 2024 07:31:59 +0000
Date: Wed, 24 Apr 2024 15:31:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2863/6555]
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c:90:15: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202404241522.BCA1oTBk-lkp@intel.com>
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
config: arm64-randconfig-r111-20240422 (https://download.01.org/0day-ci/archive/20240424/202404241522.BCA1oTBk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404241522.BCA1oTBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241522.BCA1oTBk-lkp@intel.com/

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
