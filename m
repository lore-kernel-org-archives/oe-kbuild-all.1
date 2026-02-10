Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F59330B25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708932; cv=none; b=Ras+eeiB/MWoJaHbEa8mLE7pL3IPI19RhX0co0tgCnYJFtfoz/YIZa7RYsheYaut9QnXKBBD0+vIjRcc42hZmlqWhpv0vIf1Q1elqJhzEW86KKEQOz6584fQZjTW8NfiVDsqu/oZp3M83N0135HRwkTbeFAO9Qm4xgTEnz3NMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708932; c=relaxed/simple;
	bh=3A8HXt7e9IkJD7IZvzeTBZ27+5nlY1CYA0GZ8gfIzhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sL/fYQL3IWOjGjbWwvK2nFVIoCq0XmGv01nq5+/37u0KqCqksvZVapDL6AmMbp0+kQi5glnXO8qsvYTP4lwTx6+aW5M94UtrdSLYR9jxv+Yx2m4tqmA5UPeUtS1n+gUVTIJ1Mzfa3DraBcpcLwhnT9SrW0KWXA/mjb2y5MmQ4Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH5n2hKC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH5n2hKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708931; x=1802244931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3A8HXt7e9IkJD7IZvzeTBZ27+5nlY1CYA0GZ8gfIzhg=;
  b=YH5n2hKCEflq399qIYqIbrP5uF3r5pFNhuL5uBBfmOVRBPo6GSHyMGzm
   RBnnbdrqtZuPR71j+z0LV7WeMLtBoRd4Xp9YqQF6XipiHdRiz4dY9lhPe
   nOoI24D++cXonYy/uMdQ755ffky+zVVcG3uYUcjh6p7yqsN3b7ZuxpmS5
   1KRRqHyv7MNyXTZJTyDn8cnJS9XhvDJKTIipK/HvQoYpDLZU+O2FiVnGr
   fiozMQchU9U0Yw0eQekg57UeW5td1kcdCKldH/RKEddG9TL4JEFwsoLww
   +uDgmDi12udcexzL3bpx7lUueLuT8AC+bmAunWXTHJPDFxiJm+KALdAs4
   g==;
X-CSE-ConnectionGUID: dw7V756JSGawkWzJtG8YXw==
X-CSE-MsgGUID: dFhYolONS7uGM4TIuZklOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71901201"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71901201"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:35:30 -0800
X-CSE-ConnectionGUID: 4vV6ZhpwQZWZ50A+y5Veuw==
X-CSE-MsgGUID: Xxc7vrVXQeWAIpXXAYIYIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216012382"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 23:35:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpiHP-00000000omS-04rL;
	Tue, 10 Feb 2026 07:35:27 +0000
Date: Tue, 10 Feb 2026 15:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Zhiping Zhang <zhipingz@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] RMDA MLX5: get tph for p2p access when registering
 dmabuf mr
Message-ID: <202602101511.OySzKpKR-lkp@intel.com>
References: <20260209175317.1713406-3-zhipingz@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209175317.1713406-3-zhipingz@meta.com>

Hi Zhiping,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19-rc7]
[also build test WARNING on next-20260209]
[cannot apply to awilliam-vfio/next awilliam-vfio/for-linus rdma/for-next drm-misc/drm-misc-next linus/master v6.19 v6.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhiping-Zhang/Vfio-add-callback-to-get-tph-info-for-dmabuf/20260210-015711
base:   v6.19-rc7
patch link:    https://lore.kernel.org/r/20260209175317.1713406-3-zhipingz%40meta.com
patch subject: [RFC 2/2] RMDA MLX5: get tph for p2p access when registering dmabuf mr
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260210/202602101511.OySzKpKR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101511.OySzKpKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101511.OySzKpKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/mr.c: In function 'get_tph_mr_dmabuf':
>> drivers/infiniband/hw/mlx5/mr.c:1633:31: warning: unused variable 'mdev' [-Wunused-variable]
    1633 |         struct mlx5_core_dev *mdev = dev->mdev;
         |                               ^~~~


vim +/mdev +1633 drivers/infiniband/hw/mlx5/mr.c

  1627	
  1628	static void get_tph_mr_dmabuf(struct mlx5_ib_dev *dev, int fd, u16 *st_index,
  1629								  u8 *ph)
  1630	{
  1631		int ret;
  1632		struct dma_buf *dmabuf;
> 1633		struct mlx5_core_dev *mdev = dev->mdev;
  1634	
  1635		dmabuf = dma_buf_get(fd);
  1636		if (IS_ERR(dmabuf))
  1637			return;
  1638	
  1639		if (!dmabuf->ops->get_tph)
  1640			goto end_dbuf_put;
  1641	
  1642		ret = dmabuf->ops->get_tph(dmabuf, st_index, ph);
  1643		if (ret) {
  1644			*st_index = MLX5_MKC_PCIE_TPH_NO_STEERING_TAG_INDEX;
  1645			*ph = MLX5_IB_NO_PH;
  1646			mlx5_ib_dbg(dev, "get_tph failed (%d)\n", ret);
  1647			goto end_dbuf_put;
  1648		}
  1649	
  1650	end_dbuf_put:
  1651		dma_buf_put(dmabuf);
  1652	};
  1653	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
