Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4311FDA61
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997998; cv=pass; b=F3sxzVhjfmKm02zeIPq9NgSfQoVsapgEUMSO354FrytM/eOzVUozWRvtJ0s9P8WzxcdC0V9AkBupPzXGQJ/zp50Hsr6CUc01LIwEL7MOrdPhMbyCgW0YIr9nFA88ko8Yk9Ztt+pz/ZQABriyOl82aZUaUPot1db8zJtaJsCj+Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997998; c=relaxed/simple;
	bh=cZHOuyFSDD0YCiUahnVWqH20bORv4bma4nfHULxUbNM=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHkct9WXeobkJ1n3g+n+R2odKHNOPw6n7O657FmtAaRZbkuK/EZkHv04zsldqqust1dEjovk+kwC4OiV1rw+l1W3J7Ze3Qdk343s2uccKUFfN7/zzfMMURedKB5nYiaogANwslz4O/1wLB3Qpl4ykQ3WEdseD3nalw/OMViinE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=bgHyg5iP; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="bgHyg5iP"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-790b7b3e594so39384967b3.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Feb 2026 18:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769997995; cv=none;
        d=google.com; s=arc-20240605;
        b=POyML3+0Ec7wWKmWzyPyJiB2g4Yhgy9UyWJ+qg6KkmgvJ8ntlKmNKNOlw6IoCmblTf
         x+T0JPdVclgvHP2SC0bPyqBZlf1Gr+JGxUBy6UMGgjLlA4+CLE6TlG/VvFSo8oZvjKGH
         nucLM+oAFkrBDze1xRZxWIVPSJ0BW15VfZIksLgiLbwQq4r+xT55L5Rf/nkBec7KAW3Y
         M+YC7f1E9XjgNJDuI31LnCnzrONfyOwboWHSjQueV8VlzyfDCN/rkIhE5tPdVw+bQFg0
         9ecMledn4j0/hVr8KDHrjifTvH5OaK7/HV1fcKzMAJ6xgj9OOJ+96QQrUkXG0ruFLkN1
         YI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:dkim-signature;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        fh=MdRLj37UIsiA+YVjIjE4my5tWSVbuigZoajUUjiY1JM=;
        b=g8ql9RwH33K6iMoCdJ/ed80f+bBmFALUSjZYf6rkOwRFK9MRAJ61q2LLPzp7tcW6kY
         IfgX7FBTsw32iltUI/Ag0C8DjW824Q8X3rYY3eWvij+YDpsYwZsZuYHJcVvPDNA9CIBN
         uqvV3ccl6NUXMzFE97pJjOAC0hjG6cNCMM2FVcPnLEDzmBZwJib5BlUI2P8E7s9fdHxd
         u4wivFDQPaVCufAzdvW4kYjiUa2WwcJg6d452cf9ExpZY8hNWFggFjmutObbVufVFFrT
         xFybK8ZZiP5769njBYlUBljQuwxCkwOcr9/mi9tPEEyJYgEEjvTdZ1hQrDf4XgFOaRA5
         XjKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769997995; x=1770602795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=bgHyg5iPxcHz6bEaeXaLbSk/iPXuI5jm9GEaNtdeX9sZPllwAFjazferJbx/IgDP4s
         /VM0yj3z4RpPZ4iFgR0BxVTqBvMO1krDMBA9OCJDeXkMcNxerd8NNyZbz7vWfXAa4l/d
         F8eBjgQcehSxrJcBbwkRGBoG2nMmi0M04wY/EceUrO/nl2e4B84rswSK48XQvV4P0W2R
         imG5hqd93dDhUlfVDjNDWC0GFcd1uAo0kUyv6CVu03bjVGlk8S2IlTP5eDCXP7FNq/7p
         E5VnWQ2BGeodJiniBeNlWd+B7Cyw6AaTce+OO7jAxzFL9Up3dm8l7K0hLSXQiwceuyoC
         gXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997995; x=1770602795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=xESf+QxldkMhqOuYexCRfy6wouii6cPFhCBWJk3aAdS5DdI4zLSFCQfxNdQlV8mwkP
         rMDxl1l8weM04WwcC5WFIGhFKDxDVUD6qZ98I7iRBR5ySIPhEHIN+Ho8W+5SeexBoLNk
         qSk5iEU8IU/8axpiZ/vEuQTHDdl8NF9T+RWoA/aExAvRBGlF/wKCwgcKhbMbrUQGebmf
         I6omou+afsikSXr4p+3D6dHWgVKXNNw70jYurEq6lsznWgbzWjYNPeNnSVSNYH3WCGJf
         VZauEBIHQjmOIS7/IuagtYNYaqUT9wFdWKT6vqaM/RO4RS0jY23bkTlxBjCsD1ro2F3r
         6I+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4UCTy5ZqvL/157OK8ZwbdQlnqz0PR4dEMqcSlyFc5hAso0pB7/DoKHKosvhIZHcl7BrytgIzTYWggBl+V@lists.linux.dev
