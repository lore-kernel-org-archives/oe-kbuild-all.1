Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7260A5645E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709047970; cv=none; b=pZyF0dLUdBdXycGNXAPP8zMfQdKrK/8nsM5PXLAIjccy8XX2UWJvot8iIvTFOVtHLsvoNHH/p1GAvtpVZPXKug8hA0DebM2HJPxnqdgMuMnojjVr6Yzp05rr1awo49ozrpHgVG4mpupf0pv0pZNfmFhs7kVRBcXGkgfy2RWITAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709047970; c=relaxed/simple;
	bh=QaDb1ZELv520YsjfudE/KCVo2ne0El0FQ6/5i9ccj2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHT8KG7phUgftk1aR6UTogxBnh9ius5MN7Y9eLth16SL7DHmsHpSn6gTjWvi3tiSa0x23LrMrusQZvvGLbnBqvuJI6BqFXXib2H/GX/h2MqC07qjZ4QtKphkKrVX5NjRLtd+6YTNPT0yK/F2ir4N2u7kfoH1ZjOXdl8T0ROmMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S8Yzh3Le; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S8Yzh3Le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709047967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MDCObZXExJ++MoWh6hDrm8zBrtFTGzI9Zmeydt7tWR0=;
	b=S8Yzh3Lep6xYgWAbm9PZ/91Et+iuNMROiIUFB5inbamKK8h4SuQ4/XO9aLv/llJG3SFEJg
	YyWnMGz0paSdvW0iSeMbO6dcQYK+lkKxdsFs+CYhkuvuj/6Ju3ff89mpABHZiPW2lUKsBo
	XieaVfCurOwMYLXpG+FEeMDh2Flul5M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-3tF7BPrSP_mgnpEgMGKF_Q-1; Tue, 27 Feb 2024 10:32:43 -0500
X-MC-Unique: 3tF7BPrSP_mgnpEgMGKF_Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41FC18828C1;
	Tue, 27 Feb 2024 15:32:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6B5A492BE3;
	Tue, 27 Feb 2024 15:32:42 +0000 (UTC)
Date: Tue, 27 Feb 2024 10:32:40 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [linux-next:master 8941/10418] WARNING: modpost: vmlinux:
 section mismatch in reference: virtio_fs_init+0x8c (section: .init.text) ->
 map_benchmark_cleanup (section: .exit.text)
Message-ID: <20240227153240.GA386283@fedora>
References: <202402271629.7zZU8sCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zDzGy/+JAcXYiXbK"
Content-Disposition: inline
In-Reply-To: <202402271629.7zZU8sCF-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10


--zDzGy/+JAcXYiXbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 04:56:25PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   22ba90670a51a18c6b36d285fddf92b9887c0bc3
> commit: a8f62f50b4e4ea92a938fca2ec1bd108d7f210e9 [8941/10418] virtiofs: e=
xport filesystem tags through sysfs
> config: sh-buildonly-randconfig-r003-20230528 (https://download.01.org/0d=
ay-ci/archive/20240227/202402271629.7zZU8sCF-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240227/202402271629.7zZU8sCF-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402271629.7zZU8sCF-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: virtio_fs_in=
it+0x8c (section: .init.text) -> map_benchmark_cleanup (section: .exit.text)

False positive? virtio_fs_init() does not call map_benchmark_cleanup().

>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

--zDzGy/+JAcXYiXbK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmXeAJgACgkQnKSrs4Gr
c8g+oggAxf9KzZ+pAVrrGLSK4z3mIRYOrOlkMbXHxqltLuT4Av5yEGXDVOJIR/BE
nl4iYktmZIbVezx3ZYhpL7/AYOV+4LF+o+9ZtjsL+vn4e+mKF7Cc8pDZHYbqQ9kZ
aAYgvFUjq2iEXFD70D8QyJfieNrcw6BkRuZCAbWMN+nJ7wWSGE5zw8iz9i5W3MzS
zJ+i80fCIZ9hxxier9/ca07CHfBidDTpQVpfgXbL4bl4u1uynMBIq/7UTGahSnhD
Sew/nMh2PYcOmsb5uDd8U0JtLD2jWiz1brQjg04Pf+yXwDPSNhvEx8lXjcmz2QmF
YP+fUTxFwmcHAmjk+44VdpseQsYhAg==
=eiYd
-----END PGP SIGNATURE-----

--zDzGy/+JAcXYiXbK--

