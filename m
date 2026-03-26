Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3C3537C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 02:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491177; cv=pass; b=roCAky3edXhtADnHxgdHQsF4fkXkhGYzak6ge57Mwx9X3CzSCnY6TxUVLoxniyNelG0XLN5Yjxc0wBPSOBtcgT1CU1Wz2tP0P4JdKdDlAni5EcPmCp8e2ZgwWbqBIgcGKR/INcCDC9h6zigplcJ2eSIjYUSzUcAUQR2nFa97LFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491177; c=relaxed/simple;
	bh=tv5nfp1dvu/Tkr8TpVf2gegTD+Ef12uY2ylzmRm9r14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luIxqbW4p8uhGsRFxiTvOLeGkhe4CKAGxf3tQ6xSFPw+QyypxbjfpT0w5Bh4JNUG0btpHDLwKuSbz5PZX1jUdIlRBaieByo4g66M+OAJbuxC/Sde5xL+rOY5Dtp2D7usrSnIETs8a+xOdOBCiPhrJh673FCNThRp4utzUqSRduU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU0Oz8v0; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU0Oz8v0"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89a0ecbc713so5105506d6.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 19:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774491174; cv=none;
        d=google.com; s=arc-20240605;
        b=Sb+wu47HDXXfOVDJ53MLgrMU9lLVaJ+CwuqpZmMXLUK2jsLGgNdaW/uZRsrbRQSfDc
         h9k8j5CNBNLFmD6c/AK8lVJGJnujtLfL77qwaaWktSylpmT2dEpC24A1Pf1lSdHQPXdK
         yjF9wVGlvLmEyWSNLas2C/izSFFDSmuYclJ0uL99W5RdSuZXzdL2A35zRsujina9fdIA
         BNi+pyo5D+P40kmsrTY/6RjNbZBgT50e+EZIbVYmJ/QS+2ggrwuIOBVTvlBAXMUj26mI
         TEilGzTetckirsCWhiqslxtYmcqGVXjhN0Y5FeXSsWnS3OJtHSkyInkhCOpgWCAnW53t
         2QLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        fh=H5CELjsJmwZ+g0l/sUNznKhdGRpFbv/gVCO/baK/AEk=;
        b=BfmYPhK19bugxVV0tfhzkdJx/CF+ieoCSe750LSw7Hm6WwhkwVglU7ksYlUHTaN1qv
         HaqaLECNHuzwhIfZY91IxSIL/obwcH8K3qgggQp34qPXDSfkemlaBux5CUh7PNcWO+kZ
         hpbqJl+B+uLoz9Y43JL0uFeF6d1SqskA5V/PLhE//HDHuqPrFWDHoAczTsCJF3U3NUTO
         bns3bNtxUYquxXdhDxVne/l9obbPvvB3+xhl/p/UtgvVBBem1p7w6A1OQgWok6CYyFIb
         s/YUTyf9p7Mx0arZ04mSayFK/kL68THdTWBkw6hY8u8WjU54SItj8eFDuBz+vU6szKzq
         pAIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774491174; x=1775095974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        b=UU0Oz8v0cTvzFf2orwb96RunO9PXB9XC+z0AlBGHTDy6HsOZg62dtJ1cIts/7vf8f/
         tmXgomzCBlNFW30LSg+WHOHiW5SdRHrlO8CvtrTXLrqvGg//Sm0HvwyMDxAx0HGczrzo
         XDdrY1bqiEeYXd+d6+GhWzFpQDBpEsAH7ZX/gtCVaa0c2xSLBNxexY7a7joeOQtcpsMs
         WXaWhnLjyaHytXHePtwNAN3KPQH5h+wOGmYEN3h8yX/WeaWfe+rtx4n7pqrfvF7AmuCz
         bM8lpfiuHej4i8ErY2VCpYEJSb2Xau99mbdfLI2LHQljHQhsvjVwVCtATUtQibTzRUKB
         +Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774491174; x=1775095974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LZz/ifoYRb/n1L6k1t1xrO6vM8B/9SjmCeNM7ARg2A=;
        b=kMrzMp2cXl07WhFHuNG9zInzpQ3o9KmFL/hqCbHZY0EtjCPnAPty7yjqmGt8GVTulV
         DJAyO9EkC4HE5RuY4SeIhvCpKuv0tCufUkdEgk/hObMoyw6o4KympDDZ/qBlK4wlUP+e
         rN3GsTlo4EJbPnAWRkLluK623LHOe+1gZ+Hw+M9bc3biQ2akWxA0PGrGjPCzE4o2+hjL
         ZLwtIOOeCqfEnj47+4hiGIaq+x09UKzYoqBnhy0J3/tBXgWzdVgxLZytPAFQcDLEeyaP
         vtxt9/rKNf2SV6nZ6sKa9qETA1rBPKaF35QfAugjcRowwqI4F4He35DCov1I24jI69OQ
         GqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5ImGAjiE/ngSn6+Ju2RPuTN9FvrqGE05Djl3tQ2b5lZZvi7vh9X2zcKs+IBj62e/wdqvfXnRfnMixqR/3@lists.linux.dev
