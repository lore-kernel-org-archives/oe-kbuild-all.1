Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6652E92B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756320965; cv=none; b=Cwo2lvUY1m5uX3BgVDUvjJMW1CSlddPOUu/3ADyRql9CBaAI6cGe6SqAyBDrrcQZj2aUT+ZuB0gXmd4X4jb+0si1Ml65FyOE3R+UvxaY4Ckvf867pQJwRyNkpAu/u/1oQM1m4pwfF/cGU0gvBcnvskgJ4PxgKKJZPo/uFamRd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756320965; c=relaxed/simple;
	bh=8ok7WAgHWHzIb67w4OKsGxYVKHOMk/whxVn9yr022jA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfyB20aOLJQTSgcuOCnN6MGs+Eg4hLLSPgBdmxpZMgGpXzEnrcBT28muzFVT3nVhVy/JHFl2OmtWuRU1XJTKdU2Fl8Z4R7tTcfxHJHMuLNpli9BZhTpms+GYsk1odKjTkyTeU0pb0cCijGM99e8x3wh35yISDyMdJVY2VrEiVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUTN97vw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUTN97vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756320962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LaJTrQIELffdqMUepm7rFcVjoX613nWdx1blyGA6qhk=;
	b=aUTN97vwL9BL4hxJI34Ko0hvlxejVXgi994aWCHyygpp4Xm8lkb41ajbaUk0uP0s8+Npad
	gt4HcoV9srBB+n2YYyIq37hHkUO8H7qROCn0ebWZZ7yonY7aPEQPn13PtQ1iscpzSQsSkI
	qbxx3Vb8slFve9kDZECrWw99sNEGsrI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-6GJhNw4aM3ySqWr-9u_Z9w-1; Wed, 27 Aug 2025 14:56:01 -0400
X-MC-Unique: 6GJhNw4aM3ySqWr-9u_Z9w-1
X-Mimecast-MFC-AGG-ID: 6GJhNw4aM3ySqWr-9u_Z9w_1756320960
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3f08869d948so387925ab.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 11:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756320960; x=1756925760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LaJTrQIELffdqMUepm7rFcVjoX613nWdx1blyGA6qhk=;
        b=WdT50sy3JJbHvnlEPUCUK1C9g/pGtD4ZBB54s6ttTGn8ayVEWZn1qSsyessFxkFLgt
         nEg5C3C8i155qJ7zBnPf0oaL/ifB+seuwONleS/F1yI8Iug4qqJRGW21OUmfRz8M8Zn5
         EQII5FHu2n97gmisRxCYIgPxWntzklUqdakV5nuzGwPhcDgW079b5QLB65yf7oeY6/Qc
         QK9aQyFMUhqz/xG5RdErO0X0WeUZLj9bwTA3eIiEK+Pn0CfT0N8U9DixXSZvwx1m48kv
         9eA/FG5pgAjJuCWh8HwuzaCeQLLN02aeaM6KeQMZVnATNRu+IkcQ7Qra1GCm6J3VFcUh
         R79A==
X-Forwarded-Encrypted: i=1; AJvYcCV6wgGrULSnHRaCcIFsJSo/NZyPsz0yLrx0SI2f18CUVAhW9YuqiWIUM07h/VVDu5pKQwN6bOoNcyRBaSX1@lists.linux.dev
X-Gm-Message-State: AOJu0YyuvIH67IbXxJgw7aTbf3whE/eLA6z3AuC76LJ76HNqdKKSvxaD
	da5pvNDoGU66peuruvfbnUmgXwaR8uwLvPl+ZLdxRJNrQVybedEUinl5mtmRrIKIcWjEjkJ/SYr
	iQCB/mthdlWRTc1CQ6zq8B7xeA/RoxhdS0E7d5ysDKSFNo3//jPvOhEbxtQHLZ0J1HRI=
