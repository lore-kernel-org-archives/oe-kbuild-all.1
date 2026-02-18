Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3505342503
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430102; cv=none; b=dquIzOtlDv5CKOzKuKU5/NlPX9tnHXtYRqQ7fBdV+qFjRVwXG9Qi+NR2mQHcfcvwKMM8JsBlyW2f3lU9i6cCt/IKA+Z5nw4t76xmIOWQKkKmKr+TWXnzCIwsEGm7oba7oWDRl9NQbxpiD9qdOv7Bi8Z9cWRz3SvYrwrsJp2gF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430102; c=relaxed/simple;
	bh=FBkeVMppITt5sfF0fmpGoJhFE3YHDFR/ZSiA8d6c0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BMHkfZkrHCY8xcD+a+sjOBSjW/Gbolg/1hEhfwnDqFShH1QQ0lNmBtbfz7RjYdgkaFd/oqJ2MKAKWLys89wzBxXvNHEvYMD7DRfIa2TqCntnkPXPWpZs3MCcqpx1+iha3cYiy5a0nKbOVfdzREgM1AC/EyngNbjfrzZO5UBIUHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieg0r+dG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieg0r+dG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771430100; x=1802966100;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FBkeVMppITt5sfF0fmpGoJhFE3YHDFR/ZSiA8d6c0W4=;
  b=ieg0r+dGLxe9y16bVjU3Uy3L22B1Z9oruWSa1TLdLP7izVYftq/IQ2iO
   9WUhpdq6S0sNTyeRCOCvcJCATvn6C6rcxOm/SMZLyRFuiNH+e6vCnYpvq
   WLQcI8QbuBHG3p1VQn/JthGnWrJ0SYxrGby7nLEXS67DeL6jE+i/T5M1v
   gTciX9AtASkXkeDEEF6AWwFHOjsAC0UnfkiqEUV2bBi5Le48JTQ8N0gOr
   +SXL+QOY4R6zNRY8LWvKewm6ETziMQSC5h7pCXfxwPBu3bJrW6JbE+R2V
   w3RWM0NDEQra2I1zqpWVYrXDPRGdeIA1HFU5XQH456B97s6VExp82wyBb
   Q==;
X-CSE-ConnectionGUID: +fnCXzBmTg2nV7wkdlgl3A==
X-CSE-MsgGUID: OgFyMww4TfaPr0gM3vwD9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="97967954"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="97967954"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 07:55:00 -0800
X-CSE-ConnectionGUID: 72/C59WAQoG9B2ikMvsKIg==
X-CSE-MsgGUID: /eJSaXxMRKOFMbi/UXqy5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="214073093"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 07:54:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsjt9-000000012Uu-3I7C;
	Wed, 18 Feb 2026 15:54:55 +0000
Date: Wed, 18 Feb 2026 23:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-18 62/62]
 sound/soc/codecs/max98088.c:948 max98088_dai1_hw_params() warn: inconsistent
 indenting
