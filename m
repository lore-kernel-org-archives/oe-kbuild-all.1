Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B92179A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 01:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494606; cv=none; b=m4otnH5h1m9ST43ljW4og2YnMIMtO5/oEpmx4bIpEuXBoMv3An6M0T8C8Z8pshzIMQ6YocxmNbDXAGeO7TfaJBmr86mQ2CFMEZvxUDAtUSwmE+HOC2yua3P0gqv3ffa0W50UGqqtfhggZSXC3j4W3yhP9QFalSgY6L3lnERHr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494606; c=relaxed/simple;
	bh=gJxVadC4tkPCpX7YeccA1HxpZAPwjD4S3dKGWG7MYwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUPv5piMMlq8wbAcn3mnuNRdF9oJOY37rQlJMZ4it9YuKZdzzV5QoNnfhZLIZeuNzYUEEtlvt3ChnJtrW/lIV6qnr8b2inN+j4DFW/0nXs6GmrPBbLgUBW+xwaDPviwyydE3G8bM0OlGzNFwZ388umJC3l7qwzsfFR9sSoP7MgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHgzDXdG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHgzDXdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746494604; x=1778030604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJxVadC4tkPCpX7YeccA1HxpZAPwjD4S3dKGWG7MYwQ=;
  b=oHgzDXdG2i35BkkWBHxoJqPw0aKljgOCpnn1Vi5N8MwSqEgazoVM40EP
   a87WqUVk9MG4kPClF+uwQj76kEWlvvnn08S3LxC3nifac6kGhVI5GcLqW
   JZMzi/Q34ZxCYmdCcIo7pBHoqnGRtRdWDpkb3UY33wNUr7p4Dsu2fMSWe
   g229oaB3y+Yjc/JEqOuTwLzSTDsGG5aflGV7zsShXnBiB6MAvUC3db8pL
   YjGPoIDVgNkQ4eJdTKt1Kie0Ahfh4ppLfmRqvZZKDf5wtXIj3RyAmKKGP
   qZr/fthVt7z0GcESv5B/JX8pG+a6YTPneKB1Wf23HR/M8CcglmTL+iGT6
   w==;
X-CSE-ConnectionGUID: g45lF7O0SLi+Jc+jh3+YXA==
X-CSE-MsgGUID: COAsoDeGSWeeI2ViL7O1Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51949705"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="51949705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 18:23:23 -0700
X-CSE-ConnectionGUID: 0VB23QwRSxyw29g4s8XXFg==
X-CSE-MsgGUID: GdvsHu7MQ/C1rCAcHm1Irw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="166504024"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 May 2025 18:23:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC71k-0006BR-0B;
	Tue, 06 May 2025 01:23:20 +0000
Date: Tue, 6 May 2025 09:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>
Subject: [sean-jc:sink 54/177] drivers/vhost/vdpa.c:219:52: error: 'struct
 irq_bypass_producer' has no member named 'token'
Message-ID: <202505060948.q8WlJK7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   b64923e38c20d35f52d3e78fe87993306d912851
commit: 55503e04dc3db68bfba5486acee4a8baa0ef8765 [54/177] irqbypass: Take ownership of producer/consumer token tracking
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250506/202505060948.q8WlJK7G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060948.q8WlJK7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060948.q8WlJK7G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/cdev.h:8,
                    from drivers/vhost/vdpa.c:16:
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_setup_vq_irq':
>> drivers/vhost/vdpa.c:219:52: error: 'struct irq_bypass_producer' has no member named 'token'
     219 |                          qid, vq->call_ctx.producer.token, ret);
         |                                                    ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/vhost/vdpa.c:218:17: note: in expansion of macro 'dev_info'
     218 |                 dev_info(&v->dev, "vq %u, irq bypass producer (token %p) registration fails, ret =  %d\n",
         |                 ^~~~~~~~


vim +219 drivers/vhost/vdpa.c

776f395004d829 Zhu Lingshan        2020-06-05  197  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  198  static void vhost_vdpa_setup_vq_irq(struct vhost_vdpa *v, u16 qid)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  199  {
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  200  	struct vhost_virtqueue *vq = &v->vqs[qid];
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  201  	const struct vdpa_config_ops *ops = v->vdpa->config;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  202  	struct vdpa_device *vdpa = v->vdpa;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  203  	int ret, irq;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  204  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  205  	if (!ops->get_vq_irq)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  206  		return;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  207  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  208  	irq = ops->get_vq_irq(vdpa, qid);
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  209  	if (irq < 0)
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  210  		return;
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  211  
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  212  	if (!vq->call_ctx.ctx)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  213  		return;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  214  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  215  	vq->call_ctx.producer.irq = irq;
55503e04dc3db6 Sean Christopherson 2025-04-04  216  	ret = irq_bypass_register_producer(&vq->call_ctx.producer, vq->call_ctx.ctx);
e01afe36df1a9e Zhu Lingshan        2020-10-23  217  	if (unlikely(ret))
e01afe36df1a9e Zhu Lingshan        2020-10-23  218  		dev_info(&v->dev, "vq %u, irq bypass producer (token %p) registration fails, ret =  %d\n",
e01afe36df1a9e Zhu Lingshan        2020-10-23 @219  			 qid, vq->call_ctx.producer.token, ret);
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  220  }
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  221  

:::::: The code at line 219 was first introduced by commit
:::::: e01afe36df1a9e42cacdb9c5b99512ec69a6f14b vdpa: handle irq bypass register failure case

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
