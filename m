Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D326F46C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459112; cv=none; b=DI29Ta9oH+04MvXL4s64fJsP9V86y3YeB5CfOViWQczYwim+QwNoK3TdBwtE8NN2lL13Oalp1g2p9Uuv2SuRhGPVakTuifFDiArrPWDUs6F/RVzMqci+AEuNpn9LjpYojj6AVRqGTBjg2ZIPagcaZJfV37rCQHDnAe4PLBGhIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459112; c=relaxed/simple;
	bh=D0cay7UgXRByGay8F+IOpdiIHYD3wlTU+4ZO54NP6ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPl4AdORAUhRwHTKo1ZTCMAfzu72m9PiF0zxIYJ6yIYcjcuZsvaWBNtm0sDviZBNKIN+kjuX0a6fsGVtFOwOGZAg5iwXTGt1jERFvSh6f2dESt6OqS3tV8Xzl1tbt4Ukc+AhHqPAZ8YJlMbUcVfJM5smhyP4JIf7xdtXJbc+onA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzzBcmhf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzzBcmhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751459110; x=1782995110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D0cay7UgXRByGay8F+IOpdiIHYD3wlTU+4ZO54NP6ZY=;
  b=JzzBcmhfmT0xmrpKIkvdRCivVOpDWFsmgpD8bykDe7tDOrWB3aYmbwmV
   KtFTuwSXubWM76PX+fX4ZSgMteoQL/gBxVC8OmUNaJfV9exh3wb8HWI76
   3t0hJCIYlAnhxM8/Y9Ko0M72Jj4ria45wva48WYE2ibFqsChVzPe3+a/t
   Bo7KItys9if+IQIaI8rpThDCKaQbTG2lmMOhjHCbIULR50Sg8gnFWxfOf
   yTJw5PqZXQ/3l8m4P5/2jsRjsoUVjPjKGef3yn3gKSvLCVNnnPj3G6hAF
   kfK44IxEqjBwY4AHT6tFvG92XheHK7y+v16kpxQ+jY2dMgENscibWxBwm
   A==;
X-CSE-ConnectionGUID: qLk8tMn1TKePMhP4sg6JIg==
X-CSE-MsgGUID: Gu9UT4j2RDOitKy8I4wk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64796951"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64796951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:25:10 -0700
X-CSE-ConnectionGUID: elOijtxfQF6IKsgZc7YJKA==
X-CSE-MsgGUID: +S1Sw1QpQWqYH419//R+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153685462"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2025 05:25:08 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWwWQ-0000cT-1O;
	Wed, 02 Jul 2025 12:25:06 +0000
Date: Wed, 2 Jul 2025 20:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 26/35] drivers/vfio/cdx/intr.c:41:15:
 error: implicit declaration of function 'msi_domain_alloc_irqs'; did you
 mean 'msi_domain_get_virq'?