Message-ID: <202602182358.0TRouiIA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-18
head:   da12f93d8f90b9a32fb4be525733575626ad927d
commit: da12f93d8f90b9a32fb4be525733575626ad927d [62/62] dai
config: arc-randconfig-r072-20260218 (https://download.01.org/0day-ci/archi=
ve/20260218/202602182358.0TRouiIA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182358.0TRouiIA-lkp@i=
ntel.com/

New smatch warnings:
sound/soc/codecs/max98088.c:948 max98088_dai1_hw_params() warn: inconsisten=
t indenting
sound/soc/codecs/max98088.c:1018 max98088_dai2_hw_params() warn: inconsiste=
nt indenting
sound/soc/codecs/max98088.c:1131 max98088_dai1_set_fmt() warn: inconsistent=
 indenting
sound/soc/codecs/max98088.c:1201 max98088_dai2_set_fmt() warn: inconsistent=
 indenting
sound/soc/codecs/max98088.c:1268 max98088_dai1_mute() warn: inconsistent in=
denting
sound/soc/codecs/max98088.c:1284 max98088_dai2_mute() warn: inconsistent in=
denting

Old smatch warnings:
sound/soc/codecs/max98088.c:651 max98088_line_pga() warn: inconsistent inde=
nting
sound/soc/codecs/max98088.c:1087 max98088_dai_set_sysclk() warn: inconsiste=
nt indenting
sound/soc/codecs/max98088.c:1091 max98088_dai_set_sysclk() warn: inconsiste=
nt indenting
sound/soc/codecs/max98088.c:1103 max98088_dai_set_sysclk() warn: inconsiste=
nt indenting
sound/soc/codecs/max98088.c:1521 max98088_put_eq_enum() warn: inconsistent =
indenting

vim +948 sound/soc/codecs/max98088.c

e86e1244a41352 Mark Brown        2010-10-18   942 =20
e86e1244a41352 Mark Brown        2010-10-18   943  static int max98088_dai1=
_hw_params(struct snd_pcm_substream *substream,
e86e1244a41352 Mark Brown        2010-10-18   944                          =
          struct snd_pcm_hw_params *params,
e86e1244a41352 Mark Brown        2010-10-18   945                          =
          struct snd_soc_dai *dai)
e86e1244a41352 Mark Brown        2010-10-18   946  {
da12f93d8f90b9 Kuninori Morimoto 2026-02-13   947  	struct snd_soc_componen=
t *component =3D snd_soc_dai_to_component(dai);
3f64507697e32c Kuninori Morimoto 2018-01-29  @948         struct max98088_p=
riv *max98088 =3D snd_soc_component_get_drvdata(component);
e86e1244a41352 Mark Brown        2010-10-18   949         struct max98088_c=
data *cdata;
e86e1244a41352 Mark Brown        2010-10-18   950         unsigned long lon=
g ni;
e86e1244a41352 Mark Brown        2010-10-18   951         unsigned int rate;
e86e1244a41352 Mark Brown        2010-10-18   952         u8 regval;
e86e1244a41352 Mark Brown        2010-10-18   953 =20
e86e1244a41352 Mark Brown        2010-10-18   954         cdata =3D &max980=
88->dai[0];
e86e1244a41352 Mark Brown        2010-10-18   955 =20
e86e1244a41352 Mark Brown        2010-10-18   956         rate =3D params_r=
ate(params);
e86e1244a41352 Mark Brown        2010-10-18   957 =20
793f77036d5ca9 Mark Brown        2014-01-08   958         switch (params_wi=
dth(params)) {
793f77036d5ca9 Mark Brown        2014-01-08   959         case 16:
3f64507697e32c Kuninori Morimoto 2018-01-29   960                 snd_soc_c=
omponent_update_bits(component, M98088_REG_14_DAI1_FORMAT,
e86e1244a41352 Mark Brown        2010-10-18   961                         M=
98088_DAI_WS, 0);
e86e1244a41352 Mark Brown        2010-10-18   962                 break;
793f77036d5ca9 Mark Brown        2014-01-08   963         case 24:
3f64507697e32c Kuninori Morimoto 2018-01-29   964                 snd_soc_c=
omponent_update_bits(component, M98088_REG_14_DAI1_FORMAT,
e86e1244a41352 Mark Brown        2010-10-18   965                         M=
98088_DAI_WS, M98088_DAI_WS);
e86e1244a41352 Mark Brown        2010-10-18   966                 break;
e86e1244a41352 Mark Brown        2010-10-18   967         default:
e86e1244a41352 Mark Brown        2010-10-18   968                 return -E=
INVAL;
e86e1244a41352 Mark Brown        2010-10-18   969         }
e86e1244a41352 Mark Brown        2010-10-18   970 =20
3f64507697e32c Kuninori Morimoto 2018-01-29   971         snd_soc_component=
_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
e86e1244a41352 Mark Brown        2010-10-18   972 =20
e86e1244a41352 Mark Brown        2010-10-18   973         if (rate_value(ra=
te, &regval))
e86e1244a41352 Mark Brown        2010-10-18   974                 return -E=
INVAL;
e86e1244a41352 Mark Brown        2010-10-18   975 =20
3f64507697e32c Kuninori Morimoto 2018-01-29   976         snd_soc_component=
_update_bits(component, M98088_REG_11_DAI1_CLKMODE,
e86e1244a41352 Mark Brown        2010-10-18   977                 M98088_CL=
KMODE_MASK, regval);
e86e1244a41352 Mark Brown        2010-10-18   978         cdata->rate =3D r=
ate;
e86e1244a41352 Mark Brown        2010-10-18   979 =20
e86e1244a41352 Mark Brown        2010-10-18   980         /* Configure NI w=
hen operating as master */
1227f601ba3477 Kuninori Morimoto 2020-06-16   981         if (snd_soc_compo=
nent_read(component, M98088_REG_14_DAI1_FORMAT)
e86e1244a41352 Mark Brown        2010-10-18   982                 & M98088_=
DAI_MAS) {
6c9762a78c3251 Marco Felsch      2021-04-23   983                 unsigned =
long pclk;
6c9762a78c3251 Marco Felsch      2021-04-23   984 =20
e86e1244a41352 Mark Brown        2010-10-18   985                 if (max98=
088->sysclk =3D=3D 0) {
3f64507697e32c Kuninori Morimoto 2018-01-29   986                         d=
ev_err(component->dev, "Invalid system clock frequency\n");
e86e1244a41352 Mark Brown        2010-10-18   987                         r=
eturn -EINVAL;
e86e1244a41352 Mark Brown        2010-10-18   988                 }
e86e1244a41352 Mark Brown        2010-10-18   989                 ni =3D 65=
536ULL * (rate < 50000 ? 96ULL : 48ULL)
e86e1244a41352 Mark Brown        2010-10-18   990                          =
       * (unsigned long long int)rate;
6c9762a78c3251 Marco Felsch      2021-04-23   991                 pclk =3D =
DIV_ROUND_CLOSEST(max98088->sysclk, max98088->mclk_prescaler);
6c9762a78c3251 Marco Felsch      2021-04-23   992                 ni =3D DI=
V_ROUND_CLOSEST_ULL(ni, pclk);
3f64507697e32c Kuninori Morimoto 2018-01-29   993                 snd_soc_c=
omponent_write(component, M98088_REG_12_DAI1_CLKCFG_HI,
e86e1244a41352 Mark Brown        2010-10-18   994                         (=
ni >> 8) & 0x7F);
3f64507697e32c Kuninori Morimoto 2018-01-29   995                 snd_soc_c=
omponent_write(component, M98088_REG_13_DAI1_CLKCFG_LO,
e86e1244a41352 Mark Brown        2010-10-18   996                         n=
i & 0xFF);
e86e1244a41352 Mark Brown        2010-10-18   997         }
e86e1244a41352 Mark Brown        2010-10-18   998 =20
e86e1244a41352 Mark Brown        2010-10-18   999         /* Update sample =
rate mode */
e86e1244a41352 Mark Brown        2010-10-18  1000         if (rate < 50000)
3f64507697e32c Kuninori Morimoto 2018-01-29  1001                 snd_soc_c=
omponent_update_bits(component, M98088_REG_18_DAI1_FILTERS,
e86e1244a41352 Mark Brown        2010-10-18  1002                         M=
98088_DAI_DHF, 0);
e86e1244a41352 Mark Brown        2010-10-18  1003         else
3f64507697e32c Kuninori Morimoto 2018-01-29  1004                 snd_soc_c=
omponent_update_bits(component, M98088_REG_18_DAI1_FILTERS,
e86e1244a41352 Mark Brown        2010-10-18  1005                         M=
98088_DAI_DHF, M98088_DAI_DHF);
e86e1244a41352 Mark Brown        2010-10-18  1006 =20
3f64507697e32c Kuninori Morimoto 2018-01-29  1007         snd_soc_component=
_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN,
e86e1244a41352 Mark Brown        2010-10-18  1008                 M98088_SH=
DNRUN);
e86e1244a41352 Mark Brown        2010-10-18  1009 =20
e86e1244a41352 Mark Brown        2010-10-18  1010         return 0;
e86e1244a41352 Mark Brown        2010-10-18  1011  }
e86e1244a41352 Mark Brown        2010-10-18  1012 =20
e86e1244a41352 Mark Brown        2010-10-18  1013  static int max98088_dai2=
_hw_params(struct snd_pcm_substream *substream,
e86e1244a41352 Mark Brown        2010-10-18  1014                          =
          struct snd_pcm_hw_params *params,
e86e1244a41352 Mark Brown        2010-10-18  1015                          =
          struct snd_soc_dai *dai)
