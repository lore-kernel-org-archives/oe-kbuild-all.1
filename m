Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA11944F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNQvA069"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702240688; x=1733776688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XFXPO+n/Lu8tJ0UlCah9YtoT3mlmYBBj3N7+CPKuZN0=;
  b=PNQvA069SbvgkDi+uDmAMOfjYktJheEpX0uCM+lWw/uN9UoFvp9A5aXK
   hDVzcIYe/xtW7bOTlNwUd7bhoao2om0K28fFLxQURpfitDzgYdGSbE51U
   PnAhL4iazWDMyVUfAN4/t4mpwnr4wFdrcOErumHSeoe4DrdVADKlGCUJi
   paWi06cWWWorkFuBk858hlcW+3WC8c8E/fkX2IjtEu/NuEEuQxDaYWE+9
   E7Kyt92qqac9by2ncPNnl6XPrSsS3xXVcr0Do1J98IzlLSRCnYqpxyqC7
   9BAcwzo+Z/Lw0zeCAUJGXtP93b4k5P/ULnODqAwnvlMPRk4hZvbp+Bn9c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1384240"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1384240"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 12:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="772784450"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="772784450"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Dec 2023 12:38:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCQYs-000HFq-3D;
	Sun, 10 Dec 2023 20:38:03 +0000
Date: Mon, 11 Dec 2023 04:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Stevens <stevensd@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or
 member 'dma_buf' not described in 'virtio_dma_buf_attach'
Message-ID: <202312110445.z6bDltrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a87498869d6d1e7347cd01f337a77984604eb5e
commit: a0308938ec81cd0dca9d75833ec0dd1b8708917e virtio: add dma-buf support for exported objects
date:   3 years, 4 months ago
config: parisc-randconfig-m041-20230821 (https://download.01.org/0day-ci/archive/20231211/202312110445.z6bDltrY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110445.z6bDltrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110445.z6bDltrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or member 'dma_buf' not described in 'virtio_dma_buf_attach'
>> drivers/virtio/virtio_dma_buf.c:41: warning: Function parameter or member 'attach' not described in 'virtio_dma_buf_attach'


vim +41 drivers/virtio/virtio_dma_buf.c

    35	
    36	/**
    37	 * virtio_dma_buf_attach - mandatory attach callback for virtio dma-bufs
    38	 */
    39	int virtio_dma_buf_attach(struct dma_buf *dma_buf,
    40				  struct dma_buf_attachment *attach)
  > 41	{
    42		int ret;
    43		const struct virtio_dma_buf_ops *ops =
    44			container_of(dma_buf->ops,
    45				     const struct virtio_dma_buf_ops, ops);
    46	
    47		if (ops->device_attach) {
    48			ret = ops->device_attach(dma_buf, attach);
    49			if (ret)
    50				return ret;
    51		}
    52		return 0;
    53	}
    54	EXPORT_SYMBOL(virtio_dma_buf_attach);
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
