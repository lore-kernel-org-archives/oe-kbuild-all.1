Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5A401A0B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761852; cv=none; b=lcmEvdmRkj4mJMxXqf+dwfzADHkoiBbFpbZ1QcthIXhhdnjmG8z27taC5ryb5euTrjVNS1QbAddsKZ2LqVDZ11QdZevYdaFnlW2o3GAbYFAWITAXwOnFgsI1Z7f3jeY7izTlCHqHBxX5wa6CWNyqNIWfywIPbRlFQFv8s1VUDKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761852; c=relaxed/simple;
	bh=bW2Nzo/gRDyd3g0cxeNgLqrw+gfxef14VuLVZzz4VEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISA2v5rwNGTEP1UYoTtOjVHAQnyumqq+5DhOq/dUOlxlUcEyxdp70o6yRYzluoMSsYUTEURT0V/wPggo13zNQhMt3y27sq6bMXyfLRoFQLyTOeuzgKjQSE5qoIkeeiPcb6LTKOB1YFRYOgZpZ/hZ3ms7ART85ZM45M/AKU7CAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNcHyj4U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNcHyj4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F22C1F000E9;
	Mon,  3 Aug 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785761847;
	bh=+I7vcEF+wRUjL2IJQ7q2EYh1NMrScKK/YFcfGqiNYw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNcHyj4UeQfnu7wwXrfxFRBOvo/cZsEy6VC3o9IaOhJoqr0uK/OqF037kaK/x/kHB
	 +i7BNlN/XJcDyJO4a13AQJz9taDOfQbmUw+//x7qGsI3mDOmK0lLtW47VeRcUhDE4Y
	 ylQLW992R5IsvzX0pRnwRP299wOedlsk+sNdladVNjTsh334Xe5yftrukZJIPVHwJk
	 MS9aImTHp/IlwwfQ/xwe65EFvoiCEGWijhdV3syOaFUDvRVV3MCulnhBRDrUEu62Yv
	 rSlpTwXJwPpRQltvSs90p3/lVZMoCGEpyGvIbqq3d+2HnpgSWIigtd64B4fSlSamVL
	 PK55OiJejEGjw==
Date: Mon, 3 Aug 2026 14:57:20 +0200
From: Joel Granados <joel.granados@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 3459/9043] kernel/sysctl-test.c:46:9: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <cb5wxw5thf6eg6gsfhvgvl6trncqggd34x7yt5npqnhnyqw3pe@gkiyaeow6ufr>
References: <202607261257.2AECxOah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tgip6k6zaprdqwfp"
Content-Disposition: inline
In-Reply-To: <202607261257.2AECxOah-lkp@intel.com>


--tgip6k6zaprdqwfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The warnings seem new because the function definitions change line
within the file. But there is not change of type in commit e433c7d7fca0
("sysctl: Group proc_handler declarations and document") so these are
false positives.

