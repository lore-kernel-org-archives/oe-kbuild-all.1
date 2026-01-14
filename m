Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5639C659
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406073; cv=none; b=p4rWT623hRkb3RjwH49ZWJISMjokGIOADdFe2k0wEmo4UO5KmRAdZ1cfeQ466pYhVpdHL0i+VeSg2jP64deP4VpmWa//mOPWATrGQQBEKnwVRsv3CTCsonY9D3kVW/UwhTXTor0rrtnkFZky2vGPR6gtmmv4DER9FrOAC5P223o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406073; c=relaxed/simple;
	bh=vu8wNkY+ONyZ11dQOa1RhYbfZ6CIfKh+CDlvLi9Pphk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PThPLfYbetbDoJ5ZCLJMZbqOFnnG57mPs6tnCmBKvrHdOr0Gwlp3zwxQgf26IUArh9CD297CmdAiYRuqVTw7pejUIMSqk1n98bY2NMczkZ8sJ5z09Lv2N5vwC/JT+E6FtC0i9VW6duFbrMcj4FgfP+y6BJJlcOnXlWoBiKx6bC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VT7BVmnf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VT7BVmnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768406070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=45w2Nqp7W5ReZCd4Up6qyFBRnRWCXaqu4990woCkPZ0=;
	b=VT7BVmnfhj1wqo+7AevawnlsJPtHlt5gesOmhOXJTd4XCVJuLi9G/UQ43NvgokzUiYm0Qw
	2zmA4UofHghHCjfcoWLDoCqsmyzjOhm5M7IIWTjwueVK1gE7cZB0nI4M80ZGEASC49/beW
	5bX6DtS+UPXE0IvKvF5K1hcwBPdZtqM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-qlqg-Da4Ngq8rfnH2eOkOA-1; Wed, 14 Jan 2026 10:54:29 -0500
X-MC-Unique: qlqg-Da4Ngq8rfnH2eOkOA-1
X-Mimecast-MFC-AGG-ID: qlqg-Da4Ngq8rfnH2eOkOA_1768406068
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ac814f308so12934075a91.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406068; x=1769010868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45w2Nqp7W5ReZCd4Up6qyFBRnRWCXaqu4990woCkPZ0=;
        b=gRdTLO+oet3w6JrvAIk4zeS8DtJLYT84uYGyXrYIJtwVwyK1EkBWU29Z70aQi/MtLU
         UAiy1jQNORJeLVLwoXSoLkl1cZhgcdDOeRwVnaJ1J3GLDsoGrEf98FCGbITU+r2n7nCC
         XfbSpGkExwfeuL+bxdFyA3bvTY9vmYDAPoOEWx7ZvBwoHTmo6Q0pBgJnjxm8+Hgd2GfN
         Iwi7KB38FojEOfSI/qgrMr39iers1YaXzERHTj907rfTNWhQP4E9c+tYZwwhqN1zTesG
         8SPpYwKnlpDnQglXYy9DRn5rR864mfPalejAXr5WQF8TYvUH2qVM+5OIkJVskA/61Gx3
         kF8w==
X-Forwarded-Encrypted: i=1; AJvYcCVYYijk+r0CK0DOWDGfy0fcASj2OMdx6C0oKdYFiypqImGN2DXCIMcOBIIx2l4Q71m93NzY9qQ9Faqpefkj@lists.linux.dev
X-Gm-Message-State: AOJu0YxWUO8/myVuS/KtARM3a2GuXpxCk0hG96CibIaeEkZqiZULVXpd
	NDxkHtkiLfd2fiDBcb8KO7OAjTxaqukoH5kNBLN6hnuYtZwLyIRCwy2oMcc3fRXkVW4QHdspPpK
	oKhTAcA+NdeiD5wh7/znuxU2la1hzZVWyh7fe6BpKjprGqCbSf3+czFVFpzPvIraWc4pdUZjdxa
	8CFZ03nsz4HAj0mx2gdCSB6JSUmDOLWkgIJutox+X1hQ==
X-Gm-Gg: AY/fxX71WOBvZIhHz2mGlvEUmR5cmtjgammKbexWTqtcI1axaPKt1FdbVn6Hb868kIq
	JiFe50EIMoYwiHmCKbbP8aeBnDJVrILSi+Rrd1FqItBRudFhU0/fj6jmYe56q2Xyse6IBStD6zR
	t87Rbw+J6HVOV2s2SUp6Zw7YETqROUkevTqna6bEZwUucSA4QVCufPOtsdYrrX4cam
X-Received: by 2002:a17:90b:590c:b0:34c:f8e6:5ec1 with SMTP id 98e67ed59e1d1-35109163a89mr3116087a91.35.1768406068122;
        Wed, 14 Jan 2026 07:54:28 -0800 (PST)
X-Received: by 2002:a17:90b:590c:b0:34c:f8e6:5ec1 with SMTP id
 98e67ed59e1d1-35109163a89mr3116054a91.35.1768406067530; Wed, 14 Jan 2026
 07:54:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112-vsock-vmtest-v14-1-a5c332db3e2b@meta.com> <202601140749.5TXm5gpl-lkp@intel.com>
In-Reply-To: <202601140749.5TXm5gpl-lkp@intel.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 14 Jan 2026 16:54:15 +0100
X-Gm-Features: AZwV_Qg5JTJCQi1Wwfd0jbkgP1qN1I8qkJH4vIis9H-XSIO4o_clOB-LFig_dcA
Message-ID: <CAGxU2F45q7CWy3O_QhYj0Y2Bt84vA=eaTeBTu+TvEmFm0_E7Jw@mail.gmail.com>
Subject: Re: [PATCH net-next v14 01/12] vsock: add netns to vsock core
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: kernel test robot <lkp@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Long Li <longli@microsoft.com>, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, berrange@redhat.com, 
	Sargun Dhillon <sargun@sargun.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dI_lbJxLTi4peiJtKuVWL6SfRiQbIGWqyGDtp9bW9Ns_1768406068
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 00:13, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bobby,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-set-skb-owner-of-virtio_transport_reset_no_sock-reply/20260113-125559
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260112-vsock-vmtest-v14-1-a5c332db3e2b%40meta.com
> patch subject: [PATCH net-next v14 01/12] vsock: add netns to vsock core
> config: x86_64-buildonly-randconfig-004-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140749.5TXm5gpl-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140749.5TXm5gpl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140749.5TXm5gpl-lkp@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> WARNING: modpost: net/vmw_vsock/vsock: section mismatch in reference: vsock_exit+0x25 (section: .exit.text) -> vsock_sysctl_ops (section: .init.data)

Bobby can you check this report?

Could be related to `__net_initdata` annotation of `vsock_sysctl_ops` ?
Why we need that?

Thanks,
Stefano

