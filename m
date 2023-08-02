Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC233E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 14:51:46 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso925679166b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Aug 2023 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690987904; x=1691592704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRsiMyy83ll7ZxD3exDSOM0mCfjRFxM0+ANJLzPtR8E=;
        b=aMaI3QcvZGfm3AQNtxQUwoGw8eJbgKYhC7PZPJMmLoUL2jEr42i+/cj2xJfWDi0vgx
         sHDLmfPQpJrFUwKWAlOsknukj2MF48HEpvG0caNShjXyOLYcYDFJ1DuDubRauWhqNvVA
         d8vwkVeBZhwe+KR3N4lcDlWAeHn0duImmaZFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987904; x=1691592704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRsiMyy83ll7ZxD3exDSOM0mCfjRFxM0+ANJLzPtR8E=;
        b=SCsMLvbYhPdetunldI8i+EiJb38PYxMgp/KgQGOQySOfBlNvOMLbN+kNEG6N7sHRN/
         OknoewfT3usKP5bfK9tA6mRNuexKBqpnh8yVOS2l8wQ+pn0CsHVpJ5p6heF7N7egkvcB
         etYdf3giz8Pcap2Qt1zQxoxnGwbEfDX99u/xOBPf8KfsAsUeg1ACOOsk0Z2wZyOBmaSo
         vIa8JmU/LRoV3Rapyj4whTRYzRM2/6u6KVwYHaZDtBR+tIL1iFSzwUKyRIr4SW2XUXSU
         BDSMmAXLqp74I6PHvfp18bEKRycgxseF0R+SCxbY28vAGo6Ntzv0cMQvvQqmf+jlJP2u
         wIrA==
X-Gm-Message-State: ABy/qLY8bX+DgxpEkpWG9yfypfMWpseGVKteTyat+eUFi+jlTIHEEAk6
	bGqOhlTWiuEF/oS10HmDD/O6WXI/FV9KttHgI6foPPUi
X-Google-Smtp-Source: APBJJlEvJ3Jrz2r0jPM7KYkWeOUgSCcVROsTncucAW2GVcKMiDh7L4KcaYqKEv+RXUCkZWu/elQs9A==
X-Received: by 2002:a17:906:101e:b0:99c:5708:cbf3 with SMTP id 30-20020a170906101e00b0099c5708cbf3mr235850ejm.28.1690987904149;
        Wed, 02 Aug 2023 07:51:44 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id ke16-20020a17090798f000b00989027eb30asm9176070ejc.158.2023.08.02.07.51.43
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 07:51:43 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so100295e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Aug 2023 07:51:43 -0700 (PDT)
X-Received: by 2002:a05:600c:1c90:b0:3f7:e4d8:2569 with SMTP id
 k16-20020a05600c1c9000b003f7e4d82569mr347125wms.5.1690987903338; Wed, 02 Aug
 2023 07:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308022221.APCRi7vk-lkp@intel.com>
In-Reply-To: <202308022221.APCRi7vk-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Aug 2023 07:51:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vj5t2tPUX31rn1EjZcH10UGHN+AUov7N9xy6R7_VZWMQ@mail.gmail.com>
Message-ID: <CAD=FV=Vj5t2tPUX31rn1EjZcH10UGHN+AUov7N9xy6R7_VZWMQ@mail.gmail.com>
Subject: Re: [linux-next:master 5684/6443] htmldocs: Documentation/gpu/todo.rst:469:
 WARNING: Unexpected indentation.
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 2, 2023 at 7:43=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   626c67169f9972fffcdf3bc3864de421f162ebf5
> commit: d2aacaf07395bd798373cbec6af05fff4147aff3 [5684/6443] drm/panel: C=
heck for already prepared/enabled in drm_panel
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022221=
.APCRi7vk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308022221.APCRi7vk-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.
>
> vim +469 Documentation/gpu/todo.rst
>
>    465
>    466  In a whole pile of panel drivers, we have code to make the
>    467  prepare/unprepare/enable/disable callbacks behave as no-ops if th=
ey've already
>    468  been called. To get some idea of the duplicated code, try:
>  > 469    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>    470    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
>    471

Thanks for the report. This was reported by Stephen Rothwell a few
hours ago. I just posted a patch to fix it.

https://lore.kernel.org/all/20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87=
b1ae198a857@changeid/

-Doug