On Sun, Jul 26, 2026 at 12:09:54PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9eebf259d5352b87080d67758f483583d9e763d7
> commit: e433c7d7fca0b2c9787648e8f0bd658578c375b4 [3459/9043] sysctl: Grou=
p proc_handler declarations and document
> config: alpha-randconfig-r132-20260725 (https://download.01.org/0day-ci/a=
rchive/20260726/202607261257.2AECxOah-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260726/202607261257.2AECxOah-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607261257.2AECxOah-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
> >> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:46:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:46:9: sparse:     got void [noderef] __user *buff=
er
> >> kernel/sysctl-test.c:46:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:46:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:46:9: sparse:     got void [noderef] __user *buff=
er
>    kernel/sysctl-test.c:55:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:55:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:55:9: sparse:     got void [noderef] __user *buff=
er
>    kernel/sysctl-test.c:55:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:55:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:55:9: sparse:     got void [noderef] __user *buff=
er
>    kernel/sysctl-test.c:92:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:92:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:92:9: sparse:     got void [noderef] __user *buff=
er
>    kernel/sysctl-test.c:92:9: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void *buf @@     got void [nod=
eref] __user *buffer @@
>    kernel/sysctl-test.c:92:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:92:9: sparse:     got void [noderef] __user *buff=
er
>    kernel/sysctl-test.c:101:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:101:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:101:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:101:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:101:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:101:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:133:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:133:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:133:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:133:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:137:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:137:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:137:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:137:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:137:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:137:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:172:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:172:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:172:9: sparse:     got void [noderef] __user *buf=
fer
>    kernel/sysctl-test.c:172:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got void [no=
deref] __user *buffer @@
>    kernel/sysctl-test.c:172:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:172:9: sparse:     got void [noderef] __user *buf=
fer
> >> kernel/sysctl-test.c:201:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:201:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:201:9: sparse:     got char [noderef] __user *use=
r_buffer
> >> kernel/sysctl-test.c:201:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:201:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:201:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:231:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:231:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:231:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:231:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:231:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:231:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:262:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:262:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:262:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:262:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:262:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:262:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:292:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:292:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:292:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:292:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:292:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:292:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:332:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:332:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:332:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:332:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:332:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:332:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:364:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:364:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:364:9: sparse:     got char [noderef] __user *use=
r_buffer
>    kernel/sysctl-test.c:364:9: sparse: sparse: incorrect type in argument=
 3 (different address spaces) @@     expected void *buf @@     got char [no=
deref] __user *user_buffer @@
>    kernel/sysctl-test.c:364:9: sparse:     expected void *buf
>    kernel/sysctl-test.c:364:9: sparse:     got char [noderef] __user *use=
r_buffer
>=20
> vim +46 kernel/sysctl-test.c
>=20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   11 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   12  /*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   13   * Test that proc_dointvec w=
ill not try to use a NULL .data field even when the
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   14   * length is non-zero.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   15   */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   16  static void sysctl_test_api_=
dointvec_null_tbl_data(struct kunit *test)
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   17  {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   18  	struct ctl_table null_data_=
table =3D {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   19  		.procname =3D "foo",
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   20  		/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   21  		 * Here we are testing tha=
t proc_dointvec behaves correctly when
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   22  		 * we give it a NULL .data=
 field. Normally this would point to a
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   23  		 * piece of memory where t=
he value would be stored.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   24  		 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   25  		.data		=3D NULL,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   26  		.maxlen		=3D sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   27  		.mode		=3D 0644,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   28  		.proc_handler	=3D proc_doi=
ntvec,
> c06a17fe056b84 Liu Shixin   2022-09-08   29  		.extra1		=3D SYSCTL_ZERO,
> c06a17fe056b84 Liu Shixin   2022-09-08   30  		.extra2         =3D SYSCTL=
_ONE_HUNDRED,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   31  	};
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   32  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   33  	 * proc_dointvec expects a =
buffer in user space, so we allocate one. We
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   34  	 * also need to cast it to =
__user so sparse doesn't get mad.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   35  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   36  	void __user *buffer =3D (vo=
id __user *)kunit_kzalloc(test, sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   37  							   GFP_USER);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   38  	size_t len;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   39  	loff_t pos;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   40 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   41  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   42  	 * We don't care what the s=
tarting length is since proc_dointvec should
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   43  	 * not try to read because =
=2Edata is NULL.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   44  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   45  	len =3D 1234;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  @46  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&null_data_table,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   47  					       KUNIT_PROC_READ,=
 buffer, &len,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   48  					       &pos));
