Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E136023CE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 17:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242175; cv=none; b=gBWs7ZzOZRdMSRF47bj2sP8POjIwb47BOSNYeRnPDUkq8eboZGIzrmt8Mxo205+up/urXGcBPwyfD2QQnGYMuMez9Sy0L2b5Z4SUtRN6k1NgPlAcZkpITBYmCtNG701EbmCeYk+UUVLOIJVavdi4yEwFVKlCU+v8cFELAXfDzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242175; c=relaxed/simple;
	bh=1R5BBKNZPRJR92gKTsz+ECWIxcM4suXNvvpYxvmHbzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AqltLLRZsrKjixnZuJ9Gmi1U4TSJhw2B7iYZBDK5x42qtQicrNdjvxn0DpgeRzdn66/8/5ZLUdqQdfGXTRAplu9Pv92gkcvAuTzHOxRVC0NO1mgO/VjcXJFJe4Rp8tCn+G/N7sA2XmEfpd7CsLhGXIke2sfpisSV/kSuefBuUFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYQG2wfj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYQG2wfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747242174; x=1778778174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1R5BBKNZPRJR92gKTsz+ECWIxcM4suXNvvpYxvmHbzc=;
  b=MYQG2wfj9Za8kV4tMIywSBmZOEkyTj6ETob29L+G6n2qvnGocKyPqgVE
   RisT6cdBibRzeWDDr7OlGkZo6UfiLNKt6uMOKxSTNRHsfSeRdYXePd0C6
   pwK1x5TmaDoFVfvVHPsZo9rFUgr6s52OK4YbTCSbUujHZoVCkM2tOIr0+
   Wb0IQd4Wzgf1/YR7YFiyqiFaRuEasmSal3NNU1oQ8YhBFRoCQPgtNfYbn
   JNdiBQKXXoOCFoA3R/UHuNrAIxOg6dOkEflpgkH2cwVleD4+LdUfrnGU1
   QYaVo8N7TygiEr9fNx8PbhI21SXgp4v/e6AVEADdSdY6nzTSFIp24Dd3a
   w==;
X-CSE-ConnectionGUID: 1DNQct5LR7ePUkH2EAUJ+g==
X-CSE-MsgGUID: eM020gbBSgG2h3zAlH9X/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48404072"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="48404072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 10:02:53 -0700
X-CSE-ConnectionGUID: SerQlHnFQEqCjXXqhe/zag==
X-CSE-MsgGUID: hCsw+/skQUmVChi9s4SbPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="137975664"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2025 10:02:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFFVJ-000HNL-2Z;
	Wed, 14 May 2025 17:02:49 +0000
Date: Thu, 15 May 2025 01:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_aram.c:69:49: sparse:
 sparse: non size-preserving pointer to integer cast
Message-ID: <202505150051.8wPvjFGZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: b6701d65018bed8e2b5c0924a10720d6ef578de7 [1/1] CHROMIUM: soc: mediatek: Add APU mvpu, mdw, apummu driver
config: arm-randconfig-r133-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150051.8wPvjFGZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505150051.8wPvjFGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150051.8wPvjFGZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_aram.c:69:49: sparse: sparse: non size-preserving pointer to integer cast
   drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_aram.c:120:51: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_v2.c:153:28: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_cmd_v2.c:169:30: sparse: sparse: non size-preserving pointer to integer cast
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_cmd_v2.c:208:37: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_cmd_v4.c:202:30: sparse: sparse: non size-preserving pointer to integer cast
   drivers/soc/mediatek/apusys/midware/2.0/rv/mdw_rv_cmd_v4.c:253:37: sparse: sparse: non size-preserving pointer to integer cast
--
   drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_cmn.c:525:28: sparse: sparse: symbol 'mdw_fence_ops' was not declared. Should it be static?
>> drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_cmn.c:222:43: sparse: sparse: non size-preserving pointer to integer cast
   drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_cmn.c:450:46: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_v3.c:172:28: sparse: sparse: non size-preserving pointer to integer cast
--
>> drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_v4.c:840:28: sparse: sparse: non size-preserving pointer to integer cast
   drivers/soc/mediatek/apusys/midware/2.0/cmd/mdw_cmd_v4.c:1102:27: sparse: sparse: non size-preserving pointer to integer cast
--
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_dbg.c:29:4: sparse: sparse: symbol 'apummu_apusys_trace' was not declared. Should it be static?
>> drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_dbg.c:277:17: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_dbg.c:277:17: sparse:     expected int ( *read )( ... )
   drivers/soc/mediatek/apusys/apu_mem/apummu/common/apummu_dbg.c:277:17: sparse:     got int ( * )( ... )

vim +69 drivers/soc/mediatek/apusys/midware/2.0/mdw_mem_aram.c

    34	
    35	static int mdw_mem_aram_attach(struct dma_buf *dbuf,
    36		struct dma_buf_attachment *attach)
    37	{
    38		struct mdw_mem_aram_attachment *am_attach = NULL;
    39		struct mdw_mem *m = dbuf->priv;
    40		struct mdw_mem_aram *am = m->priv;
    41		int ret = 0;
    42	
    43		/* check type */
    44		if (m->type >= MDW_MEM_TYPE_MAX ||
    45			m->type == MDW_MEM_TYPE_MAIN) {
    46			mdw_drv_err("invalid type(%u)\n", m->type);
    47			return -EINVAL;
    48		}
    49	
    50		/* alloc attach */
    51		am_attach = kzalloc(sizeof(*am_attach), GFP_KERNEL);
    52		if (!am_attach) {
    53			ret = -ENOMEM;
    54			goto out;
    55		}
    56	
    57		/* alloc sg table */
    58		ret = sg_alloc_table(&am_attach->sgt, 1, GFP_KERNEL);
    59		if (ret)
    60			goto free_attach;
    61	
    62		/* map vlm */
    63		if (m->type == MDW_MEM_TYPE_SYSTEM_ISP) {
    64			mdw_mem_debug("s(0x%llx) bypass vlm map\n",
    65				(uint64_t)m->mpriv);
    66			am->dma_addr = am->addr;
    67		} else {
    68			uint64_t dma_addr = am->dma_addr;
  > 69			ret = mdw_apu_mem_map((uint64_t)m->mpriv, am->sid, &dma_addr);
    70			if (ret) {
    71				mdw_drv_err("apumem(0x%llx/%u) map fail\n",
    72					(uint64_t)m->mpriv, am->sid);
    73				goto free_table;
    74			}
    75			am->dma_addr = dma_addr;
    76		}
    77	
    78		sg_dma_address(am_attach->sgt.sgl) = am->dma_addr;
    79		sg_dma_len(am_attach->sgt.sgl) = am->dma_size;
    80		am_attach->am = am;
    81		am_attach->m = m;
    82		attach->priv = am_attach;
    83		mdw_mem_debug("s(0x%llx) sg(%p) m(%u/%pad/0x%x)\n",
    84			(uint64_t)m->mpriv,
    85			&am_attach->sgt,
    86			am->sid,
    87			&sg_dma_address(am_attach->sgt.sgl),
    88			sg_dma_len(am_attach->sgt.sgl));
    89	
    90		mutex_lock(&am->mtx);
    91		list_add_tail(&am_attach->node, &am->attachments);
    92		mutex_unlock(&am->mtx);
    93	
    94		goto out;
    95	
    96	free_table:
    97		sg_free_table(&am_attach->sgt);
    98	free_attach:
    99		kfree(am_attach);
   100	out:
   101		return ret;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
