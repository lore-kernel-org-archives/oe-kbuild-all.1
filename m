Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4E8154C19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 13:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724074622; cv=none; b=VZROEaPM5T00FuEZ9B6+YPiqvjuM0ifS/dvYoMMG/sCkKn04cyV3fkzKUep9sQSJNb3yTLgkjN79thXLPbb0+UiRZa6+7vl20MYIYZcBjS9RGS6HXL7mgL1IjAZOoHBwqVOjw32Lw/bej+VW877pUJKeqJDYOf0u3GHa2T2Dbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724074622; c=relaxed/simple;
	bh=sn7LNfbqx9iwvxJPTRlzvVhNsiV5bluAJG4Veg4ysfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XHSC5szLTLIfyonFQ1zyPjpldjqn9h/x00LkV9IomrsEo4QFctWZPC82+PPro1SlZofmjO+TtfHtUmu9l5n9qfa9aYGBVveUkwlamK5KBy+sNQTG90rtgZHIKGgw9r1Eiun8N7YdqqkSkJJ98NGuI/hGhcWzTzDYX3k/z+YIAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGEu9kzk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGEu9kzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724074620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Py1nKUzAfM/OTvIy7L2sYTr0+ohPDjRTycpz1UnhWhw=;
	b=dGEu9kzkC6nhvReK49yhAw2dsZqr9bYjrmvAzU9oJryRmNtra9RwzrwT6tTIHre4Cletk5
	OC6/kN46IZkXuJRyZQ1cE5T2SgNQA6/T11JIH8WVVMghd4d6rg4tSA9iEPRvXgQSuJE/7B
	VSXXUWTpXgOz9D45R4VvFkP/nGztK/M=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-OI3vW_9wNKOeSiGZx6dpPw-1; Mon, 19 Aug 2024 09:36:56 -0400
X-MC-Unique: OI3vW_9wNKOeSiGZx6dpPw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3db2017a251so3915845b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 06:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724074615; x=1724679415;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/iJNM2H0Bn+mH5epT+OXY9z51A/PXnyvIAFT4yJMBs=;
        b=AtKbYVDWj6UKYpTvSbaOsyyndiv6OmWUuWJ9WQCDO3HbghIwLJvgKbztGNFR+j4/6T
         qF7NGQpDQK/ERGfu8qj+5H5QFf3ShdwxB/ARrfdZj47aktfVV4vrjfhK9oUUtRDQlz7D
         SSGJB70jUbZbY0hoTUy8nqSPzMGF44D+QZN6UA2QBjbtdAYUEOu4R6F5rVQGohGkDeRc
         oRV1v53d9ONYkUkgeyKzh4IpnAJef1SGXhv3PfBTSIxebF6zh4JFXEmo+jrSdtTRaWtT
         8I0d00eCy8Q8neArmho4z/1APjf2IBjNy/kP1bllWJMOGa0IQKryBfvd5tJK/owENiGK
         ND0g==
X-Forwarded-Encrypted: i=1; AJvYcCVgEchm1hcJy7ycKRWL1ptofJYt/V+N22pXwgwFh0CTfHY3w96FHqK2IReJKVaQb+zlDZnLJFN5Y2pg7Yxxmw3qEC3CFo0xVshOq5JtjA==
X-Gm-Message-State: AOJu0YxsuQPhOXXItPGehZ6m0tM1d0M4MOUjh0ihUJ/98vKpwSObSgxR
	3vtLfSHq4iwpSNBBBI3s0YMvb4cZNVt63mAAK5p3cBe/gNmQ5SWIBxaEeAD6OPSXyCsrlzhZY6U
	eNjMv9CvLXkgk0tzRsPKQCSHETxwZZdoTELXs0a6wV/zU4VVwHOUfGVnvrvrpTXY=
X-Received: by 2002:a05:6808:148a:b0:3da:e219:bf with SMTP id 5614622812f47-3dd3ae320edmr14893351b6e.43.1724074615342;
        Mon, 19 Aug 2024 06:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPpaKdjs9uyeLCpbyaYGw5neC/R9XgXicCaeDNO0oBOnU3UKv8pW+3H0tiVsMRwweNVZ2MzA==
