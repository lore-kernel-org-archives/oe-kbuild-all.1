Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E3D38836C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405066; cv=none; b=bU8aKwssSeImFvKO3V8qN/8NF9pAKA9e6MHhRw5vo3clB5KGHLTCVfrtznEaEwzHtZHDjuJ41nvukS1F7C3YavLD0Ctb6ur1g32H6q1uRq57Hjav/QKAtVUYH90cfoEIVFz57LUl3mmBBrZgDsFNIRZhOgmjX5vgFjw6bMFqcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405066; c=relaxed/simple;
	bh=35hdW/wwDjr1vFALwc1iduv8yoL5UmcgZk7rvJt/BV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lPkFYR/H/ck31qrMde47LQeXWj1re/aod3JLHSnY6uyKRYsdwmvCHo9M7ZaAIabtKGsTirNE2l3xuYQPUe8CWmqHvPyhLUETpprDOjyNF2uhpX6z5D2rjxIWsd/i90RNpAmlGXyKZHkbnoT33/13G3RpxgJNmScjWfUcOrx+s00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fmzbul+k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fmzbul+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780405065; x=1811941065;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=35hdW/wwDjr1vFALwc1iduv8yoL5UmcgZk7rvJt/BV0=;
  b=Fmzbul+kqnm/6mh0v3uFogBweF2eCuWNvkgC5Jkau58Hx+V6IucrobIr
   Oe+Ewt1Ipg9/bYYI3Us0+rTdKiRaFELEldxT0Bxehf5e5F5es4Ujfv5XN
   4MHheX3Scbi8gk4R0wDgOKrHXMWZU39FzKWDKyuJRXG5HhuJFlJua/MfX
   wB3iE2kVDnnUmHWJV4VPKcPDX9h8iizn9dAYChGjJFR9eRBWNstcefCwN
   Ts5E5UZc/4anyDYn7EbHOspgqQKsaKx2iB9ObbZUqcpejndeW/4YSIGSF
   p1HyZVMqGPFRT/7vRUR1iIvm+pkfcdC+VOhD6mBIpHUEVZIITaza0Uc0q
   A==;
X-CSE-ConnectionGUID: EgE+ElXLTGu9z5T1C34RKA==
X-CSE-MsgGUID: DPbNZYF4TjG7htgGu/aBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81248090"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81248090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:57:45 -0700
X-CSE-ConnectionGUID: fEmS+BFvRdam//y7BIk9pQ==
X-CSE-MsgGUID: vKFUdPYOSyG43fzp4odxtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243740104"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 05:57:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUOge-00000000C2m-39sH;
	Tue, 02 Jun 2026 12:57:40 +0000
Date: Tue, 02 Jun 2026 20:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/fsl/fsl_xcvr.c:236:33: warning: initialization of 'struct fsl_xcvr
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202606022034.wBwV4Y4m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 8be84f679bd497ac2dabc87df9f9a4737f841c0d [290/290] ASoC: soc-dai: r=
emove snd_soc_dai_{set/get}_drvdata()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/2026060=
2/202606022034.wBwV4Y4m-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260602/202606022034.wBwV4Y4m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022034.wBwV4Y4m-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_xcvr.c: In function 'fsl_xcvr_capds_put':
   sound/soc/fsl/fsl_xcvr.c:236:33: error: implicit declaration of function=
 'snd_soc_dai_get_drvdata'; did you mean 'snd_soc_card_get_drvdata'? [-Werr=
or=3Dimplicit-function-declaration]
     236 |         struct fsl_xcvr *xcvr =3D snd_soc_dai_get_drvdata(dai);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                 snd_soc_card_get_drvdata
>> sound/soc/fsl/fsl_xcvr.c:236:33: warning: initialization of 'struct fsl_=
xcvr *' from 'int' makes pointer from integer without a cast [-Wint-convers=
ion]
   cc1: some warnings being treated as errors


vim +236 sound/soc/fsl/fsl_xcvr.c

28564486866fa8 Viorel Suman   2020-10-13  231 =20
28564486866fa8 Viorel Suman   2020-10-13  232  static int fsl_xcvr_capds_pu=
t(struct snd_kcontrol *kcontrol,
28564486866fa8 Viorel Suman   2020-10-13  233  			      struct snd_ctl_elem=
_value *ucontrol)
28564486866fa8 Viorel Suman   2020-10-13  234  {
28564486866fa8 Viorel Suman   2020-10-13  235  	struct snd_soc_dai *dai =3D =
snd_kcontrol_chip(kcontrol);
28564486866fa8 Viorel Suman   2020-10-13 @236  	struct fsl_xcvr *xcvr =3D s=
nd_soc_dai_get_drvdata(dai);
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  237  	int changed;
28564486866fa8 Viorel Suman   2020-10-13  238 =20
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  239  	changed =3D memcmp(xcv=
r->cap_ds, ucontrol->value.bytes.data,
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  240  			 sizeof(xcvr->cap_ds=
)) !=3D 0;
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  241  	memcpy(xcvr->cap_ds, u=
control->value.bytes.data,
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  242  	       sizeof(xcvr->ca=
p_ds));
28564486866fa8 Viorel Suman   2020-10-13  243 =20
e8446a4a574d19 C=C3=A1ssio Gabriel 2026-04-28  244  	return changed;
28564486866fa8 Viorel Suman   2020-10-13  245  }
28564486866fa8 Viorel Suman   2020-10-13  246 =20

:::::: The code at line 236 was first introduced by commit
:::::: 28564486866fa889b78264360022c94836fa8072 ASoC: fsl_xcvr: Add XCVR AS=
oC CPU DAI driver

:::::: TO: Viorel Suman <viorel.suman@nxp.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
