Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEB41A00F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 04:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775881505; cv=none; b=k//Ydq1+yQjAbJsC8/Er9LbjMnV7CCv5fJKK0AvLcRRjT7T7Bll2pmNr5MO79Q6cp1XuThSvUYRnhGepoINtZ/NfJLICkbyj1IvlsIxc3p5nS68jAQwIMz6pv8UB6jD+7RwXXJi9Mj4Ssd1FiuJghw3CAkDlsmqCsbuDP/qF9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775881505; c=relaxed/simple;
	bh=XKInVug3eFaVF/DnCI3O3vSttHw54DBcqJmJhqh4qBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O4nhmzopxVWgkl28DHiGe7e/YPu8Jycs8kZTqu1TGLhoH7exNSRtLY2RDMfsK9OhDrk5NnijI9tuWKUU2rmwHu6N2LgGF2JtHGxCfzrg/9cCqT1N6t0RSt55eU81DMK75qAYpgxLaNvQZCdSxpZZoZLHEM+fqVjjaYKNjHwmySI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U82tI9/5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U82tI9/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775881504; x=1807417504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XKInVug3eFaVF/DnCI3O3vSttHw54DBcqJmJhqh4qBQ=;
  b=U82tI9/5GfbWQfiKFLPh98v9oHOZ5ex5jzATd/R94e0mfK0adynqAmEz
   Hm5dugCThe3w/pk5flPgUTzGRpHEJSKJ35LadSj0x3MiEAaPbeJK1Nv4F
   +HfPHZ5ae72B+9M4R/6ZQAz2+enG9mdvfsTczpVZ5GNyiTbxbfSi2ktBS
   inIg+QmMLFRvdY5s/+ig7ZcCr7ca144NtEx1OI9kbn/SfY+qiIMHl2/Y4
   3sWEAxTwtbugp5VzBRB+Ut+Fh7riZ4YJ+g5PYje+/qMyDEWTr1yh75Oe0
   6OzONHK5FHgFXQqGPCGufievVJq1LEIWNXK1BWAwK+7y63hyg18ihDa/g
   w==;
X-CSE-ConnectionGUID: pcdp2cPRT4KNphPiSnvRYA==
X-CSE-MsgGUID: ZiymVysxRRuWSPs3WJAytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76777386"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76777386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 21:25:04 -0700
X-CSE-ConnectionGUID: rlWwUYQ/S3GBf7numPyWcg==
X-CSE-MsgGUID: qij6k2OqQI+v5Kd7ul2XKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224966043"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 21:25:01 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBPty-000000000l3-1q6I;
	Sat, 11 Apr 2026 04:24:58 +0000
Date: Sat, 11 Apr 2026 12:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 91/98]
 drivers/platform/x86/intel/int3472/led.c:20:45: error: 'struct
 int3472_discrete_device' has no member named 'led'; did you mean 'leds'?
Message-ID: <202604111227.IKQ61Oxf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git review-ilpo-next
head:   d0e6904dc063c19e470bb505eb010eb9f1b1148a
commit: bbd917d96aa152a5c4701964db5b28db666f7491 [91/98] platform/x86: int3=
472: Add support for GPIO type 0x02 (IR flood LED)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260411=
/202604111227.IKQ61Oxf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604111227.IKQ61Oxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111227.IKQ61Oxf-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_regis=
ter_led':
>> drivers/platform/x86/intel/int3472/led.c:20:45: error: 'struct int3472_d=
iscrete_device' has no member named 'led'; did you mean 'leds'?
      20 |         struct int3472_led *led =3D &int3472->led;
         |                                             ^~~
         |                                             leds
   drivers/platform/x86/intel/int3472/led.c: At top level:
>> drivers/platform/x86/intel/int3472/led.c:52:6: warning: no previous prot=
otype for 'skl_int3472_unregister_led' [-Wmissing-prototypes]
      52 | void skl_int3472_unregister_led(struct int3472_discrete_device *=
int3472)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_unreg=
ister_led':
   drivers/platform/x86/intel/int3472/led.c:54:45: error: 'struct int3472_d=
