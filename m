Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94230128803
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713288869; cv=none; b=WQpx4Vx2u/Ol0V9GOMDKZmFRU9vdCDEgCaHoy5SjGLJZh2Cfg2Rsgf+TG36T7n0RaqpiS/HYL5Mi9HvGmvtXqee6+DSG2mrJtwcQkNfptmIKxP8TEimo4vTQt3XbGlR6pjc5568lcaLhgzJpLfXZWzlRxNkDXEOo/5Lfq8kQWc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713288869; c=relaxed/simple;
	bh=xu+k3B6e0S5uV2AeyPNUBYkGSJodPLz6zhec+aOyGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoSq80yt3yB34eQ170DQh1FT6CYsbbYIRM3aQQGNn7oDKrXnn0/A4ZVShBD6Qlm+fgwnFWPf22bYswpBz9DBP7d0wYkP9Nss+Pl/scfeuG//M61P67d9H7p0uOoIbTKdVnt0xQQApKWtVky8/RiT8R8nnUJ3REaokyKUYXuZtCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKy6PkK3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKy6PkK3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so6275795a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713288867; x=1713893667; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBGtZhXrsDv9/IU80RlwXoRNjhCMbNIbfxUge/aRn1Q=;
        b=JKy6PkK36e8F9AUtQYg//exA/FKN9c/GhEOmlHEFWhNGdg9vc792iVByz7Axs+M/0z
         ylDRjSzlfDwGTyjYbX+uoW6hm+EHZtXFCAPiZ0x037q5qadhiTCexxOoNUrKUQ5akVxC
         uppfnKXYGKapAskBdjIG+G5Jq4yoa36F3jn2GWZfiZ1P79u2N0VBskctpNb/OvQdW8+i
         CaJBO2euTxqz6I7hhnqZXzoD/LuFrJTL5fpYk0v6HK3Ex6wCgD45a+bscHNNADny1Awv
         HcA3xeQ5Te31wG/B5+bGy7SF6Qu9W+BdhDB8OTWE+JqtH2Q2QwP+D+BWFhT92W3HY+wC
         Mu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713288867; x=1713893667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBGtZhXrsDv9/IU80RlwXoRNjhCMbNIbfxUge/aRn1Q=;
        b=sjF4UIgNLRtVTleDYyXjt2mooPjzXQgRuiCIRyZvE50mIM2H+DoADber4pDVMO6zF7
         MsiH1YcXjnzoDYhPCfeS8+S13/4zszA/xomXui5+O9OSTeS6x/BAWYtEQGG6kHHAT0VV
         SrLXR4MsPyxeu7Ee+5jAMngI3rfA0JShZfLLBAnpagDBY5QENf0kN1FaGXI4+ovFN1cZ
         Z+WjWWl0aem84UP21Ee3ICyB0/TMg7ryviERd4eXaY+MEPfLpYmMHVVuyxvHAV2KRCZf
         +ziSHI8J4NKARkknybjNmVI3smKBa8w6qri0FFtSMTX3alZREQMQe2Rc2Do52Qu96SFr
         phbA==
X-Forwarded-Encrypted: i=1; AJvYcCUcwX0143JlZvSHdZlC/DY6WA5GhbYkL+ILB+bwkTErqZ1EqEIIyR8TsEWEmz6VQzsZRa6XeM0021vKEo75BCL840M7L+NBqDR54NLpxw==
X-Gm-Message-State: AOJu0Yx1qKXKeuwxy5zd12CPbaQbNL2UP7eKEs6Jhc3BE2WI0CbbxZUA
	VQv6eyWU9PgtzeOxSwWrf4wUL2aKimPHY9slWr0qohwn91B/ceAaJCn3LvGI3WhaXTeNnJr3/cr
	kLgdimLh2ttDcffU1jca5B6yPwB0=
X-Google-Smtp-Source: AGHT+IESOFgHtJldCSkg3hlXty7KCffRAd8b1WXWXaSWCE1frVgK14VVZblAjVAWRBOrri139ePgBSSDR7J4vov0Bco=
X-Received: by 2002:a17:907:31c9:b0:a52:4fc1:ea90 with SMTP id
 xf9-20020a17090731c900b00a524fc1ea90mr7379092ejb.62.1713288866697; Tue, 16
 Apr 2024 10:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416053909.256319-5-hpa@redhat.com> <202404170023.1zEGO9ja-lkp@intel.com>
In-Reply-To: <202404170023.1zEGO9ja-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Apr 2024 20:33:50 +0300
Message-ID: <CAHp75VeKCGSZTb5bGU4YNr9r-z+gXmk4GC5HOZCFcoRQRN37CA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] power: supply: power-supply-leds: Add
 charging_orange_full_green trigger for RGB LED
To: kernel test robot <lkp@intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 8:03=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kate,
>
> kernel test robot noticed the following build errors:

> All errors (new ones prefixed by >>):
>
>    drivers/power/supply/power_supply_leds.c: In function 'power_supply_up=
date_bat_leds':
> >> drivers/power/supply/power_supply_leds.c:42:17: error: implicit declar=
ation of function 'led_mc_trigger_event'; did you mean 'led_trigger_event'?=
 [-Werror=3Dimplicit-function-declaration]
>       42 |                 led_mc_trigger_event(psy->charging_orange_full=
_green_trig,
>          |                 ^~~~~~~~~~~~~~~~~~~~
>          |                 led_trigger_event
>    cc1: some warnings being treated as errors

Probably you need a new dependency or so.

--=20
With Best Regards,
Andy Shevchenko
