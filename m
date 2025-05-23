Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DC1AAE2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 19:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030064; cv=none; b=j/B+DqIt1R/SFZoStt2T+fUJdFC7zWBJEysmlQBBAUng3PSAMmRc9BGImEpnyjCA48OS2N5f8xR8NcU+oyqdPOhXVoll09Jx8soT2ir87m3MFVaDe5bi50ehGgAP/l1PkBdBbaXNoowfRLgo70oeMloX4WHTWgs/dvmQKvSxBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030064; c=relaxed/simple;
	bh=R5wPs3sPT5nmLtfvLBf3dVFCAPL5scbm60Eqn+vMmqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K/4K6PA1j06va/kFssBfQA08WAP7kBuZ7XteoonPZgA4gqEAzfyolFrEOqydsIEYJ2YQwTDDh5X6g2SmlyPCZYOAGmrJH/rgVJMwtklrIMCWarFCoG4NbJiKINBEaCInEpBVz/k3cbBAXWo8FCU6KnVhzo2cR5OVJEezCsZQ9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KnzFvtPT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KnzFvtPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748030061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d5s7qNG9n+sGshnUg/+ZZCTuuWygNofQvMjxRSXOXAw=;
	b=KnzFvtPTsNG42ASX3UySa75k+U5MJnJL/D3FpgYMoIO+JPzhCh2+aenkGO8HTzYXBqjXUt
	kgerF9KylkUGunwasnH5bzileB+SEtW7w3rQxJa2iFtCGUNTz51CBEkYWv+gUfDv15t2j0
	Gyb75Jyh56Vjx154ueCve99d0DnaqGQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-ga4TLk8TMm2y5H3lupS3cw-1; Fri, 23 May 2025 15:54:19 -0400
X-MC-Unique: ga4TLk8TMm2y5H3lupS3cw-1
X-Mimecast-MFC-AGG-ID: ga4TLk8TMm2y5H3lupS3cw_1748030058
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso738035e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 12:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748030058; x=1748634858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5s7qNG9n+sGshnUg/+ZZCTuuWygNofQvMjxRSXOXAw=;
        b=SHg9N01g16dBItdknefDJOdYxbILX1ZitlZUQ4GC3GHpKAjraDsvdGjOYBdUthkF3m
         LXW8rBjZ6s6BegAXDxOJly20pBxXayCIq5d/nfQJ2O9JgkKQLKG9vPxGx98FxPebCUTB
         p4m8hbpsjbtK/hy3oqiZJXkb1cWzmzPbz/wJkNjWYtqv8Y8bdk922PfTxctQLPa+k+Gz
         A76KqrLfMACOrLbQ6Fok5OeKNRGg5sp5Les0Gw2Fn9uZ5jkKziR0QqlUYO+PVt3c7SNE
         dnY/wxHd1v9Mngah3zPo+xAIUWXyFSEc0San95YKgufTyZi8RSD7HxfkWyuA97xFzO6I
         tBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBpnM8RwK0itxOUg530L9GfdAD55SI0YrySuoH0Uz8IqEpIjHHOuVB3t/iepCWe8pmTKESEDvBxe90+ocG@lists.linux.dev
X-Gm-Message-State: AOJu0YxSj64ro8sgsDw0p+29/JFrkWU1hbbTViLaf6IAin61r91uvybl
	pS605hNKJ5dzCBYJi36HQNP4e2IkvDr7R2/NW8QwEg7DahnntlJCPRUDWFWZDm80HHdr2Z0vpNl
	ZJM+pBlMUkrgIL1x/iTfbA8pgiNGUfRKArY/sywqbIYtseeO61VERf6cMT2u3ca4Ha2g=
X-Gm-Gg: ASbGncuCZ/fmfNIYrLGELZM6PEwohFYEGqnQ8f+5T/Hl42BOusWQipI7QIVy2qmfIKz
	iSb7j01d53PWb04YSxVwSILCerxtbTiH7EauF1SaJiJnuJEMKQewTJozOF0cPkdo2xqs+C3jcM2
	SZw68GH2t1vv7vaYMSyKwEKfdsbHo9uYLEXdzJY18xBsTbDBOzjj6TRPjsvb4wkgWSme9QpmQUV
	I26Hwm1Bpaa76dnBlpb9aWbDIql8gUanLso4dxwQVzXXgopeRD9N2rvnEFJhMrSpk++Yu1qPc+w
	nOihLg==
X-Received: by 2002:a05:6000:4382:b0:3a3:6c48:4703 with SMTP id ffacd0b85a97d-3a4cb47b52dmr492647f8f.34.1748030058315;
        Fri, 23 May 2025 12:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRESeg6hYmIYenPlyFSRpIWgPNu80nJPhJQhf3A+46BP/y1MNESUExwt1IggIXansY31YITg==
