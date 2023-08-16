Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7215AEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692200648; x=1723736648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4IQO2w+5btV52oz61O2yUewxdfCeTFdOYVPBTHTeFzk=;
  b=YCmS+NRFYU7cK0ENnrN03JcsuopdubWqnKpm46x0gikV1pm2oITOhi7o
   8GM9ZKlu/EUDBztazhoGQRrt0bhGunRRcaS+n2OKyUpkxWG7ZL+s+1uKx
   UOHpsdjROi4KlDx12J7oTgvCZVKu/RksLRrh7P4ATSp8C37+NF0hL7kpF
   0xgm9GQMAk8XqBjZul8cOI7k/UGY6gs72EzTVBYJwRxXS90cBEkSiU/cx
   Wk7FRn6d6DEcZN8TwFkLt2aMg/PhzZVXIwnb4AQdbgSt88qP15sBg4Dn2
   tS8e7EUTR4s33Dt2dN6oJEp4x2BB9oMIAyHBKgtaWQIU2pXhYO/29dyjs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436467856"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="436467856"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 08:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684112585"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="684112585"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Aug 2023 08:44:06 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWIgk-0000PJ-2O;
	Wed, 16 Aug 2023 15:44:03 +0000
Date: Wed, 16 Aug 2023 23:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 9401/30000]
 drivers/media/dvb-core/dvb_frontend.c:2701:1: warning: the frame size of
 1040 bytes is larger than 1024 bytes
Message-ID: <202308162327.Sm8aUpI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: 8e89bf80ce8d8780bd3db165a50fa5b5bca5875c [9401/30000] ANDROID: fix allmodconfig build
config: i386-buildonly-randconfig-r006-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162327.Sm8aUpI8-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162327.Sm8aUpI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162327.Sm8aUpI8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/dvb-core/dvb_frontend.c: In function 'dvb_frontend_handle_ioctl':
>> drivers/media/dvb-core/dvb_frontend.c:2701:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    }
    ^


vim +2701 drivers/media/dvb-core/dvb_frontend.c

