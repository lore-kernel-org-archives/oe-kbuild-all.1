Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACC145351
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709048458; cv=none; b=qXRuzxezt1/1RbAunrJcOT6kfRfVT8V8DRo6Uu5cAzK2T7pAU7ctIMOF9XppUhvjPIOIvelMt37X4doFpm2YNEXboC4UcPFHLfObxQC8FUzxbKu66gWkvmuaNS8MsyWbMchwOOWpiDe2nkSYjoFFTVMM69w18HNB7B+u/MtunNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709048458; c=relaxed/simple;
	bh=mU3qgdLjvJJvW6Bq3BdwUQuCNmo7zeQzxX4oX+WHUEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+zW1lZbhVUeGKE16tWgfzXQf59EDFjbqwYjJY8lHOoG5Zw1eHZv/lr7Z7F8y2Oiuv/ZIGZClgJ0y7fdYzr2JAF7mMQ2m/U2/Oz27pExvlnisgiEwv+Y7Wk3x5HNtMaelG6HO7OfL0Ic6Oz1tCvtoZp/C+QMUgSJAkQ+YVCqsPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R69I/DNH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R69I/DNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709048455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GzIo3zOFfRe5Mm+FfxZ6cCRtAUc/l6csiJhKy7QkY4I=;
	b=R69I/DNH/EuXioiWE1DvUEnEcCN0io0OeD39BrRmOMPLVUdoxPCqquIlsXzz0ADH448tAm
	FOU+znYGVu9PY+cVuJAEz1xcqCMtcT7hPPq6gUoJDPDfSJzCWTJurtJ082egSz9YJJ3B+o
	8WVn4aiHNltBASq8LBSMgxNaHPgAS4s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-2TcqQ_QbM1O9Jp20zVjj3A-1; Tue,
 27 Feb 2024 10:40:52 -0500
X-MC-Unique: 2TcqQ_QbM1O9Jp20zVjj3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F28383E124;
	Tue, 27 Feb 2024 15:40:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B71DC185C3;
	Tue, 27 Feb 2024 15:40:51 +0000 (UTC)
Date: Tue, 27 Feb 2024 10:40:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] virtiofs: export filesystem tags through sysfs
Message-ID: <20240227154049.GB386283@fedora>
References: <20240213001149.904176-3-stefanha@redhat.com>
 <202402240215.AhxvUkqt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RG6cRcuSGtZ5GAbj"
Content-Disposition: inline
In-Reply-To: <202402240215.AhxvUkqt-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


--RG6cRcuSGtZ5GAbj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 02:55:25AM +0800, kernel test robot wrote:
> Hi Stefan,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on mszeredi-fuse/for-next]
> [also build test WARNING on linus/master v6.8-rc5 next-20240223]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Hajnoczi/vi=
rtiofs-forbid-newlines-in-tags/20240213-081536
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> patch link:    https://lore.kernel.org/r/20240213001149.904176-3-stefanha=
%40redhat.com
> patch subject: [PATCH v4 2/3] virtiofs: export filesystem tags through sy=
sfs
> config: sh-randconfig-r131-20240223 (https://download.01.org/0day-ci/arch=
ive/20240224/202402240215.AhxvUkqt-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240224/202402240215=
=2EAhxvUkqt-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402240215.AhxvUkqt-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_in=
it+0x78 (section: .init.text) -> ikconfig_cleanup (section: .exit.text)

False positive? virtio_fs_init() does not call ikconfig_cleanup().

> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp949.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1251.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ucs2_utils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-k=
eys/trusted.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in block/t10-pi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_decoder.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4=
xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/spm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20=
411-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon=
/hi6220_reset.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250=
/8250_pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/=
omap3-rom-rng.o
> WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in re=
ference: mxc_rnga_driver+0x4 (section: .data) -> mxc_rnga_remove (section: =
=2Eexit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-w1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gp=
io.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/common/nvm=
e-auth.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-=
core.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-=
fabrics.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvm=
et.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/target/nvm=
e-loop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brc=
m_u-boot.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscre=
en/cyttsp_i2c_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-ke=
ymap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-=
pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-cor=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-front=
ends/mb86a16.o
> WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in refer=
ence: davinci_mmcsd_driver+0x8 (section: .data) -> davinci_mmcsd_remove (se=
ction: .exit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_co=
re.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_u=
art.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_simpleondemand.o
> WARNING: modpost: drivers/memory/emif: section mismatch in reference: emi=
f_driver+0x4 (section: .data) -> emif_remove (section: .exit.text)
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/=
ampere_cspmu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_d=
dr_perf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra19=
4-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmte=
st.o
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--RG6cRcuSGtZ5GAbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmXeAoEACgkQnKSrs4Gr
c8hsfAf+L/fRtpYA/RsSrECVefzacgf9U9ydM4o4HIUMp4pT0tm510f6q9doK4zI
N5C9y5szkYaSB65NUNjP++WrbmFkHyNg8pCIegQPHJOl36hOVno5zdx0QuxEt8T+
qYV1P2aLIYhEh7fjlFtl33JAkTkFxsrxGvY76Y9KjeGxSaXKnTdmfw5L84JnyeqT
a6oH61kFtOp3ZeU3hHOASgc2UIm68vCEm2Jvn5QOQoDCSJJF8MLYKMFvjbJAXXUZ
jfKO9WGW6LfeDVO7/iAgvLG4TcaHFAQTYUUoC2gBxGXwymBmA03FGU2aJd/pybsh
4u4JKL4inWeAf2r87aJUGmYy/h8OHA==
=Wo44
-----END PGP SIGNATURE-----

--RG6cRcuSGtZ5GAbj--

