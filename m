Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567F145B0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709049814; cv=none; b=RjwAe7eID1hs5e1sTuE0UHrrIPt3N1/pSNdARdvry4pkMvvsA30VoFHYO0Wjp66kyj9k8BJWefY2o5tjFHm4kC6BrW9Chcn89x2aoO/vw989roNLdGMTk8dXi46W3tS6QlpaJs79bimoyFJUkfTQnvMSqgNHhovy2617J821vz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709049814; c=relaxed/simple;
	bh=A69XrJHaXltw7Hn2ASTY720vO4n5n2DJyEzFDWASGtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDSvocnwDLRwmkSTIVfla3tUSd8PGnxn78R0jg/f/A2LDe8wZ9eNwDM5KNWhWIv9IHrRiRxxPxm827ljKZ9ZaYwmIQACHieWgmp6WOK0NQ1Vf9VTyT6kfMZqg4uqPeXJAJu0IsJ8WtHma+3d3D4JV82yphRkuySA1Khz53PVdjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QRNnJXLp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QRNnJXLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709049811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWR3v94Z3yVKS81cEbsEuzZBVnWgZD4EO0y+0UXIwfM=;
	b=QRNnJXLpQjQ8ZUuyWn6B43uBaGxGenUP9u1ZfsLcqGIjDiBM1ZJyr4mB8sNP2Mkm5DCreF
	TNGRaUNyWNiU6Pz3E/r5f70/cbgnGEgtif9VtuWd4vbWc/G4Xs2XVrg24ww7Au4e45xZmU
	I5CJ2mPXtatm23acwzq0lx+I/+6XuRs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-oI8HPJIoNDay1LCjQBTIaQ-1; Tue,
 27 Feb 2024 11:03:23 -0500
X-MC-Unique: oI8HPJIoNDay1LCjQBTIaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A77029AB412;
	Tue, 27 Feb 2024 16:03:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B92CAC084A5;
	Tue, 27 Feb 2024 16:03:21 +0000 (UTC)
Date: Tue, 27 Feb 2024 11:03:20 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
	Miklos Szeredi <mszeredi@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [mszeredi-fuse:for-next 2/20] WARNING: modpost: vmlinux: section
 mismatch in reference: virtio_fs_init+0x78 (section: .init.text) ->
 ikheaders_cleanup (section: .exit.text)
Message-ID: <20240227160320.GF386283@fedora>
References: <202402251213.5EH9JYEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TDVODAe+ttfF/5im"
Content-Disposition: inline
In-Reply-To: <202402251213.5EH9JYEQ-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8


--TDVODAe+ttfF/5im
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 12:36:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> head:   33771e1143a9944d1a4c8e8457db92cab037563a
> commit: a8f62f50b4e4ea92a938fca2ec1bd108d7f210e9 [2/20] virtiofs: export =
filesystem tags through sysfs
> config: sh-randconfig-002-20240225 (https://download.01.org/0day-ci/archi=
ve/20240225/202402251213.5EH9JYEQ-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240225/202402251213.5EH9JYEQ-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402251213.5EH9JYEQ-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_in=
it+0x78 (section: .init.text) -> ikheaders_cleanup (section: .exit.text)

False positive? virtio_fs_init() does not call ikheaders_cleanup().

Stefan

> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/test_udelay=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp852.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp855.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp860.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp936.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-centeuro.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/bcachefs/mean_and_va=
riance_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_misc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/minix/minix.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hfs/hfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/hpfs/hpfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/pstore/pstore.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted=
-keys/encrypted-keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-gener=
ic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bpf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_list_sort.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_bas=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_dynamic_debug.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_blackhole_dev.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_linear_ranges.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/overflow_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strcat_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strscpy_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-ram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/reg=
map-raw-ram.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/char=
lcd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44=
780_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/line=
-display.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/common/usb-=
otg-fsm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/inp=
ut_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-cor=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-bootrom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-light.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-log.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-loopback.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-power-supply.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-raw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus=
/gb-vibrator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-g=
pio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-=
controller.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-so=
c-xlnx-i2s.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-so=
c-xlnx-formatter-pcm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-=
test.o
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--TDVODAe+ttfF/5im
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmXeB8gACgkQnKSrs4Gr
c8gR9Qf/eLvT7OlWTBOqvlQ9taXYS7lQ7sn5vMIo5xy+9D28whrHwQo9yWiZYK13
QyiYRzBSfPEGNUnmvJe8yTppBkJ09/iMBak8ZDGHqYyWaz6B7qH94d/YAHWlZpUG
MZZHVGLIaqJt5/E72hLimQJoMvG1E3Yo8M5oocu19vA4T99SE4Z3e3Bo7Js4pyPC
Gu7uMrcZ7GvoXPWEQWbXxGFbPitaYbu9g8A5kmOCWkQshKvH0z8yebmRoLnsrie0
9Xr+f8edKeZbBgw2W4fenpBWuUvgGphEmpfPY64XHoMY32SPnGRAV7XZqs1RVQKv
ACDKOAh3a12GjcFWw07kg6LHGyZZxg==
=dzvp
-----END PGP SIGNATURE-----

--TDVODAe+ttfF/5im--

