Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29B208DD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X5TRHuBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704362619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iso67TQoBLfN9VezQNaMcYrGz+a7AhOyWx0neOL61x8=;
	b=X5TRHuBzzkbTHazvaI2+24Wfqz02pRJ/0ggcaqTRjchTUptNTYzR1N/FQz5cIV5fG5Qys3
	BD+uahdPK7JHbb/0fUAxT+GDboiGfKlulddR1h70CDR/lG8HfC1ZokzqjgceYn1NV3zlJl
	e8q33sCnlUdg2VUGkLcwNd9xR8RS/M0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-8ablYyk8PLqp1oBcSMfDzg-1; Thu, 04 Jan 2024 05:03:38 -0500
X-MC-Unique: 8ablYyk8PLqp1oBcSMfDzg-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4677690896cso107004137.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 02:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704362618; x=1704967418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iso67TQoBLfN9VezQNaMcYrGz+a7AhOyWx0neOL61x8=;
        b=qKSMx95tWzm3KuS2yMHZpuQay1PtuXFAJT6lepJR9UX12Z7gkRwQW7aRltOPimXyB4
         bHnrWRw1PJJgR+M+JDz6fs0ueVkctbIrUzC2HKxd2P7HX21RsbOfmaDRRpbkxOoibloV
         w9wm6b5aiBvGRGqxASpyCrAA4fhOSstvvsbS7HF7EsJwewogP539lMA6k2r07Cn8ckkW
         GGrgom2VUmcL/BMITi3Nli4J2jCxm/VuHU09yNefZxDotdHebBCeRcBv/STHgJglaLE3
         owNV4UxoCxtDVjZ9um30WMDEDUdGxTWwMzei2dGadybopuuMTmrb/U1KSJhXi9kRugov
         Bp8A==
X-Gm-Message-State: AOJu0YxwK16/kgulxjkn/mzvAsEjL7ElVlMZZ0SsZM6rQ0BXVjVH5oWL
	ILYl1ygQDeOMGrKR6lWk9RSoOzxiiaP3BKwjoK1ZcB+iEEiq+p2MAOQossEquYY/CKz4rQkP0sh
	/FwhzhBogkpVWZl4Z5rq62v1iyg/TmnwJFvmGaSNeFsjaZRd+Rg==
X-Received: by 2002:a05:6102:1515:b0:466:f492:9df6 with SMTP id f21-20020a056102151500b00466f4929df6mr208080vsv.25.1704362617991;
        Thu, 04 Jan 2024 02:03:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz8o//av/QKBiLLyLxdohY/AsPRQnjqLfPP1SOrLzN0xRWnOLhbQEtO/8NFEjZaEjPlaB3jzinHT3v5L3VhQs=
X-Received: by 2002:a05:6102:1515:b0:466:f492:9df6 with SMTP id
 f21-20020a056102151500b00466f4929df6mr208070vsv.25.1704362617698; Thu, 04 Jan
 2024 02:03:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312310811.Vhbahqnt-lkp@intel.com>
In-Reply-To: <202312310811.Vhbahqnt-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 4 Jan 2024 11:03:25 +0100
Message-ID: <CABgObfZUtyDNNrWK8Q5K2DpTD4FWCjdgp3qFjTAV1DviqWLYsA@mail.gmail.com>
Subject: Re: [linux-next:master 5482/10295] arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19:
 error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2023 at 1:33=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   39676dfe52331dba909c617f213fdb21015c8d10
> commit: 8132d887a7023b212f242a51ae89281c69fde996 [5482/10295] KVM: remove=
 CONFIG_HAVE_KVM_EVENTFD
> config: riscv-randconfig-001-20231231 (https://download.01.org/0day-ci/ar=
chive/20231231/202312310811.Vhbahqnt-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231231/202312310811.Vhbahqnt-lkp@intel.com/reproduce)

arch/riscv/kvm/Kconfig is missing a "select HAVE_KVM". The same issue
is present on ppc. I'll send a cleanup patch.

Paolo

