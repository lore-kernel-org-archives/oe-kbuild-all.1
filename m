Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E71DBB0D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 21:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731015789; cv=none; b=D6Odp75dJFXzkxTaNFBWeUPwjRAtmRdoENvdMTxwpy2s82LJXIr9kDLkG6w52dNqNv0y2hil2VqZOgkeBwjiijv0KahPwT8g1Crz7E8/EQ/Y7o8kfsv/9Czl1xvQpgpd/HW/pmmC85/lEmp4ACy+G7xFXfC7AuZW2SJrSTN6vCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731015789; c=relaxed/simple;
	bh=R8rrQS1gF50oXHlYQE3JuQby/625baeA8L+QvnalpXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LAQdtgYymqzakFWWMwlmzrKc42WHa9Wwa8dzodJ3KuL+018tu1P/BjBJHDoz4B1X1e36NrBfWiun9oW6T1PlPgjjrPc10+tmM+89S1oyPskNIDfJHjUdOu2rLWmedGcbUzXkvDLy6OXgt7ZexIpLdNJ9ieg3AU7J6LOfkC3ONHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDSy8Jlc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDSy8Jlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731015786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YCBJYIc+gZaFqcH/kMhXnStnCvMEDdTjDagRSJEFPHk=;
	b=YDSy8JlcJkZ+4GkDPD7CC1qE5mpLaO3USZyPMWaY3US3qqMQCPXxF47fPae1bXFHo8ef+S
	+QmvjFGrc0v91MuufyaRH6AEhqQR4p9TktdLlfNmaKGrNDX1LYxrFAs+Q9/+nDGelgCNm9
	T1rEZb3fzc5eVTn8kLPIlPnKJls8YeY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-6DYzD3q3NJyeCwH4c336ow-1; Thu, 07 Nov 2024 16:43:05 -0500
X-MC-Unique: 6DYzD3q3NJyeCwH4c336ow-1
X-Mimecast-MFC-AGG-ID: 6DYzD3q3NJyeCwH4c336ow
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99efe7369dso144246366b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 Nov 2024 13:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015784; x=1731620584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCBJYIc+gZaFqcH/kMhXnStnCvMEDdTjDagRSJEFPHk=;
        b=LNmcbZqFmhM6Yve8SvdEKuXVmjxn3lRmXPvl59c0Jx8WZnnS5FI69o1YjTQQkhlMd7
         cmd/W4Vj8N48HQr1mQe5WTqRF/4dpmkKPDbsxMl6IBbF3TNLc3Ecd59xdJB/P68IaLOR
         bAd/Wgggg1eZLqJUxGg+diFLksmcoaCgYWrxmxhWZWk1VF0JJuBuE8f+6HYrTHIU15DZ
         idMbM6rbObfCEQc7OyR36lMLN5eiVgdvCeaT3WMdd2sjhUWej6mTNlJ4oBWOU5m44aMv
         woFrc9ZZ8tSlNJ00DuSO++D6k4ifudDrz6ViTvWXFFQntwKmz6/fncJc3nXfQqntNs+g
         mgug==
X-Forwarded-Encrypted: i=1; AJvYcCU3YrW1Kor3C2m5cEZeJN/nxef+P5Bi6iklmUPU2AQNXXpTsCf8Lv1swd2nR2HTr83Tg0HYbWzgH5Mi6+tk@lists.linux.dev
X-Gm-Message-State: AOJu0YzKn/knr1EfLLwELaWfBbZC0LNPIpApkDEfiq9yYxzUHDyhkBuk
	bEgNCubVqu9x2CSNZwZ1amcrLf60Jh3B4gYTJKcqUi5tA8Lw0uvnyMQ1isFM/K1Xbj9XfGJ5rN1
	AleDALgcWPbaBYWsggXCvuiBbkzYSRUibk32ZIW8GsinfNOGurLOgD7u6sB2IJYE=
X-Received: by 2002:a17:907:3e29:b0:a9a:f19:8c2a with SMTP id a640c23a62f3a-a9eec764f79mr117823466b.6.1731015783729;
        Thu, 07 Nov 2024 13:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJW0OsfqjsANzyex+Nc1eJEyVOk1n2M/Hw8yttgd+h4hnFUGPt5uA5k6rkI4R2Agbm00TWxA==