> 388ca2e024dd5e David Gow    2021-05-13   49  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   50 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   51  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   52  	 * See above.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   53  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   54  	len =3D 1234;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   55  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&null_data_table,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   56  					       KUNIT_PROC_WRITE=
, buffer, &len,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   57  					       &pos));
> 388ca2e024dd5e David Gow    2021-05-13   58  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   59  }
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   60 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   61  /*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   62   * Similar to the previous t=
est, we create a struct ctrl_table that has a .data
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   63   * field that proc_dointvec =
cannot do anything with; however, this time it is
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   64   * because we tell proc_doin=
tvec that the size is 0.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   65   */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   66  static void sysctl_test_api_=
dointvec_table_maxlen_unset(struct kunit *test)
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   67  {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   68  	int data =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   69  	struct ctl_table data_maxle=
n_unset_table =3D {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   70  		.procname =3D "foo",
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   71  		.data		=3D &data,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   72  		/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   73  		 * So .data is no longer N=
ULL, but we tell proc_dointvec its
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   74  		 * length is 0, so it stil=
l shouldn't try to use it.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   75  		 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   76  		.maxlen		=3D 0,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   77  		.mode		=3D 0644,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   78  		.proc_handler	=3D proc_doi=
ntvec,
> c06a17fe056b84 Liu Shixin   2022-09-08   79  		.extra1		=3D SYSCTL_ZERO,
> c06a17fe056b84 Liu Shixin   2022-09-08   80  		.extra2         =3D SYSCTL=
_ONE_HUNDRED,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   81  	};
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   82  	void __user *buffer =3D (vo=
id __user *)kunit_kzalloc(test, sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   83  							   GFP_USER);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   84  	size_t len;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   85  	loff_t pos;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   86 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   87  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   88  	 * As before, we don't care=
 what buffer length is because proc_dointvec
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   89  	 * cannot do anything becau=
se its internal .data buffer has zero length.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   90  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   91  	len =3D 1234;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   92  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&data_maxlen_unset_table,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   93  					       KUNIT_PROC_READ,=
 buffer, &len,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   94  					       &pos));
