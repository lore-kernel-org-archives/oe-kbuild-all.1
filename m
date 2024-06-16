Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC68944F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718528922; cv=none; b=FZXFtsYrwOEJ8iosz2K8+Rm0OjltqDCA1nj2BSULw5P0UBjt7Xa68pzXCpNgyKzzV+qTbIMhYVcNjUdUOUoyv9Psh+BO8NY208DcnRcVR4xEV88ut3wTKwdyQmJwgxLUGJ9C1U5WkZTl7IrDoFjHr7bv+V0ffd76hFhE2O7naqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718528922; c=relaxed/simple;
	bh=IXt0T2dIV4D47RVWneFjTLBpb2BX9j6tjpPDQQN7Aq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0RBqj2eVD5ePm68aYp5e6o9xEICFHjDCOk610N376qu096HYO29MktBEOGvD5k/sL8NZ9/0nVzeFRM1Fd/LGjapl0ntR3PbPi7HafGNUiE4yuE9W569jZE9Pd/slC61HPYpaDk+DUPtqPt4dZVpVoRkfUkg4yjnRF43YEwMfs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dff06b3f413so3194749276.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 02:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718528919; x=1719133719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtpOZr/trZtltPf6YFqTeIEX30vShCauXV7YYWeLaM=;
        b=oRUC6Hz72UwJOQZoTbe0pcB9E55xWwOL1xYZ7vfk3H+53vCZGvkZ9s2AN7Vev3sBbS
         suRJkUYYY9VMc4TMivIh6a6GZxbuowdPL9q0LwfGy56V6PeP1XB6+obpETk/g7rA4CnH
         ZIvjn0kKUZQm7cbPxDJcTw8yuZdZ5i1YNlb6s5mmI/NB5p+W6rqk8R+vP95Fp5eSHGog
         wwExjozCVxtwYveTAxBPBoNMwztWaXjRwRZJHDJcooFEG4E7ttULOscbK3Ohv4nIw8W+
         0c+IXhjnPZCupBz4nJh3BJkGmucI4krm/3RbU8h0mxxEbA3YHnMjtwH6ftXrTCyg6/ui
         sXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxZn5ukEeYaGC0Z2QDTaKdq3LNv06cah9wFJ+K9GKXjGO7R7AKqlUdhKEHmveo72b8fr7CXHIDz7mY9wwBZAse4DLwvcBgKHq8Pv5hrQ==
X-Gm-Message-State: AOJu0YzEMcZG2pkxnqXhEy6apsphH/fMXE8juu4l23DSoG+vDyQg7Xf8
	UGle1IaTlaJLOrIEJE0GrDXKvjpZVS4t9Ft/srEwrlQ0E5PlKMvUnU4KKRap
X-Google-Smtp-Source: AGHT+IFj2vmEpzPxVO8QPwqFPOsQoy5r9t3gifcZdELAiOMDgp9uRSbc3HcaOyRwdhjS1sGuicaq9Q==
X-Received: by 2002:a25:8452:0:b0:dfd:bd4d:c0d6 with SMTP id 3f1490d57ef6-dff15354524mr6185062276.7.1718528919426;
        Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dff04876e86sm1271628276.23.2024.06.16.02.08.39
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfb05bcc50dso3435908276.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 02:08:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwWmbBePYfj7uPebe/LzjfTJgSQQBQdBUlvDr0/HWJ+sDlAED9OfSXmDki9UecqeCgrAUSyoAnCCfG6iShC5HIvVqAJM3FJYPaDwScPA==
X-Received: by 2002:a25:fe0d:0:b0:dfe:3e88:3649 with SMTP id
 3f1490d57ef6-dff153abc7fmr6851815276.20.1718528918970; Sun, 16 Jun 2024
 02:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
 <202406151811.yEIZ6203-lkp@intel.com>
In-Reply-To: <202406151811.yEIZ6203-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 11:08:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
Message-ID: <CAMuHMdVvJwEbbEG6_4T2g0sHFyKehkQ81Ekc2Bi65Oq3hvNiDg@mail.gmail.com>
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

On Sat, Jun 15, 2024 at 12:55=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on drm-misc/drm-misc-next]
> [cannot apply to linus/master v6.10-rc3 next-20240613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven=
/drm-panic-Fix-uninitialized-drm_scanout_buffer-set_pixel-crash/20240614-03=
2053
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/3121082eb4beb461773ebb6f656ed9b4=
286967ee.1718305355.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
> config: x86_64-randconfig-003-20240615 (https://download.01.org/0day-ci/a=
rchive/20240615/202406151811.yEIZ6203-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240615/202406151811.yEIZ6203-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151811.yEIZ6203-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>    depmod: ERROR: Found 2 modules in dependency cycles!

Oops, so DRM core cannot call any of the helpers, and DRM_PANIC
selecting DRM_KMS_HELPER was wrong in the first place?

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