X-Received: by 2002:a17:907:3e29:b0:a9a:f19:8c2a with SMTP id a640c23a62f3a-a9eec764f79mr117820866b.6.1731015783322;
        Thu, 07 Nov 2024 13:43:03 -0800 (PST)
Received: from redhat.com ([2a02:14f:179:39a6:9751:f8aa:307a:2952])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a439e0sm145807766b.47.2024.11.07.13.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:43:02 -0800 (PST)
Date: Thu, 7 Nov 2024 16:42:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Carlos Bilbao <cbilbao@digitalocean.com>, oe-kbuild-all@lists.linux.dev,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [linux-next:master 9473/10190]
 drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <20241107164212-mutt-send-email-mst@kernel.org>
References: <202411080535.Xq60FSHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202411080535.Xq60FSHw-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b8YWIf08zv1McFoWKOcoeAOZayot4l8oGU6_RN6VChA_1731015784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 05:34:27AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   74741a050b79d31d8d2eeee12c77736596d0a6b2
> commit: 09e317f5d07e3fb5bc09674eb94e38e138fef4bf [9473/10190] vdpa/mlx5: Set speed and duplex of vDPA devices to UNKNOWN
> config: i386-randconfig-061-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080535.Xq60FSHw-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080535.Xq60FSHw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411080535.Xq60FSHw-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] speed @@     got restricted __virtio32 @@
>    drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse:     expected restricted __le32 [usertype] speed
>    drivers/vdpa/mlx5/net/mlx5_vnet.c:3910:24: sparse:     got restricted __virtio32
> 
> vim +3910 drivers/vdpa/mlx5/net/mlx5_vnet.c
> 
>   3822	
>   3823	static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name,
>   3824				     const struct vdpa_dev_set_config *add_config)
>   3825	{
>   3826		struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
>   3827		struct virtio_net_config *config;
>   3828		struct mlx5_core_dev *pfmdev;
>   3829		struct mlx5_vdpa_dev *mvdev;
>   3830		struct mlx5_vdpa_net *ndev;
>   3831		struct mlx5_core_dev *mdev;
>   3832		u64 device_features;
>   3833		u32 max_vqs;
>   3834		u16 mtu;
>   3835		int err;
>   3836	
>   3837		if (mgtdev->ndev)
>   3838			return -ENOSPC;
>   3839	
>   3840		mdev = mgtdev->madev->mdev;
>   3841		device_features = mgtdev->mgtdev.supported_features;
>   3842		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) {
>   3843			if (add_config->device_features & ~device_features) {
>   3844				dev_warn(mdev->device,
>   3845					 "The provisioned features 0x%llx are not supported by this device with features 0x%llx\n",
>   3846					 add_config->device_features, device_features);
>   3847				return -EINVAL;
>   3848			}
>   3849			device_features &= add_config->device_features;
>   3850		} else {
>   3851			device_features &= ~BIT_ULL(VIRTIO_NET_F_MRG_RXBUF);
>   3852		}
>   3853		if (!(device_features & BIT_ULL(VIRTIO_F_VERSION_1) &&
>   3854		      device_features & BIT_ULL(VIRTIO_F_ACCESS_PLATFORM))) {
>   3855			dev_warn(mdev->device,
>   3856				 "Must provision minimum features 0x%llx for this device",
>   3857				 BIT_ULL(VIRTIO_F_VERSION_1) | BIT_ULL(VIRTIO_F_ACCESS_PLATFORM));
>   3858			return -EOPNOTSUPP;
>   3859		}
>   3860	
>   3861		if (!(MLX5_CAP_DEV_VDPA_EMULATION(mdev, virtio_queue_type) &
>   3862		    MLX5_VIRTIO_EMULATION_CAP_VIRTIO_QUEUE_TYPE_SPLIT)) {
>   3863			dev_warn(mdev->device, "missing support for split virtqueues\n");
>   3864			return -EOPNOTSUPP;
>   3865		}
>   3866	
>   3867		max_vqs = min_t(int, MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues),
>   3868				1 << MLX5_CAP_GEN(mdev, log_max_rqt_size));
>   3869		if (max_vqs < 2) {
>   3870			dev_warn(mdev->device,
>   3871				 "%d virtqueues are supported. At least 2 are required\n",
>   3872				 max_vqs);
>   3873			return -EAGAIN;
>   3874		}
>   3875	
>   3876		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MAX_VQP)) {
>   3877			if (add_config->net.max_vq_pairs > max_vqs / 2)
>   3878				return -EINVAL;
>   3879			max_vqs = min_t(u32, max_vqs, 2 * add_config->net.max_vq_pairs);
>   3880		} else {
>   3881			max_vqs = 2;
>   3882		}
>   3883	
>   3884		ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mgtdev->vdpa_ops,
>   3885					 MLX5_VDPA_NUMVQ_GROUPS, MLX5_VDPA_NUM_AS, name, false);
>   3886		if (IS_ERR(ndev))
>   3887			return PTR_ERR(ndev);
>   3888	
>   3889		ndev->mvdev.max_vqs = max_vqs;
>   3890		mvdev = &ndev->mvdev;
>   3891		mvdev->mdev = mdev;
>   3892	
>   3893		ndev->vqs = kcalloc(max_vqs, sizeof(*ndev->vqs), GFP_KERNEL);
>   3894		ndev->event_cbs = kcalloc(max_vqs + 1, sizeof(*ndev->event_cbs), GFP_KERNEL);
>   3895		if (!ndev->vqs || !ndev->event_cbs) {
>   3896			err = -ENOMEM;
>   3897			goto err_alloc;
>   3898		}
>   3899		ndev->cur_num_vqs = MLX5V_DEFAULT_VQ_COUNT;
>   3900	
>   3901		mvqs_set_defaults(ndev);
>   3902		allocate_irqs(ndev);
>   3903		init_rwsem(&ndev->reslock);
>   3904		config = &ndev->config;
>   3905	
>   3906		/*
>   3907		 * mlx5_vdpa vDPA devices currently don't support reporting or
>   3908		 * setting the speed or duplex.
>   3909		 */
> > 3910		config->speed  = cpu_to_mlx5vdpa32(mvdev, SPEED_UNKNOWN);