> 388ca2e024dd5e David Gow    2021-05-13   95  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   96 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   97  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   98  	 * See previous comment.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23   99  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  100  	len =3D 1234;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  101  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&data_maxlen_unset_table,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  102  					       KUNIT_PROC_WRITE=
, buffer, &len,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  103  					       &pos));
> 388ca2e024dd5e David Gow    2021-05-13  104  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  105  }
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  106 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  107  /*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  108   * Here we provide a valid s=
truct ctl_table, but we try to read and write from
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  109   * it using a buffer of zero=
 length, so it should still fail in a similar way as
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  110   * before.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  111   */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  112  static void sysctl_test_api_=
dointvec_table_len_is_zero(struct kunit *test)
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  113  {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  114  	int data =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  115  	/* Good table. */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  116  	struct ctl_table table =3D {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  117  		.procname =3D "foo",
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  118  		.data		=3D &data,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  119  		.maxlen		=3D sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  120  		.mode		=3D 0644,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  121  		.proc_handler	=3D proc_doi=
ntvec,
> c06a17fe056b84 Liu Shixin   2022-09-08  122  		.extra1		=3D SYSCTL_ZERO,
> c06a17fe056b84 Liu Shixin   2022-09-08  123  		.extra2         =3D SYSCTL=
_ONE_HUNDRED,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  124  	};
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  125  	void __user *buffer =3D (vo=
id __user *)kunit_kzalloc(test, sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  126  							   GFP_USER);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  127  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  128  	 * However, now our read/wr=
ite buffer has zero length.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  129  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  130  	size_t len =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  131  	loff_t pos;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  132 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  133  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&table, KUNIT_PROC_READ, buffer,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  134  					       &len, &pos));
> 388ca2e024dd5e David Gow    2021-05-13  135  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  136 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  137  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&table, KUNIT_PROC_WRITE, buffer,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  138  					       &len, &pos));
> 388ca2e024dd5e David Gow    2021-05-13  139  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  140  }
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  141 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  142  /*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  143   * Test that proc_dointvec r=
efuses to read when the file position is non-zero.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  144   */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  145  static void sysctl_test_api_=
dointvec_table_read_but_position_set(
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  146  		struct kunit *test)
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  147  {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  148  	int data =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  149  	/* Good table. */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  150  	struct ctl_table table =3D {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  151  		.procname =3D "foo",
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  152  		.data		=3D &data,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  153  		.maxlen		=3D sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  154  		.mode		=3D 0644,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  155  		.proc_handler	=3D proc_doi=
ntvec,
> c06a17fe056b84 Liu Shixin   2022-09-08  156  		.extra1		=3D SYSCTL_ZERO,
> c06a17fe056b84 Liu Shixin   2022-09-08  157  		.extra2         =3D SYSCTL=
_ONE_HUNDRED,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  158  	};
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  159  	void __user *buffer =3D (vo=
id __user *)kunit_kzalloc(test, sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  160  							   GFP_USER);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  161  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  162  	 * We don't care about our =
buffer length because we start off with a
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  163  	 * non-zero file position.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  164  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  165  	size_t len =3D 1234;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  166  	/*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  167  	 * proc_dointvec should ref=
use to read into the buffer since the file
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  168  	 * pos is non-zero.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  169  	 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  170  	loff_t pos =3D 1;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  171 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  172  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&table, KUNIT_PROC_READ, buffer,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  173  					       &len, &pos));
> 388ca2e024dd5e David Gow    2021-05-13  174  	KUNIT_EXPECT_EQ(test, 0, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  175  }
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  176 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  177  /*
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  178   * Test that we can read a t=
wo digit number in a sufficiently size buffer.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  179   * Nothing fancy.
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  180   */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  181  static void sysctl_test_doin=
tvec_read_happy_single_positive(struct kunit *test)
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  182  {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  183  	int data =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  184  	/* Good table. */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  185  	struct ctl_table table =3D {
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  186  		.procname =3D "foo",
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  187  		.data		=3D &data,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  188  		.maxlen		=3D sizeof(int),
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  189  		.mode		=3D 0644,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  190  		.proc_handler	=3D proc_doi=
ntvec,
> c06a17fe056b84 Liu Shixin   2022-09-08  191  		.extra1		=3D SYSCTL_ZERO,
> c06a17fe056b84 Liu Shixin   2022-09-08  192  		.extra2         =3D SYSCTL=
_ONE_HUNDRED,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  193  	};
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  194  	size_t len =3D 4;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  195  	loff_t pos =3D 0;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  196  	char *buffer =3D kunit_kzal=
loc(test, len, GFP_USER);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  197  	char __user *user_buffer =
=3D (char __user *)buffer;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  198  	/* Store 13 in the data fie=
ld. */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  199  	*((int *)table.data) =3D 13;
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  200 =20
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23 @201  	KUNIT_EXPECT_EQ(test, 0, pr=
oc_dointvec(&table, KUNIT_PROC_READ,
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  202  					       user_buffer, &le=
n, &pos));
> 388ca2e024dd5e David Gow    2021-05-13  203  	KUNIT_ASSERT_EQ(test, 3, le=
n);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  204  	buffer[len] =3D '\0';
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  205  	/* And we read 13 back out.=
 */
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  206  	KUNIT_EXPECT_STREQ(test, "1=
3\n", buffer);
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  207  }
> 2cb80dbbbaba4f Iurii Zaikin 2019-09-23  208 =20
>=20
> :::::: The code at line 46 was first introduced by commit
> :::::: 2cb80dbbbaba4f2f86f686c34cb79ea5cbfb0edb kernel/sysctl-test: Add n=
ull pointer test for sysctl.c:proc_dointvec()
>=20
> :::::: TO: Iurii Zaikin <yzaikin@google.com>
> :::::: CC: Shuah Khan <skhan@linuxfoundation.org>
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--=20

Joel Granados

--tgip6k6zaprdqwfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmpwkDAACgkQupfNUreW
QU/iewv+M9JUF9elLd5l8jJqAnULs1nKL+aXY8e0pl7tG7LN6ZuAqpkDHcJ17sMJ
41sMphgB6kverklKesECiqn5ZGG4Kkz3p8Fi/twDixeKtYXQYRQgVOkSOLizDMyL
h7VedFwecCBNYlbiV6Zk2UiI9GpqtR492yNktPKyOQ2/+tk7jehlv9ydLfEeZBN7
reDcWEBbIailfPYsnsFq8GwHiHKaShsMfYCshpuqWw261AWRtGDMXcr+3RoL0OkN
62FROoLTz6vMTvAuo7/D7yeY1DDVI7zpDhA8n7JV9vdfXq3bTsuu6nOAs7QhNaqN
BteF+GbSRSKf4VZo9JM86ck5xiGkpgceuGrqaBvUGocV/X2bmVys9oPc1a3DnuVg
/5pXtsOIHyZJTt2joChc2+naS3SuZtmvuC4CxBUN/T4SPOUsxYnEiGyZwbbAc5Ee
0Fp2u3Rb575pzKluoA0nQMHbhJtPpSR6gzuvN1BRdj9kMskKfHlZ37TCs/GqhWp5
JoP62QUa
=b6L4
-----END PGP SIGNATURE-----

--tgip6k6zaprdqwfp--
