Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384237E319
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258785; cv=none; b=YVHDuiDxFbzuX6S6GNGY1dbjv/wN5nvxbgomtTL9fhmiqvvsARAl07pUZKDXYj/e1SQr3Gofy0btAGODFdIyKkF1mRwX89Q0XyBYicxpvpnhjoReQcCm7KARoY274FEN+Zvbcu7kLME0vBRyEWjWy6fejdkBMh68trXue3O9VuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258785; c=relaxed/simple;
	bh=EJ6GA3ln3CB5rzUUR+CiHZBiRJzeKCJ2WXERmpAAfvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t71B2wRuycRNHgKD2sZf2GlP/C9ecaRdxoFBoVowaGB7Q+eWBtwvFLoMPxhv1zDf3ra6rpnk/xmPzQS6Vf5ggHNynyVV3/xTplbQgODORPhQMhXr+D7rmQbY67uok+td9hDu4HlRdPFRhGzqDL8E3FuHjW5IVH6QkYmDN2wfdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLy4ZCMf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLy4ZCMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F873C2BCB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774258784;
	bh=EJ6GA3ln3CB5rzUUR+CiHZBiRJzeKCJ2WXERmpAAfvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mLy4ZCMfBGloKKuDIVAGpFuw3zBtjQ7tNfW3AnCAjSJGefQqKbuXe2g/FQe/jcBFX
	 J3q4U7j8BiMAk5t5szcgqgxXyYhYyZYrUlYHSrgp/R5tb1xntnOqksnju6mASLHXjb
	 B20+NdtXcRev+lif9H0yYjPtsikuCmNoIkgvtK7ZyMtf6cCn8SHfwa3Oxmtoslek3G
	 RJKwo2g+varp32Lk26/LjR8BiW0E+NkUQpDXTEKVUwe3A169fJ0SZ0ZcITr6bADUR3
	 x4yZCc0QPDOL1TxBz82jemwA7yhoJBPogMQ0U3XjlT4/Ttxjwr+KESVKXKr0KKUz52
	 GlI/5KhxICZxQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38ad12fb595so38699681fa.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 02:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkRC4hXtX4yznLrBlW6jfHlw35++lekchqcTuFqoUtNsdjnPsxjOtDaJHnvGbHgB8g63y7aq22ZqxNbxHv@lists.linux.dev
X-Gm-Message-State: AOJu0YzgYIQbv0WKa0ndstvZLlUdK1rcgWVGNzWuKz2Lylvf0K2+mh7u
	+H+dPjQsypCqpwgwaIx7auxc9nZdXQQmdvdVsOui/aKj1EBnZrHeBJIHvPlRTJmr1aVWpE3gphw
	IT2qwtjj/DTLmaugyvCSPDjBiIyyj/hdW4FOLbj0crg==
X-Received: by 2002:a05:6512:31c7:b0:5a2:7d50:31cd with SMTP id
 2adb3069b0e04-5a27dde2603mr4490220e87.3.1774258783209; Mon, 23 Mar 2026
 02:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com> <202603201641.qJ8m8Nhn-lkp@intel.com>
In-Reply-To: <202603201641.qJ8m8Nhn-lkp@intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 10:39:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>
X-Gm-Features: AaiRm53YjgeM2rDX8DY1YvwLzxTXdbFkc65W0RLmdUuzN_9o_znmAtZ9xE0zG0o
Message-ID: <CAMRc=MfWsChQc-xHiBtL6HKv6ax36szfEE8Ckjf7VUfhxzG9OA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: meraki-mx100: use real software node references
To: kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Peter Tyser <ptyser@xes-inc.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:18=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewsk=
i/platform-x86-meraki-mx100-use-real-software-node-references/20260316-1651=
20
> base:   b84a0ebe421ca56995ff78b66307667b62b3a900
> patch link:    https://lore.kernel.org/r/20260316-meraki-swnodes-v3-1-155=
01a52300e%40oss.qualcomm.com
> patch subject: [PATCH v3] platform/x86: meraki-mx100: use real software n=
ode references
> config: x86_64-buildonly-randconfig-001-20260320 (https://download.01.org=
/0day-ci/archive/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260320/202603201641.qJ8m8Nhn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603201641.qJ8m8Nhn-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `lkdtm_rodata_do_nothing':
> >> (.rodata+0xa9b6c0): undefined reference to `lpc_ich_gpio_swnode'
> >> ld: (.rodata+0xa9b840): undefined reference to `lpc_ich_gpio_swnode'
>    ld: (.rodata+0xa9b960): undefined reference to `lpc_ich_gpio_swnode'
>    ld: (.rodata+0xa9ba80): undefined reference to `lpc_ich_gpio_swnode'
>    ld: (.rodata+0xa9bba0): undefined reference to `lpc_ich_gpio_swnode'
>    ld: vmlinux.o:(.rodata+0xa9bcc0): more undefined references to `lpc_ic=
h_gpio_swnode' follow
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

FYI this is a false-positive - the prerequisite patch is already in Lee's t=
ree.

Bart
