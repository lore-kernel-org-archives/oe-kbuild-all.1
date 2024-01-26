Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340D1E86F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706289943; cv=none; b=m634ZwOp3kqtWaKK+TwBCflFC7PIe+IgHQx6slGrLc169l65NWTqVRNO/e903wNedc7+PLqJJKsrLx98q9OjXr7tdGyM6nWYdruSKE4l4N8x9BgMn3av3OCVAVh0UidyeEQgGqTBI2rxoPJ4wZdBJ1wJExcjKZjkcpyy66ZF88U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706289943; c=relaxed/simple;
	bh=xPjbeHM+/HDx6jxzmLz9AOl/bNVzYYu0ALYtamVcz+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZYsxlLefdkyNduRd5+ZLWMgTrBg406LajV+kvyp1Dk5LudY+GF0gY1CUlfmD3JNvR4CpmTxJvEnqv4sYjECOlhAuszkK6isIRAsevIOxHniIFsNYMHXwznAsHHDt4s8T2TP+fce9LzdAvMKn2cV8roiUawn3FuYss3FonGGhjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdFJQU/J; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdFJQU/J"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a271a28aeb4so58088466b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706289940; x=1706894740; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFbZbkLrOwRZ5J3+sJIG4KgFkS5YNa71i5ZmLkZajBw=;
        b=RdFJQU/J6W/NPgQ4+dK73m4NXVV7PDjW12FJubvgSWJ2w0W//NPg8G3D5WsjmGBnuH
         QN6Dctbuo0vZ7ezPOOghQJX3qTwBlUBuJQN9CBMPmWpjpzH6xWkxif4Y175X7Hx5gYub
         2NYV0DSM2xFB/JUC75nnwzeW1RfRtfJ+bTMSCeIDPLz1YVVNmaAidU8wlrFgWIUtOeIT
         dqhwEWHzHojf9ojyYE7njr0G4rW17oG4UrdOjUiHrpDbgyzTXHOBsgcMx4ujJNC3aIzu
         HebFCl12A0pmMVV/y3QFm9hbvQEkrWBmcfknQ2y+OSppVhVHuUDTluK61A/EQXjaygMo
         eUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289940; x=1706894740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFbZbkLrOwRZ5J3+sJIG4KgFkS5YNa71i5ZmLkZajBw=;
        b=mvcunDTTICZe+9QqaK26h1EHwPdcM8jeL28l6Wk6/Vwj34iUQ5ovPUKeEVK3IlqO5s
         IOHNvoxURBs0QYR7UNO0B2eVro2enEbQgd3nEEjo3/u/Hox5JSBtXLCwUT2UgAHc5SfJ
         f20ONZAlVgRH0B6d/s/U8TxXjH/+Hsda8QoCAyRqDlAHqEXOpO2fJ16XmO38BuBQwjTh
         BwWuiQr+D782BL2EfxJPQDdcZmya8IYvrLfC5JG7TPmoT0N4RI7u4zwmA1ZrewR2ZsC/
         TPWFde67pP/loURAI46EjAHIRAgBdDcpkAX3v1IMKVEYEwYFExFbGB/Pm/pYcDyNW2sD
         XQew==
X-Gm-Message-State: AOJu0YzASfeDHW1qkeA3agM/BD46Dy4NPWPc4ilAv14+0pWWrjzDsqTM
	8HT6X1fsgaXftM8lnzxaccV6TuxBac6rpZw2CQOXcypU33k14qtxfoRE2w+O+yeLno7A8Sk4JkD
	a2BEh30a5pDjhXff3vgeE4VyRgMo=
X-Google-Smtp-Source: AGHT+IEgTwvsqU6ZxyJilkEVxiWKWu4BRSw+FjFGu3xyrnVnI9q6JSKu7vmLiKKd/JlPJwiMzQP7l+6LkgrCLM2StXo=
X-Received: by 2002:a17:906:cec7:b0:a28:ab53:eda1 with SMTP id
 si7-20020a170906cec700b00a28ab53eda1mr1074405ejb.34.1706289939576; Fri, 26
 Jan 2024 09:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401260626.nE6j5ZwR-lkp@intel.com>
In-Reply-To: <202401260626.nE6j5ZwR-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 26 Jan 2024 19:25:27 +0200
Message-ID: <CAOQ4uxg0a64FBhKbDiEfDvAqgCR-5bMo+Cq9bDAAtFRs7BQT4g@mail.gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 vega20_enable_dpm_tasks.part.0+0x2cc (section: .text) -> (unknown) (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 12:52=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
> commit: dff745c1221a402b4921d54f292288373cff500c fs: move cleanup from in=
it_file() into its callers
> date:   7 months ago
> config: riscv-randconfig-r026-20230716 (https://download.01.org/0day-ci/a=
rchive/20240126/202401260626.nE6j5ZwR-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240126/202401260626.nE6j5ZwR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401260626.nE6j5ZwR-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: vmlinux: section mismatch in reference: vega10_populate=
_single_gfx_level+0x164 (section: .text) -> set_reset_devices (section: .in=
it.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vega10_populate=
_single_gfx_level+0x168 (section: .text) -> set_reset_devices (section: .in=
it.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vega10_populate=
_single_gfx_level+0x170 (section: .text) -> set_reset_devices (section: .in=
it.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vega10_populate=
_single_soc_level+0x4e (section: .text) -> set_reset_devices (section: .ini=
t.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vega10_populate=
_single_soc_level+0x5a (section: .text) -> set_reset_devices (section: .ini=
t.text)

Sorry, I have no idea what these warnings are and why they are related to t=
he
mentioned commit.

Maybe someone cares to explain?

Thanks,
Amir.
