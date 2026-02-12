Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45E2D8DD4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894629; cv=none; b=IAARtC6X9dqyqfXIs+siPokp3GRrd3zBEeLhz3jqS0GTHKKWzGWPNc60C8ljWOI46BMXfjAub8mXL3NlAFGcWg2bvjsV+1QAme/9ZuCrDDuK3PQyEt/yk4fV2AYDuRcJHhfdfgzl3RYPMNK/FiQIOVG8yVRxIMhIuro/gGWKEO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894629; c=relaxed/simple;
	bh=YbnMDj1S0xL1SuwE6tbKKYDS5HAQtgOeUHelQSb5ex8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XKaSra2CcqVkxeqy8j5CMIc+dyvfcZ2wVFkj/UmuGDxLG+Yg2vxrvZzmdI6F7PFua3SII07FCtC1UdE+MuYM2yAJy0LipD4HY1sklieBG0tmxGdJkjz/IOnkNQBltxfC5kKtZ8a/6Y1z0CKaU8HtYPjNzqasvMVfESjwR+9SzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQz86rLq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQz86rLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770894628; x=1802430628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YbnMDj1S0xL1SuwE6tbKKYDS5HAQtgOeUHelQSb5ex8=;
  b=XQz86rLq9O3RboVtQjN03/5LzZ46dpvGxRjH8vSm+mi82S26kjxh520x
   PdxHTHPCyQS9jjdF45zClKFqdaZvkeb+2Ap23QdEpDJcqTpNMIsv2dgkJ
   gLrPqbM2c3CagWPXry90bqHc+26bQ7vHDRpG+A3pO3SjUW/hK4NYK34o7
   eeiySLUwyjWDqaJbHqncKqzJsY4oA0DaN+X5Yqn2588ajsl71vnDKBQn7
   iuWvHQv5OrJbc/JRPNoMCOgWiugTYJ0UuDbGUSknYxYf+HVyeQ4ed9iw/
   T3AO/mYV6gffK0Hx4s/QUXePbi66DnDhPR7ZD8Grng8Ops4fyfFVZ27e9
   Q==;
X-CSE-ConnectionGUID: FYE+bknNTEqb+OJd3EJK2w==
X-CSE-MsgGUID: mPRJEBN/Q4yxQbOuo7NPtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75907643"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="75907643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:10:28 -0800
X-CSE-ConnectionGUID: 81zS6XElTaKHn3NgEm7SPg==
X-CSE-MsgGUID: C6IG1XnSTqqrIVzCuyezJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="212674285"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2026 03:10:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqUaV-00000000r6a-3dLq;
	Thu, 12 Feb 2026 11:10:23 +0000
Date: Thu, 12 Feb 2026 19:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"=C5=A0erif?= Rami" <ramiserifpersia@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
Subject: sound/usb/usx2y/us144mkii.c:27:12: warning: 'index' defined
 but not used
Message-ID: <202602121917.O39hNVas-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi =C5=A0erif,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   37a93dd5c49b5fda807fd204edf2547c3493319c
commit: 0ec417aa85467c6fad0563621b74868be0faf00d ALSA: usb-audio: Add infra=
structure for TASCAM US-144MKII
date:   6 months ago
config: loongarch-randconfig-r133-20260212 (https://download.01.org/0day-ci=
/archive/20260212/202602121917.O39hNVas-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260212/202602121917.O39hNVas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121917.O39hNVas-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/kfifo.h:40,
                    from sound/usb/usx2y/us144mkii.h:7,
                    from sound/usb/usx2y/us144mkii.c:7:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support=
 for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary w=
hen a recent assembler is used
         |    ^~~~~
>> sound/usb/usx2y/us144mkii.c:27:12: warning: 'index' defined but not used=
 [-Wunused-variable]
      27 | static int index[SNDRV_CARDS] =3D SNDRV_DEFAULT_IDX;
         |            ^~~~~


vim +/index +27 sound/usb/usx2y/us144mkii.c

dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  12 =20
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  13  /**
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  14   * @brief Module parameters =
for ALSA card instantiation.
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  15   *
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  16   * These parameters allow us=
ers to configure how the ALSA sound card
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  17   * for the TASCAM US-144MKII=
 is instantiated.
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  18   *
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  19   * @param index: Array of in=
tegers specifying the ALSA card index for each
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  20   * device. Defaults to -1 (a=
utomatic).
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  21   * @param id: Array of strin=
gs specifying the ALSA card ID for each device.
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  22   *            Defaults to "U=
S144MKII".
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  23   * @param enable: Array of b=
ooleans to enable or disable each device.
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  24   *                Defaults t=
o {1, 0, ..., 0} (first device enabled).
5c8c10796e274d =C5=A0erif Rami 2025-08-14  25   * @param dev_idx: Internal =
counter for the number of TASCAM devices probed.
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  26   */
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14 @27  static int index[SNDRV_CARDS=
] =3D SNDRV_DEFAULT_IDX;
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  28  static char *id[SNDRV_CARDS]=
 =3D SNDRV_DEFAULT_STR;
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  29  static bool enable[SNDRV_CAR=
DS] =3D { 1, [1 ...(SNDRV_CARDS - 1)] =3D 0 };
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  30  static int dev_idx;
dee1bcf28a3dd1 =C5=A0erif Rami 2025-08-14  31 =20

:::::: The code at line 27 was first introduced by commit
:::::: dee1bcf28a3dd13ddb2e9200407864f73e9c4d63 ALSA: usb-audio: Add initia=
l driver for TASCAM US-144MKII

:::::: TO: =C5=A0erif Rami <ramiserifpersia@gmail.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
