Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DCFFC08
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 21:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731015277; cv=none; b=PtRC5LIk0LWXSh9nOWrey8eZs1QyKyrFeg9kKluo9RufJiGqSXZu2/FvR8SvHizlDsChOm1vIcqVEhlLC/7eC7BVAG+Hla7vTbWSySgjcbYBYFI4tHRj5u4sdO5Q09lHblrh2uUISwNbri7CLR6SmdslEWsPxD77oM1n8PXa1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731015277; c=relaxed/simple;
	bh=OAmYolTxHa/GIHWVjjw2c1QU9dASHnYQ0Kbd5IxUiPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfR0Q3P2QxHnJPKU1ag0RVNptNN+IIQ5LwjCELRPnSzLMsTR+JyC5s0/SiSBDReiLvxWpOs3XBI0KSnHiVsg5/SYrbBBB/zQGPY0v4rkn0c+qGpIkrrtX+ILP4lSzV6n1BverwAeoZimA/bf6cyM+HWQqraoznEZYKYY9Ry02yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II7JH7rz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II7JH7rz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731015276; x=1762551276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAmYolTxHa/GIHWVjjw2c1QU9dASHnYQ0Kbd5IxUiPs=;
  b=II7JH7rzqAvUGqWoMARlEJLkbKwoH5AofyF7rwlTVvjG326SKjHz8Bv+
   5qjJ4QWt89CY38iJ382FUifGNu+7nywgAXJD+d4c7/2dHKQmzNUs3deNl
   hzx3wgwWg6UQIvt3z4OvOgiSilv/R2LwfnQ9SJIH2UIhNjeC/mITYWtCX
   ypj1penkr0conOwhaNn2VMx2XN/s22S2Rzyj/MlRWm58gEZz2rtoKZDMx
   sd846pkWYV/jmUYtN/engk4mEnziffTQkMM9LOe7XOOUQA5U3NtL6SJK/
   1DONSKUrXmSQ2oc9GG2CWeECwbcBD+HHJTzyANqLxtIVhJqGPy+BMXjZM
   Q==;
X-CSE-ConnectionGUID: JfnMCWetQVyaNmkKvNtdfA==
X-CSE-MsgGUID: lIzScPGFT0yVF+s3LrwZEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31054874"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31054874"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 13:34:34 -0800
X-CSE-ConnectionGUID: vsaqzR6oRB+Vv03J4Ochtg==
X-CSE-MsgGUID: mQQzxnHGQaOoQB4EvY1m8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85428215"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2024 13:34:32 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9A98-000qgo-0E;
	Thu, 07 Nov 2024 21:34:30 +0000
Date: Fri, 8 Nov 2024 05:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Bilbao <cbilbao@digitalocean.com>
Cc: oe-kbuild-all@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: [linux-next:master 9473/10190]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202411080535.Xq60FSHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   74741a050b79d31d8d2eeee12c77736596d0a6b2
commit: 09e317f5d07e3fb5bc09674eb94e38e138fef4bf [9473/10190] vdpa/mlx5: Set speed and duplex of vDPA devices to UNKNOWN
config: i386-randconfig-061-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080535.Xq60FSHw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080535.Xq60FSHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080535.Xq60FSHw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] speed @@     got restricted __virtio32 @@
   drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse:     expected restricted __le32 [usertype] speed
   drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse:     got restricted __virtio32