X-Gm-Message-State: AOJu0YyS/clhjQshLJxBqYAIe9jrFikzgXa2zYHHlC2/9y4KNVbMoH3t
	T/H/Ouq01vwLOjpiK78a2I0Gm2udcr3gyQ3IYdLGebY0lPE5MNjdiXDcSO6ViDll7Y8m8ShHBgu
	Hocz4vqO65djC09ByfQvmhvE1X+BQ6hY=
X-Gm-Gg: ATEYQzxtKX0QcANAtYf5FnplLydytfj4gUogjvHL6Ng/YAa8NL/OyRAuzfXSq0Y2ba9
	wgvtOPgCx8xk8NsolwbdSseayMNnvfTHm8jBnKMySl0lIFyOOgZ8BEpo+5uMxlWkB55toiCM3As
	dkplL57p19T0PMZPQqwgRo0klSopnxtqSw1IkJ4xvCaD79OR3I28cBT2FBlhjrtepH8FKdKa3vA
	Io7jGjxpjl2NZJYdBwhNiGdhAdANoO9GhVqqqqjtayzOZLeeJklkkUbcq0WeMGc830W1K9LGVrD
	kLSAWgnmnfOZ0zMZ4Qw=
X-Received: by 2002:a05:6214:478c:b0:89a:8434:108c with SMTP id
 6a1803df08f44-89cc42a59d0mr75882416d6.15.1774491174273; Wed, 25 Mar 2026
 19:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com> <202603260302.X0NjQOda-lkp@intel.com>
