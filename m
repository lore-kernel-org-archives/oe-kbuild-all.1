Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE4CA51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 09:07:07 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a1d0fee86aso60528267b3.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695805626; x=1696410426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm+CmHkCFmEfa7cbK5Jo56DJl1QMiUb2TNUipR3cFWA=;
        b=y2ig6yR8x8P59fcytrADh4dsiOZCON/4XEZqOFqXeIHnUwKqR4jLfN1fWQjEA9g8eV
         01XT3QOvEsbRfqgRRGMmueRIIkRtXuMGG4/yLzbxgimh4dvmSQ9IFdFn6s4HJ64oxkFu
         IwGx4S1uQ1cJXy9rrSVAQUyilIfMbJphNXGMM91lCSTV9LJG6N7/URZeov3vW5egMT+1
         PHRS76a6wo1CbeXuZPK0C5+5WtE5NyjqpW/6McNShAdUqtT9Z8+6Tdin50mZR/KjqcbK
         qXEbfgJ7S0MLpwVc1mRqw4/3Z6/8c2/5uJpfZDrwoH5rqYq0BoofTj75XCaxtYsOGWhN
         qmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805626; x=1696410426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wm+CmHkCFmEfa7cbK5Jo56DJl1QMiUb2TNUipR3cFWA=;
        b=DfwK5XKhXGeNL8RX+e0T3k/284pW1nzP6S6AsqgDLalBsKI/fHQSYzQ7J0iOWx8Xt5
         fneoNObH0Ng/vomhlLjTl+MPD3cJ68D8eab0UBsLOQT8Rlh2WHWuzwEmRJ8+exeNTISw
         lfFqaDntB8UQSvVwohTxXhGZNENA+RCajGLXb4vXnvCDoIr3sg87lSouT7L6r+vkPTyJ
         qO5C3C5nWjCcAtSWO3HeRHshiGGM2ngw1KsD5lxsAa+GG5pHw8sR9K7zM27nxsCW/tCN
         wDUKEp0vQFsEIrfECcVPXul5G/g1QbuIxEyME0Pjum9HSHZkA9huB9pbMXv5w/34l6H/
         kQXA==
X-Gm-Message-State: AOJu0YxINoCBEmK8stSO6SKGmqDgqpb0zU/OrgDcduyZpDMhSlee7yA4
	ijhnBRMCVL9+eYRuFob5wU43yxefcfXDUgkVIID6PqaZyUt40gWg
X-Google-Smtp-Source: AGHT+IHOJ7uJz9wRRMx9WyJXVRZIxp98VLGc6U0MGhD6EvrOAqvdnUU1XL6wd4Dlp0oFyLPgxgq+FoerK6agjArWnwY=
X-Received: by 2002:a0d:db11:0:b0:59f:5895:6e38 with SMTP id
 d17-20020a0ddb11000000b0059f58956e38mr1693957ywe.4.1695805626721; Wed, 27 Sep
 2023 02:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309270234.aJGlDE0P-lkp@intel.com>
In-Reply-To: <202309270234.aJGlDE0P-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Sep 2023 11:06:55 +0200
Message-ID: <CACRpkdYHUVno_E0iFE_Gxuoszr7TbtnTKaZGcAWz8_cnifwQUQ@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 15/25] drivers/pinctrl/realtek/pinctrl-rtd.c:180:29:
 warning: '%s' directive argument is null
To: kernel test robot <lkp@intel.com>
Cc: Tzuyi Chang <tychang@realtek.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 8:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

>    drivers/pinctrl/realtek/pinctrl-rtd.c: In function 'rtd_pinctrl_set_on=
e_mux':
> >> drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive =
argument is null [-Wformat-overflow=3D]
>      180 |         dev_err(pcdev->dev, "No function %s available for pin =
%s\n", func_name, mux->name);
>          |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~

So:

>    155  static int rtd_pinctrl_set_one_mux(struct pinctrl_dev *pcdev,
>    156                                     unsigned int pin, const char *=
func_name)
>    157  {
>    158          struct rtd_pinctrl *data =3D pinctrl_dev_get_drvdata(pcde=
v);
>    159          const struct rtd_pin_desc *mux;
>    160          int ret =3D 0;
>    161          int i;
>    162
>    163          mux =3D rtd_pinctrl_find_mux(data, pin);
>    164          if (!mux)
>    165                  return 0;
>    166
>    167          if (!mux->functions) {
>    168                  dev_err(pcdev->dev, "No functions available for p=
in %s\n", mux->name);
>    169                  return -ENOTSUPP;
>    170          }
>    171
>    172          for (i =3D 0; mux->functions[i].name; i++) {
>    173                  if (strcmp(mux->functions[i].name, func_name) !=
=3D 0)
>    174                          continue;
>    175                  ret =3D regmap_update_bits(data->regmap_pinctrl, =
mux->mux_offset, mux->mux_mask,
>    176                                          mux->functions[i].mux_val=
ue);
>    177                  return ret;
>    178          }
>    179
>  > 180          dev_err(pcdev->dev, "No function %s available for pin %s\=
n", func_name, mux->name);

I can't see it, what am I missing? Why would func_name or mux->name be NULL=
?

Yours,
Linus Walleij