e86e1244a41352 Mark Brown        2010-10-18  1016  {
da12f93d8f90b9 Kuninori Morimoto 2026-02-13  1017  	struct snd_soc_componen=
t *component =3D snd_soc_dai_to_component(dai);
3f64507697e32c Kuninori Morimoto 2018-01-29 @1018         struct max98088_p=
riv *max98088 =3D snd_soc_component_get_drvdata(component);
e86e1244a41352 Mark Brown        2010-10-18  1019         struct max98088_c=
data *cdata;
e86e1244a41352 Mark Brown        2010-10-18  1020         unsigned long lon=
g ni;
e86e1244a41352 Mark Brown        2010-10-18  1021         unsigned int rate;
e86e1244a41352 Mark Brown        2010-10-18  1022         u8 regval;
e86e1244a41352 Mark Brown        2010-10-18  1023 =20
e86e1244a41352 Mark Brown        2010-10-18  1024         cdata =3D &max980=
88->dai[1];
e86e1244a41352 Mark Brown        2010-10-18  1025 =20
e86e1244a41352 Mark Brown        2010-10-18  1026         rate =3D params_r=
ate(params);
e86e1244a41352 Mark Brown        2010-10-18  1027 =20
b05e16d21251e1 Mark Brown        2014-07-31  1028         switch (params_wi=
dth(params)) {
b05e16d21251e1 Mark Brown        2014-07-31  1029         case 16:
3f64507697e32c Kuninori Morimoto 2018-01-29  1030                 snd_soc_c=
omponent_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
e86e1244a41352 Mark Brown        2010-10-18  1031                         M=
98088_DAI_WS, 0);
e86e1244a41352 Mark Brown        2010-10-18  1032                 break;
b05e16d21251e1 Mark Brown        2014-07-31  1033         case 24:
3f64507697e32c Kuninori Morimoto 2018-01-29  1034                 snd_soc_c=
omponent_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
e86e1244a41352 Mark Brown        2010-10-18  1035                         M=
98088_DAI_WS, M98088_DAI_WS);
e86e1244a41352 Mark Brown        2010-10-18  1036                 break;
e86e1244a41352 Mark Brown        2010-10-18  1037         default:
e86e1244a41352 Mark Brown        2010-10-18  1038                 return -E=
INVAL;
e86e1244a41352 Mark Brown        2010-10-18  1039         }
e86e1244a41352 Mark Brown        2010-10-18  1040 =20
3f64507697e32c Kuninori Morimoto 2018-01-29  1041         snd_soc_component=
_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
e86e1244a41352 Mark Brown        2010-10-18  1042 =20
e86e1244a41352 Mark Brown        2010-10-18  1043         if (rate_value(ra=
te, &regval))
e86e1244a41352 Mark Brown        2010-10-18  1044                 return -E=
INVAL;
e86e1244a41352 Mark Brown        2010-10-18  1045 =20
3f64507697e32c Kuninori Morimoto 2018-01-29  1046         snd_soc_component=
_update_bits(component, M98088_REG_19_DAI2_CLKMODE,
e86e1244a41352 Mark Brown        2010-10-18  1047                 M98088_CL=
KMODE_MASK, regval);
e86e1244a41352 Mark Brown        2010-10-18  1048         cdata->rate =3D r=
ate;
e86e1244a41352 Mark Brown        2010-10-18  1049 =20
e86e1244a41352 Mark Brown        2010-10-18  1050         /* Configure NI w=
hen operating as master */
1227f601ba3477 Kuninori Morimoto 2020-06-16  1051         if (snd_soc_compo=
nent_read(component, M98088_REG_1C_DAI2_FORMAT)
e86e1244a41352 Mark Brown        2010-10-18  1052                 & M98088_=
DAI_MAS) {
6c9762a78c3251 Marco Felsch      2021-04-23  1053                 unsigned =
long pclk;
6c9762a78c3251 Marco Felsch      2021-04-23  1054 =20
e86e1244a41352 Mark Brown        2010-10-18  1055                 if (max98=
088->sysclk =3D=3D 0) {
3f64507697e32c Kuninori Morimoto 2018-01-29  1056                         d=
ev_err(component->dev, "Invalid system clock frequency\n");
e86e1244a41352 Mark Brown        2010-10-18  1057                         r=
eturn -EINVAL;
e86e1244a41352 Mark Brown        2010-10-18  1058                 }
e86e1244a41352 Mark Brown        2010-10-18  1059                 ni =3D 65=
536ULL * (rate < 50000 ? 96ULL : 48ULL)
e86e1244a41352 Mark Brown        2010-10-18  1060                          =
       * (unsigned long long int)rate;
6c9762a78c3251 Marco Felsch      2021-04-23  1061                 pclk =3D =
DIV_ROUND_CLOSEST(max98088->sysclk, max98088->mclk_prescaler);
6c9762a78c3251 Marco Felsch      2021-04-23  1062                 ni =3D DI=
V_ROUND_CLOSEST_ULL(ni, pclk);
3f64507697e32c Kuninori Morimoto 2018-01-29  1063                 snd_soc_c=
omponent_write(component, M98088_REG_1A_DAI2_CLKCFG_HI,
e86e1244a41352 Mark Brown        2010-10-18  1064                         (=
ni >> 8) & 0x7F);
3f64507697e32c Kuninori Morimoto 2018-01-29  1065                 snd_soc_c=
omponent_write(component, M98088_REG_1B_DAI2_CLKCFG_LO,
e86e1244a41352 Mark Brown        2010-10-18  1066                         n=
i & 0xFF);
e86e1244a41352 Mark Brown        2010-10-18  1067         }
e86e1244a41352 Mark Brown        2010-10-18  1068 =20
e86e1244a41352 Mark Brown        2010-10-18  1069         /* Update sample =
rate mode */
e86e1244a41352 Mark Brown        2010-10-18  1070         if (rate < 50000)
3f64507697e32c Kuninori Morimoto 2018-01-29  1071                 snd_soc_c=
omponent_update_bits(component, M98088_REG_20_DAI2_FILTERS,
e86e1244a41352 Mark Brown        2010-10-18  1072                         M=
98088_DAI_DHF, 0);
e86e1244a41352 Mark Brown        2010-10-18  1073         else
3f64507697e32c Kuninori Morimoto 2018-01-29  1074                 snd_soc_c=
omponent_update_bits(component, M98088_REG_20_DAI2_FILTERS,
e86e1244a41352 Mark Brown        2010-10-18  1075                         M=
98088_DAI_DHF, M98088_DAI_DHF);
e86e1244a41352 Mark Brown        2010-10-18  1076 =20
3f64507697e32c Kuninori Morimoto 2018-01-29  1077         snd_soc_component=
_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN,
e86e1244a41352 Mark Brown        2010-10-18  1078                 M98088_SH=
DNRUN);
e86e1244a41352 Mark Brown        2010-10-18  1079 =20
e86e1244a41352 Mark Brown        2010-10-18  1080         return 0;
e86e1244a41352 Mark Brown        2010-10-18  1081  }
e86e1244a41352 Mark Brown        2010-10-18  1082 =20
e86e1244a41352 Mark Brown        2010-10-18  1083  static int max98088_dai_=
set_sysclk(struct snd_soc_dai *dai,
e86e1244a41352 Mark Brown        2010-10-18  1084                          =
          int clk_id, unsigned int freq, int dir)
