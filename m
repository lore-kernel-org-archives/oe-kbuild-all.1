Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484198;
	b=fj7Z9KBDbM27uSzxASep5PVpK9X5Vw+hk84sCpb0z+y0XomKxzXBgiNWqSwaE+uGO3si
	 5F+IqjvGK6KhziwcCXiAzv2e6rXPpnajCUhMBK+kuM6K9mNuunHVPkdvbusUAAmOdqEDL
	 /9G5nA12VWrlXWSKlt3wkvKJPXx06cKVvx1WBLvBal1k/NZvP6hS+Ox3oKjL7mCqcTWWS
	 8m2TuSly/sFOT1CO/Vnbk+ET7Pwe1Rj/rcBFtjyGLpoCRUc3qTDgy7+sU83AWULZ0vVH3
	 fPBsTLtLdw2aD3xDyzvARC1SYFqNQsfLyWaJ8YnX/pSmSa0pzp33Ac12PxV/pv1uFUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484198;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l9uR/N7gLiTwOqReBXdbxE6qJ9gVs9WwY/EYk75QFRc=;
	b=0YoWQZX2XzbLnz2IS+QdZy3XMORK5hMfVL2qDyfAI4e9tV4DLdETu3ahDfoEzPvpY+tZ
	 Rp40cvP/5t8zQidHeawM2XgB44Tmp+15B5gWV93J3dtpbOI0RLGmgZWqYy7YCHBXdjcuM
	 Alj5GgAvvg5c1XvU3ZCBF43uhsLxJktPYm/pqhXW59qNJBncYGJ2e9va6ZtZ9NOMV2wnv
	 b9xqjDYcS2AmYhdH5gG7UsRv0vNmNzpjJtK7Bo6GKefKpXTCDWy314hWkYBDz1ejJdOwx
	 g7W7/NOWvDMIDreNTRzkYfc/3g4MQcVi7AH1ba8kk2G11OA+cQT5NpRhrOh+EWaCuVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROii2efd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2894606A31D;
	Tue, 20 Oct 2026 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROii2efd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFB61F000C6;
	Tue, 20 Oct 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484197;
	bh=l9uR/N7gLiTwOqReBXdbxE6qJ9gVs9WwY/EYk75QFRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ROii2efdOwpCgHdWe4YOER9Dz1CzSCwp1GyIu33YEcAQyuwFiQkxx17LOl1FQCWdi
	 EKvqXPhpd4yurMzvsRkpFAytHXPoIpIqwE4CQ8+NycXDKyLxOL3mS9NR9svq83yhvm
	 /t/nof/51il6zWWiZd7XomIvuZYKc3id4/Wa4vBI+KrGJ92j0pJnruiEGxslzOB2yy
	 e/dTVA5CQdaVK714vJeFb70tRpa+lqORnSVNj0+N0Xd/ZWxBB4tsXs4fYubvxNVeKB
	 ZVSglQ9E/nTV+DfTeHh4eplzEWCmIIn4HTBL7qYgZho8qI7lSwc9hThxq2YENZXF5S
	 +PNod0Zyygmtg==
Date: Tue, 20 Oct 2026 10:16:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Waqar Hameed <waqar.hameed@axis.com>,
 oe-kbuild-all@lists.linux.dev, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-doc@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [linux-next:master 3622/16987] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <20261020101625.01874245@foz.lan>
In-Reply-To: <a9c10b54-be65-4448-8d1d-fde894336484@infradead.org>
References: <202610151025.1g5IgCv2-lkp@intel.com>
	<a9c10b54-be65-4448-8d1d-fde894336484@infradead.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 17:15:02 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> [for kernel-doc people]
