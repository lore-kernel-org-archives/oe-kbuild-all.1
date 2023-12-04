Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD72EADA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LtmjNi39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701680535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=klUlZafuD5fySdh0flPq8If8aOTjdsGX9L5Pty3/G5Y=;
	b=LtmjNi39Fa9HAYx3ATVFimE/WUAiLoVv4kyxeCx98EZK58UV2lc5Vyi+r6IHOlZYk57Ap8
	nyq06avqO5M56baGVKgxzdavgcworkd3MzC4v9pcJo9bbyw8+2K0fKJI+ppDld5I+DAUi0
	rjClqLLR5SiOccGwVZoDlRxZdcyDjFU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-Iu8tiCVvPt2uT_G_1ABR_w-1; Mon, 04 Dec 2023 04:02:14 -0500
X-MC-Unique: Iu8tiCVvPt2uT_G_1ABR_w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3333c3b6519so1299930f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Dec 2023 01:02:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701680532; x=1702285332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klUlZafuD5fySdh0flPq8If8aOTjdsGX9L5Pty3/G5Y=;
        b=IWl91qXhFCRPMqJB3njXZt1ylOmC5m1B977zrLugMjfm5PcZJTRvsz+Bobh1cX/2t3
         MFqXBZP6YhFMPEh641Hi3EIUTr7CHM3ysguw3G3IVZZr7WT4fWDjh9HBnein5KeS6DOu
         Li0YuZudUnt0M6mZOSGPlBKBrxcTtOZv2R5xavoafLQzndvFwlVLMapqWShk1hWbiOx9
         Opyu0i8C716LnEdZZ/74VaLmh54ACjteiryL3BmXtI0sys2EP4dl7EuyeyfLNrXRG5cp
         zD4fATLZT/TZpuMmVNY7lcpfbQtSiQbMRpu4vY9/DUex4VLjFzqblwZMvsWz1+J0JFPY
         mZ2w==
X-Gm-Message-State: AOJu0YxsSf5ZZ9Loj/g7SzG8qlugq7HDUKK40ucBAE2WsWHeDapmfRVu
	QyTlMVLHeBftkw5bBzl1sTR8oGHVCmiUIhIj7aYftXM5Ff7VUAVcr4asuP4FjnjQKtxSE7fToU3
	or11VMz251IfjKbvIOX//S0JFMw==
X-Received: by 2002:a5d:570c:0:b0:333:2fd2:68de with SMTP id a12-20020a5d570c000000b003332fd268demr2993306wrv.113.1701680532072;
        Mon, 04 Dec 2023 01:02:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0ZQVyyx/zbTsZL1jvUz7Lg2aDNjkx9I4PA83zE9UwNtmP49rfhCh0xG6pgtoc8yUb5PljQw==
X-Received: by 2002:a5d:570c:0:b0:333:2fd2:68de with SMTP id a12-20020a5d570c000000b003332fd268demr2993302wrv.113.1701680531755;
        Mon, 04 Dec 2023 01:02:11 -0800 (PST)
Received: from redhat.com ([2.55.11.133])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d6843000000b0033340d2b127sm4131457wrw.89.2023.12.04.01.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 01:02:11 -0800 (PST)
Date: Mon, 4 Dec 2023 04:02:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Suwan Kim <suwan.kim027@gmail.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Christoph Hellwig <hch@lst.de>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, pbonzini@redhat.com
Subject: Re: drivers/block/virtio_blk.c:570:68: warning: '%d' directive
 output may be truncated writing between 1 and 11 bytes into a region of size
 7
