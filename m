Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA616D9AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718529158; cv=none; b=GnDzkTlcI8kHik/3kc7oiIl50uftAZL4LmpsprmaLp5ncDymh7fkfvbX1NaNrAfBG7mHBwpqgpESydjn93S3xKE3B86v3DYzsvaRstEZG60O5fPaqTE4i6YQyiymXFi2CaQOsKgS3uBWxX75kAl4aLdS2mNZSPOG2yjjaftnKx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718529158; c=relaxed/simple;
	bh=+z62tjy2vxumRKSsg9vWvPyWHPQ8iFomJ/EHU/Jefjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+B4fctvO393v0fleGPrTpu/pd9zl8m8X6U+w8psbMZ92tyZF6wfMP0OJbu3vzEQO3cfgk0uzxbLiy+v8k3pItXDZeyMRebNYYvtbawEX39pHnPK2Nihldg71dYUAeKRgVFI9ArHdUQY5ytjGX5PP63tORTpE3zvBLBL+UoT9Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-63127fc434aso29165427b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 02:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718529154; x=1719133954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By6v0+YnSgsH+RWah/gSqD/GguB9CLtqyolfWDQlUF8=;
        b=lXBcSYjRXA/+EBzWWP6h5s+SWSdCq7+ICMp6FnKybFauLTrp5zw+lc59bzCM9VoqLY
         DMQbX8ZWGiHEWPDghbreiyfXuui7fjr5/5ZqXnFCTFUZaMrZuq0lLa7pL8tqqhES+FWG
         P3bor9HNMfaW44S73Sdfou2hVi/NvXl2/l7LN2KuQoewRj9x367iANWN/motvCKluxqg
         GlwT8C2fGljC4Zi+bspSTWnxr7X7gmFhmBdxcP8h/XgCwiEK/n/b858/e0y1KolbqOqX
         lyjzj4DoB9WstXdkS1Rm4Stm1oK7he/TkMN06mQ3fHt6X+nJ5dSYvW0+gGw2MFcKg5mz
         M34g==
X-Forwarded-Encrypted: i=1; AJvYcCUjdMHHwGz45fko/Z+xI+9RM7vMCzq2QlSh1nxPoXO06OxDz63zx6jEaIVwgJOXTT+MS8X8qYQT3i1q9+ZwMQODzkD5GP/KpduISp+KsQ==
X-Gm-Message-State: AOJu0Yzd6s/DEBoJYwXZ4eXG+AaKevpGoDxYhAa0Lj9Kou8OL61tYEbz
	jpyYGRll5II1X8gd9r1GFjhko5M46HtDmTPQDizNphVE9sX66PYxZXl6dERW
X-Google-Smtp-Source: AGHT+IGWaxfLG+h9GhAGo8MFtbc+F6BmYe92S4i3wkBZnydKwzgwVwg7+aylfoeCxFwRmO21/GVc7A==
X-Received: by 2002:a0d:d513:0:b0:615:6d2c:2cf6 with SMTP id 00721157ae682-6322470faf0mr56504607b3.47.1718529154042;
        Sun, 16 Jun 2024 02:12:34 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311a446e2asm10370747b3.88.2024.06.16.02.12.33
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 02:12:33 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dff305df675so816594276.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 02:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr1BKf/7bn5G8bYpUK4eN7Nb+DaIovnNLeQbKBshWhd8xn/pKV855xf4Gt0owe3tbo5Zs3zXstdZLXXQLuXvjozMstVD1iBYgvzPPD1Q==
X-Received: by 2002:a25:3dc4:0:b0:dfe:32ba:a877 with SMTP id
 3f1490d57ef6-dff153c36a6mr5976090276.32.1718529152591; Sun, 16 Jun 2024
 02:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com> <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:12:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Message-ID: <CAMuHMdX4VCrV9VPFT5412ccaG7AwqGUH_c-Tcy2NXLk3AapNBw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: kernel test robot <lkp@intel.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com=
> wrote:
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on drm-misc/drm-misc-next]
> > [cannot apply to linus/master v6.10-rc3 next-20240613]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoev=
en/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-=
032053
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9=
b4286967ee.1718305355.git.geert%2Brenesas%40glider.be
> > patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset(=
)
> > config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci=
/archive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> >    depmod: ERROR: Found 2 modules in dependency cycles!
>
> Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
> selecting DRM_KMS_HELPER was wrong in the first place?

Q: So how does this work with DRM_PANIC calling
   drm_fb_helper_emergency_disable()?
A: drm_fb_helper_emergency_disable() is a dummy if
   !CONFIG_DRM_FBDEV_EMULATION, so I guess no one tried to build
   a failing randconfig with CONFIG_DRM_FBDEV_EMULATION=3Dy yet.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
