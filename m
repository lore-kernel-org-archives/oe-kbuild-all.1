Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F53259D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 18:42:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id EB013CFE13
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 18:12:11 +0000 (UTC)
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C6B01BF205;
	Mon,  3 Jul 2023 18:12:03 +0000 (UTC)
Message-ID: <0895ee64688ee3c839e6737dada9f17a7b92a39c.camel@hadess.net>
Subject: Re: [PATCH v5] HID: steelseries: Add support for Arctis 1 XBox
From: Bastien Nocera <hadess@hadess.net>
To: Benjamin Tissoires <bentiss@kernel.org>, kernel test robot
 <lkp@intel.com>
Cc: linux-input@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 03 Jul 2023 20:12:03 +0200
In-Reply-To: <ytk64symj6g2rsoy5jfe4gpojiska7plv5w4lmofm7vifrap5h@4lpu33rqodos>
References: <20230703102918.9941-1-hadess@hadess.net>
	 <202307032208.b5brKeCt-lkp@intel.com>
	 <ytk64symj6g2rsoy5jfe4gpojiska7plv5w4lmofm7vifrap5h@4lpu33rqodos>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-07-03 at 17:33 +0200, Benjamin Tissoires wrote:
>=20
> On Jul 03 2023, kernel test robot wrote:
> >=20
> > Hi Bastien,
> >=20
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on hid/for-next]
> > [also build test ERROR on linus/master v6.4 next-20230703]
> > [If your patch is applied to the wrong git tree, kindly drop us a
> > note.
> > And when submitting patch, we suggest to use '--base' as documented
> > in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >=20
> > url:=C2=A0=C2=A0=C2=A0
> > https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/HID-steel=
series-Add-support-for-Arctis-1-XBox/20230703-183124
> > base:=C2=A0=C2=A0
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git=C2=A0for-
> > next
> > patch link:=C2=A0=C2=A0=C2=A0
> > https://lore.kernel.org/r/20230703102918.9941-1-hadess%40hadess.net
> > patch subject: [PATCH v5] HID: steelseries: Add support for Arctis
> > 1 XBox
> > config: parisc-randconfig-r032-20230703
> > (https://download.01.org/0day-ci/archive/20230703/202307032208.b5br
> > KeCt-lkp@intel.com/config)
> > compiler: hppa-linux-gcc (GCC) 12.3.0
> > reproduce:
> > (https://download.01.org/0day-ci/archive/20230703/202307032208.b5br
> > KeCt-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a
> > new version of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202307032208.b5brKeCt-lkp@intel=
.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > =C2=A0=C2=A0 hppa-linux-ld: drivers/hid/hid-steelseries.o: in function
> > `.LC10':
> > > > hid-steelseries.c:(.rodata.cst4+0x8): undefined reference to
> > > > `hid_is_usb'
>=20
> Bastien, you need a depends on USB_HID IIRC in your Kconfig (at
> least CONFIG_USB_HID is not set in that kernel test bot run).

Yeah, I just get to undo the changes from v3 ;)
