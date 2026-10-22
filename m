Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690841;
	b=4Ayz8sr19/jvgyVb1zDegLoeqMBcKnlGiAy1o9fHIeSMFaD3qlMIWhsvDSpjAxw7P87R
	 dleTueweuH7wL7nBTiCJzKtxD3ZsnehW2znQCGYY7fovyBzfbgkRglK8Agb+wFhPa7Kdm
	 gST1/Ei2ehpQQoqn5A3sfkw92uy4t1EDSqlfUB9tpx9aZWvKpXIdYmYByl6qG7xfP/MwH
	 rlaczv7OBjO7ZIj4AxKroZwqDguV34cKB2UT/AkCFlG8GdA5mKlbCdE1FM+JkbNBC3gTX
	 +Zj8+vEQIpu8mPj9wx1wtvIjcTpchLJ6oWzrcjThYERtDAgW3cvyjBextUjJeVmd14w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690841;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rIzkIzlxVshfj+zv1RaKr7LZm1RxVCKaE5w+6BRAbV8=;
	b=FwMzzoXv4sZ74XeIizYP876EbS/n6sREm4VQoHHnmVO4SH86/5Qi78l8bulooruXzC0H
	 UP9J7X5eJKZWT2MZ8T1ZRw78NQ6J25arzn/b4oIehY28ERx56OugCMsyRw+gmuQ7ckyFN
	 RJ8TS2taKUtgidEt5bXcQxSqd5Uj+iJmO8oB6ydeoYKr6CvDYpQCrvk/M+12Xv4ywBh0W
	 xkThzJ2XO9ExRkUYLZzIr31Ea9G+xA8Vj0wZrhV+nQdiQm4gnfeDHikfwPMub716Cd5tl
	 1+vtl0yIREDg9k95uK2DsxvuN/2NeAJVsn+05rasqAvEr+Yy659BawTc7x9wHgXa8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2Z5fpHX;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 17:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2Z5fpHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792690840; x=1824226840;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gYMdjHryxrjcr35DQJ/fXG6yE/3tLW0RUPr94nqQga4=;
  b=R2Z5fpHXJcSct3ih/gJVucfiWp4ZZ8Dzvgu0+V04guOei0RidNr0qGtr
   xueqN4rDrLQLuL4yB8uOTnDNNcta0l24CXjRal7DZiYySKpDwtmJGRMz4
   Pxm3+FarVr+zQWA3+I6s/tH4DCAIHCrzJPsjTbYiuc+RL4CqvQye0ftJ5
   xm812kp4plJfgKXZhOkJLOnYnoM7qi0vio6Zl+IH3GZLTlVgKZX/todbi
   W4352azFIjnCKbSMA4cXjXi4Xq9qmmj0iTeWj0Z0hwp+iSbjt2VW7kfuO
   WVmOLIsBWz9bvICkyQYyZfBEZa9AopEChShW5nqDJmBCAisZTtKt6AUei
   A==;
X-CSE-ConnectionGUID: RUQjcQweTrO6ZMj5Zj6OcA==
X-CSE-MsgGUID: O6XtbFcgQom+Ezj6dhXArQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1322457"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1322457"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 10:40:39 -0700
X-CSE-ConnectionGUID: wE4KalcrT722acOAVUvtXg==
X-CSE-MsgGUID: 92cj7yFDTh68eJsvgDwyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3505714"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2026 10:40:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJwmJ-00000000RQg-1AAC;
	Thu, 22 Oct 2026 17:40:35 +0000
Date: Fri, 23 Oct 2026 01:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 1/1]
 drivers/firmware/turris-mox-rwtm.c:244:69: warning: '%08x' directive writing
 8 bytes into a region of size between 7 and 9
