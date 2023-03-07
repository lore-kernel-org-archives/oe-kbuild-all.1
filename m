Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6DD290F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 09:13:28 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9C2F5CD452
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 09:11:28 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D446F20012;
	Tue,  7 Mar 2023 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678180280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+35FxWwIjTdrtwuY1Ep/El64KtU1Rcfr22xgTT7AVo=;
	b=geSahXA+9PLffWU5jRXmywJsWv7w0yOpyUs+rdFgEAP4oM/F9dgPQPU1ZqlaSmhKU64HpS
	xAjbcpwVmG6d62U44asv4tPvloQp/vOR9Do45Q/42GE41pcdYYdp2DReUxLt1RzFdJpnhU
	MCVNS4UDJ7r+TO41vQWy9Zx1MGXDNzQJwyRWO3TkTLV/Ma/UWeC80mN/0N6p6thBurq5+8
	2q9hC7BnfT8c08flCC75yGZLSn+5HEPvBHA8IQysY9KLxgs3eHw2FJLoi1VRyRRmZxh6vH
	qf2sR5TzGXW1WuiTURm6kTN6voew9q3RJ5IPLPgxsUx+aQ6cM+igBoUSyp0MbQ==
Date: Tue, 7 Mar 2023 10:11:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Hector Palacios <hector.palacios@digi.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [miquelraynal:nand/next 2/4]
 drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid
 assignment: |=
Message-ID: <20230307101118.32d36af5@xps-13>
In-Reply-To: <202303070644.Kvs6l6g9-lkp@intel.com>
References: <202303070644.Kvs6l6g9-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Hector,

lkp@intel.com wrote on Tue, 7 Mar 2023 06:23:31 +0800:

> tree:   https://github.com/miquelraynal/linux-0day.git nand/next
> head:   fa07e65008e7068b7d11d09dc932326ee1245ee3
> commit: 2e3927b0ea56ffae4d05477691210b7b06f9b599 [2/4] mtd: rawnand: hyni=
x: fix up bit 0 of sdr_timing_mode
> config: parisc-randconfig-s053-20230305 (https://download.01.org/0day-ci/=
archive/20230307/202303070644.Kvs6l6g9-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/miquelraynal/linux-0day/commit/2e3927b0ea56f=
fae4d05477691210b7b06f9b599
>         git remote add miquelraynal https://github.com/miquelraynal/linux=
-0day.git
>         git fetch --no-tags miquelraynal nand/next
>         git checkout 2e3927b0ea56ffae4d05477691210b7b06f9b599
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Dparisc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=
=3Dparisc SHELL=3D/bin/bash drivers/mtd/nand/raw/
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303070644.Kvs6l6g9-lkp@i=
ntel.com/

Sparse isn't happy, could you fix it and sent a new version?
Please don't apply the above tags, they are only relevant if there is
something to fix that has already been merged.

> sparse warnings: (new ones prefixed by >>)
> >> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid assi=
gnment: |=3D
> >> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    left side has typ=
e restricted __le16
> >> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    right side has ty=
pe unsigned long =20
>=20
> vim +740 drivers/mtd/nand/raw/nand_hynix.c
>=20
>    730=09
>    731	static void hynix_fixup_onfi_param_page(struct nand_chip *chip,
>    732						struct nand_onfi_params *p)
>    733	{
>    734		/*
>    735		 * Certain chips might report a 0 on sdr_timing_mode field
>    736		 * (bytes 129-130). This has been seen on H27U4G8F2GDA-BI.
>    737		 * According to ONFI specification, bit 0 of this field "shall be=
 1".
>    738		 * Forcibly set this bit.
>    739		 */
>  > 740		p->sdr_timing_modes |=3D BIT(0); =20
>    741	}
>    742=09
>=20


Thanks,
Miqu=C3=A8l