X-Gm-Gg: ASbGncv9gYK28kvyUQGGJe4wFpPkSzsgCn065JWJGm/NWJ+DmF/uyoJrJrEOhoWjPV7
	bKVO+XpSEP7UPNfbeq6lxNYFeglv2lVJLVqGx5Z6v0TmmM3eQUMrTPh69IRen/XrbNyPk38CLq4
	9ltH7nVa/Phqh5iZ7RMjKizWh6MXWjX87bCbTc4nnp9q7yi1a81Nat/mf9uqUnb1U8xteKxI5eb
	A/s76iSjkAxped6g9e4mBYFJedXB3yDhQW52nKj8DVeyf+isK9lFOM6Nhp8VUHvIAN/NiATieDJ
	XKl5hkGITTApwp0YWjfQQOgY5dC7lc2TbDcy3EOe3EA=
X-Received: by 2002:a05:6e02:1c0b:b0:3ec:173e:8b6c with SMTP id e9e14a558f8ab-3ec173e8e6emr65344305ab.4.1756320960265;
        Wed, 27 Aug 2025 11:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPb2pJYAkguncuQSx6IZaNOZrvdB1Zk3MUKrevEct/LLAhqT63GRfQVhKzRAZJNEzz7BkGLQ==
X-Received: by 2002:a05:6e02:1c0b:b0:3ec:173e:8b6c with SMTP id e9e14a558f8ab-3ec173e8e6emr65344105ab.4.1756320959727;
        Wed, 27 Aug 2025 11:55:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3f0a3a1ae9esm10463375ab.3.2025.08.27.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:55:59 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:55:57 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Gupta, Nipun" <Nipun.Gupta@amd.com>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "Agarwal, Nikhil" <nikhil.agarwal@amd.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
 <oe-kbuild-all@lists.linux.dev>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org"
 <maz@kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>,
 "chenqiuji666@gmail.com" <chenqiuji666@gmail.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "robh@kernel.org" <robh@kernel.org>, "Gangurde,
 Abhijit" <abhijit.gangurde@amd.com>, "nathan@kernel.org"
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250827125557.6340d8d3.alex.williamson@redhat.com>
In-Reply-To: <CH3PR12MB91935A30AE6BFFA18A5D4B32E838A@CH3PR12MB9193.namprd12.prod.outlook.com>
References: <20250826043852.2206008-1-nipun.gupta@amd.com>
	<20250826043852.2206008-2-nipun.gupta@amd.com>
	<20250826102416.68ed8fc6.alex.williamson@redhat.com>
	<CH3PR12MB91935A30AE6BFFA18A5D4B32E838A@CH3PR12MB9193.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ADkryh-UVVSzm_mapjCNYlOlXCb09FwWn5OefcUlzg_1756320960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 Aug 2025 11:04:12 +0000
"Gupta, Nipun" <Nipun.Gupta@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Tuesday, August 26, 2025 9:54 PM
> > To: Gupta, Nipun <Nipun.Gupta@amd.com>
> > Cc: arnd@arndb.de; gregkh@linuxfoundation.org; Agarwal, Nikhil
> > <nikhil.agarwal@amd.com>; kvm@vger.kernel.org; linux-kernel@vger.kernel.org;
> > llvm@lists.linux.dev; oe-kbuild-all@lists.linux.dev; robin.murphy@arm.com;
> > krzk@kernel.org; tglx@linutronix.de; maz@kernel.org; linux@weissschuh.net;
> > chenqiuji666@gmail.com; peterz@infradead.org; robh@kernel.org; Gangurde,
> > Abhijit <abhijit.gangurde@amd.com>; nathan@kernel.org; kernel test robot
> > <lkp@intel.com>
> > Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
> > CONFIG_GENERIC_MSI_IRQ
> >
> > On Tue, 26 Aug 2025 10:08:52 +0530
> > Nipun Gupta <nipun.gupta@amd.com> wrote:
> >  
> > > Define dummy MSI related APIs in VFIO CDX driver to build the
> > > driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-  
> > lkp@intel.com/  
> > > Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> > > Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> > > Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> > > ---
> > >
> > > Changes v1->v2:
> > > - fix linking intr.c file in Makefile
> > > Changes v2->v3:
> > > - return error from vfio_cdx_set_irqs_ioctl() when CONFIG_GENERIC_MSI_IRQ
> > >   is disabled
> > > Changes v3->v4:
> > > - changed the return value to -EINVAL from -ENODEV  
> >
> > What are your intentions for merging this series, char-misc or vfio?  
> 
> Yes please, this can be taken via vfio.

Series applied to vfio next branch for v6.18.  Thanks,

Alex