X-Received: by 2002:a05:6808:148a:b0:3da:e219:bf with SMTP id 5614622812f47-3dd3ae320edmr14893327b6e.43.1724074614976;
        Mon, 19 Aug 2024 06:36:54 -0700 (PDT)
Received: from localhost ([181.120.144.238])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61a6dcfsm6585022a12.7.2024.08.19.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 06:36:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexdeucher@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Helge Deller <deller@gmx.de>, Sam
 Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
In-Reply-To: <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
 <202408101951.tXyqYOzv-lkp@intel.com>
 <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
 <CADnq5_NjCFyy+bQY+uyijcZwvwXYkvVLLUQdtzN_ODvHAj193Q@mail.gmail.com>
 <8bbf3f92-3719-4ff4-9587-e076635758d1@suse.de>
Date: Mon, 19 Aug 2024 15:36:51 +0200
Message-ID: <87frr0ljm4.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Alex and Thomas,

> Hi
>
> Am 16.08.24 um 22:57 schrieb Alex Deucher:
>> On Mon, Aug 12, 2024 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
>>> Hi
>>>
>>> Am 10.08.24 um 13:44 schrieb kernel test robot:
>>>> Hi Alex,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>>
>>>> [auto build test ERROR on drm-misc/drm-misc-next]
>>>> [also build test ERROR on linus/master v6.11-rc2 next-20240809]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note=
.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/vi=
deo-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-02135=
7
>>>> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
>>>> patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alex=
ander.deucher%40amd.com
>>>> patch subject: [PATCH] video/aperture: match the pci device when calli=
ng sysfb_disable()
>>>> config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/=
archive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
>>>> compiler: csky-linux-gcc (GCC) 14.1.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-=
lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>      csky-linux-ld: drivers/video/aperture.o: in function `aperture_re=
move_conflicting_pci_devices':
>>>>>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_de=
v'
>>> Strange. There's a already placeholder [1] for architectures without
>>> PCI. Otherwise the source file is listed at [2].
>> So I dug into this, and the problem seems to be that
>> CONFIG_SCREEN_INFO is not defined in that config.  I can't figure out
>> how this should work in that case or why this is not a problem in
>> drivers/firmware/sysfb.c.
>>
>> Something like this works:
>> diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
>> index 56a5a0bc2b1af..50e98210c9fe5 100644
>> --- a/drivers/video/aperture.c
>> +++ b/drivers/video/aperture.c
>> @@ -347,7 +347,9 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
>>    */
>>   int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
>> const char *name)
>>   {
>> +#if defined(CONFIG_SCREEN_INFO)
>>          struct screen_info *si =3D &screen_info;
>> +#endif
>>          bool primary =3D false;
>>          resource_size_t base, size;
>>          int bar, ret =3D 0;
>> @@ -355,8 +357,10 @@ int
>> aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
>> char *na
>>          if (pdev =3D=3D vga_default_device())
>>                  primary =3D true;
>>
>> +#if defined(CONFIG_SCREEN_INFO)
>>          if (pdev =3D=3D screen_info_pci_dev(si))
>>                  sysfb_disable();
>> +#endif
>>
>>          for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
>>                  if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
>>
>> But that can't be the right fix...  Any ideas?
>
> Thanks for investigating. I'd say we should pass the device (pdev->dev)=
=20
> to sysfb_disable() and=C2=A0 do the test there. In sysfb.c, next to=20
> sysfb_disable(), you'll find sysfb_parent_dev(), which gives the Linux=20
> device of the screen_info.
>
> The code then looks something like this:
>
> sysfb_disable(struct device *dev)
> {
>  =C2=A0=C2=A0=C2=A0 if (dev && dev =3D=3D sysfb_parent_dev(screen_info))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
>
>  =C2=A0 /* else do the current code */
> }
>
> there's an invocation of sysfb_disable() in drivers/of/platform.c where=
=20
> you can pass NULL.
>

Agreed. That sounds like the best approach.

> Best regards
> Thomas
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