vim +3910 drivers/vdpa/mlx5/net/mlx5_vnet.c

  3822	
  3823	static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
  3824				     const struct vdpa_dev_set_config *add_config)
  3825	{
  3826		struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
  3827		struct virtio_net_config *config;
  3828		struct mlx5_core_dev *pfmdev;
  3829		struct mlx5_vdpa_dev *mvdev;
  3830		struct mlx5_vdpa_net *ndev;
  3831		struct mlx5_core_dev *mdev;
  3832		u64 device_features;
  3833		u32 max_vqs;
  3834		u16 mtu;
  3835		int err;
  3836	
  3837		if (mgtdev->ndev)
  3838			return -ENOSPC;
  3839	
  3840		mdev = mgtdev->madev->mdev;
  3841		device_features = mgtdev->mgtdev.supported_features;
  3842		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
  3843			if (add_config->device_features & ~device_features) {
  3844				dev_warn(mdev->device,
  3845					 "The provisioned features 0x%llx are not supported by this device with features 0x%llx\n",
  3846					 add_config->device_features, device_features);
  3847				return -EINVAL;
  3848			}
  3849			device_features &= add_config->device_features;
  3850		} else {
  3851			device_features &= ~BIT_ULL(VIRTIO_NET_F_MRG_RXBUF);
  3852		}
  3853		if (!(device_features & BIT_ULL(VIRTIO_F_VERSION_1) &&
  3854		      device_features & BIT_ULL(VIRTIO_F_ACCESS_PLATFORM))) {
  3855			dev_warn(mdev->device,
  3856				 "Must provision minimum features 0x%llx for this device",
  3857				 BIT_ULL(VIRTIO_F_VERSION_1) | BIT_ULL(VIRTIO_F_ACCESS_PLATFORM));
  3858			return -EOPNOTSUPP;
  3859		}
  3860	
  3861		if (!(MLX5_CAP_DEV_VDPA_EMULATION(mdev, virtio_queue_type) &
  3862		    MLX5_VIRTIO_EMULATION_CAP_VIRTIO_QUEUE_TYPE_SPLIT)) {
  3863			dev_warn(mdev->device, "missing support for split virtqueues\n");
  3864			return -EOPNOTSUPP;
  3865		}
  3866	
  3867		max_vqs = min_t(int, MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues),
  3868				1 << MLX5_CAP_GEN(mdev, log_max_rqt_size));
  3869		if (max_vqs < 2) {
  3870			dev_warn(mdev->device,
  3871				 "%d virtqueues are supported. At least 2 are required\n",
  3872				 max_vqs);
  3873			return -EAGAIN;
  3874		}
  3875	
  3876		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP)) {
  3877			if (add_config->net.max_vq_pairs > max_vqs / 2)
  3878				return -EINVAL;
  3879			max_vqs = min_t(u32, max_vqs, 2 * add_config->net.max_vq_pairs);
  3880		} else {
  3881			max_vqs = 2;
  3882		}
  3883	
  3884		ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mgtdev->vdpa_ops,
  3885					 MLX5_VDPA_NUMVQ_GROUPS, MLX5_VDPA_NUM_AS, name, false);
  3886		if (IS_ERR(ndev))
  3887			return PTR_ERR(ndev);
  3888	
  3889		ndev->mvdev.max_vqs = max_vqs;
  3890		mvdev = &ndev->mvdev;
  3891		mvdev->mdev = mdev;
  3892	
  3893		ndev->vqs = kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
  3894		ndev->event_cbs = kcalloc(max_vqs + 1, sizeof(*ndev->event_cbs), GFP_KERNEL);
  3895		if (!ndev->vqs || !ndev->event_cbs) {
  3896			err = -ENOMEM;
  3897			goto err_alloc;
  3898		}
  3899		ndev->cur_num_vqs = MLX5V_DEFAULT_VQ_COUNT;
  3900	
  3901		mvqs_set_defaults(ndev);
  3902		allocate_irqs(ndev);
  3903		init_rwsem(&ndev->reslock);
  3904		config = &ndev->config;
  3905	
  3906		/*
  3907		 * mlx5_vdpa vDPA devices currently don't support reporting or
  3908		 * setting the speed or duplex.
  3909		 */
