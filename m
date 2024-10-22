Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE261C244B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729619337; cv=none; b=isRmcNwF9ul8Nqizi04Ekp6LqsFsAVS41ssPfUJajUMt3/Tnzr6XcByDg6i/Yzo9MKYZv5MktTwJtf62LFfaqOmkxF6fN9UfipcWsxmL0NJlPA8oqF2dq9LWQ3f0aC8LPT10R1uEkbGw+RmjqrIXjwoMCtMEYMfWGJpJEU58Jmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729619337; c=relaxed/simple;
	bh=ijlY3JuuS4PyFELNt+oI48g0neLGveCDGe1VZ+PJ7hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dA8pIrCZ85OCTugjDdsBTi2Mb2QAH848OKIzpEogCtls9XafCHba2uxXqW21MQx7Ux4x18khTk7upee8ttpfgKJHwwKiAH9kfLQ9y9fNjXlbPofnKEghhiQyCeywg7tStxyTwwOUGHpIi3CdkYHhfrlEszMORyHXEgxJg7+5wn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0tfQd6M; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0tfQd6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729619335; x=1761155335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijlY3JuuS4PyFELNt+oI48g0neLGveCDGe1VZ+PJ7hg=;
  b=I0tfQd6MRgKu0HtL0pY2VQjU+vjC/ToHhEJ9cgrqD8uzxxk/UNkBH9ho
   jytkFJSlqbGrJAshQWnPjKVtMB8dfk66oRp+/VK7xWPdSiew3f3wE++p7
   P6ZyUJP5+X9GtVMQX7Poy+gCVyodvflxWHNpce4FCKS+wkw/5Vjh8qufa
   aKwxOXViUMJo+4+ZHLuMVerBgVV0TvmLMXaNTb4B6ET0R5bFyUvlpO+8q
   vy4MalReXg+L7veA00gRC7YkzJgE6FZ8WwdlIOSm/R1NFOhyHBCHur44M
   /QzfUBx0buPFcZS5TmenrDir1pn8hmwrOeaF/8JoaCewzlrE3AZX3SXYT
   Q==;
X-CSE-ConnectionGUID: ScG0KpN3QBaEEdELzzhENQ==
X-CSE-MsgGUID: WrXpU/iCQw2yNFT+EKlkFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40298082"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40298082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 10:48:54 -0700
X-CSE-ConnectionGUID: PpL1ZtL6ROyMeSXjQuhdRA==
X-CSE-MsgGUID: RoIa9geiTQW+3K4AdTuTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84560432"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Oct 2024 10:48:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3Izy-000Ttf-0t;
	Tue, 22 Oct 2024 17:48:50 +0000
Date: Wed, 23 Oct 2024 01:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pengyuan Zhao <zhaopengyuan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 12720/30000]
 drivers/vdpa/virtio_pci/vp_vdpa.c:168 vp_vdpa_request_irq() warn:
 inconsistent indenting
