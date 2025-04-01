Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B582AF04
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 23:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743551170; cv=none; b=mPfmAtzhdO8dDH8ynG5Ox0Yei4PrZ+c22e17Qyyo0htmPYyYlnNKm8nXrA5pYDkylxYSSTmxO9cYS5jH3uEF97PaAxVPNEXV+CjpbBFbDSt26OkSjYYSFDgiYHEhFrfEMa1sP0bXSkR+1U2vUqDscvQ8eh2dlVz+2KpkUEOjTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743551170; c=relaxed/simple;
	bh=qBYqN8SVkCA17kTx85IOE+i4BuFRLmQl5ELVW9VJBuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTzJLdb/F90gi4whv2zbT3iKaHt1+nqkwiHHM5sQeKIJ/LGKepTLCqDbboZLWVs5gtZSqNJ+RKIJ67XCP77TrTfGWvBvcA2jVwouGrXavJzi/zzYg3j7VbbDYFir/6ECqq1x64vRV94PmgMBwKagXR8WtU/Z7fm5RRbiGtUMK0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK7DergB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK7DergB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265D7C4CEE4;
	Tue,  1 Apr 2025 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743551169;
	bh=qBYqN8SVkCA17kTx85IOE+i4BuFRLmQl5ELVW9VJBuA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=CK7DergBUT5HcjHNwmbk5ImPJP8GqDX6/yeLvg7JfVSqnY242ruKqmjMcAnYE+ngR
	 3/KrPpL40ZRSrlTpzzY4ovARwK1Itpt5paAdxOVVHx+4058SCTIEZufuGCOLFURf9i
	 DlOZhuWjgLk7ic9b1J+iQuH++NapIM883vuRTwk+q4aaFPr5eeohpza7/B2Th3yfz/
	 DaPNFdWpPDVx2m3gabaed6akMYiQUZKgJkgvlVPCmBP02lkya+55LmCy78Gd0wZSJQ
	 PM6SVRACYQ6larXvwq4ZSdpht53z+f7StybZEXb4mIe/kWjiCtBP09EpoDYTNfslsn
	 RXRJbZ+9hnwaA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C06E6CE160D; Tue,  1 Apr 2025 16:46:08 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:46:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, lucvoo@kernel.org
Subject: Re: [paulmckrcu:dev.2025.03.25a 45/45]
 fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry defined
 twice
Message-ID: <12f099bc-effb-49d3-8094-5b981e577eda@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202504020500.Svb9JN2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202504020500.Svb9JN2H-lkp@intel.com>