Message-ID: <20231204040038-mutt-send-email-mst@kernel.org>
References: <202312041509.DIyvEt9h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202312041509.DIyvEt9h-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 04:56:35PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
> commit: 4e0400525691d0e676dbe002641f9a61261f1e1b virtio-blk: support polling I/O
> date:   1 year, 6 months ago
> config: x86_64-buildonly-randconfig-006-20230906 (https://download.01.org/0day-ci/archive/20231204/202312041509.DIyvEt9h-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312041509.DIyvEt9h-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312041509.DIyvEt9h-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/block/virtio_blk.c: In function 'init_vq':
> >> drivers/block/virtio_blk.c:570:68: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Wformat-truncation=]
>      570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
>          |                                                                    ^~
>    drivers/block/virtio_blk.c:570:58: note: directive argument in the range [-2147483648, 65534]
>      570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
>          |                                                          ^~~~~~~~~~~~~
>    drivers/block/virtio_blk.c:570:17: note: 'snprintf' output between 11 and 21 bytes into a destination of size 16
>      570 |                 snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +570 drivers/block/virtio_blk.c
> 
>    511	
>    512	static int init_vq(struct virtio_blk *vblk)
>    513	{
>    514		int err;
>    515		int i;
>    516		vq_callback_t **callbacks;
>    517		const char **names;
>    518		struct virtqueue **vqs;
>    519		unsigned short num_vqs;
>    520		unsigned int num_poll_vqs;
>    521		struct virtio_device *vdev = vblk->vdev;
>    522		struct irq_affinity desc = { 0, };
>    523	
>    524		err = virtio_cread_feature(vdev, VIRTIO_BLK_F_MQ,
>    525					   struct virtio_blk_config, num_queues,
>    526					   &num_vqs);
>    527		if (err)
>    528			num_vqs = 1;
>    529	
>    530		if (!err && !num_vqs) {
>    531			dev_err(&vdev->dev, "MQ advertised but zero queues reported\n");
>    532			return -EINVAL;
>    533		}
>    534	
>    535		num_vqs = min_t(unsigned int,
>    536				min_not_zero(num_request_queues, nr_cpu_ids),
>    537				num_vqs);
>    538	
>    539		num_poll_vqs = min_t(unsigned int, poll_queues, num_vqs - 1);
>    540	
>    541		vblk->io_queues[HCTX_TYPE_DEFAULT] = num_vqs - num_poll_vqs;
>    542		vblk->io_queues[HCTX_TYPE_READ] = 0;
>    543		vblk->io_queues[HCTX_TYPE_POLL] = num_poll_vqs;
>    544	
>    545		dev_info(&vdev->dev, "%d/%d/%d default/read/poll queues\n",
>    546					vblk->io_queues[HCTX_TYPE_DEFAULT],
>    547					vblk->io_queues[HCTX_TYPE_READ],
>    548					vblk->io_queues[HCTX_TYPE_POLL]);
>    549	
>    550		vblk->vqs = kmalloc_array(num_vqs, sizeof(*vblk->vqs), GFP_KERNEL);
>    551		if (!vblk->vqs)
>    552			return -ENOMEM;
>    553	
>    554		names = kmalloc_array(num_vqs, sizeof(*names), GFP_KERNEL);
>    555		callbacks = kmalloc_array(num_vqs, sizeof(*callbacks), GFP_KERNEL);
>    556		vqs = kmalloc_array(num_vqs, sizeof(*vqs), GFP_KERNEL);
>    557		if (!names || !callbacks || !vqs) {
>    558			err = -ENOMEM;
>    559			goto out;
>    560		}
>    561	
>    562		for (i = 0; i < num_vqs - num_poll_vqs; i++) {
>    563			callbacks[i] = virtblk_done;
>    564			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req.%d", i);
>    565			names[i] = vblk->vqs[i].name;
>    566		}
>    567	
>    568		for (; i < num_vqs; i++) {
>    569			callbacks[i] = NULL;
>  > 570			snprintf(vblk->vqs[i].name, VQ_NAME_LEN, "req_poll.%d", i);
>    571			names[i] = vblk->vqs[i].name;
>    572		}
>    573	
>    574		/* Discover virtqueues and write information to configuration.  */
>    575		err = virtio_find_vqs(vdev, num_vqs, vqs, callbacks, names, &desc);
>    576		if (err)
>    577			goto out;
>    578	
>    579		for (i = 0; i < num_vqs; i++) {
>    580			spin_lock_init(&vblk->vqs[i].lock);
>    581			vblk->vqs[i].vq = vqs[i];
>    582		}
>    583		vblk->num_vqs = num_vqs;
>    584	
>    585	out:
>    586		kfree(vqs);
>    587		kfree(callbacks);
>    588		kfree(names);
>    589		if (err)
>    590			kfree(vblk->vqs);
>    591		return err;
>    592	}
>    593	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Stefan, Paolo,
It's a false positive but do we want to fix it? Make i unsigned?

-- 
MST