In-Reply-To: <202603260302.X0NjQOda-lkp@intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 25 Mar 2026 19:12:43 -0700
X-Gm-Features: AQROBzCCMauqzLcmBl2kKVUIVShU14LLDgvO9-3x4yc_nzuajvT4xQWqyoEo6mk
Message-ID: <CAFqHKT==yv=1E9Tjz+xbMZpS+33_jFYe6hCVdktmctaKiAUHZQ@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 12:43=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Derek,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v7.0-rc5 next-20260324]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/plat=
form-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20260324221032.1333636-9-derekjo=
hn.clark%40gmail.com
> patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI bat=
tery charge limiting
> config: x86_64-randconfig-005-20260325 (https://download.01.org/0day-ci/a=
rchive/20260326/202603260302.X0NjQOda-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260326/202603260302.X0NjQOda-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `lwmi_om_fan_get_set':
> >> drivers/platform/x86/lenovo/wmi-other.c:206:(.text+0x1b74542): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_attr_01_is_supported':
>    drivers/platform/x86/lenovo/wmi-other.c:1267:(.text+0x1b74fdf): undefi=
ned reference to `lwmi_attr_id'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:1270:(.text+0x1b75013): un=
defined reference to `lwmi_cd01_get_data'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:1283:(.text+0x1b7515b): un=
defined reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1299:(.text+0x1b752f4): un=
defined reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd_fan':
> >> drivers/platform/x86/lenovo/wmi-other.c:565:(.text+0x1b75ca3): undefin=
ed reference to `lwmi_cd_fan_get_data'
>    ld: vmlinux.o: in function `lwmi_psy_prop_is_writeable':
>    drivers/platform/x86/lenovo/wmi-other.c:687:(.text+0x1b75e2f): undefin=
ed reference to `lwmi_attr_id'
> >> ld: drivers/platform/x86/lenovo/wmi-other.c:690:(.text+0x1b75e5a): und=
efined reference to `lwmi_cd00_get_data'
>    ld: vmlinux.o: in function `lwmi_psy_ext_set_prop':
>    drivers/platform/x86/lenovo/wmi-other.c:649:(.text+0x1b75f9b): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_psy_ext_get_prop':
>    drivers/platform/x86/lenovo/wmi-other.c:603:(.text+0x1b761aa): undefin=
ed reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `lwmi_other_probe':
> >> drivers/platform/x86/lenovo/wmi-other.c:1612:(.text+0x1b764eb): undefi=
ned reference to `lwmi_cd_match_add_all'
>    ld: vmlinux.o: in function `lwmi_om_fan_info_collect_cd00':
>    drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b7680f): undefin=
ed reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:540:(.text+0x1b76838): und=
efined reference to `lwmi_cd00_get_data'
>    ld: vmlinux.o: in function `lwmi_om_ps_ext_init':
> >> drivers/platform/x86/lenovo/wmi-other.c:806:(.text+0x1b76a57): undefin=
ed reference to `devm_battery_hook_register'
>    ld: vmlinux.o: in function `lwmi_om_fw_attr_add':
> >> drivers/platform/x86/lenovo/wmi-other.c:1474:(.text+0x1b76afa): undefi=
ned reference to `firmware_attributes_class'
>    ld: vmlinux.o: in function `attr_current_value_show':
>    drivers/platform/x86/lenovo/wmi-other.c:1225:(.text+0x1b77015): undefi=
ned reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `attr_current_value_store':
>    drivers/platform/x86/lenovo/wmi-other.c:1165:(.text+0x1b776e2): undefi=
ned reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1168:(.text+0x1b7771c): un=
defined reference to `lwmi_cd01_get_data'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1179:(.text+0x1b7781e): un=
defined reference to `lwmi_attr_id'
>    ld: vmlinux.o: in function `attr_capdata01_show':
>    drivers/platform/x86/lenovo/wmi-other.c:1099:(.text+0x1b77e38): undefi=
ned reference to `lwmi_attr_id'
>    ld: drivers/platform/x86/lenovo/wmi-other.c:1102:(.text+0x1b77e67): un=
defined reference to `lwmi_cd01_get_data'
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING
>    Depends on [m]: X86_PLATFORM_DEVICES [=3Dy] && ACPI_WMI [=3Dy] && ACPI=
_BATTERY [=3Dm]
>    Selected by [y]:
>    - LENOVO_WMI_GAMEZONE [=3Dy] && X86_PLATFORM_DEVICES [=3Dy] && ACPI_WM=
I [=3Dy] && DMI [=3Dy]
>
>
> vim +206 drivers/platform/x86/lenovo/wmi-other.c
>
> 51ed34282f63fa Rong Zhang 2026-01-21  186
> 51ed34282f63fa Rong Zhang 2026-01-21  187  /**
> 51ed34282f63fa Rong Zhang 2026-01-21  188   * lwmi_om_fan_get_set() - Get=
 or set fan RPM value of specified fan
> 51ed34282f63fa Rong Zhang 2026-01-21  189   * @priv: Driver private data =
structure
> 51ed34282f63fa Rong Zhang 2026-01-21  190   * @channel: Fan channel index=
 (0-based)
> 51ed34282f63fa Rong Zhang 2026-01-21  191   * @val: Pointer to value (inp=
ut for set, output for get)
> 51ed34282f63fa Rong Zhang 2026-01-21  192   * @set: True to set value, fa=
lse to get value
> 51ed34282f63fa Rong Zhang 2026-01-21  193   *
> 51ed34282f63fa Rong Zhang 2026-01-21  194   * Communicates with WMI inter=
face to either retrieve current fan RPM
> 51ed34282f63fa Rong Zhang 2026-01-21  195   * or set target fan RPM.
> 51ed34282f63fa Rong Zhang 2026-01-21  196   *
> 51ed34282f63fa Rong Zhang 2026-01-21  197   * Return: 0 on success, or an=
 error code.
> 51ed34282f63fa Rong Zhang 2026-01-21  198   */
> 51ed34282f63fa Rong Zhang 2026-01-21  199  static int lwmi_om_fan_get_set=
(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
> 51ed34282f63fa Rong Zhang 2026-01-21  200  {
> 51ed34282f63fa Rong Zhang 2026-01-21  201       struct wmi_method_args_32=
 args;
> 51ed34282f63fa Rong Zhang 2026-01-21  202       u32 method_id, retval;
> 51ed34282f63fa Rong Zhang 2026-01-21  203       int err;
> 51ed34282f63fa Rong Zhang 2026-01-21  204
> 51ed34282f63fa Rong Zhang 2026-01-21  205       method_id =3D set ? LWMI_=
FEATURE_VALUE_SET : LWMI_FEATURE_VALUE_GET;
> 51ed34282f63fa Rong Zhang 2026-01-21 @206       args.arg0 =3D LWMI_ATTR_I=
D_FAN_RPM(channel);
> 51ed34282f63fa Rong Zhang 2026-01-21  207       args.arg1 =3D set ? *val =
: 0;
> 51ed34282f63fa Rong Zhang 2026-01-21  208
> 51ed34282f63fa Rong Zhang 2026-01-21  209       err =3D lwmi_dev_evaluate=
_int(priv->wdev, 0x0, method_id,
> 51ed34282f63fa Rong Zhang 2026-01-21  210                                =
   (unsigned char *)&args, sizeof(args), &retval);
> 51ed34282f63fa Rong Zhang 2026-01-21  211       if (err)
> 51ed34282f63fa Rong Zhang 2026-01-21  212               return err;
> 51ed34282f63fa Rong Zhang 2026-01-21  213
> 51ed34282f63fa Rong Zhang 2026-01-21  214       if (!set) {
> 51ed34282f63fa Rong Zhang 2026-01-21  215               *val =3D retval;
> 51ed34282f63fa Rong Zhang 2026-01-21  216               return 0;
> 51ed34282f63fa Rong Zhang 2026-01-21  217       }
> 51ed34282f63fa Rong Zhang 2026-01-21  218
> 51ed34282f63fa Rong Zhang 2026-01-21  219       /*
> 51ed34282f63fa Rong Zhang 2026-01-21  220        * It seems that 0 means =
"no error" and 1 means "done". Apparently
> 51ed34282f63fa Rong Zhang 2026-01-21  221        * different firmware tea=
ms have different thoughts on indicating
> 51ed34282f63fa Rong Zhang 2026-01-21  222        * success, so we accepts=
 both.
> 51ed34282f63fa Rong Zhang 2026-01-21  223        */
> 51ed34282f63fa Rong Zhang 2026-01-21  224       return (retval =3D=3D 0 |=
| retval =3D=3D 1) ? 0 : -EIO;
> 51ed34282f63fa Rong Zhang 2026-01-21  225  }
> 51ed34282f63fa Rong Zhang 2026-01-21  226
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Can someone explain to me why this is happening? I cannot reproduce
these locally with W=3D1 and/or C=3D1. I'd prefer to resolve this before
submitting a v6.

Thanks,
Derek
