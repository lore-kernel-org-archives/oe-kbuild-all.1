Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446AF31AABC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 18:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475357; cv=none; b=a162JwxnTnOEb3wqscuKCRhrMufqTjOGAcwcGkCGRh0JDfV9KFUExSA0Uble88tjWyvt/OF2e5AEsqa3RETSvULsX9cf2wga3G2hX4mutWfpKlv8o0NxqKeX9UTd/Q1Uk9pJELjs26u+cpZTZZHMlEfzVBqUGO9tP2Op2w8sqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475357; c=relaxed/simple;
	bh=h8dg6IJwiMzAKy9pUJCmeJ23bAYTBA3lGuwl7oMjj2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UU59hWUqA+UH9Sy8vcqplGkpqrIgBfnBAPrex8QcZeWrK4xfEkxiQUjlgrcAAmBaByLqTCoMlwpaJ0vIx4pbZ/MLhOZyw0ydHo2MePHt3SYdOsEM2UIpNzdvKChwPx9afiF/R0sGULKaWPfp4442MHkwstWE1ldQH7Ysw5HB97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQfD9aS0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQfD9aS0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48372efa020so41449375e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772475352; x=1773080152; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ly3HA8CVT/qmA0QrPKvm+q33/myg29MXsLP+2Ew4xC0=;
        b=QQfD9aS0/HUIKHW++nDxGNRiiwmLE+uc2dq+eElcbwCaaNXFZP/Si1GrTpOzGd6akp
         8ExtAP+CN+xdA3xb6/gIzo0AtQZEbCn5M3Rc0zwVdwDKSqH3WP9DmsmGDnMTPBbMZTN+
         G6N8c3LRf8XoYQx3vtFdRa0B5uBw7H8vx4XqZvcJYvvA21wTsnViOiziP7qVgQNjlZmy
         KpH6XGZKuM7A1M3lIZSkqLrtEEO9kVFNKHsDYCGsSGgmXQhpyiiTI0RX+mdfjSZKtkoY
         hqzvO39zb5rAMtK9ig88gpDhth6rDE8VqeplNz9y6Bg7MLHy6+aPD7ZE2XcTXSMmOxsx
         NZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475352; x=1773080152;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ly3HA8CVT/qmA0QrPKvm+q33/myg29MXsLP+2Ew4xC0=;
        b=m+uIHzHwrvp5bJ3aZZgiH8oWfRQIU/Apq9kRMspGMCRP5LUT+MeiftTux5zGGWnzyu
         oF+pLO6byF4zlWJN72+rD31PJ90YqDeAue52Zslzfuu0jbJQtItXIVoUAeSvR/8Do8Cc
         u28Wn9GMRbObIl3hBYzUIwtYsfZik6tT7/Oqe8c3xvP1smKRylZfWZ98QKDVNEwmOqaQ
         pBap3PUYuuyZ2DYXaVLEsXg7P00nuBfpFLTp5fK3FHUfAEKnvYk/H4mE63moZcoIHwl6
         I+IVYI7FHUUHiO5hzP+CNwkxCDkrQQmxJ8t+Cirjyr1ThRWdHdQhLlGbkH1I1/PIYeEz
         S5/g==
X-Forwarded-Encrypted: i=1; AJvYcCXfG9+Fkh4EvDENN2txI/4b1Z/DBlrGHKVMO24MUm+48Mpr/G2RgIKQINDpxDmgKqlGI2rirwNK+U8aT45F@lists.linux.dev
X-Gm-Message-State: AOJu0YxnLcl0NqR41WmlkJcxz0s4aBHu52vrZr43dwAH2TJVCNNgxagC
	OClWEveTGQPQgPn+8UA85LrofKW8s45gTYTOskWQNetDunl3GowTphBi1QdM90/LsFu+n3ti/cR
	3yGSB
X-Gm-Gg: ATEYQzzS0UUeqRUjX2eQVahRbq3yAJCs6O5u1OlGYz9KCuvoVx0R7MK9EDqFEN0EQKF
	F4mlwjrZ3BfglyYxOD9BayGOBpv1t0RWgVGm2MO/lzrlibLU2RYqAIz+ydXj5QuU1qyJ43wLOaY
	bXoX0w997mpDtQJ4ZjmmqGqLpOrrRRFwATMbEXnKDDVEA1Z6gpl+wxLzLZKjgB1VxV+tI+CmZ92
	MuKv3ACGocJyEaqaUzMZl/V0s9bGlh4OINcR+rym+nnM84EAVgLOxVAK894WcXjTOk+5qTtFrLm
	6+gFKbf0aowuNueKratBo80kQGS6L5z3OKfDHjQ6EOmMyXm2LuUXjBBQHrC3AhbqVkW4lH5q5K/
	DmB/jS7xj0MF/32Iq8xIphRrJQRQsvo2WAYVEPWrJPMcMx78/W2lXPWlf+Vi40347+GQDX7SIRd
	feIDRlU2NIPw7KqMshfDHtdJqslvU=
X-Received: by 2002:a05:600c:3b18:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-483c9bc1f39mr264118075e9.13.1772475352512;
        Mon, 02 Mar 2026 10:15:52 -0800 (PST)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm686222915e9.0.2026.03.02.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:15:52 -0800 (PST)
Date: Mon, 2 Mar 2026 21:15:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 30/34]
 drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to
 'PTR_ERR'
