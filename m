Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB321D3D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778407; cv=none; b=GwA1K1a4iU45iDZcx7GNBS0MH4h/tw6DEFjuWfmb31dtuYRZlhtJbp78sreF88+DytRkkESBqICU1yygtmx5qOqzTbRnSxe3wNYQnb5sg/48LD0NdO12PwT+fWbrCPGiRgc0yipIdViT4xoYApCKgnlO7lEPLSlzIER6f86PRKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778407; c=relaxed/simple;
	bh=Rc2MCP3m+5b1MKdPYBpZ19mGsZIx0qiAYwqsYvRboDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLFccbdGtNeSmhjstZvZl1/Z1Pu7GO27BK2RQRYKPwZPKHuy/KUAQLSXpPr9BgsLn4J8VXOT9aLGSoobf2FsoQJrMTfHQ/Mhd+ctDyLa/6xijA6JbkEtYjDa0lnj/+C3wCb963GRrMFkNdD5ls2AOSciOMCioOKfiUNqFXBfK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz++v+uS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz++v+uS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784778405; x=1816314405;
  h=date:from:to:cc:subject:message-id;
  bh=Rc2MCP3m+5b1MKdPYBpZ19mGsZIx0qiAYwqsYvRboDQ=;
  b=Bz++v+uSRvdUUGyyLnhD4PmmjstcaMqtHGx0iprjcgz+cFGjpliQyhda
   e1j32KneO2lIKGuUQJaNIO6N0YS5pdlX/XwFkN/jesM2MWb67WfduukFr
   WFYxcL0BbFHTceY4OArCpJ8FljEAnyik+7kai4hcvElSeJNDLkWEih/ys
   8dIPeAUSrb9XlE5GBUd8hnflPPSEgCrAadvkmnN0HjaOR/ZmZ0s2Jc3sP
   Ub8BzOVFPq4d97l427GYA7zovOBUmjgLDqlult3ZUa69RDnAhbwTqSNyf
   idAdgLznnTsE2N4Mo8Rrh/Bm+oVOZXDqIoreyF12GF6Vecrvj+Rle5MgY
   Q==;
X-CSE-ConnectionGUID: v8MpKgVVTh2hNI3pJmvyNw==
X-CSE-MsgGUID: QjyeeHk2SNKy52DrbWwxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96796556"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96796556"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:46:44 -0700
X-CSE-ConnectionGUID: PpkgL7QsSOu47pqNi/RD4w==
X-CSE-MsgGUID: ZZ0m3CXVQtWDH4IX0N4hHA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2026 20:46:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmkOO-00000000ZED-0f1p;
	Thu, 23 Jul 2026 03:46:40 +0000
Date: Thu, 23 Jul 2026 11:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>
Subject: drivers/dma/at_hdmac.c:1129:11: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202607231110.8MqNRj0Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: 5d8c5bea0da97809813b5f702700019cfffb6085 dmaengine: at_hdmac: add COMPILE_TEST support
date:   8 months ago
config: sparc64-randconfig-r111-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231110.8MqNRj0Q-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231110.8MqNRj0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma/at_hdmac.c:1119:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/dma/at_hdmac.c:1119:15: sparse:     expected void [noderef] __iomem *vaddr
   drivers/dma/at_hdmac.c:1119:15: sparse:     got void *
>> drivers/dma/at_hdmac.c:1129:11: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/at_hdmac.c:1144:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int *memset_vaddr @@     got void [noderef] __iomem *vaddr @@
   drivers/dma/at_hdmac.c:1144:28: sparse:     expected int *memset_vaddr
   drivers/dma/at_hdmac.c:1144:28: sparse:     got void [noderef] __iomem *vaddr
>> drivers/dma/at_hdmac.c:1157:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem *vaddr @@
   drivers/dma/at_hdmac.c:1157:43: sparse:     expected void *vaddr
   drivers/dma/at_hdmac.c:1157:43: sparse:     got void [noderef] __iomem *vaddr
   drivers/dma/at_hdmac.c:1186:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void * @@
   drivers/dma/at_hdmac.c:1186:15: sparse:     expected void [noderef] __iomem *vaddr
   drivers/dma/at_hdmac.c:1186:15: sparse:     got void *
   drivers/dma/at_hdmac.c:1192:11: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/dma/at_hdmac.c:1222:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int *memset_vaddr @@     got void [noderef] __iomem *vaddr @@
   drivers/dma/at_hdmac.c:1222:28: sparse:     expected int *memset_vaddr
   drivers/dma/at_hdmac.c:1222:28: sparse:     got void [noderef] __iomem *vaddr
   drivers/dma/at_hdmac.c:1235:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem *vaddr @@
   drivers/dma/at_hdmac.c:1235:43: sparse:     expected void *vaddr
   drivers/dma/at_hdmac.c:1235:43: sparse:     got void [noderef] __iomem *vaddr

