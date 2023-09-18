Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D856FD0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695029462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K9mKfMs2axUjRk4VejYXL9YNHsofaFImODtn3an3J0Q=;
	b=BpcqJPrloomRyKriyBFoffG+optmS/69INq4f7Cal6ZorfRyRrFwhQsGZm4XE4B2mjTZ0m
	XNpMtLdHX9rSNOVh50v8vHGEW+LA18WrGoTH/yoman0dN00EMmeFKYOt9VdtAQ3RxIptws
	QSHrDYlspvnk44h17uUwkhKxwickTMM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-ppfbZ5UBOS2krHAFDvsdiQ-1; Mon, 18 Sep 2023 05:30:57 -0400
X-MC-Unique: ppfbZ5UBOS2krHAFDvsdiQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31fd48da316so3002007f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029456; x=1695634256;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9mKfMs2axUjRk4VejYXL9YNHsofaFImODtn3an3J0Q=;
        b=p7MfmIUix2kY2jvfyBjKQOrzju+Rlj+wGq88v7IHIG3BdopNpccFMdbGryFvxD5piC
         SJRolzlSvn5Q1CTtTYWkKnrEKf/pwfmvRI+2GxShIp1nV4ZUcohD0W1F9+CKzjH1AYnn
         Hkpi1+es0rbcAl3kAQrYI/c+HIq7bpo2U9j6r0VRys78cR1ETn2FufjACoTrGlUHXy3f
         EYit/a6P9GcNYfVm0l/a2IvXz8ELeGtakJcqUd795Fl0eFwZpoG3dhrGKM4zrm82/apI
         fG4AxR7ri5w1MJ2ShoJt0bUQf1DJcoi7n3KtDixuxMTsxidsakOSlgt0oN6B3OoLW+KM
         TKig==
X-Gm-Message-State: AOJu0Yy5CRGVSKZwRZ3BuIrFl1GNFOZi7DHLRUK2aEDVZ0JCkUHk1xQt
	QII4ma5Eag3AjXHlPPMWunACWutbKuIsyV7idU3tvuOO1DXbDgZm8FA7o9zFbwb0UhOEIjeuLlZ
	XfX16CQWsSlZ3kQKxZTqYntCyOg==
X-Received: by 2002:a5d:4152:0:b0:317:5182:7b55 with SMTP id c18-20020a5d4152000000b0031751827b55mr6601629wrq.42.1695029455963;
        Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVwKer/t6wO8e6EaqpLJk3xr8QAnbzNM6Ra4QUQXA+9orH05TCHII2aGbpDgbji3C7zRZ1Q==
X-Received: by 2002:a5d:4152:0:b0:317:5182:7b55 with SMTP id c18-20020a5d4152000000b0031751827b55mr6601614wrq.42.1695029455646;
        Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q11-20020adff50b000000b0031c71693449sm12122610wro.1.2023.09.18.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:30:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, arnd@arndb.de, rdunlap@infradead.org,
 glaubitz@physik.fu-berlin.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] fbdev/sh7760fb: Depend on FB=y
In-Reply-To: <20230918090400.13264-1-tzimmermann@suse.de>
References: <20230918090400.13264-1-tzimmermann@suse.de>
Date: Mon, 18 Sep 2023 11:30:54 +0200
Message-ID: <87o7hz4ylt.fsf@minerva.mail-host-address-is-not-set>
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

> Fix linker error if FB=m about missing fb_io_read and fb_io_write. The
> linker's error message suggests that this config setting has already
> been broken for other symbols.
>
>   All errors (new ones prefixed by >>):
>
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_probe':
>      sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
>      sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_videomode_to_var'
>      sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_alloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `register_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_dealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `framebuffer_release'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_remove':
>      sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebuffer'
>      sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_dealloc_cmap'
>      sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `framebuffer_release'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined reference to `fb_io_read'
>   >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefined reference to `fb_io_write'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
>      sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-lkp@intel.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed with your change.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

