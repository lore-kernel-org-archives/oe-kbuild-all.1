Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671031DA2EB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318239; cv=none; b=ru550jpcf2owiXybaZRszx7UnFGCpdJLXIJKxhJDSCGFxQdzjRVc/R/F0VRsKXzGxCGJ+K9D9X3QwoKHEyA7pTj7EOCN6uBUN41w2ykg2YVQgcBRelTUMkdrwMiRQnn7WsbrT4RQjc+vx0dyqv3onv5OW2Hcxa+zyo+YZta0A20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318239; c=relaxed/simple;
	bh=CSBFQS88igW0jUCGuwCmGf0rpqBIDOAPpzkbjoA0v2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU13f92q/0VtA6dMYPRFw6ZW2NpsPxflCZmSsDqpUnEPPIVwI+CIX78kOWOzPWub1tS8SBnLqjqmMF3PKgEgPIbUDBziP4ZjV1rYdFTJlpx9br9aL4JcPtzS1oCYCj9POSg0Ah2Uls9ABk5QDxuyiRhDXggeu+NWD5bzmGI8ZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCnR8Jps; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCnR8Jps"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a995f56ea2dso110406466b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Oct 2024 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728318236; x=1728923036; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DjhLFwVBpKRr9Z2MwbXlQuaVUI2IN6bC3xXF+EK/4g=;
        b=PCnR8JpsiQK5VFjY/oqlaNW43kIwDsrVQYVujaiZui1V7t+9QFwHLlDr0mmeRl92nj
         t202w5/r+qQadlb28Dl3gkqsF90Mh4+K8J+CZTHC2AVeuc4UPDxPiIT/qQW1X0uSVEvP
         Z2OL+4OL4Cb08QEJvQrBKUaLbfiMz0bt0UE1Z6Br5IJnAIyGbnV8TAsNdhJeQuS9T8cS
         SfIw33WzOcpRNcn7G7puw/u2P7HtENvgVA4ueTHijNxYz6TeKiR3HIa3TmkFWxQtA0To
         7DQ4bjWmNKMyh3gCKz7xt3HqXenzWFbYJEMDbeB99cybgSI6/sFRHWamLOUBUeR7mb10
         6jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728318236; x=1728923036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DjhLFwVBpKRr9Z2MwbXlQuaVUI2IN6bC3xXF+EK/4g=;
        b=cHhenXT/dhPVjx7u4DZdPhau8Zww9vQ7J1m5j1i73IMe/NPuX9pjH1o2ft1frxXTA1
         iHJOlPFHJ+N80EqskRtYna9MxaNGmxFzldUTCjc16AP1aaHy/7dlRinsddJMOIBcYoMZ
         ayAhB0LwYXb4ldmpE5Th96d9thgd+fo9czGjGm0EqMnD84iXLn//5oKoglnhkPU/R3qj
         Vr8hLU8uX83NagQrICfztTxSGWKR57VUfcvx1YorH9igwnEgx0PbuI93bS2g5CfCBDF5
         HmA1gvTMB76gQ9CV/+qpq4a9zaW8rb+7/4YJd0bZP9nBRn4Wg315OYr+gvUPgOfqDzdI
         Uh/w==
X-Forwarded-Encrypted: i=1; AJvYcCXHcW0W3LgPxJIC8Gp3x51dH43TiWXWMO9m0OjKFEVJzbY8cZLelLkwgvyYBXd3b33L3LesOuqIosX0TLRY@lists.linux.dev
X-Gm-Message-State: AOJu0YzYOlr+Y3V5DES/NTfu36uQxUhCBW4zC3S+u2sPAG9kNvhWLdXz
	ZaOZgCdk7uxClEEnkFfNJuNbQ54ZE9RwrWlBOIL2RX5vn/mZXV/QNBACxFdeuxtwmzv5CKSDrUL
	0qj9Pcudp64ruAYjQkLLVlr8EhgfivXPOZwU1DA==
X-Google-Smtp-Source: AGHT+IEhWSRFZqVhC3rbl0UHvbwLLLlpn38m/GYhWm2qL50BAg4U+z5JzqqQw152dm0AYm6pv3+IQ51UGtTJYfZ34DY=
X-Received: by 2002:a17:907:a0d:b0:a8b:ddf4:4701 with SMTP id
 a640c23a62f3a-a991bd47985mr1349645766b.16.1728318235289; Mon, 07 Oct 2024
 09:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003120655.53663-1-vamsikrishna.brahmajosyula@gmail.com> <202410060802.Ln9ygpuY-lkp@intel.com>
In-Reply-To: <202410060802.Ln9ygpuY-lkp@intel.com>
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date: Mon, 7 Oct 2024 21:53:43 +0530
Message-ID: <CAJvTgAg-8RYjo9Rapor86G5o10aTws7B1NmZVuN64KRy5kjzWg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW in setcmap_atomic
To: kernel test robot <lkp@intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 6:31=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Vamsi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7ec462100ef9142344ddbf86f2c3008b97acddbe]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vamsi-Krishna-Brah=
majosyula/gpu-drm-set-gamma_lut-or-degamma_lut-based-on-HW-in-setcmap_atomi=
c/20241003-200835
> base:   7ec462100ef9142344ddbf86f2c3008b97acddbe
> patch link:    https://lore.kernel.org/r/20241003120655.53663-1-vamsikris=
hna.brahmajosyula%40gmail.com
> patch subject: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW =
in setcmap_atomic
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241006=
/202410060802.Ln9ygpuY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241006/202410060802.Ln9ygpuY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410060802.Ln9ygpuY-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
Based on the kernel bot compile failure I received,
> >> ERROR: modpost: "drm_mode_obj_find_prop_id" [drivers/gpu/drm/drm_kms_h=
elper.ko] undefined!
I realised I can not use drm_mode_obj_find_prop_id in setcmap_atomic
(in atomic context).
I am exploring atomic functions which access gamma_lut and degamma_lut
via state.
I will send a v2 with a new approach.
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