e86e1244a41352 Mark Brown        2010-10-18  1085  {
da12f93d8f90b9 Kuninori Morimoto 2026-02-13  1086  	struct snd_soc_componen=
t *component =3D snd_soc_dai_to_component(dai);
3f64507697e32c Kuninori Morimoto 2018-01-29  1087         struct max98088_p=
riv *max98088 =3D snd_soc_component_get_drvdata(component);
da12f93d8f90b9 Kuninori Morimoto 2026-02-13  1088  	struct device *dai_dev =
=3D snd_soc_dai_to_dev(dai);
e86e1244a41352 Mark Brown        2010-10-18  1089 =20
e86e1244a41352 Mark Brown        2010-10-18  1090         /* Requested cloc=
k frequency is already setup */
e86e1244a41352 Mark Brown        2010-10-18  1091         if (freq =3D=3D m=
ax98088->sysclk)
e86e1244a41352 Mark Brown        2010-10-18  1092                 return 0;
e86e1244a41352 Mark Brown        2010-10-18  1093 =20
62a7fc32a6289d Andreas F=C3=A4rber    2018-10-05  1094  	if (!IS_ERR(max980=
88->mclk)) {
62a7fc32a6289d Andreas F=C3=A4rber    2018-10-05  1095  		freq =3D clk_roun=
d_rate(max98088->mclk, freq);
62a7fc32a6289d Andreas F=C3=A4rber    2018-10-05  1096  		clk_set_rate(max9=
8088->mclk, freq);
62a7fc32a6289d Andreas F=C3=A4rber    2018-10-05  1097  	}
62a7fc32a6289d Andreas F=C3=A4rber    2018-10-05  1098 =20
e86e1244a41352 Mark Brown        2010-10-18  1099         /* Setup clocks f=
or slave mode, and using the PLL
e86e1244a41352 Mark Brown        2010-10-18  1100          * PSCLK =3D 0x01=
 (when master clk is 10MHz to 20MHz)
e86e1244a41352 Mark Brown        2010-10-18  1101          *         0x02 (=
when master clk is 20MHz to 30MHz)..
e86e1244a41352 Mark Brown        2010-10-18  1102          */
e86e1244a41352 Mark Brown        2010-10-18  1103         if ((freq >=3D 10=
000000) && (freq < 20000000)) {
3f64507697e32c Kuninori Morimoto 2018-01-29  1104                 snd_soc_c=
omponent_write(component, M98088_REG_10_SYS_CLK, 0x10);
6c9762a78c3251 Marco Felsch      2021-04-23  1105                 max98088-=
>mclk_prescaler =3D 1;
e86e1244a41352 Mark Brown        2010-10-18  1106         } else if ((freq =
>=3D 20000000) && (freq < 30000000)) {
3f64507697e32c Kuninori Morimoto 2018-01-29  1107                 snd_soc_c=
omponent_write(component, M98088_REG_10_SYS_CLK, 0x20);
6c9762a78c3251 Marco Felsch      2021-04-23  1108                 max98088-=
>mclk_prescaler =3D 2;
e86e1244a41352 Mark Brown        2010-10-18  1109         } else {
3f64507697e32c Kuninori Morimoto 2018-01-29  1110                 dev_err(c=
omponent->dev, "Invalid master clock frequency\n");
e86e1244a41352 Mark Brown        2010-10-18  1111                 return -E=
INVAL;
e86e1244a41352 Mark Brown        2010-10-18  1112         }
e86e1244a41352 Mark Brown        2010-10-18  1113 =20
1227f601ba3477 Kuninori Morimoto 2020-06-16  1114         if (snd_soc_compo=
nent_read(component, M98088_REG_51_PWR_SYS)  & M98088_SHDNRUN) {
3f64507697e32c Kuninori Morimoto 2018-01-29  1115                 snd_soc_c=
omponent_update_bits(component, M98088_REG_51_PWR_SYS,
e86e1244a41352 Mark Brown        2010-10-18  1116                         M=
98088_SHDNRUN, 0);
3f64507697e32c Kuninori Morimoto 2018-01-29  1117                 snd_soc_c=
omponent_update_bits(component, M98088_REG_51_PWR_SYS,
e86e1244a41352 Mark Brown        2010-10-18  1118                         M=
98088_SHDNRUN, M98088_SHDNRUN);
e86e1244a41352 Mark Brown        2010-10-18  1119         }
e86e1244a41352 Mark Brown        2010-10-18  1120 =20
da12f93d8f90b9 Kuninori Morimoto 2026-02-13  1121         dev_dbg(dai_dev, =
"Clock source is %d at %uHz\n", clk_id, freq);
e86e1244a41352 Mark Brown        2010-10-18  1122 =20
e86e1244a41352 Mark Brown        2010-10-18  1123         max98088->sysclk =
=3D freq;
e86e1244a41352 Mark Brown        2010-10-18  1124         return 0;
e86e1244a41352 Mark Brown        2010-10-18  1125  }
e86e1244a41352 Mark Brown        2010-10-18  1126 =20
e86e1244a41352 Mark Brown        2010-10-18  1127  static int max98088_dai1=
_set_fmt(struct snd_soc_dai *codec_dai,
e86e1244a41352 Mark Brown        2010-10-18  1128                          =
        unsigned int fmt)