Message-ID: <202507022059.nYMlWtcH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   626e89412dfb88766d90d842af4d9ec432d8526f
commit: 7f81907b7e3f93dfed2e903af52659baa4944341 [26/35] cdx: Enable compile testing
config: m68k-randconfig-r112-20250702 (https://download.01.org/0day-ci/archive/20250702/202507022059.nYMlWtcH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507022059.nYMlWtcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507022059.nYMlWtcH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/cdx/intr.c: In function 'vfio_cdx_msi_enable':
>> drivers/vfio/cdx/intr.c:41:15: error: implicit declaration of function 'msi_domain_alloc_irqs'; did you mean 'msi_domain_get_virq'? [-Wimplicit-function-declaration]
      41 |         ret = msi_domain_alloc_irqs(dev, MSI_DEFAULT_DOMAIN, nvec);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               msi_domain_get_virq
   drivers/vfio/cdx/intr.c: In function 'vfio_cdx_msi_disable':
>> drivers/vfio/cdx/intr.c:135:9: error: implicit declaration of function 'msi_domain_free_irqs_all' [-Wimplicit-function-declaration]
     135 |         msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +41 drivers/vfio/cdx/intr.c

848e447e000c41 Nipun Gupta 2024-04-23   23  
848e447e000c41 Nipun Gupta 2024-04-23   24  static int vfio_cdx_msi_enable(struct vfio_cdx_device *vdev, int nvec)
848e447e000c41 Nipun Gupta 2024-04-23   25  {
848e447e000c41 Nipun Gupta 2024-04-23   26  	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
848e447e000c41 Nipun Gupta 2024-04-23   27  	struct device *dev = vdev->vdev.dev;
848e447e000c41 Nipun Gupta 2024-04-23   28  	int msi_idx, ret;
848e447e000c41 Nipun Gupta 2024-04-23   29  
848e447e000c41 Nipun Gupta 2024-04-23   30  	vdev->cdx_irqs = kcalloc(nvec, sizeof(struct vfio_cdx_irq), GFP_KERNEL);
848e447e000c41 Nipun Gupta 2024-04-23   31  	if (!vdev->cdx_irqs)
848e447e000c41 Nipun Gupta 2024-04-23   32  		return -ENOMEM;
848e447e000c41 Nipun Gupta 2024-04-23   33  
848e447e000c41 Nipun Gupta 2024-04-23   34  	ret = cdx_enable_msi(cdx_dev);
848e447e000c41 Nipun Gupta 2024-04-23   35  	if (ret) {
848e447e000c41 Nipun Gupta 2024-04-23   36  		kfree(vdev->cdx_irqs);
848e447e000c41 Nipun Gupta 2024-04-23   37  		return ret;
848e447e000c41 Nipun Gupta 2024-04-23   38  	}
848e447e000c41 Nipun Gupta 2024-04-23   39  
848e447e000c41 Nipun Gupta 2024-04-23   40  	/* Allocate cdx MSIs */
848e447e000c41 Nipun Gupta 2024-04-23  @41  	ret = msi_domain_alloc_irqs(dev, MSI_DEFAULT_DOMAIN, nvec);
848e447e000c41 Nipun Gupta 2024-04-23   42  	if (ret) {
848e447e000c41 Nipun Gupta 2024-04-23   43  		cdx_disable_msi(cdx_dev);
848e447e000c41 Nipun Gupta 2024-04-23   44  		kfree(vdev->cdx_irqs);
848e447e000c41 Nipun Gupta 2024-04-23   45  		return ret;
848e447e000c41 Nipun Gupta 2024-04-23   46  	}
848e447e000c41 Nipun Gupta 2024-04-23   47  
848e447e000c41 Nipun Gupta 2024-04-23   48  	for (msi_idx = 0; msi_idx < nvec; msi_idx++)
848e447e000c41 Nipun Gupta 2024-04-23   49  		vdev->cdx_irqs[msi_idx].irq_no = msi_get_virq(dev, msi_idx);
848e447e000c41 Nipun Gupta 2024-04-23   50  
848e447e000c41 Nipun Gupta 2024-04-23   51  	vdev->msi_count = nvec;
848e447e000c41 Nipun Gupta 2024-04-23   52  	vdev->config_msi = 1;
848e447e000c41 Nipun Gupta 2024-04-23   53  
848e447e000c41 Nipun Gupta 2024-04-23   54  	return 0;
848e447e000c41 Nipun Gupta 2024-04-23   55  }
848e447e000c41 Nipun Gupta 2024-04-23   56  
848e447e000c41 Nipun Gupta 2024-04-23   57  static int vfio_cdx_msi_set_vector_signal(struct vfio_cdx_device *vdev,
848e447e000c41 Nipun Gupta 2024-04-23   58  					  int vector, int fd)
848e447e000c41 Nipun Gupta 2024-04-23   59  {
848e447e000c41 Nipun Gupta 2024-04-23   60  	struct eventfd_ctx *trigger;
848e447e000c41 Nipun Gupta 2024-04-23   61  	int irq_no, ret;
848e447e000c41 Nipun Gupta 2024-04-23   62  
848e447e000c41 Nipun Gupta 2024-04-23   63  	if (vector < 0 || vector >= vdev->msi_count)
848e447e000c41 Nipun Gupta 2024-04-23   64  		return -EINVAL;
848e447e000c41 Nipun Gupta 2024-04-23   65  
848e447e000c41 Nipun Gupta 2024-04-23   66  	irq_no = vdev->cdx_irqs[vector].irq_no;
848e447e000c41 Nipun Gupta 2024-04-23   67  
848e447e000c41 Nipun Gupta 2024-04-23   68  	if (vdev->cdx_irqs[vector].trigger) {
848e447e000c41 Nipun Gupta 2024-04-23   69  		free_irq(irq_no, vdev->cdx_irqs[vector].trigger);
848e447e000c41 Nipun Gupta 2024-04-23   70  		kfree(vdev->cdx_irqs[vector].name);
848e447e000c41 Nipun Gupta 2024-04-23   71  		eventfd_ctx_put(vdev->cdx_irqs[vector].trigger);
848e447e000c41 Nipun Gupta 2024-04-23   72  		vdev->cdx_irqs[vector].trigger = NULL;
848e447e000c41 Nipun Gupta 2024-04-23   73  	}
848e447e000c41 Nipun Gupta 2024-04-23   74  
848e447e000c41 Nipun Gupta 2024-04-23   75  	if (fd < 0)
848e447e000c41 Nipun Gupta 2024-04-23   76  		return 0;
848e447e000c41 Nipun Gupta 2024-04-23   77  
848e447e000c41 Nipun Gupta 2024-04-23   78  	vdev->cdx_irqs[vector].name = kasprintf(GFP_KERNEL, "vfio-msi[%d](%s)",
848e447e000c41 Nipun Gupta 2024-04-23   79  						vector, dev_name(vdev->vdev.dev));
848e447e000c41 Nipun Gupta 2024-04-23   80  	if (!vdev->cdx_irqs[vector].name)
848e447e000c41 Nipun Gupta 2024-04-23   81  		return -ENOMEM;
848e447e000c41 Nipun Gupta 2024-04-23   82  
848e447e000c41 Nipun Gupta 2024-04-23   83  	trigger = eventfd_ctx_fdget(fd);
848e447e000c41 Nipun Gupta 2024-04-23   84  	if (IS_ERR(trigger)) {
848e447e000c41 Nipun Gupta 2024-04-23   85  		kfree(vdev->cdx_irqs[vector].name);
848e447e000c41 Nipun Gupta 2024-04-23   86  		return PTR_ERR(trigger);
848e447e000c41 Nipun Gupta 2024-04-23   87  	}
848e447e000c41 Nipun Gupta 2024-04-23   88  
848e447e000c41 Nipun Gupta 2024-04-23   89  	ret = request_irq(irq_no, vfio_cdx_msihandler, 0,
848e447e000c41 Nipun Gupta 2024-04-23   90  			  vdev->cdx_irqs[vector].name, trigger);
848e447e000c41 Nipun Gupta 2024-04-23   91  	if (ret) {
848e447e000c41 Nipun Gupta 2024-04-23   92  		kfree(vdev->cdx_irqs[vector].name);
848e447e000c41 Nipun Gupta 2024-04-23   93  		eventfd_ctx_put(trigger);
848e447e000c41 Nipun Gupta 2024-04-23   94  		return ret;
848e447e000c41 Nipun Gupta 2024-04-23   95  	}
848e447e000c41 Nipun Gupta 2024-04-23   96  
848e447e000c41 Nipun Gupta 2024-04-23   97  	vdev->cdx_irqs[vector].trigger = trigger;
848e447e000c41 Nipun Gupta 2024-04-23   98  
848e447e000c41 Nipun Gupta 2024-04-23   99  	return 0;
848e447e000c41 Nipun Gupta 2024-04-23  100  }
848e447e000c41 Nipun Gupta 2024-04-23  101  
848e447e000c41 Nipun Gupta 2024-04-23  102  static int vfio_cdx_msi_set_block(struct vfio_cdx_device *vdev,
848e447e000c41 Nipun Gupta 2024-04-23  103  				  unsigned int start, unsigned int count,
848e447e000c41 Nipun Gupta 2024-04-23  104  				  int32_t *fds)
848e447e000c41 Nipun Gupta 2024-04-23  105  {
848e447e000c41 Nipun Gupta 2024-04-23  106  	int i, j, ret = 0;
848e447e000c41 Nipun Gupta 2024-04-23  107  
848e447e000c41 Nipun Gupta 2024-04-23  108  	if (start >= vdev->msi_count || start + count > vdev->msi_count)
848e447e000c41 Nipun Gupta 2024-04-23  109  		return -EINVAL;
848e447e000c41 Nipun Gupta 2024-04-23  110  
848e447e000c41 Nipun Gupta 2024-04-23  111  	for (i = 0, j = start; i < count && !ret; i++, j++) {
848e447e000c41 Nipun Gupta 2024-04-23  112  		int fd = fds ? fds[i] : -1;
848e447e000c41 Nipun Gupta 2024-04-23  113  
848e447e000c41 Nipun Gupta 2024-04-23  114  		ret = vfio_cdx_msi_set_vector_signal(vdev, j, fd);
848e447e000c41 Nipun Gupta 2024-04-23  115  	}
848e447e000c41 Nipun Gupta 2024-04-23  116  
848e447e000c41 Nipun Gupta 2024-04-23  117  	if (ret) {
848e447e000c41 Nipun Gupta 2024-04-23  118  		for (--j; j >= (int)start; j--)
848e447e000c41 Nipun Gupta 2024-04-23  119  			vfio_cdx_msi_set_vector_signal(vdev, j, -1);
848e447e000c41 Nipun Gupta 2024-04-23  120  	}
848e447e000c41 Nipun Gupta 2024-04-23  121  
848e447e000c41 Nipun Gupta 2024-04-23  122  	return ret;
848e447e000c41 Nipun Gupta 2024-04-23  123  }
848e447e000c41 Nipun Gupta 2024-04-23  124  
848e447e000c41 Nipun Gupta 2024-04-23  125  static void vfio_cdx_msi_disable(struct vfio_cdx_device *vdev)
848e447e000c41 Nipun Gupta 2024-04-23  126  {
848e447e000c41 Nipun Gupta 2024-04-23  127  	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
848e447e000c41 Nipun Gupta 2024-04-23  128  	struct device *dev = vdev->vdev.dev;
848e447e000c41 Nipun Gupta 2024-04-23  129  
848e447e000c41 Nipun Gupta 2024-04-23  130  	vfio_cdx_msi_set_block(vdev, 0, vdev->msi_count, NULL);
848e447e000c41 Nipun Gupta 2024-04-23  131  
848e447e000c41 Nipun Gupta 2024-04-23  132  	if (!vdev->config_msi)
848e447e000c41 Nipun Gupta 2024-04-23  133  		return;
848e447e000c41 Nipun Gupta 2024-04-23  134  
848e447e000c41 Nipun Gupta 2024-04-23 @135  	msi_domain_free_irqs_all(dev, MSI_DEFAULT_DOMAIN);
848e447e000c41 Nipun Gupta 2024-04-23  136  	cdx_disable_msi(cdx_dev);
848e447e000c41 Nipun Gupta 2024-04-23  137  	kfree(vdev->cdx_irqs);
848e447e000c41 Nipun Gupta 2024-04-23  138  
848e447e000c41 Nipun Gupta 2024-04-23  139  	vdev->cdx_irqs = NULL;
848e447e000c41 Nipun Gupta 2024-04-23  140  	vdev->msi_count = 0;
848e447e000c41 Nipun Gupta 2024-04-23  141  	vdev->config_msi = 0;
848e447e000c41 Nipun Gupta 2024-04-23  142  }
848e447e000c41 Nipun Gupta 2024-04-23  143  

:::::: The code at line 41 was first introduced by commit
:::::: 848e447e000c41894ff931dc7c004fd42c8840f8 vfio/cdx: add interrupt support

:::::: TO: Nipun Gupta <nipun.gupta@amd.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
