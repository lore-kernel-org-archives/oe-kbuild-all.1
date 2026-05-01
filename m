Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAB3290BB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613670; cv=none; b=CFUY5rA8Pv89FkvIS01eFbQTljYPXG6Mb0b9CX6og+7o2/ckxQUUshXPdW/4zjbznuuc/F6B95SI5As2md2xjC/G/j2BqIMBnnx189Jdm8Y+xAHG58RuaWIJETB6oAu8/uxJwqb7evwXvOQuZH8Or0L3Snwy0PxPIVTXkRIjyIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613670; c=relaxed/simple;
	bh=PIiYDfQufaxzUFy4iyDMQWXAS2/6A8BWTzRv7Oh1mMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U1xmaz2CwV2H94VxqytrQ5Ysluap9Q9bSGg2T35Q6bo6F9YKUy1qYJsaUZ9ftEFvnxxTG8i1SrZbQkG+C4KtTmZGPGlb2mLnlg8d7dIgKpYlyMX0VJABl4ZaxWVMm9K1zVUgOrSYRt4q1v8JrJ5j+RQag/wKMlrguVWYjyLPBew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vgw2gAD5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vgw2gAD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777613669; x=1809149669;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PIiYDfQufaxzUFy4iyDMQWXAS2/6A8BWTzRv7Oh1mMo=;
  b=Vgw2gAD5scwgbk1IYnEaUbM9b0177qu0sYOl3VmxZy55Nz5B5dKDzIDj
   EPafA6QFlC4yFaUnZix89uMCgw0gEh3e/QU0qIZmbPoC8gfdv66/66AhL
   tLSMe9fgW//AibyC7SHs0wQ8btBLDAGrHIVSrnMar550njLXcuNSl5WIp
   WOHMHbrhvBmHL6gdNQBdG7q9wOWW0/oSSwT0kPgktnULWQr3Alh9KGSbK
   UA7T76mP/IrcZrR3s9+mTqcNsMQWkW9+Xq5pHjWkR0TRyiTU4/vUUQSWc
   zKXrgFOpfPg82sPf9zqaJ0ATgSCKo3GO9HihZX+sidq8/6L0osolJwzfC
   w==;
X-CSE-ConnectionGUID: n++zrGQ4R2md3vmEe2fP1w==
X-CSE-MsgGUID: LCnsoD/aTuyFOtZocHs3VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="95996475"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="95996475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 22:34:28 -0700
X-CSE-ConnectionGUID: n1RT5m0sTWafskQqUfwvMQ==
X-CSE-MsgGUID: +rYDpQdZSrukDBAnotxC5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="235045302"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Apr 2026 22:34:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIgW8-000000000DD-0i6c;
	Fri, 01 May 2026 05:34:24 +0000
Date: Fri, 01 May 2026 13:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 13/13]
 drivers/fpga/intel-m10-bmc-sec-update.c:186:16: error: implicit declaration
 of function 'bitmap_print_to_pagebuf'; did you mean
 'cpumap_print_to_pagebuf'?
Message-ID: <202605011326.qFg97QDd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26
commit: 09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26 [13/13] bitmap: drop bitma=
p_print_to_pagebuf()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260501/2=
02605011326.qFg97QDd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260501/202605011326.qFg97QDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011326.qFg97QDd-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   drivers/fpga/intel-m10-bmc-sec-update.c: In function 'show_canceled_csk':
>> drivers/fpga/intel-m10-bmc-sec-update.c:186:16: error: implicit declarat=
ion of function 'bitmap_print_to_pagebuf'; did you mean 'cpumap_print_to_pa=
gebuf'? [-Wimplicit-function-declaration]
     186 |         return bitmap_print_to_pagebuf(1, buf, csk_map, CSK_BIT_=
LEN);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
         |                cpumap_print_to_pagebuf


vim +186 drivers/fpga/intel-m10-bmc-sec-update.c

7f03d84a672d87 Russ Weight   2022-06-06  164 =20
7f03d84a672d87 Russ Weight   2022-06-06  165  static ssize_t
7f03d84a672d87 Russ Weight   2022-06-06  166  show_canceled_csk(struct devi=
ce *dev, u32 addr, char *buf)
7f03d84a672d87 Russ Weight   2022-06-06  167  {
3e10c805b382d0 Ilpo J=C3=A4rvinen 2023-01-16  168  	unsigned int i, size =
=3D CSK_32ARRAY_SIZE * sizeof(u32);
7f03d84a672d87 Russ Weight   2022-06-06  169  	struct m10bmc_sec *sec =3D d=
ev_get_drvdata(dev);
7f03d84a672d87 Russ Weight   2022-06-06  170  	DECLARE_BITMAP(csk_map, CSK_=
BIT_LEN);
7f03d84a672d87 Russ Weight   2022-06-06  171  	__le32 csk_le32[CSK_32ARRAY_=
SIZE];
7f03d84a672d87 Russ Weight   2022-06-06  172  	u32 csk32[CSK_32ARRAY_SIZE];
7f03d84a672d87 Russ Weight   2022-06-06  173  	int ret;
7f03d84a672d87 Russ Weight   2022-06-06  174 =20
3e10c805b382d0 Ilpo J=C3=A4rvinen 2023-01-16  175  	ret =3D m10bmc_sec_read=
(sec, (u8 *)&csk_le32, addr, size);
7f03d84a672d87 Russ Weight   2022-06-06  176  	if (ret) {
3e10c805b382d0 Ilpo J=C3=A4rvinen 2023-01-16  177  		dev_err(sec->dev, "fai=
led to read CSK vector\n");
7f03d84a672d87 Russ Weight   2022-06-06  178  		return ret;
7f03d84a672d87 Russ Weight   2022-06-06  179  	}
7f03d84a672d87 Russ Weight   2022-06-06  180 =20
7f03d84a672d87 Russ Weight   2022-06-06  181  	for (i =3D 0; i < CSK_32ARRA=
Y_SIZE; i++)
7f03d84a672d87 Russ Weight   2022-06-06  182  		csk32[i] =3D le32_to_cpu(((=
csk_le32[i])));
7f03d84a672d87 Russ Weight   2022-06-06  183 =20
7f03d84a672d87 Russ Weight   2022-06-06  184  	bitmap_from_arr32(csk_map, c=
sk32, CSK_BIT_LEN);
7f03d84a672d87 Russ Weight   2022-06-06  185  	bitmap_complement(csk_map, c=
sk_map, CSK_BIT_LEN);
7f03d84a672d87 Russ Weight   2022-06-06 @186  	return bitmap_print_to_pageb=
uf(1, buf, csk_map, CSK_BIT_LEN);
7f03d84a672d87 Russ Weight   2022-06-06  187  }
7f03d84a672d87 Russ Weight   2022-06-06  188 =20

:::::: The code at line 186 was first introduced by commit
:::::: 7f03d84a672d87630448339a8a0e1d689f6980f9 fpga: m10bmc-sec: expose ma=
x10 canceled keys in sysfs

:::::: TO: Russ Weight <russell.h.weight@intel.com>
:::::: CC: Xu Yilun <yilun.xu@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