e86e1244a41352 Mark Brown        2010-10-18  1129  {
da12f93d8f90b9 Kuninori Morimoto 2026-02-13  1130  	struct snd_soc_componen=
t *component =3D snd_soc_dai_to_component(codec_dai);
3f64507697e32c Kuninori Morimoto 2018-01-29 @1131         struct max98088_p=
riv *max98088 =3D snd_soc_component_get_drvdata(component);
e86e1244a41352 Mark Brown        2010-10-18  1132         struct max98088_c=
data *cdata;
e86e1244a41352 Mark Brown        2010-10-18  1133         u8 reg15val;
e86e1244a41352 Mark Brown        2010-10-18  1134         u8 reg14val =3D 0;
e86e1244a41352 Mark Brown        2010-10-18  1135 =20
e86e1244a41352 Mark Brown        2010-10-18  1136         cdata =3D &max980=
88->dai[0];
e86e1244a41352 Mark Brown        2010-10-18  1137 =20
e86e1244a41352 Mark Brown        2010-10-18  1138         if (fmt !=3D cdat=
a->fmt) {
e86e1244a41352 Mark Brown        2010-10-18  1139                 cdata->fm=
t =3D fmt;
e86e1244a41352 Mark Brown        2010-10-18  1140 =20
14688a14dac34a Mark Brown        2022-02-22  1141                 switch (f=
mt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
14688a14dac34a Mark Brown        2022-02-22  1142                 case SND_=
SOC_DAIFMT_CBC_CFC:
14688a14dac34a Mark Brown        2022-02-22  1143                         /=
* Consumer mode PLL */
3f64507697e32c Kuninori Morimoto 2018-01-29  1144                         s=
nd_soc_component_write(component, M98088_REG_12_DAI1_CLKCFG_HI,
e86e1244a41352 Mark Brown        2010-10-18  1145                          =
       0x80);
3f64507697e32c Kuninori Morimoto 2018-01-29  1146                         s=
nd_soc_component_write(component, M98088_REG_13_DAI1_CLKCFG_LO,
e86e1244a41352 Mark Brown        2010-10-18  1147                          =
       0x00);
e86e1244a41352 Mark Brown        2010-10-18  1148                         b=
reak;
14688a14dac34a Mark Brown        2022-02-22  1149                 case SND_=
SOC_DAIFMT_CBP_CFP:
14688a14dac34a Mark Brown        2022-02-22  1150                         /=
* Set to provider mode */
e86e1244a41352 Mark Brown        2010-10-18  1151                         r=
eg14val |=3D M98088_DAI_MAS;
e86e1244a41352 Mark Brown        2010-10-18  1152                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1153                 default:
3f64507697e32c Kuninori Morimoto 2018-01-29  1154                         d=
ev_err(component->dev, "Clock mode unsupported");
e86e1244a41352 Mark Brown        2010-10-18  1155                         r=
eturn -EINVAL;
e86e1244a41352 Mark Brown        2010-10-18  1156                 }
e86e1244a41352 Mark Brown        2010-10-18  1157 =20
e86e1244a41352 Mark Brown        2010-10-18  1158                 switch (f=
mt & SND_SOC_DAIFMT_FORMAT_MASK) {
e86e1244a41352 Mark Brown        2010-10-18  1159                 case SND_=
SOC_DAIFMT_I2S:
e86e1244a41352 Mark Brown        2010-10-18  1160                         r=
eg14val |=3D M98088_DAI_DLY;
e86e1244a41352 Mark Brown        2010-10-18  1161                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1162                 case SND_=
SOC_DAIFMT_LEFT_J:
e86e1244a41352 Mark Brown        2010-10-18  1163                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1164                 default:
e86e1244a41352 Mark Brown        2010-10-18  1165                         r=
eturn -EINVAL;
e86e1244a41352 Mark Brown        2010-10-18  1166                 }
e86e1244a41352 Mark Brown        2010-10-18  1167 =20
e86e1244a41352 Mark Brown        2010-10-18  1168                 switch (f=
mt & SND_SOC_DAIFMT_INV_MASK) {
e86e1244a41352 Mark Brown        2010-10-18  1169                 case SND_=
SOC_DAIFMT_NB_NF:
e86e1244a41352 Mark Brown        2010-10-18  1170                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1171                 case SND_=
SOC_DAIFMT_NB_IF:
e86e1244a41352 Mark Brown        2010-10-18  1172                         r=
eg14val |=3D M98088_DAI_WCI;
e86e1244a41352 Mark Brown        2010-10-18  1173                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1174                 case SND_=
SOC_DAIFMT_IB_NF:
e86e1244a41352 Mark Brown        2010-10-18  1175                         r=
eg14val |=3D M98088_DAI_BCI;
e86e1244a41352 Mark Brown        2010-10-18  1176                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1177                 case SND_=
SOC_DAIFMT_IB_IF:
e86e1244a41352 Mark Brown        2010-10-18  1178                         r=
eg14val |=3D M98088_DAI_BCI|M98088_DAI_WCI;
e86e1244a41352 Mark Brown        2010-10-18  1179                         b=
reak;
e86e1244a41352 Mark Brown        2010-10-18  1180                 default:
e86e1244a41352 Mark Brown        2010-10-18  1181                         r=
eturn -EINVAL;
e86e1244a41352 Mark Brown        2010-10-18  1182                 }
e86e1244a41352 Mark Brown        2010-10-18  1183 =20
3f64507697e32c Kuninori Morimoto 2018-01-29  1184                 snd_soc_c=
omponent_update_bits(component, M98088_REG_14_DAI1_FORMAT,
e86e1244a41352 Mark Brown        2010-10-18  1185                         M=
98088_DAI_MAS | M98088_DAI_DLY | M98088_DAI_BCI |
e86e1244a41352 Mark Brown        2010-10-18  1186                         M=
98088_DAI_WCI, reg14val);
e86e1244a41352 Mark Brown        2010-10-18  1187 =20
e86e1244a41352 Mark Brown        2010-10-18  1188                 reg15val =
=3D M98088_DAI_BSEL64;
e86e1244a41352 Mark Brown        2010-10-18  1189                 if (max98=
088->digmic)
e86e1244a41352 Mark Brown        2010-10-18  1190                         r=
eg15val |=3D M98088_DAI_OSR64;
3f64507697e32c Kuninori Morimoto 2018-01-29  1191                 snd_soc_c=
omponent_write(component, M98088_REG_15_DAI1_CLOCK, reg15val);
e86e1244a41352 Mark Brown        2010-10-18  1192         }
e86e1244a41352 Mark Brown        2010-10-18  1193 =20
e86e1244a41352 Mark Brown        2010-10-18  1194         return 0;
e86e1244a41352 Mark Brown        2010-10-18  1195  }
e86e1244a41352 Mark Brown        2010-10-18  1196 =20

:::::: The code at line 948 was first introduced by commit
:::::: 3f64507697e32c2f491224f9f0656be5ae5d6d15 ASoC: max98088: replace cod=
ec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
