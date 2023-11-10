Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A26AB4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgrYdrca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699599900; x=1731135900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RZvtDoltcivn8Akea6qyn5pPypQIrlUKxFgtTWvL4PM=;
  b=WgrYdrcaNLyIerYFutb9kZ1xyVJj9V+Uia2U84rJvYUeMzlO4nES+2kO
   LWfTTVG/+SErzGV6RK0cIKbP94VHdftRjAsF7RV+TrIg5qX3Z0ypFkDsj
   Y/VnrICoiOTF+Qz6NeSIbyAGVtBPeWCLwAY8UBt4N3NlW4m6mbGABGj69
   /Wuo36LrSGDrNz/kJlXl9ph80z+RXpQq9btefLeIdk0T/Y6frd/ctc5Cf
   TKPxo2lf6PQZjcVdoNLOGdyC7s6m7Q8NG/cxaqjI8NljXUAvFafeYQSnN
   pVAenlYjnWAj/ibSETApXIXR8zEE+42cPcD4bICMDZP2Tr5pUvyYCj45K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8797681"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="8797681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 23:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="11793691"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2023 23:04:57 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1LZW-0009TK-32;
	Fri, 10 Nov 2023 07:04:54 +0000
Date: Fri, 10 Nov 2023 15:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Tina Zhang <tina.zhang@intel.com>
Subject: [tinazhangzw:vt-d-pgtable-20231106 12/29]
 drivers/iommu/virtio-iommu.c:1148:62: warning: '%d' directive output may be
 truncated writing between 1 and 10 bytes into a region of size 8
Message-ID: <202311101414.2oUoH7FE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git vt-d-pgtable-20231106
head:   93d46e47a316a193e5a4dac6f715b1a4e4c97011
commit: 21d236d9f874c2bb54acf28f05f918864a4ea2c2 [12/29] iommu/virtio: Support multiple queues
config: x86_64-randconfig-001-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101414.2oUoH7FE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101414.2oUoH7FE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101414.2oUoH7FE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/virtio-iommu.c: In function 'viommu_probe':
>> drivers/iommu/virtio-iommu.c:1148:62: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Wformat-truncation=]
      snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "request.%d",
                                                                 ^~
   drivers/iommu/virtio-iommu.c:1148:53: note: directive argument in the range [0, 2147483647]
      snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "request.%d",
                                                        ^~~~~~~~~~~~
   drivers/iommu/virtio-iommu.c:1148:3: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
      snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "request.%d",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        pair);
        ~~~~~
>> drivers/iommu/virtio-iommu.c:1154:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "event.%d",
                                                                 ^
   drivers/iommu/virtio-iommu.c:1154:3: note: 'snprintf' output between 8 and 17 bytes into a destination of size 16
      snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "event.%d",
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        pair);
        ~~~~~


vim +1148 drivers/iommu/virtio-iommu.c

  1114	
  1115	static int viommu_init_vqs(struct viommu_dev *viommu)
  1116	{
  1117		int ret;
  1118		int i, pair;
  1119		const char **names;
  1120		struct virtqueue **vqs;
  1121		size_t num_pairs, num_vqs;
  1122		vq_callback_t **callbacks;
  1123		struct irq_affinity irq_aff = {};
  1124		struct virtio_device *vdev = dev_to_virtio(viommu->dev);
  1125	
  1126		viommu->num_queues = min_t(u16, viommu->num_queues, nr_cpu_ids);
  1127	
  1128		num_pairs = viommu->num_queues;
  1129		num_vqs = num_pairs * 2;
  1130	
  1131		if (viommu->num_queues < 1) {
  1132			dev_err(viommu->dev, "Invalid number of queues\n");
  1133			return -EINVAL;
  1134		}
  1135	
  1136		viommu->vqs = devm_kcalloc(viommu->dev, num_vqs, sizeof(*viommu->vqs),
  1137					   GFP_KERNEL);
  1138		vqs = devm_kcalloc(viommu->dev, num_vqs, sizeof(*vqs), GFP_KERNEL);
  1139		callbacks = devm_kcalloc(viommu->dev, num_vqs, sizeof(*callbacks),
  1140					 GFP_KERNEL);
  1141		names = devm_kcalloc(viommu->dev, num_vqs, sizeof(*names), GFP_KERNEL);
  1142	
  1143		if (!viommu->vqs || !vqs || !callbacks || !names)
  1144			/* Cleanup done by devm */
  1145			return -ENOMEM;
  1146	
  1147		for (i = 0, pair = 0; pair < num_pairs; pair++, i++) {
> 1148			snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "request.%d",
  1149				 pair);
  1150			/* No async request, so no callback */
  1151			names[i] = viommu->vqs[i].name;
  1152	
  1153			i++;
> 1154			snprintf(viommu->vqs[i].name, VIOMMU_VQ_NAME_LEN, "event.%d",
  1155				 pair);
  1156			callbacks[i] = viommu_event_handler;
  1157			names[i] = viommu->vqs[i].name;
  1158		}
  1159	
  1160		ret = virtio_find_vqs(vdev, num_vqs, vqs, callbacks, names, &irq_aff);
  1161		if (ret)
  1162			return ret;
  1163	
  1164		for (i = 0; i < num_vqs; i++) {
  1165			/* TODO split request/event */
  1166			viommu->vqs[i].vq = vqs[i];
  1167			spin_lock_init(&viommu->vqs[i].lock);
  1168			INIT_LIST_HEAD(&viommu->vqs[i].requests);
  1169		}
  1170		return 0;
  1171	}
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