On Wed, Apr 02, 2025 at 05:33:50AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
> head:   cedfad9ced72fc8c873e11a4c6a089a415489166
> commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduc=
e ratelimit's false-positive misses
> config: nios2-randconfig-r122-20250402 (https://download.01.org/0day-ci/a=
rchive/20250402/202504020500.Svb9JN2H-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 10.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020500=
=2ESvb9JN2H-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504020500.Svb9JN2H-lkp=
@intel.com/
>=20
> sparse warnings: (new ones prefixed by >>)
> >> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry def=
ined twice
>    fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
> >> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry def=
ined twice
>    fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
> >> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry def=
ined twice
>    fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
> --

For line 71 of fs/btrfs/extent-io-tree.c, the C preprocessor gives
me this:

  do { static struct _ddebug __attribute__((__aligned__(8))) __attribute__(=
(__section__("__dyndbg"))) __UNIQUE_ID_ddebug469 =3D { .modname =3D "btrfs"=
, .function =3D __func__, .filename =3D "fs/btrfs/extent-io-tree.c", .forma=
t =3D ("%s: ino %llu isize %llu odd range [%llu,%llu]"), .lineno =3D 71, .f=
lags =3D 0, .class_id =3D ((1 << 6) - 1), .key.dd_key_false =3D ((struct st=
atic_key_false){ .key =3D { .enabled =3D { 0 }, { .type =3D 0UL } }, }) }; =
do { __attribute__((__noreturn__)) extern void __compiletime_assert_470(voi=
d) __attribute__((__error__("classid value overflow"))); if (!(!(((1 << 6) =
- 1) > ((1 << 6) - 1)))) __compiletime_assert_470(); } while (0); if (({ bo=
ol branch; if (__builtin_types_compatible_p(typeof(*&__UNIQUE_ID_ddebug469.=
key.dd_key_false), struct static_key_true)) branch =3D arch_static_branch_j=
ump(&(&__UNIQUE_ID_ddebug469.key.dd_key_false)->key, false); else if (__bui=
ltin_types_compatible_p(typeof(*&__UNIQUE_ID_ddebug469.key.dd_key_false), s=
truct static_key_false)) branch =3D arch_static_branch(&(&__UNIQUE_ID_ddebu=
g469.key.dd_key_false)->key, false); else branch =3D ____wrong_branch_error=
(); __builtin_expect(!!(branch), 0); })) do { static struct ratelimit_state=
 _rs =3D { .lock =3D (raw_spinlock_t) { .raw_lock =3D { }, }, .interval =3D=
 (5 * 1000), .burst =3D 10, .rs_n_left =3D { (10) }, .flags =3D 0, }; if (_=
__ratelimit(&_rs, __func__)) _btrfs_printk(inode->root->fs_info, "\001" "7"=
 "%s: ino %llu isize %llu odd range [%llu,%llu]", caller, btrfs_ino(inode),=
 isize, start, end); } while (0); } while (0)

There are things that might look like initializer entries being defined
twice, for example ".flags".  But the two ".flags" entries are for different
data structures, so this appears to be a false positive.

Or am I missing a turn in here somewhere?

							Thanx, Paul

>    drivers/hid/hid-cherry.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-ezkey.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-monterey.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-dr.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-apple.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-ite.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-lcpower.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-microsoft.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-gyration.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-lenovo.c:786:58: sparse: sparse: cast to restricted __=
le32
>    drivers/hid/hid-lenovo.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-input.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-petalynx.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-razer.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-topseed.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> --
>    drivers/hid/hid-twinhan.c: note: in included file:
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
> >> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined=
 twice
>    include/linux/hid.h:1079:17: sparse:   also defined here
>=20
> vim +71 fs/btrfs/extent-io-tree.c
>=20
> 6962541e964ff3 Josef Bacik  2022-09-09  55 =20
> d8038a1f46f376 Josef Bacik  2022-09-09  56  #define btrfs_debug_check_ext=
ent_io_range(tree, start, end)		\
> d8038a1f46f376 Josef Bacik  2022-09-09  57  	__btrfs_debug_check_extent_i=
o_range(__func__, (tree), (start), (end))
> d8038a1f46f376 Josef Bacik  2022-09-09  58  static inline void __btrfs_de=
bug_check_extent_io_range(const char *caller,
> d8038a1f46f376 Josef Bacik  2022-09-09  59  						       struct extent_io=
_tree *tree,
> d8038a1f46f376 Josef Bacik  2022-09-09  60  						       u64 start, u64 e=
nd)
> 6962541e964ff3 Josef Bacik  2022-09-09  61  {
> 738290c056e28d David Sterba 2023-11-21  62  	const struct btrfs_inode *in=
ode;
> 6962541e964ff3 Josef Bacik  2022-09-09  63  	u64 isize;
> 6962541e964ff3 Josef Bacik  2022-09-09  64 =20
> 738290c056e28d David Sterba 2023-11-21  65  	if (tree->owner !=3D IO_TREE=
_INODE_IO)
> 6962541e964ff3 Josef Bacik  2022-09-09  66  		return;
> 6962541e964ff3 Josef Bacik  2022-09-09  67 =20
> 738290c056e28d David Sterba 2023-11-21  68  	inode =3D extent_io_tree_to_=
inode_const(tree);
> 0988fc7bda79fe David Sterba 2022-10-28  69  	isize =3D i_size_read(&inode=
->vfs_inode);
> 6962541e964ff3 Josef Bacik  2022-09-09  70  	if (end >=3D PAGE_SIZE && (e=
nd % 2) =3D=3D 0 && end !=3D isize - 1) {
> 0988fc7bda79fe David Sterba 2022-10-28 @71  		btrfs_debug_rl(inode->root-=
>fs_info,
> 6962541e964ff3 Josef Bacik  2022-09-09  72  		    "%s: ino %llu isize %ll=
u odd range [%llu,%llu]",
> 0988fc7bda79fe David Sterba 2022-10-28  73  			caller, btrfs_ino(inode), =
isize, start, end);
> 6962541e964ff3 Josef Bacik  2022-09-09  74  	}
> 6962541e964ff3 Josef Bacik  2022-09-09  75  }
> 83cf709a89fb97 Josef Bacik  2022-09-09  76  #else
> 83cf709a89fb97 Josef Bacik  2022-09-09  77  #define btrfs_leak_debug_add_=
state(state)		do {} while (0)
> 83cf709a89fb97 Josef Bacik  2022-09-09  78  #define btrfs_leak_debug_del_=
state(state)		do {} while (0)
> 83cf709a89fb97 Josef Bacik  2022-09-09  79  #define btrfs_extent_state_le=
ak_debug_check()		do {} while (0)
> d8038a1f46f376 Josef Bacik  2022-09-09  80  #define btrfs_debug_check_ext=
ent_io_range(c, s, e)	do {} while (0)
> 83cf709a89fb97 Josef Bacik  2022-09-09  81  #endif
> 83cf709a89fb97 Josef Bacik  2022-09-09  82 =20
> 83cf709a89fb97 Josef Bacik  2022-09-09  83 =20
>=20
> :::::: The code at line 71 was first introduced by commit
> :::::: 0988fc7bda79feff046056f032fd149ab08e03d1 btrfs: switch extent_io_t=
ree::private_data to btrfs_inode and rename
>=20
> :::::: TO: David Sterba <dsterba@suse.com>
> :::::: CC: David Sterba <dsterba@suse.com>
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
