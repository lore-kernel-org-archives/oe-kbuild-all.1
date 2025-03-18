Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E718035280
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742267979; cv=none; b=h/usoPuujfyQiBh0Mb5JqDmqbJHCRDXg7KSyyjKQfroO7xw/3KxTKEW0h6H/uLNR77Iwtie7hgI64k3T/YXxAv55RcuqsqvIslrLTWvOVnt2DWIgDfxnsFNu/h5PzMvWxCt9HOplQIL+2itvwF16cuihtITncEWcFoapgo34348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742267979; c=relaxed/simple;
	bh=TDsRVl9KzL07D3OaqAY1eCauOShIpPn1bxPJP1LVrPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McgksgAd9v1lLq5OXJX26LoNbmoLCeV7Xtq1ucm7RrEwGTWbx7v9xzGbWtLPgVAHuwIQeZZaMn46qf3LnhDT6/a0pPiosUZSrYJvvPpBq1afn72ya0dbQnYO4ca4AFAEen/UUBH+IktGjJu3+cHoAvl06dVUCYasg6rWMZmQbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCirzMQd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCirzMQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267977; x=1773803977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TDsRVl9KzL07D3OaqAY1eCauOShIpPn1bxPJP1LVrPE=;
  b=VCirzMQdSA/0DJvnyrHp9/YTU1y+y4YRLvhxASLs2yzCR2zp/KRvhLea
   amYXtRk40p/yoWOaqC1qQFSVG8f/wrJIKx2IvTpJypcH+vkWyHlUu8AS5
   CDCzUOmlxzWHbYKLSYtCxEZM9ElYCS4FuSl0HKB34l9VH6sj4x37aFZVe
   zRnPzG3Vhfq1RJuJAEHnCkwaaGPVT83pCQXTvDyp789viMWCbC4yPXqJR
   UCnAmjjLB2ciWL//KjhIdCo+YFds7rXOygjCTv3XUgeTapxYhqQPBlVCW
   +7TOQGzjEdliXu1q1KqmD3tZ1/cloAvIeJSRNvnMQL6CRw1zh+fXXJ5dK
   g==;
X-CSE-ConnectionGUID: j1lBd+KNQdmPPBvP6alH4A==
X-CSE-MsgGUID: NyTwdyMQSsa0yU9mYijDDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30971723"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="30971723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:16:17 -0700
X-CSE-ConnectionGUID: un1CNWDASuezZvPLCz92NA==
X-CSE-MsgGUID: suDn22W9RKyCCfHmbFfqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="152979025"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2025 20:16:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuNR5-000DLU-1v;
	Tue, 18 Mar 2025 03:16:11 +0000
Date: Tue, 18 Mar 2025 11:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 21/21]
 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c:20:13: warning: no previous
 prototype for 'yhgch_drm_interrupt'
Message-ID: <202503181104.PG4g7AR6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   0e71e11c7c57c6a824d6a2a6d48ef99568a94b3b
commit: 5beb05c06d06e80489ab0fb616cfbc42b94e19e6 [21/21] anolis: drm/yhgch/yhgch-drm: rename inspur-drm to yhgch-drm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250318/202503181104.PG4g7AR6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181104.PG4g7AR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181104.PG4g7AR6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c:20:13: warning: no previous prototype for 'yhgch_drm_interrupt' [-Wmissing-prototypes]
      20 | irqreturn_t yhgch_drm_interrupt(int irq, void *arg)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/yhgch_drm_interrupt +20 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c

    18	
    19	DEFINE_DRM_GEM_FOPS(yhgch_fops);
  > 20	irqreturn_t yhgch_drm_interrupt(int irq, void *arg)
    21	{
    22		struct drm_device *dev = (struct drm_device *)arg;
    23		struct yhgch_drm_private *priv =
    24		    (struct yhgch_drm_private *)dev->dev_private;
    25		u32 status;
    26	
    27		status = readl(priv->mmio + INSPUR_RAW_INTERRUPT);
    28	
    29		if (status & INSPUR_RAW_INTERRUPT_VBLANK(1)) {
    30			writel(INSPUR_RAW_INTERRUPT_VBLANK(1),
    31			       priv->mmio + INSPUR_RAW_INTERRUPT);
    32			drm_handle_vblank(dev, 0);
    33		}
    34	
    35		return IRQ_HANDLED;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
