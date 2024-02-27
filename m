Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2514691C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709048964; cv=none; b=RliFA3cP32j3YAJjIPAbf/HI3/xsf6Qd7FScC8JRSiBVQCM9gZ44I4WdP/PNyjCDrX9lln7zMrxEhdHFvS5F7w4XEzz7dRD966N6Oli7bf1TkdRx0t2TE+7NllmQ/Gqso2ianSOSVnf4kZh8w5ONLUi27ZRajnfyFEcnDJykMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709048964; c=relaxed/simple;
	bh=oSrAjldgQgPcTIook8Fa+tav7gTMd8SYRRU8QhgSUUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaNFjk5hZ3W+0Ewqt3aLUYbmAz0m6HYB3HqBPCaCmTgk9GaZlwOxW0GJbpr0DmwwJoTIgu9pM/nw0HlM2L3RT2sA1j1kb8rzExUR2oZ3rVPAIw7bOGErbioArkc91C84/TLPNrncryvkfpwkbWjr95ijbcggVsOBtWSZcD2rJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICzU8ql+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICzU8ql+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709048962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8vRu0VnNgXiuzAjGfMTUKfoxuVwP3WU0iL4WVwECfs=;
	b=ICzU8ql+y7oWJ+hN8WXp8QZzekD3EdluHfjBd1xq1w8O0zPlyWFstXK37yWy2t/EPFFlsB
	o6pSJIVdOX9MiZ1FkVsy/yAMJjgQfNixAP7zOEe7UyiCgA1RnK1QTHf+1XGiBZjZjf+hyd
	DZ1KkWrL7H1g3kInt12Ab7XQEcWRZEc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-j8GcIfeLMFmQXLSwrjOM1w-1; Tue,
 27 Feb 2024 10:49:20 -0500
X-MC-Unique: j8GcIfeLMFmQXLSwrjOM1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F29DC3C1E9CD;
	Tue, 27 Feb 2024 15:49:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B43240C122C;
	Tue, 27 Feb 2024 15:49:19 +0000 (UTC)
Date: Tue, 27 Feb 2024 10:49:17 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] virtiofs: export filesystem tags through sysfs
Message-ID: <20240227154917.GC386283@fedora>
References: <20240213001149.904176-3-stefanha@redhat.com>
 <202402270649.GYjNX0yw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TI0QAWuGRzmVtct6"
Content-Disposition: inline
In-Reply-To: <202402270649.GYjNX0yw-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2


--TI0QAWuGRzmVtct6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 07:09:27AM +0800, kernel test robot wrote:
> Hi Stefan,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on mszeredi-fuse/for-next]
> [also build test WARNING on linus/master v6.8-rc6]
> [cannot apply to next-20240226]
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
> config: um-randconfig-r081-20240226 (https://download.01.org/0day-ci/arch=
ive/20240227/202402270649.GYjNX0yw-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240227/202402270649.GYjNX0yw-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402270649.GYjNX0yw-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
> >> WARNING: modpost: fs/fuse/virtiofs: section mismatch in reference: vir=
tio_fs_init+0x144 (section: .init.text) -> virtio_fs_sysfs_exit (section: .=
exit.text)

I'll send a patch to fix this.

Stefan

> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/binfmt_script.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_base.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp437.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp850.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp861.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp862.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp865.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp932.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_euc-jp.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp950.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-2.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-3.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-4.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-5.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-6.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-7.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp1255.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-9.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-14.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-u.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-ru.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_utf8.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-cyrillic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-greek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-inuit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-romanian.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-roman.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted=
-keys/encrypted-keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/cast_common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_rhashtable.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_bas=
e.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_d=
eflate.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf85=
7x.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_r=
ing.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-f=
map.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_u=
til.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_c=
mdset_0020.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfif=
o_buf.o
> WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generati=
on failed, symbol will not be versioned.
> Is "csum_partial" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "csum_partial_copy_generic" [vmlinux] ver=
sion generation failed, symbol will not be versioned.
> Is "csum_partial_copy_generic" prototyped in <asm/asm-prototypes.h>?
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--TI0QAWuGRzmVtct6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmXeBH0ACgkQnKSrs4Gr
c8iveQf/Tns4XgZq/5imTV74uIOJtfp15RMFQ2iTqpoChFupd5UFjav+bk+qN5sP
Qc4mtbgGIGFs5lT1k0wwERs8vAZjV4FnlqCtbHwU3spVsqxY+A9Hm1y9xPu1UI0V
d1Ro/2NGbIEjP4AA6XEAMmmvhhIsA9/GHZ4B29O8rtETfkeMFcA/Gr/5ahj5IkHd
qm3psDRbmZkJ+nSQAEAvaKuUgv0nZ8dJFPVvnnUNjgQ6GauV/5zPpNF4Kf69AQye
YNWsyQ0RQDbNM1ElA31w1tq5gccfRtubpE1yOOMZaM9i4tBBRm75w3wD4rEREa1R
IYEFMuVXu42siGpR2QtE0XxjO0YE8g==
=mtA9
-----END PGP SIGNATURE-----

--TI0QAWuGRzmVtct6--

