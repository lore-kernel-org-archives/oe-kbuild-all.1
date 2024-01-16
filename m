Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5901CABA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 17:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427135; cv=none; b=rJ04FzbuIdcJ8GKJFKEJIm7dHzf0QV0uD5GpUKozoewB0roU6Q/O8+p5l8ibDSNlcJdKF/8DbSpwIlrGG4Esotmb8MlgXFyicAJHe6ogyV9gS3BGgsInm4puAWipxjqWIjeCdSI+KlQOrIR2Upg4EWNc49gen7CvrG+uusR1JL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427135; c=relaxed/simple;
	bh=ePRFPj1bioMNiByK/lse0KJkW56a+Yj6MNv4K9dpABM=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding; b=UqRYJotyQggjhgjuoIeWjj/0/nk4un1wr7RWz9eu5/CRk5xPCmTGYlYbtANHh4rf+nTbgCqXwSPxq/OpFPNvVw3baIYw8no5tu1KpUutJP7Vt2gnLCJv442vTp9ucZBgSLEzkg4WbiuQ0sSebd30SDq+5kIf7MzqzYzTGOIEsco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDMjuS9+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDMjuS9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705427132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knW0WOf74tXPpCTSl1JxvD6cZl/HDrppfcXoxL22jXQ=;
	b=UDMjuS9+3vkBaKLwWeg79KUKuQSYUxLJJFmqqacu2egRJJXr6e7P/jmiAXiugYD7fhEwOW
	vQz+HLnik2331M3WznRNamnpx01dT4WMiAcAHXF0BCQMPxHgzCmzZC/202ZglxOotlfvua
	AQt9SBywtzt6QzGPD1wAogF2Xui2lGs=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-Q5ULJjghNXugqnTVL742mA-1; Tue, 16 Jan 2024 12:45:30 -0500
X-MC-Unique: Q5ULJjghNXugqnTVL742mA-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4696784b943so721275137.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 09:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705427130; x=1706031930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knW0WOf74tXPpCTSl1JxvD6cZl/HDrppfcXoxL22jXQ=;
        b=w+ucMBSQHfQuteEbMs0o5tF+y/+2d9C9vcg7QV1JI0hE5WqPxyWLoWD6qJtTBbh2z4
         kh0FFFogbMmn69a5VLZFcz0pGzrmS1nh+QldQmhmKD/Ka/5475U9CztlwYPTRyyE5O0O
         DQovGwuQr2NNd5RUWn4GyJCx0KmkVbexY74AXvrAe0poTTYKtxeN4qlFJxbnQPM5trTo
         A4WZ5eLNNKyGLrYc+TqftWXZEKGlQVHLvnuz9EAGTV91tFXoB4z3EcxggVPtIG4ySNTv
         1GrJoJwzK7svNriMoxpAKVk7aDrGhOhwq8Au3f8ddMntMD7BTBJ7sDJNSSPDi7cGsYM4
         mS8Q==
X-Gm-Message-State: AOJu0YyclHjn7GICF4G4L2bY04ogJLS80IMJWvVh1jHNhkKUwMUqApAN
	xtCE4ZqUwKtgDv4AdDIU+wn3h0p7vAyc9MimkQYFFeJQ65q+ReEr3AqfSMDWEm0Bb1LSGfrfGTU
	4PkmI5PX7s7H+fL53RpamJQoDq6xDIzME+0Zs+8zByECKN8++Hg==
X-Received: by 2002:a67:ed0e:0:b0:468:15fc:2b2f with SMTP id l14-20020a67ed0e000000b0046815fc2b2fmr3858849vsp.55.1705427129175;
        Tue, 16 Jan 2024 09:45:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf7ZZOMX0Dc0NMImYpNAgb44vgHJkqkV6zuJT2cPxAttmESoCCDVVA8gGHD1jPxigjhZhzcIlLStd1q62Ugtw=
X-Received: by 2002:a67:ed0e:0:b0:468:15fc:2b2f with SMTP id
 l14-20020a67ed0e000000b0046815fc2b2fmr3858821vsp.55.1705427127940; Tue, 16
 Jan 2024 09:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401162158.2FqwkuiP-lkp@intel.com>
In-Reply-To: <202401162158.2FqwkuiP-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Jan 2024 18:45:15 +0100
Message-ID: <CABgObfZfjD9RqHOQsZquv7g_u4TRaJyNj315Z05R=piGnFAEvg@mail.gmail.com>
Subject: Re: [linux-next:master 697/13343] arch/loongarch/kvm/mmu.c:810:13:
 error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you
 mean 'mmu_invalidate_retry_gfn'?
To: kernel test robot <lkp@intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Kai Huang <kai.huang@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 2:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
> commit: 8569992d64b8f750e34b7858eac5d7daaf0f80fd [697/13343] KVM: Use gfn=
 instead of hva for mmu_notifier_retry
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/2=
0240116/202401162158.2FqwkuiP-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240116/202401162158.2FqwkuiP-lkp@intel.com/reproduce)

This was fixed-up when merging the KVM tree, but I missed it because
it was not mentioned in the loongarch pull request. I'll send a fixup
as soon as Linus gets back online.

Paolo