Message-ID: <202603030132.eYdqJKik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   c37cf2824740d833b21eb816e21f94836100291f
commit: f8983286b743407cc7350f9635f6b3157f8bbeb1 [30/34] iommufd: Use the PAL mapping type instead of a vfio function
config: i386-randconfig-141-20260302 (https://download.01.org/0day-ci/archive/20260303/202603030132.eYdqJKik-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603030132.eYdqJKik-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/pages.c:1486 iopt_map_dmabuf() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1486 drivers/iommu/iommufd/pages.c

71db84a092c399 Jason Gunthorpe 2025-11-21  1461  static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
71db84a092c399 Jason Gunthorpe 2025-11-21  1462  			   struct dma_buf *dmabuf)
71db84a092c399 Jason Gunthorpe 2025-11-21  1463  {
f8983286b74340 Jason Gunthorpe 2026-02-09  1464  	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
71db84a092c399 Jason Gunthorpe 2025-11-21  1465  	struct dma_buf_attachment *attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1466  	int rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1467  
f8983286b74340 Jason Gunthorpe 2026-02-09  1468  	attach = dma_buf_mapping_attach(dmabuf, pal_match,
f8983286b74340 Jason Gunthorpe 2026-02-09  1469  					ARRAY_SIZE(pal_match),
f8983286b74340 Jason Gunthorpe 2026-02-09  1470  					&iopt_dmabuf_attach_revoke_ops, pages);
71db84a092c399 Jason Gunthorpe 2025-11-21  1471  	if (IS_ERR(attach))
71db84a092c399 Jason Gunthorpe 2025-11-21  1472  		return PTR_ERR(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1473  
71db84a092c399 Jason Gunthorpe 2025-11-21  1474  	dma_resv_lock(dmabuf->resv, NULL);
71db84a092c399 Jason Gunthorpe 2025-11-21  1475  	/*
71db84a092c399 Jason Gunthorpe 2025-11-21  1476  	 * Lock ordering requires the mutex to be taken inside the reservation,
71db84a092c399 Jason Gunthorpe 2025-11-21  1477  	 * make sure lockdep sees this.
71db84a092c399 Jason Gunthorpe 2025-11-21  1478  	 */
71db84a092c399 Jason Gunthorpe 2025-11-21  1479  	if (IS_ENABLED(CONFIG_LOCKDEP)) {
71db84a092c399 Jason Gunthorpe 2025-11-21  1480  		mutex_lock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1481  		mutex_unlock(&pages->mutex);
71db84a092c399 Jason Gunthorpe 2025-11-21  1482  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1483  
8c5f9645c3893f Leon Romanovsky 2026-01-31  1484  	rc = dma_buf_pin(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1485  	if (rc) {
f8983286b74340 Jason Gunthorpe 2026-02-09 @1486  		rc = PTR_ERR(pages->dmabuf.exp_phys);

Delete this line.  It's a copy and paste bug.

71db84a092c399 Jason Gunthorpe 2025-11-21  1487  		goto err_detach;
f8983286b74340 Jason Gunthorpe 2026-02-09  1488  	}
71db84a092c399 Jason Gunthorpe 2025-11-21  1489  
f8983286b74340 Jason Gunthorpe 2026-02-09  1490  	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
f8983286b74340 Jason Gunthorpe 2026-02-09  1491  	if (IS_ERR(pages->dmabuf.exp_phys)) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1492  		rc = PTR_ERR(pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1493  		goto err_unpin;
f8983286b74340 Jason Gunthorpe 2026-02-09  1494  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1495  
f8983286b74340 Jason Gunthorpe 2026-02-09  1496  	/* For now only works with single range exporters */
f8983286b74340 Jason Gunthorpe 2026-02-09  1497  	if (pages->dmabuf.exp_phys->length != 1) {
f8983286b74340 Jason Gunthorpe 2026-02-09  1498  		rc = -EINVAL;
f8983286b74340 Jason Gunthorpe 2026-02-09  1499  		goto err_unmap;
f8983286b74340 Jason Gunthorpe 2026-02-09  1500  	}
f8983286b74340 Jason Gunthorpe 2026-02-09  1501  	pages->dmabuf.phys = pages->dmabuf.exp_phys->phys[0];
8c5f9645c3893f Leon Romanovsky 2026-01-31  1502  
71db84a092c399 Jason Gunthorpe 2025-11-21  1503  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1504  
71db84a092c399 Jason Gunthorpe 2025-11-21  1505  	/* On success iopt_release_pages() will detach and put the dmabuf. */
71db84a092c399 Jason Gunthorpe 2025-11-21  1506  	pages->dmabuf.attach = attach;
71db84a092c399 Jason Gunthorpe 2025-11-21  1507  	return 0;
71db84a092c399 Jason Gunthorpe 2025-11-21  1508  
f8983286b74340 Jason Gunthorpe 2026-02-09  1509  err_unmap:
f8983286b74340 Jason Gunthorpe 2026-02-09  1510  	dma_buf_pal_unmap_phys(attach, pages->dmabuf.exp_phys);
8c5f9645c3893f Leon Romanovsky 2026-01-31  1511  err_unpin:
8c5f9645c3893f Leon Romanovsky 2026-01-31  1512  	dma_buf_unpin(attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1513  err_detach:
71db84a092c399 Jason Gunthorpe 2025-11-21  1514  	dma_resv_unlock(dmabuf->resv);
71db84a092c399 Jason Gunthorpe 2025-11-21  1515  	dma_buf_detach(dmabuf, attach);
71db84a092c399 Jason Gunthorpe 2025-11-21  1516  	return rc;
71db84a092c399 Jason Gunthorpe 2025-11-21  1517  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