Message-ID: <202610230124.s1LmY9qC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-=
03
head:   162041188e96c974a8078481672bfddc1ca10f9a
commit: a79f256fc99d6d7aa4a8c738c28cc876e5ef1435 [1/1] firmware: turris-mox=
-rwtm: Deduplicate command execution code
config: arm64-randconfig-1001-20261022 (https://download.01.org/0day-ci/arc=
hive/20261023/202610230124.s1LmY9qC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261023/202610230124.s1LmY9qC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: a79f256fc99d ("firmware: turris-mox-rwtm: Deduplicate command exec=
ution code")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230124.s1LmY9qC-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/turris-mox-rwtm.c: In function 'mox_get_board_info':
>> drivers/firmware/turris-mox-rwtm.c:244:69: warning: '%08x' directive wri=
ting 8 bytes into a region of size between 7 and 9 [-Wformat-overflow=3D]
     244 |    "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x=
%08x%08x",
         |                                                                 =
    ^~~~
   drivers/firmware/turris-mox-rwtm.c:243:3: note: 'sprintf' output between=
 135 and 137 bytes into a destination of size 135
     243 |   sprintf(rwtm->pubkey,
         |   ^~~~~~~~~~~~~~~~~~~~~
     244 |    "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x=
%08x%08x",
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
     245 |    ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     246 |    s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +244 drivers/firmware/turris-mox-rwtm.c

389711b37493996 Marek Beh=C3=BAn 2019-08-22  197 =20
389711b37493996 Marek Beh=C3=BAn 2019-08-22  198  static int mox_get_board_=
info(struct mox_rwtm *rwtm)
389711b37493996 Marek Beh=C3=BAn 2019-08-22  199  {
ed09d6d4f593862 Marek Beh=C3=BAn 2024-08-31  200  	struct device *dev =3D r=
wtm_dev(rwtm);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  201  	struct armada_37xx_rwtm_=
rx_msg *reply =3D &rwtm->reply;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  202  	int ret;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  203 =20
a79f256fc99d6d7 Marek Beh=C3=BAn 2024-08-31  204  	ret =3D mox_rwtm_exec(rw=
tm, MBOX_CMD_BOARD_INFO, NULL, false);
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  205  	if (ret =3D=3D -ENODATA)=
 {
ed09d6d4f593862 Marek Beh=C3=BAn 2024-08-31  206  		dev_warn(dev,
389711b37493996 Marek Beh=C3=BAn 2019-08-22  207  			 "Board does not have =
manufacturing information burned!\n");
8a4853a65b88240 Marek Beh=C3=BAn 2024-08-31  208  	} else if (ret =3D=3D -E=
OPNOTSUPP) {
ed09d6d4f593862 Marek Beh=C3=BAn 2024-08-31  209  		dev_notice(dev,
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  210  			   "Firmware does not =
support the BOARD_INFO command\n");
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  211  	} else if (ret < 0) {
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  212  		return ret;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  213  	} else {
389711b37493996 Marek Beh=C3=BAn 2019-08-22  214  		rwtm->serial_number =3D =
reply->status[1];
389711b37493996 Marek Beh=C3=BAn 2019-08-22  215  		rwtm->serial_number <<=
=3D 32;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  216  		rwtm->serial_number |=
=3D reply->status[0];
389711b37493996 Marek Beh=C3=BAn 2019-08-22  217  		rwtm->board_version =3D =
reply->status[2];
389711b37493996 Marek Beh=C3=BAn 2019-08-22  218  		rwtm->ram_size =3D repl=
y->status[3];
389711b37493996 Marek Beh=C3=BAn 2019-08-22  219  		reply_to_mac_addr(rwtm-=
>mac_address1, reply->status[4],
389711b37493996 Marek Beh=C3=BAn 2019-08-22  220  				  reply->status[5]);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  221  		reply_to_mac_addr(rwtm-=
>mac_address2, reply->status[6],
389711b37493996 Marek Beh=C3=BAn 2019-08-22  222  				  reply->status[7]);
b787a6b89284949 Marek Beh=C3=BAn 2024-08-31  223  		rwtm->has_board_info =
=3D true;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  224 =20
389711b37493996 Marek Beh=C3=BAn 2019-08-22  225  		pr_info("Turris Mox ser=
ial number %016llX\n",
389711b37493996 Marek Beh=C3=BAn 2019-08-22  226  			rwtm->serial_number);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  227  		pr_info("           boa=
rd version %i\n", rwtm->board_version);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  228  		pr_info("           bur=
ned RAM size %i MiB\n", rwtm->ram_size);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  229  	}
389711b37493996 Marek Beh=C3=BAn 2019-08-22  230 =20
a79f256fc99d6d7 Marek Beh=C3=BAn 2024-08-31  231  	ret =3D mox_rwtm_exec(rw=
tm, MBOX_CMD_ECDSA_PUB_KEY, NULL, false);
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  232  	if (ret =3D=3D -ENODATA)=
 {
ed09d6d4f593862 Marek Beh=C3=BAn 2024-08-31  233  		dev_warn(dev, "Board ha=
s no public key burned!\n");
8a4853a65b88240 Marek Beh=C3=BAn 2024-08-31  234  	} else if (ret =3D=3D -E=
OPNOTSUPP) {
ed09d6d4f593862 Marek Beh=C3=BAn 2024-08-31  235  		dev_notice(dev,
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  236  			   "Firmware does not =
support the ECDSA_PUB_KEY command\n");
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  237  	} else if (ret < 0) {
72f99888944c44d Marek Beh=C3=BAn 2021-05-20  238  		return ret;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  239  	} else {
389711b37493996 Marek Beh=C3=BAn 2019-08-22  240  		u32 *s =3D reply->statu=
s;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  241 =20
b787a6b89284949 Marek Beh=C3=BAn 2024-08-31  242  		rwtm->has_pubkey =3D tr=
ue;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  243  		sprintf(rwtm->pubkey,
389711b37493996 Marek Beh=C3=BAn 2019-08-22 @244  			"%06x%08x%08x%08x%08x%=
08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
389711b37493996 Marek Beh=C3=BAn 2019-08-22  245  			ret, s[0], s[1], s[2],=
 s[3], s[4], s[5], s[6], s[7],
389711b37493996 Marek Beh=C3=BAn 2019-08-22  246  			s[8], s[9], s[10], s[1=
1], s[12], s[13], s[14], s[15]);
389711b37493996 Marek Beh=C3=BAn 2019-08-22  247  	}
389711b37493996 Marek Beh=C3=BAn 2019-08-22  248 =20
389711b37493996 Marek Beh=C3=BAn 2019-08-22  249  	return 0;
389711b37493996 Marek Beh=C3=BAn 2019-08-22  250  }
389711b37493996 Marek Beh=C3=BAn 2019-08-22  251 =20

:::::: The code at line 244 was first introduced by commit
:::::: 389711b374939968d2d0adede01b9e1f3bb4f531 firmware: Add Turris Mox rW=
TM firmware driver

:::::: TO: Marek Beh=C3=BAn <marek.behun@nic.cz>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
