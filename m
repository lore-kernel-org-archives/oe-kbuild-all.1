Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4138272816
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 16:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756225465; cv=none; b=fZEF3/82Ay6NlYMRKeA+Xb6PG5fChiKp4ZC+IgVQqUzcCUhZMSAYnArVCKDYVP04tM7jHsCy2Dp09qdxbMSDfSE5I+U1ZZnPS1SCrn6rQzWDqprr6maHf+ZDt+H+8QQ224TMywlVGzS+eaA/7/0Pi8C6qD3a6xJKUDSP9+BUIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756225465; c=relaxed/simple;
	bh=pk1+KDkyoaqAtnIkFzZI+W1at4fbDeoEIRnzxJiguA4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwsn06QgtC1h4T5f5xvGePP8r8WsnzVzu7relbEYUmsMfcFeRR1heoZBi1Lu8ZSbOKG1fmspU7SegzG6KpK0M2ZgG4rV4oDBOsuvH+6je1WD6j5usvjqG1XC3fhrfQlAugIRZ4iWu7DyRbJsrL98/jtajby5Bdvt/r2ddOjLREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aznqJwO3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aznqJwO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756225462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DRvj9SHcb313RxmMOQKtcYFfPDoXScIlFzVPwHabrg=;
	b=aznqJwO3p9XokqBjUWCYi1jso8WGFsUbVwBrei/COOU2CQWh/+cBgt9sXIskh1BxyGe5N8
	sMaIwxmz0jwuz86c+ombhMydoIXDXymhrNJVrylcUNjTp/6bzWNj/k/HO+ZSFYL8qZCgQs
	F55IxLLCqodYG84aCel3A/3tJ/Oml7c=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-JLdFEwCsMgWlkVQQsQJ_-g-1; Tue, 26 Aug 2025 12:24:21 -0400
X-MC-Unique: JLdFEwCsMgWlkVQQsQJ_-g-1
X-Mimecast-MFC-AGG-ID: JLdFEwCsMgWlkVQQsQJ_-g_1756225461
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3e67d83ee31so7040355ab.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 09:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756225460; x=1756830260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DRvj9SHcb313RxmMOQKtcYFfPDoXScIlFzVPwHabrg=;
        b=AmLkd3wGCXFWHVQ++AxlOmvOLTmH9lVsMxJYjbn3MjJ7ulig/Co5tOZZMVJKljyez0
         Kxsib5uiAAk4hmjOTLsjkLc8cMp9Gip3l3MNef9VuOt0Nr8DcZ0EUmJOzsnPSDZ1AZJ/
         qOyS0Jps3zM0NJnivXWGVqXgnTUAvtWgCf2tlvCAOPxTI7fzTgKfMOIB2ADssJZ1fItE
         g3+VZ9COqKvYCyQU5chDPzCu1dXHA2lGlf4kfYf6YECchn9z3GYlt5kl0PL/RvTgodvI
         +AGCpZpjLULZf1uTEzGx+ldlkrUOX6WnruSh4b9+He5reUTg3w/VQ5edJpqVLDW9nP+9
         uuXg==
X-Forwarded-Encrypted: i=1; AJvYcCXwvr2HDy2+d52LlD6K0g05o0s89H3QvRYDxxzs3WkBuxYasks99fYnmrOS3Fuz0z2vmJEovwm00PD2Sj/t@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtth5LXgbHNB64fd4NL0RbQFguoHIKs7qJTr8NtJkvxy79oiIL
	gu8e6JeqU0iP1Bp52oiKwFH9jR4XGUhSLrA1tOxYhDqQgAPvGv2rnJBPZxDn2d94kxvPbgkjheo
	maTrk3bHsr9ddxIC9SdBDgjJGwplAYedjvaWwPmoZbkY9Tsajb29O6pSubaET2D2T1/Q=
X-Gm-Gg: ASbGnctGnZCyiv61R+VkU2ZtB//v+hDgf3iCeVyoUnH8MSc6gAIdbi1jflFEHhunxJL
	2XKnN54yMo2xlWTI9YaAy9BDajVCJYQvSC1IrxgLBMUbGZOvLuDlfnR1BGJ+9jvC+E4P/KyKhqL
	kkUI5Epb0bbnGdFIq2tRWpVTp/jReraQc/a8GKdGoL9Ug35K+HNJqwx2rCSBtGjU8uUEo5n3S20
	DO6NcoXY5afj25fCdAF+GM8MWZ+SANbFwZ8XNBWyMh1Ti+M/7rnE8s2NfgKpaqpo8aN58t2qBlk
	4BIsz5s7SsrKohmYRL7LXL+b3b8d6GWyJwPB/b5LDoo=
X-Received: by 2002:a05:6e02:ca3:b0:3eb:9359:d896 with SMTP id e9e14a558f8ab-3eb9359db7bmr40662695ab.3.1756225460632;
        Tue, 26 Aug 2025 09:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmin04GaruynHXLV3EmAB3AOv0MHqsYH/MYaIx/IC/y7jDBa3d4BpatCwcs6IsDHllI5zy1Q==
X-Received: by 2002:a05:6e02:ca3:b0:3eb:9359:d896 with SMTP id e9e14a558f8ab-3eb9359db7bmr40662465ab.3.1756225460200;
        Tue, 26 Aug 2025 09:24:20 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ec79dabe36sm42903925ab.29.2025.08.26.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:24:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:24:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <nikhil.agarwal@amd.com>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <robin.murphy@arm.com>, <krzk@kernel.org>, <tglx@linutronix.de>,
 <maz@kernel.org>, <linux@weissschuh.net>, <chenqiuji666@gmail.com>,
 <peterz@infradead.org>, <robh@kernel.org>, <abhijit.gangurde@amd.com>,
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250826102416.68ed8fc6.alex.williamson@redhat.com>
In-Reply-To: <20250826043852.2206008-2-nipun.gupta@amd.com>
References: <20250826043852.2206008-1-nipun.gupta@amd.com>
	<20250826043852.2206008-2-nipun.gupta@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XeSWDk4x-zlgJ_cxhUq7-dAYLgT-eoIaQCSUjWXNZLI_1756225461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Aug 2025 10:08:52 +0530
Nipun Gupta <nipun.gupta@amd.com> wrote:

> Define dummy MSI related APIs in VFIO CDX driver to build the
> driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-lkp@intel.com/
> Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> Changes v1->v2:
> - fix linking intr.c file in Makefile
> Changes v2->v3:
> - return error from vfio_cdx_set_irqs_ioctl() when CONFIG_GENERIC_MSI_IRQ
>   is disabled
> Changes v3->v4:
> - changed the return value to -EINVAL from -ENODEV

What are your intentions for merging this series, char-misc or vfio?
Thanks,

Alex

