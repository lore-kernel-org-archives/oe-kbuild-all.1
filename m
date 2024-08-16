Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516613A899
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723841843; cv=none; b=eDbgq3hR1VoQd216HO17uKqwfIAH7m76q1e8kDW5VkqTzYQZOtloh7KmSS4L+XlIC0vpfZZybf+NpiJ7vIziH+g58plN3MPzPo2itH2vjh+5WaqG8+wR6ZmVPIusCRZUSfL64fOw9PAgoYyAxonq/Ho0nfxQWAmXECvD8oyEJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723841843; c=relaxed/simple;
	bh=7SP1HbzL5K+OW0ebiyszmUvqttXFUziKG8Wk8fW1/xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By3HJwttxXtxiilx+PoFYHjdzl5CIYMa2OW+6jCnPlfq0IT4MiPP6lW0Hj4P8WWYcLP/afAMGPyjynO9n9kKkIkMAjN57WCKRrkhS5WZKHUd4mbjkZX2ScoL8gB2X5nw4PkjWwnPISPKEujuSBRHr0Z+NpiD1zIibntqYrZKRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBJSV8YH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBJSV8YH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-713dc00cf67so16743b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723841841; x=1724446641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsIivMm/44noRoy/gkZcdnVTe5dyE8L520DECYextvY=;
        b=gBJSV8YHBMkQQzZVPAT1mxj1ixtzRFuLJ+v5opDHf+MxJ1PBmrRVrENlFxvIrtZpeo
         KhYmaSrgimNWG/ZI/2URQMVmFEJmMiltpEAE4LVrPrlMrhIvSiGJBP38sgQ4OpKbxLaf
         WkMOZQOStec6pqZZ2Tm3DRwjldsA0LG0WqcDtz6fzgZrWy0HlsfesBeQoiSN3NNeWmUz
         P3j+ld1J3gmpbloXjokMgbOGdaYbhosqfeONY2i0KZVUUR+w+Df9aStbCik6a26tlk2q
         rKGC35t/TJuWBQhacx91anCRkg74JBTVjLNNLvlF6BZIm/hU5CZuZyQEoqDejoYfEroh
         RdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723841841; x=1724446641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsIivMm/44noRoy/gkZcdnVTe5dyE8L520DECYextvY=;
        b=HTubr/J+oa4//JN5t1G8NrQeZW+HHYzF/XmYjfH6H5zK72oDIuzSsVFBgNUfEee2ND
         Uo1NvrVXScJKRyYLb/JYCjqyroUdp6AuSau8GYm9oP1+lBf6MPblQGkOHAA4jUR0ZtRc
         twyMT8X+53d0+CIklBzB0IADfOc1lfYI4lhAV1AxCfUE3orM3uX6NsLUNlHuNScqfnLR
         POuor+Tx6GiBSr5i+d8/8h7V/DJbrrzrvw45+4nX1QXEAI8X9t6NSOQGzA+83sc2NLdM
         Yz+Z7wG94cni8mFZHC8auepZPpEtDUT6fKVqCZ1DgxpLYDFEmPq7jyFvCFc3LOGz27lw
         7Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+g3EtrRRbo7HlK9x4m44tot0t2XFc7E8rrVJZWIohCF5kTcaqemnEnLrv5fQMVBNHZIDAayq06zTNelReqzb2RQajbt02HzhJ6Je3g==
X-Gm-Message-State: AOJu0YwJPSLM4XQjed/gy1bifLwJiaymN3d1qkauopQiFVy1LarKHtK5
	Zv0J17hlpZGIUUW2gczcaB0is3Klzi/DOewfDHqz/DPReTKVfAYT65GtvW1znmPYskXk3br+GzS
	eGzB6RdPXxWNHY/ERAYHYeIE5yxU=
X-Google-Smtp-Source: AGHT+IHoJOQTzqfb2dX42ndnbhiCwYWlaSqh3MOp7ckz4PAyV7UzPO/MMniS0UAlRLhYKkyGF87KLMkSXx3UN7HFtik=
X-Received: by 2002:a05:6a20:bd1d:b0:1c8:a0c4:2286 with SMTP id
 adf61e73a8af0-1c90507506bmr3555008637.51.1723841840710; Fri, 16 Aug 2024
 13:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
 <202408101951.tXyqYOzv-lkp@intel.com> <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
In-Reply-To: <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Aug 2024 16:57:09 -0400
Message-ID: <CADnq5_NjCFyy+bQY+uyijcZwvwXYkvVLLUQdtzN_ODvHAj193Q@mail.gmail.com>
Subject: Re: [PATCH] video/aperture: match the pci device when calling sysfb_disable()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel test robot <lkp@intel.com>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.08.24 um 13:44 schrieb kernel test robot:
> > Hi Alex,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on drm-misc/drm-misc-next]
> > [also build test ERROR on linus/master v6.11-rc2 next-20240809]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/vid=
eo-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-021357
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alexa=
nder.deucher%40amd.com
> > patch subject: [PATCH] video/aperture: match the pci device when callin=
g sysfb_disable()
> > config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/a=
rchive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >     csky-linux-ld: drivers/video/aperture.o: in function `aperture_remo=
ve_conflicting_pci_devices':
> >>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_dev=
'
>
> Strange. There's a already placeholder [1] for architectures without
> PCI. Otherwise the source file is listed at [2].

So I dug into this, and the problem seems to be that
CONFIG_SCREEN_INFO is not defined in that config.  I can't figure out
how this should work in that case or why this is not a problem in
drivers/firmware/sysfb.c.

Something like this works:
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 56a5a0bc2b1af..50e98210c9fe5 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -347,7 +347,9 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
const char *name)
 {
+#if defined(CONFIG_SCREEN_INFO)
        struct screen_info *si =3D &screen_info;
+#endif
        bool primary =3D false;
        resource_size_t base, size;
        int bar, ret =3D 0;
@@ -355,8 +357,10 @@ int
aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
char *na
        if (pdev =3D=3D vga_default_device())
                primary =3D true;

+#if defined(CONFIG_SCREEN_INFO)
        if (pdev =3D=3D screen_info_pci_dev(si))
                sysfb_disable();
+#endif

        for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
                if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))

But that can't be the right fix...  Any ideas?

Alex

>
> [1]
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/screen_info.h=
#L127
> [2] https://elixir.bootlin.com/linux/v6.10/source/drivers/video/Makefile#=
L11
>
> Best regards
> Thomas
>
> >     csky-linux-ld: drivers/video/aperture.o: in function `devm_aperture=
_acquire_release':
> >>> aperture.c:(.text+0x2c0): undefined reference to `screen_info'
> >>> csky-linux-ld: aperture.c:(.text+0x2c4): undefined reference to `scre=
en_info_pci_dev'
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
