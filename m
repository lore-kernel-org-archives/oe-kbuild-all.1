Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D71FC7D5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737108504; cv=none; b=juDJGlzkmXmkunO0SEq/D7NB0loUtNqda44bwecWXFw6nwX7iGOwI3RzhqwRox4dTFwBVQ2Zy+exz74o+RyEL8+hRGeP0AZ03iNgWU8Tlu9xM4zKvgsC6wpq8BP0qlQvQ73S0djy/MJPcxyOo+A093RM4GIkFvg6+wBd230VFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737108504; c=relaxed/simple;
	bh=pFh7x/HW4cx0JcyahgPImN1OzEO+GLGZQVEvyKDpAiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9sdJs9/1LezRZAXgMEbBJPtRZ4MmmGMHXze+isQtUpFIH8/cOJGR6+p8qcoYyTu01Vb8MqS7mJJh5FLmukdZhu58UCojH/aIUyAM7n+bRiYgSV7sUP8eEWcKOMJ1ZYtE3pX0HdnWitWYY4MX6rIdWcLWQUxttQfHOCZxeMlO1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH1mrtL/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH1mrtL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737108503; x=1768644503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFh7x/HW4cx0JcyahgPImN1OzEO+GLGZQVEvyKDpAiI=;
  b=QH1mrtL/0rk/BkFMspK73zMO2PPRJhDIONRs0sSiTMq/+4P+rrUEsV6p
   dhpZLRqA7BHUWVj39g4FTGFNWW6uWSzo22XxZtseys1TPe9tJweFWIlpu
   J8FwujD4KiNdlnvSr4DkIT4Awg0Hc/lO0lyD4Qvc+i04SBWeZ9fJuCGpy
   9Gqm5MKqvZxEcUI3iqfChB8eXf+kg6MCEilvEixdrUmiqGao4TTFldbWQ
   b8UwNAyNTWocO3Kcv/Af46ngIr9vigEydQiBxSry2GS9zJBfQIJJB0sO1
   jpXoCe8UWRnBSnhh8wus5tr0teq19iAJ6KR23Xhtp1OYsBGtef1kiLFRc
   g==;
X-CSE-ConnectionGUID: vM1nnt0ATbmknh8sft5VEQ==
X-CSE-MsgGUID: qa1uhSPpTtWsQ263BnD7Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37418497"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37418497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 02:08:22 -0800
X-CSE-ConnectionGUID: mzrwOfonRNidPaNO3HQXgg==
X-CSE-MsgGUID: lTM94vy/Qt2AiDqmdnJxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105624567"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 02:08:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYjH0-000T3W-2W;
	Fri, 17 Jan 2025 10:08:18 +0000
Date: Fri, 17 Jan 2025 18:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/media/platform/vim2m.c:1384:1: warning: label 'error_v4l2' defined
 but not used
Message-ID: <202501171847.rVCjwXoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sakari,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   bf5b85fe246873efa65a9dc0631ad70c59eece6c
commit: b7248281afb165ebd2f64dfd5ef4de3c5cc2a81f [1/1] media: vim2m: Register video device after setting up internals
config: arm64-randconfig-002-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171847.rVCjwXoL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171847.rVCjwXoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171847.rVCjwXoL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/vim2m.c: In function 'vim2m_probe':
>> drivers/media/platform/vim2m.c:1384:1: warning: label 'error_v4l2' defined but not used [-Wunused-label]
    1384 | error_v4l2:
         | ^~~~~~~~~~
   drivers/media/platform/vim2m.c: At top level:
   drivers/media/platform/vim2m.c:1309:38: warning: 'm2m_media_ops' defined but not used [-Wunused-const-variable=]
    1309 | static const struct media_device_ops m2m_media_ops = {
         |                                      ^~~~~~~~~~~~~


vim +/error_v4l2 +1384 drivers/media/platform/vim2m.c

  1313	
  1314	static int vim2m_probe(struct platform_device *pdev)
  1315	{
  1316		struct vim2m_dev *dev;
  1317		struct video_device *vfd;
  1318		int ret;
  1319	
  1320		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
  1321		if (!dev)
  1322			return -ENOMEM;
  1323	
  1324		ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
  1325		if (ret)
  1326			goto error_free;
  1327	
  1328		atomic_set(&dev->num_inst, 0);
  1329		mutex_init(&dev->dev_mutex);
  1330	
  1331		dev->vfd = vim2m_videodev;
  1332		vfd = &dev->vfd;
  1333		vfd->lock = &dev->dev_mutex;
  1334		vfd->v4l2_dev = &dev->v4l2_dev;
  1335	
  1336		video_set_drvdata(vfd, dev);
  1337		v4l2_info(&dev->v4l2_dev,
  1338			  "Device registered as /dev/video%d\n", vfd->num);
  1339	
  1340		platform_set_drvdata(pdev, dev);
  1341	
  1342		dev->m2m_dev = v4l2_m2m_init(&m2m_ops);
  1343		if (IS_ERR(dev->m2m_dev)) {
  1344			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
  1345			ret = PTR_ERR(dev->m2m_dev);
  1346			dev->m2m_dev = NULL;
  1347			goto error_dev;
  1348		}
  1349	
  1350		ret = video_register_device(vfd, VFL_TYPE_GRABBER, 0);
  1351		if (ret) {
  1352			v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
  1353			goto error_m2m;
  1354		}
  1355	
  1356	#ifdef CONFIG_MEDIA_CONTROLLER
  1357		dev->mdev.dev = &pdev->dev;
  1358		strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
  1359		strscpy(dev->mdev.bus_info, "platform:vim2m",
  1360			sizeof(dev->mdev.bus_info));
  1361		media_device_init(&dev->mdev);
  1362		dev->mdev.ops = &m2m_media_ops;
  1363		dev->v4l2_dev.mdev = &dev->mdev;
  1364	
  1365		ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
  1366							 MEDIA_ENT_F_PROC_VIDEO_SCALER);
  1367		if (ret) {
  1368			v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
  1369			goto error_v4l2;
  1370		}
  1371	
  1372		ret = media_device_register(&dev->mdev);
  1373		if (ret) {
  1374			v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
  1375			goto error_m2m_mc;
  1376		}
  1377	#endif
  1378		return 0;
  1379	
  1380	#ifdef CONFIG_MEDIA_CONTROLLER
  1381	error_m2m_mc:
  1382		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
  1383	#endif
> 1384	error_v4l2:
  1385		video_unregister_device(&dev->vfd);
  1386		/* vim2m_device_release called by video_unregister_device to release various objects */
  1387		return ret;
  1388	error_m2m:
  1389		v4l2_m2m_release(dev->m2m_dev);
  1390	error_dev:
  1391		v4l2_device_unregister(&dev->v4l2_dev);
  1392	error_free:
  1393		kfree(dev);
  1394	
  1395		return ret;
  1396	}
  1397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