Indeed, speed is just __le. No need for fancy accessors.

>   3911		config->duplex = DUPLEX_UNKNOWN;
>   3912	
>   3913		if (add_config->mask & BIT_ULL(VDPA_ATTR_DEV_NET_CFG_MTU)) {
>   3914			err = config_func_mtu(mdev, add_config->net.mtu);
>   3915			if (err)
>   3916				goto err_alloc;
>   3917		}
>   3918	
>   3919		if (device_features & BIT_ULL(VIRTIO_NET_F_MTU)) {
>   3920			err = query_mtu(mdev, &mtu);
>   3921			if (err)
>   3922				goto err_alloc;
>   3923	
>   3924			ndev->config.mtu = cpu_to_mlx5vdpa16(mvdev, mtu);
>   3925		}
>   3926	
>   3927		if (device_features & BIT_ULL(VIRTIO_NET_F_STATUS)) {
>   3928			if (get_link_state(mvdev))
>   3929				ndev->config.status |= cpu_to_mlx5vdpa16(mvdev, VIRTIO_NET_S_LINK_UP);
>   3930			else
>   3931				ndev->config.status &= cpu_to_mlx5vdpa16(mvdev, ~VIRTIO_NET_S_LINK_UP);
>   3932		}
>   3933	
>   3934		if (add_config->mask & (1 << VDPA_ATTR_DEV_NET_CFG_MACADDR)) {
>   3935			memcpy(ndev->config.mac, add_config->net.mac, ETH_ALEN);
>   3936		/* No bother setting mac address in config if not going to provision _F_MAC */
>   3937		} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0 ||
>   3938			   device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
>   3939			err = mlx5_query_nic_vport_mac_address(mdev, 0, 0, config->mac);
>   3940			if (err)
>   3941				goto err_alloc;
>   3942		}
>   3943	
>   3944		if (!is_zero_ether_addr(config->mac)) {
>   3945			pfmdev = pci_get_drvdata(pci_physfn(mdev->pdev));
>   3946			err = mlx5_mpfs_add_mac(pfmdev, config->mac);
>   3947			if (err)
>   3948				goto err_alloc;
>   3949		} else if ((add_config->mask & BIT_ULL(VDPA_ATTR_DEV_FEATURES)) == 0) {
>   3950			/*
>   3951			 * We used to clear _F_MAC feature bit if seeing
>   3952			 * zero mac address when device features are not
>   3953			 * specifically provisioned. Keep the behaviour
>   3954			 * so old scripts do not break.
>   3955			 */
>   3956			device_features &= ~BIT_ULL(VIRTIO_NET_F_MAC);
>   3957		} else if (device_features & BIT_ULL(VIRTIO_NET_F_MAC)) {
>   3958			/* Don't provision zero mac address for _F_MAC */
>   3959			mlx5_vdpa_warn(&ndev->mvdev,
>   3960				       "No mac address provisioned?\n");
>   3961			err = -EINVAL;
>   3962			goto err_alloc;
>   3963		}
>   3964	
>   3965		if (device_features & BIT_ULL(VIRTIO_NET_F_MQ)) {
>   3966			config->max_virtqueue_pairs = cpu_to_mlx5vdpa16(mvdev, max_vqs / 2);
>   3967			ndev->rqt_size = max_vqs / 2;
>   3968		} else {
>   3969			ndev->rqt_size = 1;
>   3970		}
>   3971	
>   3972		mlx5_cmd_init_async_ctx(mdev, &mvdev->async_ctx);
>   3973	
>   3974		ndev->mvdev.mlx_features = device_features;
>   3975		mvdev->vdev.dma_dev = &mdev->pdev->dev;
>   3976		err = mlx5_vdpa_alloc_resources(&ndev->mvdev);
>   3977		if (err)
>   3978			goto err_alloc;
>   3979	
>   3980		err = mlx5_vdpa_init_mr_resources(mvdev);
>   3981		if (err)
>   3982			goto err_alloc;
>   3983	
>   3984		if (MLX5_CAP_GEN(mvdev->mdev, umem_uid_0)) {
>   3985			err = mlx5_vdpa_create_dma_mr(mvdev);
>   3986			if (err)
>   3987				goto err_alloc;
>   3988		}
>   3989	
>   3990		err = alloc_fixed_resources(ndev);
>   3991		if (err)
>   3992			goto err_alloc;
>   3993	
>   3994		ndev->cvq_ent.mvdev = mvdev;
>   3995		INIT_WORK(&ndev->cvq_ent.work, mlx5_cvq_kick_handler);
>   3996		mvdev->wq = create_singlethread_workqueue("mlx5_vdpa_wq");
>   3997		if (!mvdev->wq) {
>   3998			err = -ENOMEM;
>   3999			goto err_alloc;
>   4000		}
>   4001	
>   4002		mvdev->vdev.mdev = &mgtdev->mgtdev;
>   4003		err = _vdpa_register_device(&mvdev->vdev, max_vqs + 1);
>   4004		if (err)
>   4005			goto err_reg;
>   4006	
>   4007		mgtdev->ndev = ndev;
>   4008	
>   4009		/* For virtio-vdpa, the device was set up during device register. */
>   4010		if (ndev->setup)
>   4011			return 0;
>   4012	
>   4013		down_write(&ndev->reslock);
>   4014		err = setup_vq_resources(ndev, false);
>   4015		up_write(&ndev->reslock);
>   4016		if (err)
>   4017			goto err_setup_vq_res;
>   4018	
>   4019		return 0;
>   4020	
>   4021	err_setup_vq_res:
>   4022		_vdpa_unregister_device(&mvdev->vdev);
>   4023	err_reg:
>   4024		destroy_workqueue(mvdev->wq);
>   4025	err_alloc:
>   4026		put_device(&mvdev->vdev.dev);
>   4027		return err;
>   4028	}
>   4029	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

