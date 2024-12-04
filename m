Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BBC14D43D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733281767; cv=none; b=LWMd2Vy+oMOy4+j4sX69zvuUR5z1uuf6AXvlB+SBkWgeS0CNUlwfv5OaFOeEfirLAq0Edzmyy9D8E8bjtLcndVSpfhoHHaW9zDNALN3xaIx6rf2Nj4aGjpIADMhjo7QltfOjJf0y6OORjV1Jlqc5XWKmBf3TH024JFojphrEIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733281767; c=relaxed/simple;
	bh=MgmdEGHRndukdNTSVbD12RLjVRhCo7fsl9QialTQEYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1igFbx9nn+N4utQfT8QzeYIu87BUATwyCKI2O0Iu5apTJeLjAf8McrFfxes7DM4VARuqmqkCWN5en2ggw3lWG3eNrV0hxgOcCqUsvzeQSj/P5mCZ3TFbDtxQNjvBkQ4oIb+II6FmCc/dF4Sx5VkrI6RACqsr3AXkb6RCk6vvb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z7i53fF9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z7i53fF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733281762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgmdEGHRndukdNTSVbD12RLjVRhCo7fsl9QialTQEYY=;
	b=Z7i53fF9bwqRkAcBjwXCmh5OacQi56XnV9MssmBwXsHpmkKoRTlDJgVSy1Nv8x3yO/dix7
	DZ52i/2kgay++ZFAJNa5BVdhdjvrHz7ePBF6hy/+S1JJWkFPr4z6iX70W31rezB2lqJ46P
	CUR7xnp5cF+odrRQKiKgxVkRFz9pDsc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-OdLKBO0PMuWIoG2qSlrCyg-1; Tue, 03 Dec 2024 22:09:19 -0500
X-MC-Unique: OdLKBO0PMuWIoG2qSlrCyg-1
X-Mimecast-MFC-AGG-ID: OdLKBO0PMuWIoG2qSlrCyg
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ee36569f4cso5396229a91.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 03 Dec 2024 19:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733281755; x=1733886555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgmdEGHRndukdNTSVbD12RLjVRhCo7fsl9QialTQEYY=;
        b=MjRrrhbCVvnAqz8CE2G5xKucpzzMVjLkBMbtl1Mt/1XUAIFDL5XhGPHaE/EtEVj/oy
         NVgzugDqsXloG7vraiptmqF1fuKfYGb8rBwnZxxH0rpHvIh6+28DkWgmbcUCgLfW/ZqZ
         aasdeJZ52JzgJG/RR29rIIgXTKKGAjKIScFeplQNBG/BVNlJ3VezRZj8iA/MKnhsSZVX
         9KKcCmAI44BmYWXG4hHGCaLs90/pJ26udDKaGJ8ImXDG/B6kHqyUwbBSoMo850uCJYlP
         24fyJxn+BT+lhHOM22xGyOc3ZS94yPjUJnve8MXxvTDZl2Olh2LG/8zO8swJZr9kxE1j
         JFpA==
X-Forwarded-Encrypted: i=1; AJvYcCVPNoyvHhN4pIkHiXxtMUYP4jzEHcHG8Ml60WzSiB5wJQoKQlc6uegobRksZL30K7YoaSP0KIz86WUxHIe3@lists.linux.dev
X-Gm-Message-State: AOJu0YyF8RYYBF2IwTTU0nLSbipGenAtOQxaNqWwkLlssgqzW6oCMmkM
	ie3lBOnxGfxkZGqjl2Uwz6cVCmnzzin8td3LvYzRTyuNeYFdx8SmmfOt9HP6tVd2jpXLKu/gsSx
	i4uH0aHE+SygRPJCrVtei7lJWuN4w65f3nO8V2Oc8fV1rzV5QYPeXc7LynAhaAP89AAE3e9ptbh
	tdw+MS6zj8xQUkpUErGjB2p0Hf6NFqVqyFoc56Tw==
X-Gm-Gg: ASbGnctD9HFUmL/sOMpdGNjOWJ5gii8aMEwUTJfPj8mIgnX3fzDb4cO6XvR5I2z6P4o
	w5xYWsjXbCiar5uoYQOuOBiu0r4fS0QCT
X-Received: by 2002:a17:90b:4fcf:b0:2ee:c457:bf83 with SMTP id 98e67ed59e1d1-2ef0120fa09mr6191072a91.19.1733281755683;
        Tue, 03 Dec 2024 19:09:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRyq5Kar+YPrt0fIQIwOO5QkraST31h47uN6/R67k+FK85B3TAjImC5ClI7yR+Xz7aE0hgCtXnDh0broXLhKQ=
X-Received: by 2002:a17:90b:4fcf:b0:2ee:c457:bf83 with SMTP id
 98e67ed59e1d1-2ef0120fa09mr6191042a91.19.1733281755308; Tue, 03 Dec 2024
 19:09:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEvf9TS6c9PTiwWn3POr33m7m1shNfHOkviZpk-Pkbf79Q@mail.gmail.com>
 <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
In-Reply-To: <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 4 Dec 2024 11:09:04 +0800
Message-ID: <CACGkMEvWNb0XVYjm+bOSaFB-U2Fi4H22pwXvQBq1-5T-DqANMg@mail.gmail.com>
Subject: Re: [PATCH v2] vdpa/vp_vdpa: implement kick_vq_with_data callback
To: "Yuxue Liu yuxue.liu@jaguarmicro.com" <yuxue.liu@jaguarmicro.com>
Cc: lkp@intel.com, mst@redhat.com, angus.chen@jaguarmicro.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: maukwp6NEeHTAs4YaNjT-epb8YFNGlfdNdFwCTyDOJM_1733281756
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 10:37=E2=80=AFAM Yuxue Liu yuxue.liu@jaguarmicro.com
<yuxue.liu@jaguarmicro.com> wrote:
>
> From: Yuxue Liu <yuxue.liu@jaguarmicro.com>
>
> Implement the kick_vq_with_data vDPA callback.
> On kick, we pass the next available data to the hardware by writing it in
> the kick offset.
>
> Signed-off-by: Yuxue Liu <yuxue.liu@jaguarmicro.com>
> ---
> v2: fix build error for kernel test robot
>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

