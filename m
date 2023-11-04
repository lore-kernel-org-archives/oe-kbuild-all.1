Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B2C6AA2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hq+4YuME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699076414; x=1730612414;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IkP3GggjRW7T+oRHDtpZVdRIOlPI1g5ZaO+RNXqc/4w=;
  b=hq+4YuMEY2/Mptw4HClBKIhvS99S8XYfuMyJvO+cYjDEGaPm2oWY0Qr1
   fJGMmKQVYyhBQf79Oj7MDoORcOGb5yEU/LujN1TsGptI0JL0SfRPwo7dG
   MeL4WA15JzA3HcKhhN9Ge/RxVK7omxUcbVak8ItylX1x/eObGwKZZ69Vy
   0abK+AG49Y2uK2/TFeNrItcoMa8oRan+KxxWi8TJvhxdgg8GDpvESStNZ
   HNP1oeqkfH6PHwuSB3N2BRUhaZ4ABgVSBKeemyW7TaFCCHneE5UHGgOLY
   A0RPYn8g/NfxoL+ptHLUVASGhPT5swY6bQKnYw7UrPRCfOoTExrmx6ims
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="379455907"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="379455907"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796820342"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="796820342"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Nov 2023 22:40:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz9OD-0003VU-1p;
	Sat, 04 Nov 2023 05:40:09 +0000
Date: Sat, 4 Nov 2023 13:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/8] vhost: Add 3 new uapi to support iommufd
Message-ID: <202311041343.cTi89BKg-lkp@intel.com>
References: <20231103171641.1703146-4-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103171641.1703146-4-lulu@redhat.com>