X-Received: by 2002:a05:6000:4382:b0:3a3:6c48:4703 with SMTP id ffacd0b85a97d-3a4cb47b52dmr492629f8f.34.1748030057895;
        Fri, 23 May 2025 12:54:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1easm27008003f8f.5.2025.05.23.12.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 12:54:17 -0700 (PDT)
Date: Fri, 23 May 2025 15:54:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH net-next 8/8] vhost/net: enable gso over UDP tunnel
 support.
Message-ID: <20250523155259-mutt-send-email-mst@kernel.org>
References: <f95716aed2c65d079cdb10518431088f3e103899.1747822866.git.pabeni@redhat.com>
 <202505221428.67HNn025-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202505221428.67HNn025-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _dfqqPMzpDlCrgQQ5bP5u0x5mnHPrGIeFH18lxB-YD4_1748030058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2025 at 02:43:50PM +0800, kernel test robot wrote:
> Hi Paolo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/virtio-introduce-virtio_features_t/20250521-183700
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/f95716aed2c65d079cdb10518431088f3e103899.1747822866.git.pabeni%40redhat.com
> patch subject: [PATCH net-next 8/8] vhost/net: enable gso over UDP tunnel support.
> config: i386-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221428.67HNn025-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221428.67HNn025-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505221428.67HNn025-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/vhost/net.c:1633:30: warning: shift count >= width of type [-Wshift-count-overflow]
>     1633 |         has_tunnel = !!(features & (VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/virtio_features.h:18:24: note: expanded from macro 'VIRTIO_BIT'
>       18 | #define VIRTIO_BIT(b)           BIT_ULL(b)
>          |                                 ^~~~~~~~~~
>    include/vdso/bits.h:8:30: note: expanded from macro 'BIT_ULL'
>        8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
>          |                                         ^  ~~~~
>    drivers/vhost/net.c:1634:9: warning: shift count >= width of type [-Wshift-count-overflow]
>     1634 |                                     VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO)));
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


yep, this is why I suggested making VIRTIO_BIT(any value > 63) simply 0 on 32 bit.

>    include/linux/virtio_features.h:18:24: note: expanded from macro 'VIRTIO_BIT'
>       18 | #define VIRTIO_BIT(b)           BIT_ULL(b)
>          |                                 ^~~~~~~~~~
>    include/vdso/bits.h:8:30: note: expanded from macro 'BIT_ULL'
>        8 | #define BIT_ULL(nr)             (ULL(1) << (nr))
>          |                                         ^  ~~~~
>    2 warnings generated.
> 
> 
> vim +1633 drivers/vhost/net.c
> 
>   1622	
>   1623	static int vhost_net_set_features(struct vhost_net *n, virtio_features_t features)
>   1624	{
>   1625		size_t vhost_hlen, sock_hlen, hdr_len;
>   1626		bool has_tunnel;
>   1627		int i;
>   1628	
>   1629		hdr_len = (features & ((1ULL << VIRTIO_NET_F_MRG_RXBUF) |
>   1630				       (1ULL << VIRTIO_F_VERSION_1))) ?
>   1631				sizeof(struct virtio_net_hdr_mrg_rxbuf) :
>   1632				sizeof(struct virtio_net_hdr);
> > 1633		has_tunnel = !!(features & (VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
>   1634					    VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO)));
>   1635		hdr_len += has_tunnel ? sizeof(struct virtio_net_hdr_tunnel) : 0;
>   1636		if (features & (1 << VHOST_NET_F_VIRTIO_NET_HDR)) {
>   1637			/* vhost provides vnet_hdr */
>   1638			vhost_hlen = hdr_len;
>   1639			sock_hlen = 0;
>   1640		} else {
>   1641			/* socket provides vnet_hdr */
>   1642			vhost_hlen = 0;
>   1643			sock_hlen = hdr_len;
>   1644		}
>   1645		mutex_lock(&n->dev.mutex);
>   1646		if ((features & (1 << VHOST_F_LOG_ALL)) &&
>   1647		    !vhost_log_access_ok(&n->dev))
>   1648			goto out_unlock;
>   1649	
>   1650		if ((features & (1ULL << VIRTIO_F_ACCESS_PLATFORM))) {
>   1651			if (vhost_init_device_iotlb(&n->dev))
>   1652				goto out_unlock;
>   1653		}
>   1654	
>   1655		for (i = 0; i < VHOST_NET_VQ_MAX; ++i) {
>   1656			mutex_lock(&n->vqs[i].vq.mutex);
>   1657			n->vqs[i].vq.acked_features = features;
>   1658			n->vqs[i].vhost_hlen = vhost_hlen;
>   1659			n->vqs[i].sock_hlen = sock_hlen;
>   1660			mutex_unlock(&n->vqs[i].vq.mutex);
>   1661		}
>   1662		mutex_unlock(&n->dev.mutex);
>   1663		return 0;
>   1664	
>   1665	out_unlock:
>   1666		mutex_unlock(&n->dev.mutex);
>   1667		return -EFAULT;
>   1668	}
>   1669	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