X-Gm-Message-State: AOJu0YwbpgKliw5rdMG7xVqvc9Wk/jbuOlMyvsieBbCw2Tr4fI+J32r/
	aR0mCkbcWL7jgBXR+HARVRtME/IlFX/6gLNBAv8ocQR34ymdJdJ1sa44mqPd6uP+wOKBSemyYnv
	a8Q+JiQNuhlfq2bVedgWvO1/gBQbusn5FMF6t7plPYQ==
X-Gm-Gg: AZuq6aLTfb7XW7cDj8XPyweB7SDUiNOo6i3cY6wV70eOWz2/KrWKwp158WIjtuIPQwq
	P2X4HrhEuNp/P3AEv3zvaz6vEiOYWZXgyLyWVogd9cPvjxn1oxtGF+XzzQ0SHBE5ZB4GyAhdrU1
	8yPYRU8VzfNd0h/+mHuZ25XAYxWfRiDd/Ws/xsMw+dsbkIJ/zI/0Ehe6uHJHL0vdfYsTCj4ll2W
	42Q/B18YWiSmBSUyU2rUbZtALR6Vy3CfzjVb/BXy8iBE35qCHtCuvYKyaH7BS7mLFeBmkLO
X-Received: by 2002:a05:690c:e3e1:b0:794:198e:943b with SMTP id
 00721157ae682-7949de7f6bfmr88706007b3.8.1769997994805; Sun, 01 Feb 2026
 18:06:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <202601311615.10yziOui-lkp@intel.com> <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
 <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
In-Reply-To: <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
Date: Mon, 2 Feb 2026 02:06:34 +0000
X-Gm-Features: AZwV_QgA40VM4P6w_-3GskOG6YPGtVtQKONh5VU7M0VmOxyGKRkaTPHiN25oam0
Message-ID: <CAGYn4vxTAJwO3GiKmRtD1gTit-Wm4VOMnxZPxUfUJ0JEwj8dEw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun Feb 1, 2026 at 10:23 PM UTC, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Jan 31, 2026 at 06:14:58PM -0800, Abdurrahman Hussain wrote:
>> > On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>> > kernel test robot noticed the following build warnings:
>> >
>> > url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hus=
sain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/2026013=
0-054653
>> > base:   63804fed149a6750ffd28610c5c1c98cce6bd377
>> > patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e43=
4897ef%40nexthop.ai
>> > patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
>> > config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/=
archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> > smatch version: v0.5.0-8994-gd50c5a4c
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > | Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.co=
m/
>> >
>> > smatch warnings:
>> > drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_=
get_sync() also returns 1 on success
>> >
>> > vim +1539 drivers/i2c/busses/i2c-xiic.c
>> >
>> > e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void =
xiic_i2c_remove(struct platform_device *pdev)
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device *d=
ev =3D &pdev->dev;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct xiic=
_i2c *i2c =3D platform_get_drvdata(pdev);
>> > 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove a=
dapter & data */
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   i2c_del_ada=
pter(&i2c->adap);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D pm_runti=
me_get_sync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, "F=
ailed to activate device for removal (%pe)\n",
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   ERR_PTR(ret=
));
>> >
>> >
>> > pm_runtime_get_sync() can return 1 on success.  Perhaps use
>> > pm_runtime_resume_and_get()?
>> >
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   xiic_deinit=
(i2c);
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   pm_runtime_put_s=
ync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   pm_runtime_dont_=
use_autosuspend(dev);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
>> >
>> > --
>> > 0-DAY CI Kernel Test Service
>> > https://github.com/intel/lkp-tests/wiki
>> >
>>
>> This maybe a false positive.
>
> It's not.
>
> The blamed commit 2557b4ba04df ("i2c: xiic: cosmetic cleanup") has:
>
> -       ret =3D pm_runtime_get_sync(i2c->dev);
> -
> -       if (ret < 0)
> -               dev_warn(&pdev->dev, "Failed to activate device for remov=
al (%pe)\n",
> +       ret =3D pm_runtime_get_sync(dev);
> +       if (ret)
> +               dev_warn(dev, "Failed to activate device for removal (%pe=
)\n",
>                          ERR_PTR(ret));
>
> So we need
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index 37a15065db60..a5334b7c46d8 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1536,7 +1536,7 @@ static void xiic_i2c_remove(struct platform_device =
*pdev)
>  	i2c_del_adapter(&i2c->adap);
>
>  	ret =3D pm_runtime_get_sync(dev);
> -	if (ret)
> +	if (ret < 0)
>  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
>  			 ERR_PTR(ret));
>  	else
>
> Best regards
> Uwe

Hi Uwe,

Yes, indeed, I missed that. Thanks for pointing it out!

Best regards,
Abdurrahman