Hi Cindy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6]
[cannot apply to mst-vhost/linux-next joro-iommu/next next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-iommufd-Add-the-functions-support-iommufd/20231104-011948
base:   linus/master
patch link:    https://lore.kernel.org/r/20231103171641.1703146-4-lulu%40redhat.com
patch subject: [RFC v1 3/8] vhost: Add 3 new uapi to support iommufd
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041343.cTi89BKg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041343.cTi89BKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041343.cTi89BKg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vhost/vdpa.c: In function 'vhost_vdpa_iommufd_set_device':
   drivers/vhost/vdpa.c:584:26: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
     584 |                 if (!vdpa->iommufd_ictx || !vdpa->iommufd_device)
         |                          ^~
   drivers/vhost/vdpa.c:584:49: error: 'struct vdpa_device' has no member named 'iommufd_device'
     584 |                 if (!vdpa->iommufd_ictx || !vdpa->iommufd_device)
         |                                                 ^~
   drivers/vhost/vdpa.c:586:38: error: 'struct vdpa_device' has no member named 'iommufd_users'
     586 |                 if (atomic_read(&vdpa->iommufd_users)) {
         |                                      ^~
   drivers/vhost/vdpa.c:587:41: error: 'struct vdpa_device' has no member named 'iommufd_users'
     587 |                         atomic_dec(&vdpa->iommufd_users);
         |                                         ^~
   drivers/vhost/vdpa.c:591:21: error: 'struct vdpa_device' has no member named 'iommufd_device'
     591 |                 vdpa->iommufd_device = NULL;
         |                     ^~
   drivers/vhost/vdpa.c:592:21: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
     592 |                 vdpa->iommufd_ictx = NULL;
         |                     ^~
   drivers/vhost/vdpa.c:597:17: error: 'struct vdpa_device' has no member named 'iommufd_device'
     597 |         if (vdpa->iommufd_device)
         |                 ^~
   drivers/vhost/vdpa.c:628:13: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
     628 |         vdpa->iommufd_ictx = ictx;
         |             ^~
   drivers/vhost/vdpa.c:631:25: error: 'struct vdpa_device' has no member named 'iommufd_users'
     631 |         atomic_inc(&vdpa->iommufd_users);
         |                         ^~
   drivers/vhost/vdpa.c: At top level:
>> drivers/vhost/vdpa.c:647:5: warning: no previous prototype for 'vhost_vdpa_iommufd_ioas_attach' [-Wmissing-prototypes]
     647 | int vhost_vdpa_iommufd_ioas_attach(struct vhost_vdpa *v, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_iommufd_ioas_attach':
   drivers/vhost/vdpa.c:661:29: error: 'const struct vdpa_config_ops' has no member named 'bind_iommufd'
     661 |         if (!v->vdpa->config->bind_iommufd)
         |                             ^~
   drivers/vhost/vdpa.c:664:21: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
     664 |         if (!v->vdpa->iommufd_ictx) {
         |                     ^~
   drivers/vhost/vdpa.c:669:30: error: 'const struct vdpa_config_ops' has no member named 'attach_ioas'
     669 |         ret = v->vdpa->config->attach_ioas(v->vdpa, &attach.ioas_id);
         |                              ^~
   drivers/vhost/vdpa.c: At top level:
>> drivers/vhost/vdpa.c:688:5: warning: no previous prototype for 'vhost_vdpa_iommufd_ioas_detach' [-Wmissing-prototypes]
     688 | int vhost_vdpa_iommufd_ioas_detach(struct vhost_vdpa *v, void __user *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_iommufd_ioas_detach':
   drivers/vhost/vdpa.c:701:29: error: 'const struct vdpa_config_ops' has no member named 'bind_iommufd'
     701 |         if (!v->vdpa->config->bind_iommufd)
         |                             ^~
   drivers/vhost/vdpa.c:704:20: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
     704 |         if (v->vdpa->iommufd_ictx) {
         |                    ^~
   drivers/vhost/vdpa.c:707:31: error: 'const struct vdpa_config_ops' has no member named 'detach_ioas'
     707 |         return v->vdpa->config->detach_ioas(v->vdpa);
         |                               ^~
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_map':
   drivers/vhost/vdpa.c:1066:25: error: 'struct vdpa_device' has no member named 'iommufd_ictx'
    1066 |         } else if (!vdpa->iommufd_ictx) {
         |                         ^~
   drivers/vhost/vdpa.c: In function 'vhost_vdpa_iommufd_ioas_detach':
   drivers/vhost/vdpa.c:708:1: warning: control reaches end of non-void function [-Wreturn-type]
     708 | }
         | ^


vim +/vhost_vdpa_iommufd_ioas_attach +647 drivers/vhost/vdpa.c

   550	
   551	/* After a successful return of ioctl the device must not process more
   552	 * virtqueue descriptors. The device can answer to read or writes of config
   553	 * fields as if it were not suspended. In particular, writing to "queue_enable"
   554	 * with a value of 1 will not make the device start processing buffers.
   555	 */
   556	static long vhost_vdpa_suspend(struct vhost_vdpa *v)
   557	{
   558		struct vdpa_device *vdpa = v->vdpa;
   559		const struct vdpa_config_ops *ops = vdpa->config;
   560	
   561		if (!ops->suspend)
   562			return -EOPNOTSUPP;
   563	
   564		return ops->suspend(vdpa);
   565	}
   566	static long vhost_vdpa_iommufd_set_device(struct vhost_vdpa *v,
   567						  void __user *argp)
   568	{
   569		struct device *dma_dev = vdpa_get_dma_dev(v->vdpa);
   570		struct vhost_vdpa_set_iommufd set_iommufd;
   571		struct vdpa_device *vdpa = v->vdpa;
   572		struct iommufd_ctx *ictx;
   573		unsigned long minsz;
   574		u32 ioas_id, dev_id;
   575		struct fd f;
   576		long r = 0;
   577	
   578		minsz = offsetofend(struct vhost_vdpa_set_iommufd, iommufd_ioasid);
   579		if (copy_from_user(&set_iommufd, argp, minsz))
   580			return -EFAULT;
   581	
   582		/* Unset IOMMUFD */
   583		if (set_iommufd.iommufd < 0) {
   584			if (!vdpa->iommufd_ictx || !vdpa->iommufd_device)
   585				return -EINVAL;
   586			if (atomic_read(&vdpa->iommufd_users)) {
   587				atomic_dec(&vdpa->iommufd_users);
   588				return 0;
   589			}
   590			vdpa_iommufd_unbind(v->vdpa);
   591			vdpa->iommufd_device = NULL;
   592			vdpa->iommufd_ictx = NULL;
   593			return iommu_attach_device(v->domain, dma_dev);
   594		}
   595	
   596		/* For same device but different groups, ++refcount only */
   597		if (vdpa->iommufd_device)
   598			goto out_inc;
   599	
   600		r = -EBADF;
   601		f = fdget(set_iommufd.iommufd);
   602		if (!f.file)
   603			goto out;
   604	
   605		r = -EINVAL;
   606		ictx = iommufd_ctx_from_file(f.file);
   607		if (IS_ERR(ictx))
   608			goto out_fdput;
   609	
   610		if (v->domain) {
   611			iommu_device_unuse_default_domain(dma_dev);
   612			iommu_detach_device(v->domain, dma_dev);
   613		}
   614	
   615		ioas_id = set_iommufd.iommufd_ioasid;
   616		r = vdpa_iommufd_bind(vdpa, ictx, &ioas_id, &dev_id);
   617		if (r)
   618			goto out_reattach;
   619	
   620		set_iommufd.out_dev_id = dev_id;
   621		r = copy_to_user(argp + minsz, &set_iommufd.out_dev_id,
   622				 sizeof(set_iommufd.out_dev_id)) ?
   623			    -EFAULT :
   624			    0;
   625		if (r)
   626			goto out_device_unbind;
   627	
 > 628		vdpa->iommufd_ictx = ictx;
   629	
   630	out_inc:
   631		atomic_inc(&vdpa->iommufd_users);
   632	
   633		goto out_fdput;
   634	
   635	out_device_unbind:
   636	
   637		vdpa_iommufd_unbind(vdpa);
   638	out_reattach:
   639		iommu_device_use_default_domain(dma_dev);
   640		iommu_attach_device(v->domain, dma_dev);
   641		iommufd_ctx_put(ictx);
   642	out_fdput:
   643		fdput(f);
   644	out:
   645		return r;
   646	}
 > 647	int vhost_vdpa_iommufd_ioas_attach(struct vhost_vdpa *v, void __user *arg)
   648	{
   649		struct vdpa_device_attach_iommufd_as attach;
   650		unsigned long minsz;
   651		int ret;
   652	
   653		minsz = offsetofend(struct vdpa_device_attach_iommufd_as, ioas_id);
   654	
   655		if (copy_from_user(&attach, (void __user *)arg, minsz))
   656			return -EFAULT;
   657	
   658		if (attach.argsz < minsz || attach.flags)
   659			return -EINVAL;
   660	
   661		if (!v->vdpa->config->bind_iommufd)
   662			return -ENODEV;
   663	
 > 664		if (!v->vdpa->iommufd_ictx) {
   665			ret = -EINVAL;
   666			return ret;
   667		}
   668	
   669		ret = v->vdpa->config->attach_ioas(v->vdpa, &attach.ioas_id);
   670	
   671		if (ret)
   672			return ret;
   673	
   674		ret = copy_to_user(
   675			      (void __user *)arg +
   676				      offsetofend(struct vdpa_device_attach_iommufd_as,
   677						  flags),
   678			      &attach.ioas_id, sizeof(attach.ioas_id)) ?
   679			      -EFAULT :
   680			      0;
   681	
   682		if (ret)
   683			return ret;
   684	
   685		return 0;
   686	}
   687	
 > 688	int vhost_vdpa_iommufd_ioas_detach(struct vhost_vdpa *v, void __user *arg)
   689	{
   690		struct vdpa_device_detach_iommufd_as detach;
   691		unsigned long minsz;
   692	
   693		minsz = offsetofend(struct vdpa_device_detach_iommufd_as, flags);
   694	
   695		if (copy_from_user(&detach, (void __user *)arg, minsz))
   696			return -EFAULT;
   697	
   698		if (detach.argsz < minsz || detach.flags)
   699			return -EINVAL;
   700	
   701		if (!v->vdpa->config->bind_iommufd)
   702			return -ENODEV;
   703	
   704		if (v->vdpa->iommufd_ictx) {
   705			return -EINVAL;
   706		}
   707		return v->vdpa->config->detach_ioas(v->vdpa);
   708	}
   709	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
