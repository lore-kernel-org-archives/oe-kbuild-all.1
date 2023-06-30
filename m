Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A727154B9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 13:28:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4C13FD837F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 13:14:02 +0000 (UTC)
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 924976000C;
	Fri, 30 Jun 2023 13:13:53 +0000 (UTC)
Message-ID: <3b3169620f6a8594a78d592a21153fda70edbfda.camel@hadess.net>
Subject: Re: [PATCH] HID: steelseries: Add support for Arctis 1 XBox
From: Bastien Nocera <hadess@hadess.net>
To: kernel test robot <lkp@intel.com>, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Jiri Kosina
	 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 30 Jun 2023 15:13:53 +0200
In-Reply-To: <202306300419.dmlkSoqD-lkp@intel.com>
References: <20230629172041.3771-1-hadess@hadess.net>
	 <202306300419.dmlkSoqD-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-06-30 at 04:32 +0800, kernel test robot wrote:
> Hi Bastien,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on linus/master v6.4 next-20230629]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-steelse=
ries-Add-support-for-Arctis-1-XBox/20230630-012252
> base:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git=C2=A0for-next
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20230629172041.3771-1-hadess%40hadess.net
> patch subject: [PATCH] HID: steelseries: Add support for Arctis 1
> XBox
> config: arc-randconfig-r035-20230629
> (https://download.01.org/0day-ci/archive/20230630/202306300419.dmlkSo
> qD-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.3.0
> reproduce:
> (https://download.01.org/0day-ci/archive/20230630/202306300419.dmlkSo
> qD-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202306300419.dmlkSoqD-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 arceb-elf-ld: drivers/hid/hid-steelseries.o: in function
> `steelseries_headset_raw_event':
> > > hid-steelseries.c:(.text+0x344): undefined reference to
> > > `usb_set_wireless_status'
> > > arceb-elf-ld: hid-steelseries.c:(.text+0x344): undefined
> > > reference to `usb_set_wireless_status'
> =C2=A0=C2=A0 arceb-elf-ld: drivers/hid/hid-steelseries.o: in function
> `steelseries_probe':
> =C2=A0=C2=A0 hid-steelseries.c:(.text+0x790): undefined reference to
> `usb_set_wireless_status'
> =C2=A0=C2=A0 arceb-elf-ld: hid-steelseries.c:(.text+0x790): undefined ref=
erence
> to `usb_set_wireless_status'

The KConfig was missing a dependency on USB (and not USB HID...), fixed
in v3.
