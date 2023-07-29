Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFC27C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 09:03:06 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qPfn0-001g52-GV; Sat, 29 Jul 2023 10:59:06 +0200
Received: from ip5b40320d.dynamic.kabel-deutschland.de ([91.64.50.13] helo=[192.168.178.58])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qPfn0-002gv6-A6; Sat, 29 Jul 2023 10:59:06 +0200
Message-ID: <d59f2172d559574e43fa512531363cb3e755fe1b.camel@physik.fu-berlin.de>
Subject: Re: [akpm-mm:mm-unstable 197/338] include/asm-generic/io.h:636:15:
 error: redefinition of 'inb_p'
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de, geert@linux-m68k.org,
 Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Date: Sat, 29 Jul 2023 10:59:05 +0200
In-Reply-To: <ZMTURDfFP5/cQCXm@MiWiFi-R3L-srv>
References: <202307291412.zoTsMe9U-lkp@intel.com>
	 <ZMTURDfFP5/cQCXm@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.64.50.13
X-ZEDAT-Hint: PO

Hello Baoquan!

On Sat, 2023-07-29 at 16:56 +0800, Baoquan He wrote:
> On 07/29/23 at 02:30pm, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   d7928c9026c83acc1b3dd2a10ef48489aa0c56d0
> > commit: c1302338f919fd201d8cd44417e19e1e66ab9cef [197/338] sh: add <asm=
-generic/io.h> including
> > config: sh-randconfig-r002-20230728 (https://download.01.org/0day-ci/ar=
chive/20230729/202307291412.zoTsMe9U-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230729/2023072914=
12.zoTsMe9U-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202307291412.zoTsMe9U-l=
kp@intel.com/
>=20
> Known issue, reported again and I ever explained the reason in last
> report:
> https://lore.kernel.org/all/ZLk2fos0aWNOSCo3@MiWiFi-R3L-srv/T/#u
>=20
> Arnd has patch and alternative solution here:
> https://lore.kernel.org/all/09094baf-dadf-4bce-9f63-f2a1f255f9a8@app.fast=
mail.com/T/#u
>=20
> If no objection, I will send Arnd's patch out to mute LKP.

Sorry, there is sometimes a bit too much noise across my mailing list subsc=
riptions
that I am missing such mails. I will check Arnd'd patch and approve it if i=
t's OK.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
