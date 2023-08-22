Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883501C2BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692714904; x=1724250904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3ltBQxaEPzsPcXivK4BssS5ZvsvuWRKs23jYUsjDA8=;
  b=KwAd/NSj0XmE8YGOuwexuVQmxEp9Ic6j/O5Onx352W8CfKSwiEt18dr6
   hP5dQFr54Bqn9pNvGFWrmdba+gUzBOKLV++fY3VyAwB5ucIcy1jtFbcRA
   1mrIkiacaKRYJ8+uV73nqj8djTRoU37K3lFA/E7qtT6nNQQ6fVGmEbssY
   exDrrZR8b2v7MdnVN1e9IVsz5DS8/oci+XUajx9Y3abBNE+hDxIt/eHd+
   AqXVihoNgYCRRswm3wmYcdf08VV7GypT+G36OJxRJFxS3SsdLj+E1fl+n
   QBWdhYFs8Sse/PZ6WwoD7SFJmvoXB8ECLrUkvsYhmkM4eE7xfoOszxwcV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373877789"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="373877789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 07:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910098846"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="910098846"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 07:35:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYSTD-0000FY-2x;
	Tue, 22 Aug 2023 14:34:59 +0000
Date: Tue, 22 Aug 2023 22:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [stable:linux-5.4.y 3701/9456]
 drivers/media/platform/vim2m.c:1384:1: warning: label 'error_v4l2' defined
 but not used
Message-ID: <202308222215.x2keYOEO-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   fd2a1d1f32ea37c57a8b46a0857f06fd7274dd2c
commit: b7248281afb165ebd2f64dfd5ef4de3c5cc2a81f [3701/9456] media: vim2m: Register video device after setting up internals
config: s390-randconfig-r016-20230822 (https://download.01.org/0day-ci/archive/20230822/202308222215.x2keYOEO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222215.x2keYOEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222215.x2keYOEO-lkp@intel.com/

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
