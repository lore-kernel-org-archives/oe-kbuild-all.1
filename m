Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4983219F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718462045; cv=none; b=r5ArONLCpgwwVBlXCG/OVZYRGKYbkrYfEu6GBCAcBCg3OqvmH7qU/QhAyGFKrQzKhfaxVMlsZT3lG6RRSXb0spDngXQ4ggOR86FdGX/n3H2bbGMwsvFa4MHC+9h7Pyzp0hFfE7XwtKGz3NEj95fGjrYaPY+UuLjhkfkXPEh+6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718462045; c=relaxed/simple;
	bh=wUZ38S4ZuxVqieN4UmFB71GK3eHrGdHmsxZZYqpHpKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmDFMk5ROjzbfXVc8IKKNAbFX9G49DbAAicz6wicAd/STkbIuHrIhCurPOrfLDCIy1Yhsf2XUexbxEIQfhPIIKJAGHmh2nNKE7+bhGJrqTaTYAdHpYVITqrVJt1Yyydd3vR00vANntrhFEuF0OgIp5GTMIu4t/y1zSpnul6fD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XesT/Xhr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XesT/Xhr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8973740E0218;
	Sat, 15 Jun 2024 14:33:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bX2TYO_bIYyc; Sat, 15 Jun 2024 14:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1718462035; bh=oVaEk+dXYvf+fWg/6/lea+PK2ojpwPj5LmoJ72jXxkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XesT/Xhr4wT597myLesiyRD662YO6mo3w8DtOhi9PyGzbYXy+zIzdyrXSVidrToyH
	 lnfYjusMQxrUz6ybm1yUq8EFIEQBO9xOV+73ojl+wH92kwnGP0tLaoh4qjE1abpZ59
	 emM2T/0gSEmemdVeXvZ05Kcqr22TeJhAdr7DuTO0nlt+asI2yk5ynF680eO+QawWan
	 pEbSF+VJ1H6z6+bSANOA7Y796VGkB5zxtks+loku/TwCvQTo11SPzNyLiUUdFxA6Rh
	 r6O3DPFFthciHfz/ZotvZoOZClyYn/byim3BtfUM6fcoKPxLZVWKkgoK5vGzwJljhC
	 S2YoqRjqXOKIHiNvm+MHmLEkqebnYBuYjJXdCTqOOW6Uyl4buVaaXP2l39ad4hwQm3
	 iBmdpdmGhBhtYwdRLVv0deaQHHxU0Dj1Zs4M4v8RZZGYlD3Ro+iRb6YeHy4sISDYzs
	 2rL4xZCv2IqO9tfVbPcTgZ4UZWKuFSig2i5PmSxNjbpaso9nTZG/Zu3AYhQtWW8bs8
	 PNMjYdxlWb5TLUtmbnECSnTVRzPI2t1gNKQLpoOxrL60hb66fw8ueXZqP61CQO6bCs
	 Nbl/IVFF3iXQzIZL/XqfPwa9C2825O3cqYPSThgqqmVyJTYcaEppc1hpzrkShN6lFX
	 Hh9rkjSCCG7/5P9DhTdxswE0=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7920240E01D6;
	Sat, 15 Jun 2024 14:33:50 +0000 (UTC)
Date: Sat, 15 Jun 2024 16:33:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:x86/vmware 4/8] vmwgfx_msg.c:undefined reference to
 `vmware_hypercall_slow'
Message-ID: <20240615143344.GDZm2mSB-qyB0Vt28Q@fat_crate.local>
References: <202406152104.FxakP1MB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202406152104.FxakP1MB-lkp@intel.com>

On Sat, Jun 15, 2024 at 09:22:00PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/vmware
> head:   ef08e7dc21307b226b5280d5e8cfea687bfd2866
> commit: e5ac9008b79c59235c34494e555419665022f5e1 [4/8] drm/vmwgfx: Use VMware hypercall API
> config: i386-buildonly-randconfig-002-20240615 (https://download.01.org/0day-ci/archive/20240615/202406152104.FxakP1MB-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152104.FxakP1MB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_open_channel.constprop.0':
> >> vmwgfx_msg.c:(.text+0x203): undefined reference to `vmware_hypercall_slow'
>    ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_recv_msg':
>    vmwgfx_msg.c:(.text+0x46f): undefined reference to `vmware_hypercall_slow'
> >> ld: vmwgfx_msg.c:(.text+0x49c): undefined reference to `vmware_hypercall_slow'
>    ld: vmwgfx_msg.c:(.text+0x4c3): undefined reference to `vmware_hypercall_slow'
>    ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: in function `vmw_close_channel':
>    vmwgfx_msg.c:(.text+0x580): undefined reference to `vmware_hypercall_slow'
>    ld: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o:vmwgfx_msg.c:(.text+0x729): more undefined references to `vmware_hypercall_slow' follow
>    ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_read':
>    regmap-spi.c:(.text+0xf): undefined reference to `spi_write_then_read'
>    ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_gather_write':
>    regmap-spi.c:(.text+0x2b4): undefined reference to `spi_sync'
>    ld: drivers/base/regmap/regmap-spi.o: in function `spi_sync_transfer.constprop.0':
>    regmap-spi.c:(.text+0x337): undefined reference to `spi_sync'
>    ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_async_write':
>    regmap-spi.c:(.text+0x445): undefined reference to `spi_async'
>    ld: drivers/iio/dac/ad9739a.o: in function `ad9739a_driver_init':
>    ad9739a.c:(.init.text+0x10): undefined reference to `__spi_register_driver'
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for REGMAP_SPI
>    Depends on [n]: SPI [=n]
>    Selected by [y]:
>    - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])
> 
> -- 

Zapping tip:x86/vmware from the tip/master lineup for the time being, until this
is fixed.

Thx 0day guys for reporting.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