iscrete_device' has no member named 'led'; did you mean 'leds'?
      54 |         struct int3472_led *led =3D &int3472->led;
         |                                             ^~~
         |                                             leds


vim +20 drivers/platform/x86/intel/int3472/led.c

5ae20a8050d08a Hans de Goede    2023-01-27  16 =20
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  17  int skl_int3472_register_le=
d(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  18  			     const char *con_id)
5ae20a8050d08a Hans de Goede    2023-01-27  19  {
39237e3208209d Marco Nenciarini 2026-04-01 @20  	struct int3472_led *led =
=3D &int3472->led;
53c5f7f6e7930f Hans de Goede    2023-10-04  21  	char *p;
5ae20a8050d08a Hans de Goede    2023-01-27  22  	int ret;
5ae20a8050d08a Hans de Goede    2023-01-27  23 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  24  	if (led->classdev.dev)
5ae20a8050d08a Hans de Goede    2023-01-27  25  		return -EBUSY;
5ae20a8050d08a Hans de Goede    2023-01-27  26 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  27  	led->gpio =3D gpio;
5ae20a8050d08a Hans de Goede    2023-01-27  28 =20
5ae20a8050d08a Hans de Goede    2023-01-27  29  	/* Generate the name, repl=
acing the ':' in the ACPI devname with '_' */
d6116d86e58a04 Marco Nenciarini 2026-04-01  30  	snprintf(led->name, sizeof=
(led->name),
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  31  		 "%s::%s_led", acpi_dev_n=
ame(int3472->sensor), con_id);
d6116d86e58a04 Marco Nenciarini 2026-04-01  32  	p =3D strchr(led->name, ':=
');
5ae20a8050d08a Hans de Goede    2023-01-27  33  	if (p)
5ae20a8050d08a Hans de Goede    2023-01-27  34  		*p =3D '_';
5ae20a8050d08a Hans de Goede    2023-01-27  35 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  36  	led->classdev.name =3D led=
->name;
d6116d86e58a04 Marco Nenciarini 2026-04-01  37  	led->classdev.max_brightne=
ss =3D 1;
39237e3208209d Marco Nenciarini 2026-04-01  38  	led->classdev.brightness_s=
et_blocking =3D int3472_led_set;
5ae20a8050d08a Hans de Goede    2023-01-27  39 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  40  	ret =3D led_classdev_regis=
ter(int3472->dev, &led->classdev);
5ae20a8050d08a Hans de Goede    2023-01-27  41  	if (ret)
5ccf9873ab2bcb Hans de Goede    2023-10-04  42  		return ret;
5ae20a8050d08a Hans de Goede    2023-01-27  43 =20
d6116d86e58a04 Marco Nenciarini 2026-04-01  44  	led->lookup.provider =3D l=
ed->name;
d6116d86e58a04 Marco Nenciarini 2026-04-01  45  	led->lookup.dev_id =3D int=
3472->sensor_name;
218d3c44f5f0a3 Marco Nenciarini 2026-04-01  46  	led->lookup.con_id =3D con=
_id;
d6116d86e58a04 Marco Nenciarini 2026-04-01  47  	led_add_lookup(&led->looku=
p);
5ae20a8050d08a Hans de Goede    2023-01-27  48 =20
5ae20a8050d08a Hans de Goede    2023-01-27  49  	return 0;
5ae20a8050d08a Hans de Goede    2023-01-27  50  }
5ae20a8050d08a Hans de Goede    2023-01-27  51 =20
39237e3208209d Marco Nenciarini 2026-04-01 @52  void skl_int3472_unregister=
_led(struct int3472_discrete_device *int3472)

:::::: The code at line 20 was first introduced by commit
:::::: 39237e3208209d1bb35d939d6fee1f36b642f562 platform/x86: int3472: Rena=
me pled to led in LED registration code

:::::: TO: Marco Nenciarini <mnencia@kcore.it>
:::::: CC: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
