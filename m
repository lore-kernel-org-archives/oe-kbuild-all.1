Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D671876
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740893599; cv=none; b=p/CEC1MJBrsZm9R0Q6XSRY6j7uFbtpS/jcUhsyUTnJabp+sp1ka0pTFls/AeD0w+6PskUcUWsUJnHMpyXaoU0lEF2EKaw8ATGIF38R4cy3FYAahff5KnzLBDynF6He8rUUZKa/dmCUUUuV+PYO+stJwkdovskhBsXIsiHrQjw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740893599; c=relaxed/simple;
	bh=azts4a6VVRoq1sbNlIUWFCB4WcrhhG/a6gU6e27UEYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKm7YPE0C0EwsOZa2IkLDBurXwoYHx7MvUn5hgZlDzwEZde7y6PlAhZx0ZvV6AvGI+BjQOpOCTBYVMPRKFjUU2CCpFJvsJ7tfVKQFgW1jxmUQDhJ2U1iB1ox2Mv2eBTfyI31lCkAETKuk28rM9RTPCbp74Ik/IbfoRntv5JtQfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KF0H096S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF0H096S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740893598; x=1772429598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=azts4a6VVRoq1sbNlIUWFCB4WcrhhG/a6gU6e27UEYo=;
  b=KF0H096SIizC+8VzNk7irkGN4gs6fFh2y7GprBDJgGWiCrdR86/X+m8/
   a40J7vWJG7Gb2UFoUH0cKK2k5GWCowFeGhnWnuCEW8kHKm8MEgRyiQFkQ
   AMNTVrFitvfSpbo8N6RHCllqz5oVewuK+Outj4jXkKAjpdjVFVEEgtDHW
   qlxuJXMbBhCU2xeVPqYBYlmaeAkeYcaSsPKEHbd41vDeX2+nRIwh+H4DZ
   zDsQu1qOVrTO+tAjTcKYCqys6nGNJE5Dsk/hFQGxWA/K17J/4R0TX2Xxm
   HdgqgYNeTxiV3lQfVllhIrADhgN7c5G2rVe9HEOjOe2pSrz5MOTtorASC
   g==;
X-CSE-ConnectionGUID: 2+1QMlJ/T+2GsMWQTazytQ==
X-CSE-MsgGUID: 0Z8wFGCHQqCTsLH27dk0sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="64244387"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="64244387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 21:33:16 -0800
X-CSE-ConnectionGUID: 9HoMvIpQRKiH8HtIHzB8Sg==
X-CSE-MsgGUID: ttifPRQgSySS443nSX5oUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118599745"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 21:33:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tobwo-000H6A-0t;
	Sun, 02 Mar 2025 05:33:08 +0000
Date: Sun, 2 Mar 2025 13:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] iommu: Add domain_alloc_identity()
Message-ID: <202503021205.KTYFNoX2-lkp@intel.com>
References: <2-v2-a3b72fd4b99a+1b6-iommu_virtio_domains_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v2-a3b72fd4b99a+1b6-iommu_virtio_domains_jgg@nvidia.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-virtio-Break-out-bypass-identity-support-into-a-global-static/20250228-082243
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/2-v2-a3b72fd4b99a%2B1b6-iommu_virtio_domains_jgg%40nvidia.com
patch subject: [PATCH v2 2/5] iommu: Add domain_alloc_identity()
config: x86_64-randconfig-004-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021205.KTYFNoX2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021205.KTYFNoX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021205.KTYFNoX2-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/virtio-iommu.c: In function 'viommu_probe':
>> drivers/iommu/virtio-iommu.c:1228:34: error: assignment of member 'pgsize_bitmap' in read-only object
    1228 |         viommu_ops.pgsize_bitmap = viommu->pgsize_bitmap;
         |                                  ^
   drivers/iommu/virtio-iommu.c: At top level:
   drivers/iommu/virtio-iommu.c:817:29: warning: 'viommu_identity_domain' defined but not used [-Wunused-variable]
     817 | static struct viommu_domain viommu_identity_domain = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~


vim +/pgsize_bitmap +1228 drivers/iommu/virtio-iommu.c

edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1153  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1154  static int viommu_probe(struct virtio_device *vdev)
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1155  {
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1156  	struct device *parent_dev = vdev->dev.parent;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1157  	struct viommu_dev *viommu = NULL;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1158  	struct device *dev = &vdev->dev;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1159  	u64 input_start = 0;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1160  	u64 input_end = -1UL;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1161  	int ret;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1162  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1163  	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1) ||
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1164  	    !virtio_has_feature(vdev, VIRTIO_IOMMU_F_MAP_UNMAP))
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1165  		return -ENODEV;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1166  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1167  	viommu = devm_kzalloc(dev, sizeof(*viommu), GFP_KERNEL);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1168  	if (!viommu)
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1169  		return -ENOMEM;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1170  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1171  	spin_lock_init(&viommu->request_lock);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1172  	ida_init(&viommu->domain_ids);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1173  	viommu->dev = dev;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1174  	viommu->vdev = vdev;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1175  	INIT_LIST_HEAD(&viommu->requests);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1176  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1177  	ret = viommu_init_vqs(viommu);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1178  	if (ret)
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1179  		return ret;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1180  
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1181  	virtio_cread_le(vdev, struct virtio_iommu_config, page_size_mask,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1182  			&viommu->pgsize_bitmap);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1183  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1184  	if (!viommu->pgsize_bitmap) {
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1185  		ret = -EINVAL;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1186  		goto err_free_vqs;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1187  	}
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1188  
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1189  	viommu->map_flags = VIRTIO_IOMMU_MAP_F_READ | VIRTIO_IOMMU_MAP_F_WRITE;
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1190  	viommu->last_domain = ~0U;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1191  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1192  	/* Optional features */
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1193  	virtio_cread_le_feature(vdev, VIRTIO_IOMMU_F_INPUT_RANGE,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1194  				struct virtio_iommu_config, input_range.start,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1195  				&input_start);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1196  
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1197  	virtio_cread_le_feature(vdev, VIRTIO_IOMMU_F_INPUT_RANGE,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1198  				struct virtio_iommu_config, input_range.end,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1199  				&input_end);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1200  
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1201  	virtio_cread_le_feature(vdev, VIRTIO_IOMMU_F_DOMAIN_RANGE,
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1202  				struct virtio_iommu_config, domain_range.start,
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1203  				&viommu->first_domain);
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1204  
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1205  	virtio_cread_le_feature(vdev, VIRTIO_IOMMU_F_DOMAIN_RANGE,
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1206  				struct virtio_iommu_config, domain_range.end,
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1207  				&viommu->last_domain);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1208  
d83c67c4a669a4 Michael S. Tsirkin    2020-08-05  1209  	virtio_cread_le_feature(vdev, VIRTIO_IOMMU_F_PROBE,
2a5a314874450d Jean-Philippe Brucker 2019-01-15  1210  				struct virtio_iommu_config, probe_size,
2a5a314874450d Jean-Philippe Brucker 2019-01-15  1211  				&viommu->probe_size);
2a5a314874450d Jean-Philippe Brucker 2019-01-15  1212  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1213  	viommu->geometry = (struct iommu_domain_geometry) {
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1214  		.aperture_start	= input_start,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1215  		.aperture_end	= input_end,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1216  		.force_aperture	= true,
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1217  	};
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1218  
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1219  	if (virtio_has_feature(vdev, VIRTIO_IOMMU_F_MMIO))
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1220  		viommu->map_flags |= VIRTIO_IOMMU_MAP_F_MMIO;
ae24fb49d01103 Jean-Philippe Brucker 2019-07-22  1221  
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1222  	/* Reserve an ID to use as the bypass domain */
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1223  	if (virtio_has_feature(viommu->vdev, VIRTIO_IOMMU_F_BYPASS_CONFIG)) {
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1224  		viommu->identity_domain_id = viommu->first_domain;
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1225  		viommu->first_domain++;
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1226  	}
b7da58138e8b46 Jason Gunthorpe       2025-02-27  1227  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15 @1228  	viommu_ops.pgsize_bitmap = viommu->pgsize_bitmap;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1229  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1230  	virtio_device_ready(vdev);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1231  
169a126c6e88a9 Jean-Philippe Brucker 2019-01-15  1232  	/* Populate the event queue with buffers */
169a126c6e88a9 Jean-Philippe Brucker 2019-01-15  1233  	ret = viommu_fill_evtq(viommu);
169a126c6e88a9 Jean-Philippe Brucker 2019-01-15  1234  	if (ret)
169a126c6e88a9 Jean-Philippe Brucker 2019-01-15  1235  		goto err_free_vqs;
169a126c6e88a9 Jean-Philippe Brucker 2019-01-15  1236  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1237  	ret = iommu_device_sysfs_add(&viommu->iommu, dev, NULL, "%s",
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1238  				     virtio_bus_name(vdev));
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1239  	if (ret)
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1240  		goto err_free_vqs;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1241  
2d471b20c55e13 Robin Murphy          2021-04-01  1242  	iommu_device_register(&viommu->iommu, &viommu_ops, parent_dev);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1243  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1244  	vdev->priv = viommu;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1245  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1246  	dev_info(dev, "input address: %u bits\n",
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1247  		 order_base_2(viommu->geometry.aperture_end));
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1248  	dev_info(dev, "page mask: %#llx\n", viommu->pgsize_bitmap);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1249  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1250  	return 0;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1251  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1252  err_free_vqs:
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1253  	vdev->config->del_vqs(vdev);
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1254  
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1255  	return ret;
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1256  }
edcd69ab9a323b Jean-Philippe Brucker 2019-01-15  1257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