Message-ID: <202410230108.FVEbypBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   31421c83a2aaf8ecc1d8f377ea9e7e7a37cdb2bf
commit: 7e9f220b20b856cefc3290400637c00da0b224c3 [12720/30000] vdpa: set the virtqueue num during register
config: x86_64-randconfig-161-20241012 (https://download.01.org/0day-ci/archive/20241023/202410230108.FVEbypBJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230108.FVEbypBJ-lkp@intel.com/

smatch warnings:
drivers/vdpa/virtio_pci/vp_vdpa.c:168 vp_vdpa_request_irq() warn: inconsistent indenting

vim +168 drivers/vdpa/virtio_pci/vp_vdpa.c

b66082483c7e22 Jason Wang 2021-02-23  124  
b66082483c7e22 Jason Wang 2021-02-23  125  static int vp_vdpa_request_irq(struct vp_vdpa *vp_vdpa)
b66082483c7e22 Jason Wang 2021-02-23  126  {
b66082483c7e22 Jason Wang 2021-02-23  127  	struct virtio_pci_modern_device *mdev = &vp_vdpa->mdev;
b66082483c7e22 Jason Wang 2021-02-23  128  	struct pci_dev *pdev = mdev->pci_dev;
b66082483c7e22 Jason Wang 2021-02-23  129  	int i, ret, irq;
b66082483c7e22 Jason Wang 2021-02-23  130  	int queues = vp_vdpa->queues;
b66082483c7e22 Jason Wang 2021-02-23  131  	int vectors = queues + 1;
b66082483c7e22 Jason Wang 2021-02-23  132  
b66082483c7e22 Jason Wang 2021-02-23  133  	ret = pci_alloc_irq_vectors(pdev, vectors, vectors, PCI_IRQ_MSIX);
b66082483c7e22 Jason Wang 2021-02-23  134  	if (ret != vectors) {
b66082483c7e22 Jason Wang 2021-02-23  135  		dev_err(&pdev->dev,
b66082483c7e22 Jason Wang 2021-02-23  136  			"vp_vdpa: fail to allocate irq vectors want %d but %d\n",
b66082483c7e22 Jason Wang 2021-02-23  137  			vectors, ret);
b66082483c7e22 Jason Wang 2021-02-23  138  		return ret;
b66082483c7e22 Jason Wang 2021-02-23  139  	}
b66082483c7e22 Jason Wang 2021-02-23  140  
b66082483c7e22 Jason Wang 2021-02-23  141  	vp_vdpa->vectors = vectors;
b66082483c7e22 Jason Wang 2021-02-23  142  
b66082483c7e22 Jason Wang 2021-02-23  143  	for (i = 0; i < queues; i++) {
b66082483c7e22 Jason Wang 2021-02-23  144  		snprintf(vp_vdpa->vring[i].msix_name, VP_VDPA_NAME_SIZE,
b66082483c7e22 Jason Wang 2021-02-23  145  			"vp-vdpa[%s]-%d\n", pci_name(pdev), i);
b66082483c7e22 Jason Wang 2021-02-23  146  		irq = pci_irq_vector(pdev, i);
b66082483c7e22 Jason Wang 2021-02-23  147  		ret = devm_request_irq(&pdev->dev, irq,
b66082483c7e22 Jason Wang 2021-02-23  148  				       vp_vdpa_vq_handler,
b66082483c7e22 Jason Wang 2021-02-23  149  				       0, vp_vdpa->vring[i].msix_name,
b66082483c7e22 Jason Wang 2021-02-23  150  				       &vp_vdpa->vring[i]);
b66082483c7e22 Jason Wang 2021-02-23  151  		if (ret) {
b66082483c7e22 Jason Wang 2021-02-23  152  			dev_err(&pdev->dev,
b66082483c7e22 Jason Wang 2021-02-23  153  				"vp_vdpa: fail to request irq for vq %d\n", i);
b66082483c7e22 Jason Wang 2021-02-23  154  			goto err;
b66082483c7e22 Jason Wang 2021-02-23  155  		}
b66082483c7e22 Jason Wang 2021-02-23  156  		vp_modern_queue_vector(mdev, i, i);
b66082483c7e22 Jason Wang 2021-02-23  157  		vp_vdpa->vring[i].irq = irq;
b66082483c7e22 Jason Wang 2021-02-23  158  	}
b66082483c7e22 Jason Wang 2021-02-23  159  
b66082483c7e22 Jason Wang 2021-02-23  160  	snprintf(vp_vdpa->msix_name, VP_VDPA_NAME_SIZE, "vp-vdpa[%s]-config\n",
b66082483c7e22 Jason Wang 2021-02-23  161  		 pci_name(pdev));
b66082483c7e22 Jason Wang 2021-02-23  162  	irq = pci_irq_vector(pdev, queues);
b66082483c7e22 Jason Wang 2021-02-23  163  	ret = devm_request_irq(&pdev->dev, irq,	vp_vdpa_config_handler, 0,
b66082483c7e22 Jason Wang 2021-02-23  164  			       vp_vdpa->msix_name, vp_vdpa);
b66082483c7e22 Jason Wang 2021-02-23  165  	if (ret) {
b66082483c7e22 Jason Wang 2021-02-23  166  		dev_err(&pdev->dev,
b66082483c7e22 Jason Wang 2021-02-23  167  			"vp_vdpa: fail to request irq for vq %d\n", i);
b66082483c7e22 Jason Wang 2021-02-23 @168  			goto err;
b66082483c7e22 Jason Wang 2021-02-23  169  	}
b66082483c7e22 Jason Wang 2021-02-23  170  	vp_modern_config_vector(mdev, queues);
b66082483c7e22 Jason Wang 2021-02-23  171  	vp_vdpa->config_irq = irq;
b66082483c7e22 Jason Wang 2021-02-23  172  
b66082483c7e22 Jason Wang 2021-02-23  173  	return 0;
b66082483c7e22 Jason Wang 2021-02-23  174  err:
b66082483c7e22 Jason Wang 2021-02-23  175  	vp_vdpa_free_irq(vp_vdpa);
b66082483c7e22 Jason Wang 2021-02-23  176  	return ret;
b66082483c7e22 Jason Wang 2021-02-23  177  }
b66082483c7e22 Jason Wang 2021-02-23  178  

:::::: The code at line 168 was first introduced by commit
:::::: b66082483c7e223dd0cbf81b454ca85013446a2b vdpa: introduce virtio pci driver

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Pengyuan Zhao <zhaopengyuan@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
