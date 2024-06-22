Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5606F1DDC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719073860; cv=none; b=fnlYt+fgKhhdSmVtJFA+GfgA7VLwEvCM3XCxvZrHwWUE4IHDTvfcnT642kyxC/ekcVOc1qnhSyj7Z/X/rf4yw7SfN+KfF/V61QzL1cAa0eiWa42WfQ2rrL39Ux4n85AdaejlWjmVDM8l1oZU6l4nLyrTRxY8qmSBg9rnpSzAjrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719073860; c=relaxed/simple;
	bh=t/ssz6nqJH5mc/WQOTPCjInvsZmh3HbNEKclAaNUxKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HN5ucvVpB6YPon8saie+Up3ofcEcHoTRd4B0hnXMzldqafTalg4eU0gwJzVc4yf+JfS2D2FjQSlx4bvNv1Eji4WB4oepV8yTJTZzeUcyZ7D26+QpYrA3ZO7u87Vo2ptNaUuggWgjDnfegjH0cy6FutrC//dHBr3DI97Tf5OmrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z92Y/Q7Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z92Y/Q7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719073858; x=1750609858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t/ssz6nqJH5mc/WQOTPCjInvsZmh3HbNEKclAaNUxKg=;
  b=Z92Y/Q7YAO4a6+fbXwatkBzhFR1mubNBAX0dmF9u3FTydUzB3KhwVPJN
   H2AgFlUX+tAJd88USc2ziAYp5HBSj2lsVY/rywsApJmkDaAQL60EpSa7h
   bwa81Ug2aFjjX9ffqQE3Ai/9KT2k1BbW6jamBGpn8qLGOx4idS9m0Z1sV
   iu3Xvn+IXhyDghOILEZ5kC/1RD6ei8g6TrX6F3eCvHzZk6aIHIXjFZICe
   8rSPvtiCJQWK4CypYWIuwSMVLskmZKvuTWmQO3gXxbVGDubLG7ihZ8btt
   8r8lX4b5KkTkdwYOToceL+EzN0qNnOCbAUC0t2nyB6F5PXazeuoHwgAg4
   w==;
X-CSE-ConnectionGUID: yBHn2VqjRrSluT2SNEL63w==
X-CSE-MsgGUID: 3WGPvKtKRQCfy5+1XEPKQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15851807"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="15851807"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 09:30:57 -0700
X-CSE-ConnectionGUID: 2R5Zj3lYRPaMR0o22iDEfg==
X-CSE-MsgGUID: GvRpGTPNTwWNvB0bCU68Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="43310966"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jun 2024 09:30:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL3dd-0009oL-03;
	Sat, 22 Jun 2024 16:30:53 +0000
Date: Sun, 23 Jun 2024 00:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Rahul T R <r-ravikumar@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 86/88]
 drivers/misc/dma-buf-phys.c:55:undefined reference to
 `dma_buf_unmap_attachment'
Message-ID: <202406230052.PYBULewy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   a71ffc827394d68b5d873555d67674f0b5868430
commit: c2eb70fad9c17db42fed074f0a5efa5a36c88e8f [86/88] HACK: misc: Add dma-buf to physical address exporter
config: i386-randconfig-012-20240622 (https://download.01.org/0day-ci/archive/20240623/202406230052.PYBULewy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406230052.PYBULewy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230052.PYBULewy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
>> drivers/misc/dma-buf-phys.c:55:(.text+0x2e): undefined reference to `dma_buf_unmap_attachment'
>> ld: drivers/misc/dma-buf-phys.c:57:(.text+0x43): undefined reference to `dma_buf_detach'
>> ld: drivers/misc/dma-buf-phys.c:59:(.text+0x4f): undefined reference to `dma_buf_put'
   ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_convert':
>> drivers/misc/dma-buf-phys.c:75:(.text+0xd6): undefined reference to `dma_buf_get'
>> ld: drivers/misc/dma-buf-phys.c:80:(.text+0xf9): undefined reference to `dma_buf_attach'
>> ld: drivers/misc/dma-buf-phys.c:86:(.text+0x116): undefined reference to `dma_buf_map_attachment'
   ld: drivers/misc/dma-buf-phys.c:112:(.text+0x129): undefined reference to `dma_buf_detach'
>> ld: drivers/misc/dma-buf-phys.c:110:(.text+0x15f): undefined reference to `dma_buf_unmap_attachment'
   ld: drivers/misc/dma-buf-phys.c:112:(.text+0x168): undefined reference to `dma_buf_detach'
   ld: drivers/misc/dma-buf-phys.c:114:(.text+0x16f): undefined reference to `dma_buf_put'
   ld: drivers/misc/dma-buf-phys.c:114:(.text+0x19b): undefined reference to `dma_buf_put'


vim +55 drivers/misc/dma-buf-phys.c

    49	
    50	static int dma_buf_phys_release(struct inode *inode, struct file *file)
    51	{
    52		struct dma_buf_phys_file *priv = file->private_data;
    53	
    54		if (priv->attachment && priv->sgt)
  > 55			dma_buf_unmap_attachment(priv->attachment, priv->sgt, DMA_BIDIRECTIONAL);
    56		if (priv->dma_buf && priv->attachment)
  > 57			dma_buf_detach(priv->dma_buf, priv->attachment);
    58		if (priv->dma_buf)
  > 59			dma_buf_put(priv->dma_buf);
    60	
    61		kfree(priv);
    62	
    63		return 0;
    64	}
    65	
    66	static int dma_buf_phys_convert(struct dma_buf_phys_file *priv, int fd, u64 *phys)
    67	{
    68		struct device *dev = priv->dev;
    69		struct dma_buf *dma_buf;
    70		struct dma_buf_attachment *attachment;
    71		struct sg_table *sgt;
    72		dma_addr_t dma_addr;
    73		int ret;
    74	
  > 75		dma_buf = dma_buf_get(fd);
    76		if (IS_ERR(dma_buf))
    77			return PTR_ERR(dma_buf);
    78	
    79		/* Attach as the parent device as it will have the correct DMA ops set */
  > 80		attachment = dma_buf_attach(dma_buf, dev->parent);
    81		if (IS_ERR(attachment)) {
    82			ret = PTR_ERR(attachment);
    83			goto fail_put;
    84		}
    85	
  > 86		sgt = dma_buf_map_attachment(attachment, DMA_BIDIRECTIONAL);
    87		if (IS_ERR(sgt)) {
    88			ret = PTR_ERR(sgt);
    89			goto fail_detach;
    90		}
    91	
    92		/* Without PAT only physically contiguous buffers can be supported */
    93		if (sgt->orig_nents != 1) {
    94			dev_err(dev, "DMA-BUF not contiguous\n");
    95			ret = -EINVAL;
    96			goto fail_unmap;
    97		}
    98	
    99		dma_addr = sg_dma_address(sgt->sgl);
   100	
   101		*phys = dma_addr;
   102	
   103		priv->dma_buf = dma_buf;
   104		priv->attachment = attachment;
   105		priv->sgt = sgt;
   106	
   107		return 0;
   108	
   109	fail_unmap:
 > 110		dma_buf_unmap_attachment(attachment, sgt, DMA_BIDIRECTIONAL);
   111	fail_detach:
   112		dma_buf_detach(dma_buf, attachment);
   113	fail_put:
   114		dma_buf_put(dma_buf);
   115	
   116		return ret;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