>=20
> On 10/15/26 1:11 AM, kernel test robot wrote:
> > Hi Waqar,
> >=20
> > FYI, the error/warning still remains.
> >=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
> > commit: 3f21de6784a654503cc148169d1f59d89971da13 [3622/16987] power: su=
pply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca=
7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux) =20
>=20
> I am using:
> $ docutils --version
> docutils-3.13 (Docutils 0.23, Python 3.13.16, on linux)
> $ python3 --version
> Python 3.13.16
>=20
>=20
> > reproduce: (https://download.01.org/0day-ci/archive/20261015/2026101510=
25.1g5IgCv2-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610151025.1g5IgCv2-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> >    Using alabaster theme =20
>=20
>=20
> >>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline=
 emphasis start-string without end-string. [docutils] =20
> >    Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inlin=
e emphasis start-string without end-string. [docutils] =20
>=20
> and I only see one of these warnings (rt9467), although the sources
> for them are VERY similar.Why would that happen?
> Do we need to fix anything?
>=20
> > vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467
> >=20
> > eedb923279b78cb ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply=
/rt9467-*/sysoff_enable

Getting just line 1 is wrong. See:

	$ ./tools/docs/get_abi.py -D Documentation/ABI/testing/ rest --enable-line=
no|grep -A20 rt9467


	.. LINENO Documentation/ABI/testing/sysfs-class-power-rt9467#1


	.. _abi_sys_class_power_supply_rt9467_sysoff_enable:

	+-----------------------------------------------------------+
	| **\/sys\/class\/power_supply\/rt9467\-\*\/sysoff_enable** |
	+-----------------------------------------------------------+

	Defined on file :ref:`sysfs-class-power-rt9467 <abi_file_testing_sysfs_cla=
ss_power_rt9467>`

	This entry allows enabling the sysoff mode of rt9467 charger
	devices.
	If enabled and the input is removed, the internal battery FET
	is turned off to reduce the leakage from the BAT pin. See
	device datasheet for details. It's commonly used when the
	product enter shipping stage. After entering shipping mode,
	only 'VBUS' or 'Power key" pressed can make it leave this mode.
	'Disable' also can help to leave it, but it's more like to
	abort the action before the device really enter shipping mode.

	Access: Read, Write
	Valid values:
	- 1: enabled
	- 0: disabled


	.. LINENO Documentation/ABI/testing/sysfs-class-power-rt9471#19

Just like kernel-doc, lines are incremented per symbol.

Line 1 means the sysfs data that starts on line 1. In this specific case,
I'm seeing two issues there:

- 'Power key" - I guess it won't generate a warning, but the quote
  types don't match.

- Here, blank lines are missing:

	Access: Read, Write
	Valid values:
	- 1: enabled
	- 0: disabled

  Causing this output:

	Access: Read, Write Valid values: - 1: enabled - 0: disabled

  The right way to format it would be:

	Access: Read, Write

	Valid values:

	- 1: enabled
	- 0: disabled

  As RST format considers a single "\n" as if the next line to be
  part of the same paragraph. So, to split paragraphs, a blank
  line is needed.


If you want to test it, I suggest placing the rst content on a file
and ask Sphinx to build it. What I usually do to test stuff created
via kernel-doc/get_abi/... is to create a:

	Documentation/<temp_dir>

adding there just an index file and the output I want to test.
Then, I use make with SPHINXDIRS=3D<temp_dir>, as this is a lot
faster than building the entire Kernel.

	$ mkdir Documentation/get_abi_tmp_dir
	$ ./tools/docs/get_abi.py -D Documentation/ABI/testing/ rest > Documentati=
on/get_abi_tmp_dir/testing_abi.rst
	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Do=
cumentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/t=
esting/sysfs-driver-hid-lenovo-go-s:234
	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 tim=
es: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation=
/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 =
times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentat=
ion/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
	[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface n=
um>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defi=
ned 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Docu=
mentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
	[INFO] Didn't find ABI reference for 'Documentation/ABI/stable/sysfs-devic=
es-node'
	[INFO] Didn't find ABI reference for 'Documentation/ABI/stable/sysfs-devic=
es-node'

	$ cat <<EOF > get_abi_tmp_dir/index.rst
	Test
	=3D=3D=3D=3D

	.. toctree::
	   :maxdepth: 1

	   testing_abi
	EOF

	$ make SPHINXDIRS=3Dget_abi_tmp_dir htmldocs

here, I'm placing the entire content of the abi testing, but you
could alternatively create a dir with a subset of files under ABI
and test only the ones that hits errors. Once fixed, you can copy
them back to the ABI directory.

Btw, at least here (docs/docs-mw branch), I can=C2=B4t see any such
errors.
=09
> >=20
> > :::::: The code at line 1 was first introduced by commit
> > :::::: eedb923279b78cbfe16dd54dade0d73e9977f118 Documentation: power: r=
t9467: Document exported sysfs entries
> >=20
> > :::::: TO: ChiaEn Wu <chiaen_wu@richtek.com>
> > :::::: CC: Sebastian Reichel <sre@kernel.org> =20
>=20



Thanks,
Mauro
