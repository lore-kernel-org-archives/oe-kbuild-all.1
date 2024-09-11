Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE50D17A922
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045852; cv=none; b=LSYT4nW0ECZgQoY1oYYG8n0txHQTDSoSEdYm/xVfdC21Gv6cCKiQzN9Jv58gpLgvaWKiWkWNFf2bRHkK9i1touk06Z1rWrVnMoQA7k1ACcNuNen/1VRh8UOMo0ASHQeXwV8aeCplVgh/icNHAGgHJzAMHKOUeetPDqld+QbaeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045852; c=relaxed/simple;
	bh=WmvypRvluLxXSMvDronQqnQSCusmcYO7H9Je0eujxnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FqEO1414ZJjnC7n1B4/FNWlqivx0Y4jCW5U5L8NP1gvGcec9EyosT7RThdK5+mP+wuXFf1jCsIoVbb3ZyohMRIfHDXRj3rQKWGoyHquA6uTtldHVbfq7R09Msrj1x9RDLjSPH6+6/JyzfxVYrNnmWW4BDUli8IJeN05Z3NZSkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsV40Pkc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsV40Pkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726045850; x=1757581850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmvypRvluLxXSMvDronQqnQSCusmcYO7H9Je0eujxnM=;
  b=LsV40PkcZV0uc48O5bGOBvGAM5KX+SbJkzQ70VkDVGk5x+TiUPQABT9A
   hGehs+X+p71UN9dB4BE7zaqtABBl1Q/I06gVY+zAXtJfFaE6GxM2HrD+Y
   WFBobbi4AEnTM2MvurIIApMkfucMH4wKr+2YumJrt4Y9rU2sGY9Q+OAjw
   QoE7buqPtqH1ldv3NPSK5Vsqb17AENeSX6hC8KA2h2pMBGee0ReQJE2Fl
   mM4JrNU3N3Wvt52Z333bqr8FMY4BzP+ZkQRZ9ryQbVlxgUqWjrFv7akLq
   jNMhxHBsi2tW+cBMs4UJa84TzIzZTPebiCnsUO+UonRzHE/sH2XTPYTS0
   g==;
X-CSE-ConnectionGUID: i2HT5r09Q5OpnaQeVoU70Q==
X-CSE-MsgGUID: Jq4JRR+QQpeUOtBx61CjBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24328993"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24328993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 02:10:42 -0700
X-CSE-ConnectionGUID: L4WNw10qSsagKPKtsygjxw==
X-CSE-MsgGUID: uXVVFLaXS8aHYZTz+ZOgtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67354507"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2024 02:10:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soJN1-0003Ha-1W;
	Wed, 11 Sep 2024 09:10:39 +0000
Date: Wed, 11 Sep 2024 17:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pengyuan Zhao <zhaopengyuan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 13879/30000] drivers/vdpa/vdpa.c:759:19: sparse:
 sparse: cast to restricted __le16
Message-ID: <202409111741.8Hd9TwMf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fb74b7c6ee60eaba8d843255f6a09f6d1d6b8c33
commit: 661b972e802c8e252911361538651db906c084bb [13879/30000] vdpa: Introduce query of device config layout
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111741.8Hd9TwMf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111741.8Hd9TwMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111741.8Hd9TwMf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa.c:759:19: sparse: sparse: cast to restricted __le16
>> drivers/vdpa/vdpa.c:759:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:775:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:775:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:779:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:779:19: sparse: sparse: cast from restricted __virtio16

vim +759 drivers/vdpa/vdpa.c

   749	
   750	static int vdpa_dev_net_mq_config_fill(struct vdpa_device *vdev,
   751					       struct sk_buff *msg, u64 features,
   752					       const struct virtio_net_config *config)
   753	{
   754		u16 val_u16;
   755	
   756		if ((features & (1ULL << VIRTIO_NET_F_MQ)) == 0)
   757			return 0;
   758	
 > 759		val_u16 = le16_to_cpu(config->max_virtqueue_pairs);
   760		return nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, val_u16);
   761	}
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