> 3910		config->speed  = cpu_to_mlx5vdpa32(mvdev, SPEED_UNKNOWN);
  3911		config->duplex = DUPLEX_UNKNOWN;
  3912	
  3913		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU)) {
  3914			err = config_func_mtu(mdev, add_config->net.mtu);
  3915			if (err)
  3916				goto err_alloc;
  3917		}
  3918	
  3919		if (device_features & BIT_ULL(VIRTIO_NET_F_MTU)) {
  3920			err = query_mtu(mdev, &mtu);
  3921			if (err)
  3922				goto err_alloc;
  3923	
  3924			ndev->config.mtu = cpu_to_mlx5vdpa16(mvdev, mtu);
  3925		}
  3926	
  3927		if (device_features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
  3928			if (get_link_state(mvdev))
  3929				ndev->config.status |= cpu_to_mlx5vdpa16(mvdev, VIRTIO_NET_S_LINK_UP);
  3930			else
  3931				ndev->config.status &= cpu_to_mlx5vdpa16(mvdev, ~VIRTIO_NET_S_LINK_UP);
  3932		}
  3933	
  3934		if (add_config->mask & (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR)) {
  3935			memcpy(ndev->config.mac, add_config->net.mac, ETH_ALEN);
  3936		/* No bother setting mac address in config if not going to provision _F_MAC */
  3937		} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0 ||
  3938			   device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
  3939			err = mlx5_query_nic_vport_mac_address(mdev, 0, 0, config->mac);
  3940			if (err)
  3941				goto err_alloc;
  3942		}
  3943	
  3944		if (!is_zero_ether_addr(config->mac)) {
  3945			pfmdev = pci_get_drvdata(pci_physfn(mdev->pdev));
  3946			err = mlx5_mpfs_add_mac(pfmdev, config->mac);
  3947			if (err)
  3948				goto err_alloc;
  3949		} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0) {
  3950			/*
  3951			 * We used to clear _F_MAC feature bit if seeing
  3952			 * zero mac address when device features are not
  3953			 * specifically provisioned. Keep the behaviour
  3954			 * so old scripts do not break.
  3955			 */
  3956			device_features &= ~BIT_ULL(VIRTIO_NET_F_MAC);
  3957		} else if (device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
  3958			/* Don't provision zero mac address for _F_MAC */
  3959			mlx5_vdpa_warn(&ndev->mvdev,
  3960				       "No mac address provisioned?\n");
  3961			err = -EINVAL;
  3962			goto err_alloc;
  3963		}
  3964	
  3965		if (device_features & BIT_ULL(VIRTIO_NET_F_MQ)) {
  3966			config->max_virtqueue_pairs = cpu_to_mlx5vdpa16(mvdev, max_vqs / 2);
  3967			ndev->rqt_size = max_vqs / 2;
  3968		} else {
  3969			ndev->rqt_size = 1;
  3970		}
  3971	
  3972		mlx5_cmd_init_async_ctx(mdev, &mvdev->async_ctx);
  3973	
  3974		ndev->mvdev.mlx_features = device_features;
  3975		mvdev->vdev.dma_dev = &mdev->pdev->dev;
  3976		err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
  3977		if (err)
  3978			goto err_alloc;
  3979	
  3980		err = mlx5_vdpa_init_mr_resources(mvdev);
  3981		if (err)
  3982			goto err_alloc;
  3983	
  3984		if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
  3985			err = mlx5_vdpa_create_dma_mr(mvdev);
  3986			if (err)
  3987				goto err_alloc;
  3988		}
  3989	
  3990		err = alloc_fixed_resources(ndev);
  3991		if (err)
  3992			goto err_alloc;
  3993	
  3994		ndev->cvq_ent.mvdev = mvdev;
  3995		INIT_WORK(&ndev->cvq_ent.work, mlx5_cvq_kick_handler);
  3996		mvdev->wq = create_singlethread_workqueue("mlx5_vdpa_wq");
  3997		if (!mvdev->wq) {
  3998			err = -ENOMEM;
  3999			goto err_alloc;
  4000		}
  4001	
  4002		mvdev->vdev.mdev = &mgtdev->mgtdev;
  4003		err = _vdpa_register_device(&mvdev->vdev, max_vqs + 1);
  4004		if (err)
  4005			goto err_reg;
  4006	
  4007		mgtdev->ndev = ndev;
  4008	
  4009		/* For virtio-vdpa, the device was set up during device register. */
  4010		if (ndev->setup)
  4011			return 0;
  4012	
  4013		down_write(&ndev->reslock);
  4014		err = setup_vq_resources(ndev, false);
  4015		up_write(&ndev->reslock);
  4016		if (err)
  4017			goto err_setup_vq_res;
  4018	
  4019		return 0;
  4020	
  4021	err_setup_vq_res:
  4022		_vdpa_unregister_device(&mvdev->vdev);
  4023	err_reg:
  4024		destroy_workqueue(mvdev->wq);
  4025	err_alloc:
  4026		put_device(&mvdev->vdev.dev);
  4027		return err;
  4028	}
  4029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
