Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23390CA76
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpIf9vFJ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cc4e15605aso29875461fa.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702884812; x=1703489612; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW35qmP+/wtz3L+npU/IJLY/6oTtrrAjtbp/uv7+Jys=;
        b=hpIf9vFJi5O++qFumFEkz82tnVNN1ZMEm8wEO6Mj18beFtS+OYZpYrK3t6JN2GdPh8
         DQc0Qz88NA1JZE9Uv1mIwFRtyl1B/ACCm5zpYNtyejmstvI8eUmmzT4MpZ6i8+WDhKvs
         i9pqNdzf+Y1HH/L6nDltON62ESlMLwHOicXbeCTfYx+Rj59DQOCEvD8mzP8cwlZCeZfc
         0WbfhVCDXybUq7jjtwNyswRMQXCGtJKctucESsqewKAM9oGiiztQHvN3+fZkJ+FY+Nc3
         atxgp8y9kVTfLneK9wYS5Dz3qSoCgdUQx4u2lYifIut8EFfAfvAVZ2P00PUiw+z6QYoW
         ezTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702884812; x=1703489612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZW35qmP+/wtz3L+npU/IJLY/6oTtrrAjtbp/uv7+Jys=;
        b=PPewblpyAzRM1lnLWBis+8v2+POqb6EfgGTnZ+TpbDnSZzfYfOWxHffnozw4wtibkz
         /lHqueXv1UXD8CH710NLsRH+cV7sghpjPN4gp6gFhT3PyMnn9vfzeAlFPai9Lv3vPxBs
         hu31i28d51pGDEFYcvzqk6XY1n806apMqywvH3Z1ERhhFblgNXLnMtaWK72tBjDj25at
         ZUnH3hvZvHXerWZ1cpk5eO8Tjukhb6tUtOlmO5490JFF2czlMXYz2NYrYMkzSHxtpyJ/
         Tr1I8GDv0mJl0y2+BIbHkI2jAtpIuWVrrtBTTT/IXqh66ke8seVCgT9VD7fIul8j397r
         MIfg==
X-Gm-Message-State: AOJu0YwyjTxq032hO2sN7RzMIADmLAndChjQgYB72/84Qw4elzBEj5I2
	rFQusr7awbBkqQi5+tg0uEUvePS8tXxcsrXmlGc=
X-Google-Smtp-Source: AGHT+IE3jhEJQTtgRuyQSQT65Bnsv/gL+cwN9Cf6aIbtje89NRVtzKewiAEPwVWURaUWZGAQp+VdskvIfhqDCwU9FBU=
X-Received: by 2002:a05:651c:1503:b0:2cc:1c71:aff8 with SMTP id
 e3-20020a05651c150300b002cc1c71aff8mr7349269ljf.97.1702884811917; Sun, 17 Dec
 2023 23:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312141227.C2h1IzfI-lkp@intel.com> <20231214172541.48370-1-rymcclel@gmail.com>
In-Reply-To: <20231214172541.48370-1-rymcclel@gmail.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Mon, 18 Dec 2023 02:33:20 -0500
Message-ID: <CAEVj2tn+=T5mSZ5bN=GMyh-dtxfdhMEEPPrXCJR+JfhNJ=Wa3w@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: fix initializer element is not constant error
To: Ryan McClelland <rymcclel@gmail.com>
Cc: lkp@intel.com, linux-input@vger.kernel.org, jkosina@suse.com, 
	linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	benjamin.tissoires@redhat.com, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Thu, Dec 14, 2023 at 12:26=E2=80=AFPM Ryan McClelland <rymcclel@gmail.co=
m> wrote:
>
> With gcc-7 builds, an error happens with the controller button values bei=
ng
> defined as const. Change to a define.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@i=
ntel.com/
>
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 44 +++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 47af111ef3a2..2987083785f9 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -336,28 +336,28 @@ struct joycon_imu_cal {
>   * All the controller's button values are stored in a u32.
>   * They can be accessed with bitwise ANDs.
>   */
> -static const u32 JC_BTN_Y      =3D BIT(0);
> -static const u32 JC_BTN_X      =3D BIT(1);
> -static const u32 JC_BTN_B      =3D BIT(2);
> -static const u32 JC_BTN_A      =3D BIT(3);
> -static const u32 JC_BTN_SR_R   =3D BIT(4);
> -static const u32 JC_BTN_SL_R   =3D BIT(5);
> -static const u32 JC_BTN_R      =3D BIT(6);
> -static const u32 JC_BTN_ZR     =3D BIT(7);
> -static const u32 JC_BTN_MINUS  =3D BIT(8);
> -static const u32 JC_BTN_PLUS   =3D BIT(9);
> -static const u32 JC_BTN_RSTICK =3D BIT(10);
> -static const u32 JC_BTN_LSTICK =3D BIT(11);
> -static const u32 JC_BTN_HOME   =3D BIT(12);
> -static const u32 JC_BTN_CAP    =3D BIT(13); /* capture button */
> -static const u32 JC_BTN_DOWN   =3D BIT(16);
> -static const u32 JC_BTN_UP     =3D BIT(17);
> -static const u32 JC_BTN_RIGHT  =3D BIT(18);
> -static const u32 JC_BTN_LEFT   =3D BIT(19);
> -static const u32 JC_BTN_SR_L   =3D BIT(20);
> -static const u32 JC_BTN_SL_L   =3D BIT(21);
> -static const u32 JC_BTN_L      =3D BIT(22);
> -static const u32 JC_BTN_ZL     =3D BIT(23);
> +#define JC_BTN_Y        BIT(0)
> +#define JC_BTN_X        BIT(1)
> +#define JC_BTN_B        BIT(2)
> +#define JC_BTN_A        BIT(3)
> +#define JC_BTN_SR_R     BIT(4)
> +#define JC_BTN_SL_R     BIT(5)
> +#define JC_BTN_R        BIT(6)
> +#define JC_BTN_ZR       BIT(7)
> +#define JC_BTN_MINUS    BIT(8)
> +#define JC_BTN_PLUS     BIT(9)
> +#define JC_BTN_RSTICK   BIT(10)
> +#define JC_BTN_LSTICK   BIT(11)
> +#define JC_BTN_HOME     BIT(12)
> +#define JC_BTN_CAP      BIT(13) /* capture button */
> +#define JC_BTN_DOWN     BIT(16)
> +#define JC_BTN_UP       BIT(17)
> +#define JC_BTN_RIGHT    BIT(18)
> +#define JC_BTN_LEFT     BIT(19)
> +#define JC_BTN_SR_L     BIT(20)
> +#define JC_BTN_SL_L     BIT(21)
> +#define JC_BTN_L        BIT(22)
> +#define JC_BTN_ZL       BIT(23)
>
>  struct joycon_ctlr_button_mapping {
>         u32 code;
> --
> 2.25.1
>

Thanks for the quick fix.

Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>

-Daniel