9682cea27e9ce7 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2325  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2326  static int dvb_frontend_handle_ioctl(struct file *file,
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2327  				     unsigned int cmd, void *parg)
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2328  {
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2329  	struct dvb_device *dvbdev = file->private_data;
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2330  	struct dvb_frontend *fe = dvbdev->priv;
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2331  	struct dvb_frontend_private *fepriv = fe->frontend_priv;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2332  	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
330dada5957e3c drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-12-12  2333  	int i, err = -ENOTSUPP;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2334  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2335  	dev_dbg(fe->dvb->device, "%s:\n", __func__);
13c97bf56724b4 drivers/media/dvb/dvb-core/dvb_frontend.c Steven Toth           2008-09-04  2336  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2337  	switch (cmd) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2338  	case FE_SET_PROPERTY: {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2339  		struct dtv_properties *tvps = parg;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2340  		struct dtv_property *tvp = NULL;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2341  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2342  		dev_dbg(fe->dvb->device, "%s: properties.num = %d\n",
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2343  			__func__, tvps->num);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2344  		dev_dbg(fe->dvb->device, "%s: properties.props = %p\n",
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2345  			__func__, tvps->props);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2346  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2347  		/*
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2348  		 * Put an arbitrary limit on the number of messages that can
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2349  		 * be sent at once
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2350  		 */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2351  		if (!tvps->num || (tvps->num > DTV_IOCTL_MAX_MSGS))
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2352  			return -EINVAL;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2353  
f44d6107f87936 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-03-22  2354  		tvp = memdup_user((void __user *)tvps->props, tvps->num * sizeof(*tvp));
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2355  		if (IS_ERR(tvp))
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2356  			return PTR_ERR(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2357  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2358  		for (i = 0; i < tvps->num; i++) {
c4303473b3a931 drivers/media/dvb-core/dvb_frontend.c     Satendra Singh Thakur 2017-09-20  2359  			err = dtv_property_process_set(fe, file,
c4303473b3a931 drivers/media/dvb-core/dvb_frontend.c     Satendra Singh Thakur 2017-09-20  2360  						       (tvp + i)->cmd,
c4303473b3a931 drivers/media/dvb-core/dvb_frontend.c     Satendra Singh Thakur 2017-09-20  2361  						       (tvp + i)->u.data);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2362  			if (err < 0) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2363  				kfree(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2364  				return err;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2365  			}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2366  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2367  		kfree(tvp);
a9cb97c3e62890 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-11-01  2368  		err = 0;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2369  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2370  	}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2371  	case FE_GET_PROPERTY: {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2372  		struct dtv_properties *tvps = parg;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2373  		struct dtv_property *tvp = NULL;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2374  		struct dtv_frontend_properties getp = fe->dtv_property_cache;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2375  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2376  		dev_dbg(fe->dvb->device, "%s: properties.num = %d\n",
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2377  			__func__, tvps->num);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2378  		dev_dbg(fe->dvb->device, "%s: properties.props = %p\n",
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2379  			__func__, tvps->props);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2380  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2381  		/*
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2382  		 * Put an arbitrary limit on the number of messages that can
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2383  		 * be sent at once
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2384  		 */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2385  		if (!tvps->num || (tvps->num > DTV_IOCTL_MAX_MSGS))
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2386  			return -EINVAL;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2387  
f44d6107f87936 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-03-22  2388  		tvp = memdup_user((void __user *)tvps->props, tvps->num * sizeof(*tvp));
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2389  		if (IS_ERR(tvp))
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2390  			return PTR_ERR(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2391  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2392  		/*
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2393  		 * Let's use our own copy of property cache, in order to
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2394  		 * avoid mangling with DTV zigzag logic, as drivers might
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2395  		 * return crap, if they don't check if the data is available
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2396  		 * before updating the properties cache.
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2397  		 */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2398  		if (fepriv->state != FESTATE_IDLE) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2399  			err = dtv_get_frontend(fe, &getp, NULL);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2400  			if (err < 0) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2401  				kfree(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2402  				return err;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2403  			}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2404  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2405  		for (i = 0; i < tvps->num; i++) {
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2406  			err = dtv_property_process_get(fe, &getp,
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2407  						       tvp + i, file);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2408  			if (err < 0) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2409  				kfree(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2410  				return err;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2411  			}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2412  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2413  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2414  		if (copy_to_user((void __user *)tvps->props, tvp,
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2415  				 tvps->num * sizeof(struct dtv_property))) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2416  			kfree(tvp);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2417  			return -EFAULT;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2418  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2419  		kfree(tvp);
a9cb97c3e62890 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-11-01  2420  		err = 0;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2421  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2422  	}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2423  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2424  	case FE_GET_INFO: {
0c53c70f6afa2d drivers/media/dvb/dvb-core/dvb_frontend.c Johannes Stezenbach   2005-05-16  2425  		struct dvb_frontend_info *info = parg;
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2426  		memset(info, 0, sizeof(*info));
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2427  
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2428  		strcpy(info->name, fe->ops.info.name);
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2429  		info->symbol_rate_min = fe->ops.info.symbol_rate_min;
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2430  		info->symbol_rate_max = fe->ops.info.symbol_rate_max;
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2431  		info->symbol_rate_tolerance = fe->ops.info.symbol_rate_tolerance;
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2432  		info->caps = fe->ops.info.caps;
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2433  		info->frequency_stepsize = dvb_frontend_get_stepsize(fe);
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2434  		dvb_frontend_get_frequency_limits(fe, &info->frequency_min,
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2435  						  &info->frequency_max,
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2436  						  &info->frequency_tolerance);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2437  
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2438  		/*
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2439  		 * Associate the 4 delivery systems supported by DVBv3
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2440  		 * API with their DVBv5 counterpart. For the other standards,
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2441  		 * use the closest type, assuming that it would hopefully
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2442  		 * work with a DVBv3 application.
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2443  		 * It should be noticed that, on multi-frontend devices with
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2444  		 * different types (terrestrial and cable, for example),
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2445  		 * a pure DVBv3 application won't be able to use all delivery
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2446  		 * systems. Yet, changing the DVBv5 cache to the other delivery
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2447  		 * system should be enough for making it work.
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2448  		 */
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2449  		switch (dvbv3_type(c->delivery_system)) {
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2450  		case DVBV3_QPSK:
9474c5e63f61d0 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-05  2451  			info->type = FE_QPSK;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2452  			break;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2453  		case DVBV3_ATSC:
9474c5e63f61d0 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-05  2454  			info->type = FE_ATSC;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2455  			break;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2456  		case DVBV3_QAM:
9474c5e63f61d0 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-05  2457  			info->type = FE_QAM;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2458  			break;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2459  		case DVBV3_OFDM:
9474c5e63f61d0 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-05  2460  			info->type = FE_OFDM;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2461  			break;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2462  		default:
36bdbc3fff09bc drivers/media/dvb-core/dvb_frontend.c     Antti Palosaari       2012-08-15  2463  			dev_err(fe->dvb->device,
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2464  				"%s: doesn't know how to handle a DVBv3 call to delivery system %i\n",
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2465  				__func__, c->delivery_system);
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2466  			info->type = FE_OFDM;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2467  		}
36bdbc3fff09bc drivers/media/dvb-core/dvb_frontend.c     Antti Palosaari       2012-08-15  2468  		dev_dbg(fe->dvb->device, "%s: current delivery system on cache: %d, V3 type: %d\n",
f1b1eabff0eb3f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-07-05  2469  			__func__, c->delivery_system, info->type);
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2470  
c9d57de6103e34 drivers/media/dvb-core/dvb_frontend.c     Malcolm Priestley     2015-08-31  2471  		/* Set CAN_INVERSION_AUTO bit on in other than oneshot mode */
c9d57de6103e34 drivers/media/dvb-core/dvb_frontend.c     Malcolm Priestley     2015-08-31  2472  		if (!(fepriv->tune_mode_flags & FE_TUNE_MODE_ONESHOT))
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2473  			info->caps |= FE_CAN_INVERSION_AUTO;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2474  		err = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2475  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2476  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2477  
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2478  	case FE_READ_STATUS: {
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2479  		enum fe_status *status = parg;
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2480  
25985edcedea63 drivers/media/dvb/dvb-core/dvb_frontend.c Lucas De Marchi       2011-03-30  2481  		/* if retune was requested but hasn't occurred yet, prevent
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2482  		 * that user get signal state from previous tuning */
01886255ddf440 drivers/media/dvb/dvb-core/dvb_frontend.c Janne Grunau          2009-09-01  2483  		if (fepriv->state == FESTATE_RETUNE ||
01886255ddf440 drivers/media/dvb/dvb-core/dvb_frontend.c Janne Grunau          2009-09-01  2484  		    fepriv->state == FESTATE_ERROR) {
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2485  			err = 0;
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2486  			*status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2487  			break;
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2488  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2489  
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2490  		if (fe->ops.read_status)
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2491  			err = fe->ops.read_status(fe, status);
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2492  		break;
6757ccc57d2cc4 drivers/media/dvb/dvb-core/dvb_frontend.c Peter Beutner         2005-07-07  2493  	}
48caa6f12902df drivers/media/dvb-core/dvb_frontend.c     Antti Palosaari       2012-08-09  2494  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2495  	case FE_DISEQC_RESET_OVERLOAD:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2496  		if (fe->ops.diseqc_reset_overload) {
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2497  			err = fe->ops.diseqc_reset_overload(fe);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2498  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2499  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2500  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2501  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2502  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2503  	case FE_DISEQC_SEND_MASTER_CMD:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2504  		if (fe->ops.diseqc_send_master_cmd) {
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2505  			struct dvb_diseqc_master_cmd *cmd = parg;
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2506  
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2507  			if (cmd->msg_len > sizeof(cmd->msg)) {
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2508  				err = -EINVAL;
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2509  				break;
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2510  			}
8d7e506350a3ff drivers/media/dvb-core/dvb_frontend.c     Dan Carpenter         2015-06-06  2511  			err = fe->ops.diseqc_send_master_cmd(fe, cmd);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2512  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2513  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2514  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2515  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2516  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2517  	case FE_DISEQC_SEND_BURST:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2518  		if (fe->ops.diseqc_send_burst) {
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2519  			err = fe->ops.diseqc_send_burst(fe,
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2520  						(enum fe_sec_mini_cmd)parg);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2521  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2522  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2523  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2524  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2525  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2526  	case FE_SET_TONE:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2527  		if (fe->ops.set_tone) {
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2528  			err = fe->ops.set_tone(fe,
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2529  					       (enum fe_sec_tone_mode)parg);
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2530  			fepriv->tone = (enum fe_sec_tone_mode)parg;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2531  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2532  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2533  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2534  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2535  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2536  	case FE_SET_VOLTAGE:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2537  		if (fe->ops.set_voltage) {
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2538  			err = fe->ops.set_voltage(fe,
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2539  						  (enum fe_sec_voltage)parg);
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2540  			fepriv->voltage = (enum fe_sec_voltage)parg;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2541  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2542  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2543  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2544  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2545  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2546  	case FE_DISEQC_RECV_SLAVE_REPLY:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2547  		if (fe->ops.diseqc_recv_slave_reply)
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2548  			err = fe->ops.diseqc_recv_slave_reply(fe, parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2549  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2550  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2551  	case FE_ENABLE_HIGH_LNB_VOLTAGE:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2552  		if (fe->ops.enable_high_lnb_voltage)
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2553  			err = fe->ops.enable_high_lnb_voltage(fe, (long)parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2554  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2555  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2556  	case FE_SET_FRONTEND_TUNE_MODE:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2557  		fepriv->tune_mode_flags = (unsigned long)parg;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2558  		err = 0;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2559  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2560  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2561  	/* DEPRECATED dish control ioctls */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2562  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2563  	case FE_DISHNETWORK_SEND_LEGACY_CMD:
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2564  		if (fe->ops.dishnetwork_send_legacy_command) {
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2565  			err = fe->ops.dishnetwork_send_legacy_command(fe,
0df289a209e02f drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2015-06-07  2566  							 (unsigned long)parg);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2567  			fepriv->state = FESTATE_DISEQC;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2568  			fepriv->status = 0;
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2569  		} else if (fe->ops.set_voltage) {
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2570  			/*
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2571  			 * NOTE: This is a fallback condition.  Some frontends
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2572  			 * (stv0299 for instance) take longer than 8msec to
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2573  			 * respond to a set_voltage command.  Those switches
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2574  			 * need custom routines to switch properly.  For all
2030c0325aa3d4 drivers/media/dvb/dvb-core/dvb_frontend.c Guillaume Audirac     2010-05-06  2575  			 * other frontends, the following should work ok.
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2576  			 * Dish network legacy switches (as used by Dish500)
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2577  			 * are controlled by sending 9-bit command words
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2578  			 * spaced 8msec apart.
25985edcedea63 drivers/media/dvb/dvb-core/dvb_frontend.c Lucas De Marchi       2011-03-30  2579  			 * the actual command word is switch/port dependent
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2580  			 * so it is up to the userspace application to send
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2581  			 * the right command.
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2582  			 * The command must always start with a '0' after
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2583  			 * initialization, so parg is 8 bits and does not
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2584  			 * include the initialization or start bit
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2585  			 */
c6eb8eafdba4ad drivers/media/dvb/dvb-core/dvb_frontend.c Hans Verkuil          2008-09-03  2586  			unsigned long swcmd = ((unsigned long)parg) << 1;
9056a23ba19d91 drivers/media/dvb-core/dvb_frontend.c     Tina Ruchandani       2015-05-31  2587  			ktime_t nexttime;
9056a23ba19d91 drivers/media/dvb-core/dvb_frontend.c     Tina Ruchandani       2015-05-31  2588  			ktime_t tv[10];
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2589  			int i;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2590  			u8 last = 1;
09c2cc98cd5761 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2018-05-11  2591  
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2592  			if (dvb_frontend_debug)
b3ad24d2e0b039 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-10-13  2593  				dprintk("%s switch command: 0x%04lx\n",
b3ad24d2e0b039 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-10-13  2594  					__func__, swcmd);
6b3f99989eb73e drivers/media/dvb-core/dvb_frontend.c     Abhilash Jindal       2016-01-31  2595  			nexttime = ktime_get_boottime();
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2596  			if (dvb_frontend_debug)
b9b1b3a8f7b760 drivers/media/dvb-core/dvb_frontend.c     Ezequiel Garcia       2012-10-23  2597  				tv[0] = nexttime;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2598  			/* before sending a command, initialize by sending
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2599  			 * a 32ms 18V to the switch
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2600  			 */
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2601  			fe->ops.set_voltage(fe, SEC_VOLTAGE_18);
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2602  			dvb_frontend_sleep_until(&nexttime, 32000);
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2603  
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2604  			for (i = 0; i < 9; i++) {
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2605  				if (dvb_frontend_debug)
6b3f99989eb73e drivers/media/dvb-core/dvb_frontend.c     Abhilash Jindal       2016-01-31  2606  					tv[i + 1] = ktime_get_boottime();
c6eb8eafdba4ad drivers/media/dvb/dvb-core/dvb_frontend.c Hans Verkuil          2008-09-03  2607  				if ((swcmd & 0x01) != last) {
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2608  					/* set voltage to (last ? 13V : 18V) */
dea74869f3c62b drivers/media/dvb/dvb-core/dvb_frontend.c Patrick Boettcher     2006-05-14  2609  					fe->ops.set_voltage(fe, (last) ? SEC_VOLTAGE_13 : SEC_VOLTAGE_18);
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2610  					last = (last) ? 0 : 1;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2611  				}
c6eb8eafdba4ad drivers/media/dvb/dvb-core/dvb_frontend.c Hans Verkuil          2008-09-03  2612  				swcmd = swcmd >> 1;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2613  				if (i != 8)
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2614  					dvb_frontend_sleep_until(&nexttime, 8000);
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2615  			}
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2616  			if (dvb_frontend_debug) {
b3ad24d2e0b039 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-10-13  2617  				dprintk("%s(%d): switch delay (should be 32k followed by all 8k)\n",
46b4f7c176a2dd drivers/media/dvb/dvb-core/dvb_frontend.c Harvey Harrison       2008-04-08  2618  					__func__, fe->dvb->num);
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2619  				for (i = 1; i < 10; i++)
b3ad24d2e0b039 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-10-13  2620  					pr_info("%d: %d\n", i,
9056a23ba19d91 drivers/media/dvb-core/dvb_frontend.c     Tina Ruchandani       2015-05-31  2621  						(int)ktime_us_delta(tv[i], tv[i - 1]));
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2622  			}
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2623  			err = 0;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2624  			fepriv->state = FESTATE_DISEQC;
83b75b049be981 drivers/media/dvb/dvb-core/dvb_frontend.c NooneImportant        2005-11-08  2625  			fepriv->status = 0;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2626  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2627  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2628  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2629  	/* DEPRECATED statistics ioctls */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2630  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2631  	case FE_READ_BER:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2632  		if (fe->ops.read_ber) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2633  			if (fepriv->thread)
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2634  				err = fe->ops.read_ber(fe, parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2635  			else
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2636  				err = -EAGAIN;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2637  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2638  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2639  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2640  	case FE_READ_SIGNAL_STRENGTH:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2641  		if (fe->ops.read_signal_strength) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2642  			if (fepriv->thread)
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2643  				err = fe->ops.read_signal_strength(fe, parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2644  			else
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2645  				err = -EAGAIN;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2646  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2647  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2648  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2649  	case FE_READ_SNR:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2650  		if (fe->ops.read_snr) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2651  			if (fepriv->thread)
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2652  				err = fe->ops.read_snr(fe, parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2653  			else
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2654  				err = -EAGAIN;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2655  		}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2656  		break;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2657  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2658  	case FE_READ_UNCORRECTED_BLOCKS:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2659  		if (fe->ops.read_ucblocks) {
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2660  			if (fepriv->thread)
01153bf04db18d drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-10-11  2661  				err = fe->ops.read_ucblocks(fe, parg);
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2662  			else
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2663  				err = -EAGAIN;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2664  		}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2665  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2666  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2667  	/* DEPRECATED DVBv3 ioctls */
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2668  
9682cea27e9ce7 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2669  	case FE_SET_FRONTEND:
be431b16c6bd22 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2013-03-18  2670  		err = dvbv3_set_delivery_system(fe);
04be0f76a8d0ea drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2671  		if (err)
04be0f76a8d0ea drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2672  			break;
04be0f76a8d0ea drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2673  
e399ce77e6e8f0 drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2674  		err = dtv_property_cache_sync(fe, c, parg);
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2675  		if (err)
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2676  			break;
5bfaaddef8d46c drivers/media/dvb/dvb-core/dvb_frontend.c Mauro Carvalho Chehab 2012-01-01  2677  		err = dtv_set_frontend(fe);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2678  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2679  	case FE_GET_EVENT:
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2680  		err = dvb_frontend_get_event(fe, parg, file->f_flags);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2681  		break;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2682  
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2683  	case FE_GET_FRONTEND: {
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2684  		struct dtv_frontend_properties getp = fe->dtv_property_cache;
36cb557a2f6451 drivers/media/dvb/dvb-core/dvb_frontend.c Andrew de Quincey     2006-01-09  2685  
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2686  		/*
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2687  		 * Let's use our own copy of property cache, in order to
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2688  		 * avoid mangling with DTV zigzag logic, as drivers might
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2689  		 * return crap, if they don't check if the data is available
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2690  		 * before updating the properties cache.
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2691  		 */
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2692  		err = dtv_get_frontend(fe, &getp, parg);
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2693  		break;
bb31d2381c7304 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2016-02-04  2694  	}
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2695  
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2696  	default:
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2697  		return -ENOTSUPP;
d73dcf0cdb95a4 drivers/media/dvb-core/dvb_frontend.c     Mauro Carvalho Chehab 2017-09-18  2698  	} /* switch */
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2699  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2700  	return err;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16 @2701  }
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_frontend.c Linus Torvalds        2005-04-16  2702  

:::::: The code at line 2701 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