vim +/__iomem +1129 drivers/dma/at_hdmac.c

ce2a673d66b2ca Maxime Ripard 2015-10-22  1084  
4d112426c3446d Maxime Ripard 2015-08-24  1085  /**
4d112426c3446d Maxime Ripard 2015-08-24  1086   * atc_prep_dma_memset - prepare a memcpy operation
4d112426c3446d Maxime Ripard 2015-08-24  1087   * @chan: the channel to prepare operation on
4d112426c3446d Maxime Ripard 2015-08-24  1088   * @dest: operation virtual destination address
4d112426c3446d Maxime Ripard 2015-08-24  1089   * @value: value to set memory buffer to
4d112426c3446d Maxime Ripard 2015-08-24  1090   * @len: operation length
4d112426c3446d Maxime Ripard 2015-08-24  1091   * @flags: tx descriptor status flags
4d112426c3446d Maxime Ripard 2015-08-24  1092   */
4d112426c3446d Maxime Ripard 2015-08-24  1093  static struct dma_async_tx_descriptor *
4d112426c3446d Maxime Ripard 2015-08-24  1094  atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
4d112426c3446d Maxime Ripard 2015-08-24  1095  		    size_t len, unsigned long flags)
4d112426c3446d Maxime Ripard 2015-08-24  1096  {
ac803b56860f65 Tudor Ambarus 2022-10-25  1097  	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
4d112426c3446d Maxime Ripard 2015-08-24  1098  	struct at_dma		*atdma = to_at_dma(chan->device);
ce2a673d66b2ca Maxime Ripard 2015-10-22  1099  	struct at_desc		*desc;
ce2a673d66b2ca Maxime Ripard 2015-10-22  1100  	void __iomem		*vaddr;
ce2a673d66b2ca Maxime Ripard 2015-10-22  1101  	dma_addr_t		paddr;
ceabe10cf5d642 Ben Walker    2022-03-01  1102  	char			fill_pattern;
ac803b56860f65 Tudor Ambarus 2022-10-25  1103  	int			ret;
4d112426c3446d Maxime Ripard 2015-08-24  1104  
2c5d7407e01272 Arnd Bergmann 2015-11-12  1105  	dev_vdbg(chan2dev(chan), "%s: d%pad v0x%x l0x%zx f0x%lx\n", __func__,
2c5d7407e01272 Arnd Bergmann 2015-11-12  1106  		&dest, value, len, flags);
4d112426c3446d Maxime Ripard 2015-08-24  1107  
4d112426c3446d Maxime Ripard 2015-08-24  1108  	if (unlikely(!len)) {
4d112426c3446d Maxime Ripard 2015-08-24  1109  		dev_dbg(chan2dev(chan), "%s: length is zero!\n", __func__);
4d112426c3446d Maxime Ripard 2015-08-24  1110  		return NULL;
4d112426c3446d Maxime Ripard 2015-08-24  1111  	}
4d112426c3446d Maxime Ripard 2015-08-24  1112  
4d112426c3446d Maxime Ripard 2015-08-24  1113  	if (!is_dma_fill_aligned(chan->device, dest, 0, len)) {
4d112426c3446d Maxime Ripard 2015-08-24  1114  		dev_dbg(chan2dev(chan), "%s: buffer is not aligned\n",
4d112426c3446d Maxime Ripard 2015-08-24  1115  			__func__);
4d112426c3446d Maxime Ripard 2015-08-24  1116  		return NULL;
4d112426c3446d Maxime Ripard 2015-08-24  1117  	}
4d112426c3446d Maxime Ripard 2015-08-24  1118  
247b4d83d6525d Tudor Ambarus 2020-01-23  1119  	vaddr = dma_pool_alloc(atdma->memset_pool, GFP_NOWAIT, &paddr);
ce2a673d66b2ca Maxime Ripard 2015-10-22  1120  	if (!vaddr) {
ce2a673d66b2ca Maxime Ripard 2015-10-22  1121  		dev_err(chan2dev(chan), "%s: couldn't allocate buffer\n",
4d112426c3446d Maxime Ripard 2015-08-24  1122  			__func__);
4d112426c3446d Maxime Ripard 2015-08-24  1123  		return NULL;
4d112426c3446d Maxime Ripard 2015-08-24  1124  	}
ceabe10cf5d642 Ben Walker    2022-03-01  1125  
ceabe10cf5d642 Ben Walker    2022-03-01  1126  	/* Only the first byte of value is to be used according to dmaengine */
ceabe10cf5d642 Ben Walker    2022-03-01  1127  	fill_pattern = (char)value;
ceabe10cf5d642 Ben Walker    2022-03-01  1128  
ceabe10cf5d642 Ben Walker    2022-03-01 @1129  	*(u32*)vaddr = (fill_pattern << 24) |
ceabe10cf5d642 Ben Walker    2022-03-01  1130  		       (fill_pattern << 16) |
ceabe10cf5d642 Ben Walker    2022-03-01  1131  		       (fill_pattern << 8) |
ceabe10cf5d642 Ben Walker    2022-03-01  1132  		       fill_pattern;
4d112426c3446d Maxime Ripard 2015-08-24  1133  
ac803b56860f65 Tudor Ambarus 2022-10-25  1134  	desc = kzalloc(struct_size(desc, sg, 1), GFP_ATOMIC);
ac803b56860f65 Tudor Ambarus 2022-10-25  1135  	if (!desc)
ce2a673d66b2ca Maxime Ripard 2015-10-22  1136  		goto err_free_buffer;
ac803b56860f65 Tudor Ambarus 2022-10-25  1137  	desc->sglen = 1;
ac803b56860f65 Tudor Ambarus 2022-10-25  1138  
ac803b56860f65 Tudor Ambarus 2022-10-25  1139  	ret = atdma_create_memset_lli(chan, desc->sg, paddr, dest, len);
ac803b56860f65 Tudor Ambarus 2022-10-25  1140  	if (ret)
ac803b56860f65 Tudor Ambarus 2022-10-25  1141  		goto err_free_desc;
4d112426c3446d Maxime Ripard 2015-08-24  1142  
ce2a673d66b2ca Maxime Ripard 2015-10-22  1143  	desc->memset_paddr = paddr;
ce2a673d66b2ca Maxime Ripard 2015-10-22  1144  	desc->memset_vaddr = vaddr;
ce2a673d66b2ca Maxime Ripard 2015-10-22  1145  	desc->memset_buffer = true;
4d112426c3446d Maxime Ripard 2015-08-24  1146  
4d112426c3446d Maxime Ripard 2015-08-24  1147  	desc->total_len = len;
4d112426c3446d Maxime Ripard 2015-08-24  1148  
4d112426c3446d Maxime Ripard 2015-08-24  1149  	/* set end-of-link on the descriptor */
ac803b56860f65 Tudor Ambarus 2022-10-25  1150  	set_lli_eol(desc, 0);
4d112426c3446d Maxime Ripard 2015-08-24  1151  
ac803b56860f65 Tudor Ambarus 2022-10-25  1152  	return vchan_tx_prep(&atchan->vc, &desc->vd, flags);
4d112426c3446d Maxime Ripard 2015-08-24  1153  
ac803b56860f65 Tudor Ambarus 2022-10-25  1154  err_free_desc:
ac803b56860f65 Tudor Ambarus 2022-10-25  1155  	kfree(desc);
ce2a673d66b2ca Maxime Ripard 2015-10-22  1156  err_free_buffer:
ce2a673d66b2ca Maxime Ripard 2015-10-22 @1157  	dma_pool_free(atdma->memset_pool, vaddr, paddr);
4d112426c3446d Maxime Ripard 2015-08-24  1158  	return NULL;
4d112426c3446d Maxime Ripard 2015-08-24  1159  }
4d112426c3446d Maxime Ripard 2015-08-24  1160  

:::::: The code at line 1129 was first introduced by commit
:::::: ceabe10cf5d642b6ea80e77193f9cd4446df26b5 dmaengine: at_hdmac: In atc_prep_dma_memset, treat value as a single byte

:::::: TO: Ben Walker <benjamin.walker@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
