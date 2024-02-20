Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358E5FDB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708422206; cv=none; b=s7QyIYCIHRoU6szSfN8YhGZthi6f/nbZt1bhK8KAcJ9G80spWYBvm5ZHnXkHgMQH7jlBftjREMrB/1HvBpKRS269TfyOOOXAXqr3P/F1z62blPV0R9qioleJQ+7EZcHRgs0no+VgFwS/oh+CsraFqT9iFvQk+oxnH8KUDggnwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708422206; c=relaxed/simple;
	bh=D0Yo5x/4MfZWsJXiUKOIvYZcHzyTT/XtYOAf0/Z82rA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s2ZsmBrgtZb0LNO3g9Vtyg04a9tWsyC0RWehp48HVFbkI3F0NuCvEBaXn8D7CNypi36FKd6lrGOlSxrdNullkU8n+2iqZdklcOW4OaqqBxMvH23ptRVABU9AWbBz/v1O0ka5jDwJlS9PUyznYkT1lxmc5kCuWh0JNwCA2JRTqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBtdL0sv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBtdL0sv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708422203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d0/eBVPARKg7uLoz7RJuNF4kAD5bZj3l8nX7PR1I690=;
	b=gBtdL0svQJQSAUKeJmjopNK1MDIWjWjxqHZoQC+rtdpqtGrdHw7qidYy//gwvK7oLmkIjj
	65Fuw2/VtAOWxvikcgi+uKbzWzEfwvPztbc9HHaU9hLg2Wur+ngIb6hieZM7BRdxKGIlj/
	n6oBXH9IXijbgJQQ/TkMVaEmNsqpctc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-RKRnit9TMAGFR9v4BN4CeA-1; Tue, 20 Feb 2024 04:43:22 -0500
X-MC-Unique: RKRnit9TMAGFR9v4BN4CeA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33d19951a9bso1201054f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 01:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708422201; x=1709027001;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0/eBVPARKg7uLoz7RJuNF4kAD5bZj3l8nX7PR1I690=;
        b=C2JnIEwh/mr/KtPFTt30UIkj7p/fNUb2lcdq26sztWEV6hv8V27zyiPzMaksa7ohT1
         DQplY8487o4EoIiTnnwZLoGPBxfG/zB6jmqMYWLmcsWJHXL6TAtmn2YwXaYk6diA0fNr
         ngRAfUdsXFiYDKZ32MGgAwQgrXos5PlnfqljVC1vHdlJszvqLQcOr1EIEvI3A1BZ0cZY
         iBE1Mdyy3sACvdjPFvLRMbSSDMVoy5RhT49MYyBZ7TyehYi4SeFsc5MFOmJ8nJwDHQuS
         N0Xho7nOqMmC9vqZ6y/ZxdvMUR78y1xp8bDFl4rjRoN4YQHAgMwzk0bX9MKmLeDxqjbo
         NiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/hv2bglLiqqu2BYOJWilGSiU4mtSIoD4r/tN5FcSNtu+hhOndGBNG0oLLrBMjMWOkbFZyV/mh/VUwUbsbN7jGtygpg2UfLTfXbPsQOA==
X-Gm-Message-State: AOJu0YyneGFk0zDxuRpOS2JhY7yZGaQkoqwXYxryGv657ZB79cW2RbA9
	VmTpojH8foPZumfA+i6lSkHhhvQqUhK8aj/xLQZ6Hh6Okvsm48pvyg+XK9LdoZdg8S3AB2IHV5Y
	Q+UwW3f8QmE2tKWJLzh2rPLbfDJC09j5cnb1t49gdBZxJP2STth+fhqPyzBHEKOM=
X-Received: by 2002:a05:6000:a18:b0:33d:3a02:8362 with SMTP id co24-20020a0560000a1800b0033d3a028362mr7878947wrb.70.1708422201297;
        Tue, 20 Feb 2024 01:43:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ/M2FosjgjQmTAsSXTDdWEs4CliCEKwrB2i44K78RB/mTHLapK6fGxT2mIST6MolghceDqQ==
X-Received: by 2002:a05:6000:a18:b0:33d:3a02:8362 with SMTP id co24-20020a0560000a1800b0033d3a028362mr7878931wrb.70.1708422201005;
        Tue, 20 Feb 2024 01:43:21 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d4a11000000b0033cf4e47496sm12805118wrq.51.2024.02.20.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:43:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH] sparc: Fix undefined reference to fb_is_primary_device
In-Reply-To: <929a159f-f6dd-49d3-b6b5-70ab7450ab19@suse.de>
References: <20240220003433.3316148-1-javierm@redhat.com>
 <929a159f-f6dd-49d3-b6b5-70ab7450ab19@suse.de>
Date: Tue, 20 Feb 2024 10:43:20 +0100
Message-ID: <87h6i3ii87.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 20.02.24 um 01:34 schrieb Javier Martinez Canillas:
>> Commit 55bffc8170bb ("fbdev: Split frame buffer support in FB and FB_CORE
>> symbols") added a new FB_CORE Kconfig symbol, that can be enabled to only
>> have fbcon/VT and DRM fbdev emulation, but without support for any legacy
>> fbdev driver.
>>
>> Unfortunately, it missed to change a CONFIG_FB in arch/sparc/Makefile and
>> that leads to the following linking error in some sparc64 configurations:
>>
>>     sparc64-linux-ld: drivers/video/fbdev/core/fbcon.o: in function `fbcon_fb_registered':
>>>> fbcon.c:(.text+0x4f60): undefined reference to `fb_is_primary_device'
>> Fixes: 55bffc8170bb ("fbdev: Split frame buffer support in FB and FB_CORE symbols")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202401290306.IV8rhJ02-lkp@intel.com/
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> I don't have a sparc64 toolchain to test this patch, but I'm pretty sure
>> that this is the correct fix for the linking error reported by the robot.
>>
>>   arch/sparc/video/Makefile | 2 +-
>
> I think you also have to fix arch/sparc/Makefile.
>

Oh, you are right! Thanks for pointing that.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

