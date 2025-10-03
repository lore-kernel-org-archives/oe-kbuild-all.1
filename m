Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FAA2DC774
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517056; cv=none; b=A2i+CulGp4IuK2AMG2OFMfa2d7az60aZS7UKowKDcHtKQLDHhCJxCNkjABeHtTsj3F0pDg9vvoiUw5L4ZVSZ6WQwNj+A2YGGs++Qm9lujWOjtsojxKJyhVfsBU8hOq/HeglssPBT6HlB3dLUocjz0gHQJWsKktJbYrvo2ZxUUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517056; c=relaxed/simple;
	bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1vNLWSW7AlutzflaMl5f8VctkO76qTyHLJwyAqDL4qWNgjO2cwyaszJvUCcScEQi+Hkyh2L3she0BPxtW21/QGR6Q1+C1SZuHnPulPq7wdPwrr4pfJhjTYEFE0v4bDBK2XpPUfz9nI/2ygTMXDsReXvj5TaklK9AcJkbwZYRXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAx1fL9P; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAx1fL9P"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f1b88354eso2532422e87.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Oct 2025 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517052; x=1760121852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
        b=TAx1fL9P14dgpVrRH0EaLzCSZN1vozgqqtzrYo/CkgEegEw+F3YJkH7zJVMe5zvHKj
         GclnUUeBuiQ/dfTyM3ziehAXsvkZGHi3bfm6j5H1tOxU8kRllNeYCXmgjYmOo4TBmXHi
         +pI7gNSbXcTGxyeD864rHRaODpplC7H6HnXCcHMc7tafs+uZXUG3za+33qEC1b3NNn9T
         zWnfB4WapSBVTlnRzm4EKavhhXxKUG9ofSFriLnLmeI2DhK8OdWCEL4FNOHRCq2D9kw2
         IZjvUgidYGm2zVgohItztzF80vj7s7E0MlPWGo7O8T8s6W2Xy1+6XrtO+7biiqztHPri
         mHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517052; x=1760121852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
        b=gLeky6IUPBE8vZjmkhiaAzBgjaR70W8CDWm4OFJjpmtMJd5BBWFio8/lx/6kQaNKrJ
         9majy8rtyNN5XlzwBwyIU+Mj/0Qe9s11AXD8Nwa0hydKus/D7AEKBGcA4sw2UsPUgX6d
         v81fPiIlXLp7OPc3UMU48otZ3CXuVHtUW1FVxFvyKB8NxbL5XesxsuXJEvAvWKnmeFFI
         IcYhfT/kD9Tfaf4K8FrVGoneBOKvXPP1y/0MBrbyYSbs7uGkO1pnE8SSrV+0kera64j0
         geiQ4cbi3uhaJHNnC1VUaaisxQQ3HzARGT+xzyuYKSKJ+ssMLV77xqVDwvvSzzsYzLHc
         BjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7M5KDls0ruy4cCRfaRqXClyLnJHGDAb37UDKCAtSLEYqT/lQP2HM1vEHqoH9yLdD0iE6Sa/+Yg5VlWTGo@lists.linux.dev
X-Gm-Message-State: AOJu0YyJWatMtkDze3X5gQWSy/rmoFtH255d7IlpNg1I+91ASx0DkTOU
	qJCaUTwARFxYKw5zcbR5/367lGfNb3JiFVaU+WEDp/yM1ulolHEwVbOCX6sXOXZcuVRQGFBi0rm
	TDuPOjn3JuL3g91VnwzfcmIrPUIxfil0=
X-Gm-Gg: ASbGncuGj7cQ8SCCCiqCK+zLROCDWkDrPaf6f4+moLlGo/ZvClr2ssC+2aSASXe/mNz
	OEIqnrC0nLKn1SNfkT2ApWuqrUk7FIvhfzloZZtjYz1B3t70cL92O2lYP/cjEglteAOaxYZU3q8
	TQ5TuoESn2FshZ3FiT01wnZjiRPPe4wivyTJtLiHG+2rDxCdSAJBl2CZiOlUzjfY2QSw/38aRDg
	AnJLlaKg2XM6l36///JNH6pKewq0GFmQLq7oxyvD0FEgxm1g9IJtEefzc0eNUcdmCu/la/ZO4NT
X-Google-Smtp-Source: AGHT+IFGjI23yu+zZGYIIYp5GAvADK1Td8K5f92lbt6d4punv+uO2Xi2qzgSwr+Eyr8h+dgbxKZKruLqIS6Oqk0H0Go=
X-Received: by 2002:a05:6512:1245:b0:560:9993:f154 with SMTP id
 2adb3069b0e04-58cbbdd8224mr1238522e87.35.1759517051928; Fri, 03 Oct 2025
 11:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com> <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com> <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
 <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de> <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
In-Reply-To: <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Fri, 3 Oct 2025 20:43:59 +0200
X-Gm-Features: AS18NWCgP_BX7ybrXY0sJ6ucNdQs1TMwDO0SWiLqnHgEzd_63diU8v-qea2nPRE
Message-ID: <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: David Hunter <david.hunter.linux@gmail.com>, kernel test robot <lkp@intel.com>, 
	Bernie Thompson <bernie@plugable.com>, Arnd Bergmann <arnd@arndb.de>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Zsolt Kajtar <soci@c64.rulez.org>, 
	Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 2, 2025 at 8:52=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 02.10.25 um 08:41 schrieb Helge Deller:
> >>>> kernel test robot noticed the following build errors:
> >>>
> >>> Did you compile and test this code before submitting this patch?
> >>
> >> Yes, I had compiled & loaded the udlfb module with no errors. Please
> >> let me know how to proceed in this case.
> >
> > Look at the reported build error, which seems to happen in dev_dbg().
> > So, maybe in your testing you did not have debugging enabled?
> > The report contains the .config file with which you can test.
>
> Can we rather make an effort to remove the udlfb driver entirely? A few
> years back, there was one user who was still using it because of some
> problems with the DRM udl driver. But I think we've addressed them. The
> discussion is at [1].
Should I send a patch series to completely remove udlfb, since [1] echoed t=
hat
DRM udl driver is good enough?
>
> [1]
> https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse=
.de/
>
> Best regards
> Thomas
>
> >
> > Helge
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
>
