Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3334677D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418446; cv=none; b=YYrkBnbpOWbYpwrwHPWyd3QAP1n+ErpqvlcFsSMn3KzghKLr52VCo5HZ1QQOeST7/u0cn+xuxFOEHYEJ234MH8CrRkmDU1c5DF4gTGcRAIyOnNYG9WrOp8ifpj5F5YqygrCE0KmTeGtNw/Q3b2bORdAFtbo9VoOZFpyPAN5CVSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418446; c=relaxed/simple;
	bh=QKRezXrA3bG4ArDBbT58+S8c1CtyAn6iBKaQozySKZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKgVxKtJ7Q75jHo0qF3TThidKe6lmq4IPXpk0w4a3s1pxcThg8MrgXepuDUOMLRQNCsouCL57sCfosmLoQzoJ1fUh74PgM5Tq+zZ3PxIVjKXX7Y4C5OZWen32LrGT2wttJOh8nB/VIu3wO39YVmedv3NWJr6mnR6SWxLky2LUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckUArX2F; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckUArX2F"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5634feea416so125282e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 11:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768418444; x=1769023244; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUpDNPxjIqi9ICJXtc+mfMuxEexyo061EqFw5Nyb8q0=;
        b=ckUArX2FwOhKxo8fL0y/s6FUHCW/i4Lds8+bysyxk8b5fuke/GbMyhYVmWOf9f+w5b
         IdoTFyAxCQiAM9kB/tmfUviplq9AJZMpbS2SkRKOPwngZd3cJaDr6zyw8bMdlYWdzeYG
         48ZOLjOjbYDhE2Zk/eUgDC3UyA+6K6OqjxPht0jpEqrEIYD8s1Bmkl0oFcKp/Cqkofht
         U0WksqSl9AX8KSVlox0K9CZ8MeTM4h7ZDqyXASGbwQ0Dqp3ENZ28zthJKhTinzxslsPv
         kQoh0JNJ1r/oNt7Tbby1ntDzDSNMGQNhqni7SDvrwbS+v85eArZ22mB8HIJsD/2xN2tI
         K5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768418444; x=1769023244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUpDNPxjIqi9ICJXtc+mfMuxEexyo061EqFw5Nyb8q0=;
        b=gxEoZ7a53rEkrhW2ZrxQZkkii46v/Z7r6suQIopffshA44fUOMYBn0ngK4M+e2IJFE
         TGcdBGjz/Navxi8F+FxdpzlgenCbEc9g3vqWslp5he7xvnKCLjdsIm2wIAYa3tTPxd5E
         2wkeXuOZ0mM/oPCarMDdWsSLnR0Zs3vZRZtlDSBmGCTLCUsZyKZ/mOlCjyn7Pq1sk4XX
         h1sJxqgZqe8psVCwKeKPQeeU92dLCOR+3EcB90NHdbWz4URB95dnRxI5SJvVxOFAE/C7
         rbUzfnPojveYMXXeMBq9Ksk7dB4wX6StUuvFDOB+bE2f+ujSjwBf6+bzkz5Gc+RnyKvf
         rSNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIvp70MZm8lnpYAlpeTmguFXC0sFyOyiIveTj44MR0IU84QNm3QKoaZdW9eWnXHBI/vA1qFc/hm8Rostbl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8SKXA+9p3aX7KMlF1Y3X5TZyFoo8vsrbaKEb5pFRP0BCJK98g
	2fkCLPrgSzYLxTxgZ1tHLpa0jxv1AetjiHefBUB62aUBzDukIpHiUbZK5cpjog==
X-Gm-Gg: AY/fxX5UHn72Q+QsRca1ov9YS3lvfnwuiUSihbsLGly4vHx5+FRV/L8PAHIY+t3mtZ5
	vtwZJfPnwKomMIsWYxe/CBvxzPjcmwjKwfeM02cwMuzrRS34hmCDvDan9+vuBdxQ06Xm481rqx3
	mKRf24/kNMpvQvPPAnP7wDDTR+WY8JP97Lrve0aQLXcetVXKsBalJ5vu1WuqXZzgx7HCUKyYBsp
	qaEskM5yBBlPYvTBB5zohpt/BEVvqskeOaL3WWq7ARlm2fCplGWyvuBp1GtpRvbLVR0GB6QzixI
	Zni+zb2uyDShfjpfc894pZWjGw0HJqmCw7Y7HRsHTsta5NPIL+v4TtnAmTIBPr852wMJnHOEAXK
	qrwapPqzw/N9cJma4W8R3vNECkl7r9ak8eJwphxq8sgZlYW7PDyQyUpYL6kjAHl860N6qefiPGL
	XMzGTcQGF2Kp86Hb4dwCHQtGQm4V/CM9WeUw==
X-Received: by 2002:a05:690e:1c06:b0:646:eb06:f2e2 with SMTP id 956f58d0204a3-64903b513d2mr1973243d50.73.1768411311135;
        Wed, 14 Jan 2026 09:21:51 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6e12ffsm92418037b3.53.2026.01.14.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:21:50 -0800 (PST)
Date: Wed, 14 Jan 2026 09:21:49 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Long Li <longli@microsoft.com>, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kselftest@vger.kernel.org,
	berrange@redhat.com, Sargun Dhillon <sargun@sargun.me>
Subject: Re: [PATCH net-next v14 01/12] vsock: add netns to vsock core
Message-ID: <aWfQrS1oNcXwcXu3@devvm11784.nha0.facebook.com>
References: <20260112-vsock-vmtest-v14-1-a5c332db3e2b@meta.com>
 <202601140749.5TXm5gpl-lkp@intel.com>
 <CAGxU2F45q7CWy3O_QhYj0Y2Bt84vA=eaTeBTu+TvEmFm0_E7Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F45q7CWy3O_QhYj0Y2Bt84vA=eaTeBTu+TvEmFm0_E7Jw@mail.gmail.com>

On Wed, Jan 14, 2026 at 04:54:15PM +0100, Stefano Garzarella wrote:
> On Wed, 14 Jan 2026 at 00:13, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Bobby,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on net-next/main]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-set-skb-owner-of-virtio_transport_reset_no_sock-reply/20260113-125559
> > base:   net-next/main
> > patch link:    https://lore.kernel.org/r/20260112-vsock-vmtest-v14-1-a5c332db3e2b%40meta.com
> > patch subject: [PATCH net-next v14 01/12] vsock: add netns to vsock core
> > config: x86_64-buildonly-randconfig-004-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140749.5TXm5gpl-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140749.5TXm5gpl-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601140749.5TXm5gpl-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> WARNING: modpost: net/vmw_vsock/vsock: section mismatch in reference: vsock_exit+0x25 (section: .exit.text) -> vsock_sysctl_ops (section: .init.data)
> 
> Bobby can you check this report?
> 
> Could be related to `__net_initdata` annotation of `vsock_sysctl_ops` ?
> Why we need that?
> 
> Thanks,
> Stefano
> 

Yep, no problem.

Best,
Bobby
