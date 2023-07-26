Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFDBA49
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 09:29:19 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-278-BHox4q11P9-e6xJhB7caqw-1; Wed, 26 Jul 2023 10:29:17 +0100
X-MC-Unique: BHox4q11P9-e6xJhB7caqw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 26 Jul
 2023 10:29:15 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 26 Jul 2023 10:29:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, "'linux-kernel@vger.kernel.org'"
	<linux-kernel@vger.kernel.org>, 'Andy Shevchenko'
	<andriy.shevchenko@linux.intel.com>, 'Andrew Morton'
	<akpm@linux-foundation.org>, "'Matthew Wilcox (Oracle)'"
	<willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>, "'Jason A.
 Donenfeld'" <Jason@zx2c4.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: RE: [PATCH next resend 5/5] minmax: Relax check to allow comparison
 between int and small unsigned constants.
Thread-Topic: [PATCH next resend 5/5] minmax: Relax check to allow comparison
 between int and small unsigned constants.
Thread-Index: Adm+7rJ87D8nFkT9Rp6d+7ZLnF7rBgAODzmAAB8QSKA=
Date: Wed, 26 Jul 2023 09:29:15 +0000
Message-ID: <4520ae6dc8b447cbaa77be0cdea79986@AcuMS.aculab.com>
References: <48c2cd0407f14859919d4fcbe526234a@AcuMS.aculab.com>
 <202307260303.3ftEpZRU-lkp@intel.com>
In-Reply-To: <202307260303.3ftEpZRU-lkp@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: kernel test robot <lkp@intel.com>
> Sent: 25 July 2023 20:37
>=20
...
>    drivers/gpu/drm/drm_modes.c: In function 'drm_mode_parse_command_line_=
for_connector':
> >> include/linux/minmax.h:23:22: warning: ordered comparison of pointer w=
ith integer zero [-Wextra]
>       23 |                 ((x) >=3D 0 && (x) <=3D (typeof((x) + 0))(long=
)__INT_MAX__))
>          |                      ^~
...
>    drivers/gpu/drm/drm_modes.c:2474:29: note: in expansion of macro 'max'
>     2474 |                 extra_ptr =3D max(bpp_end_ptr, refresh_end_ptr=
);
>          |                             ^~~

There are a handful of annoying uses of min/max with pointers.
I'll fix this in v2 by adding a cast to the 0.
(I was expecting an error for unsigned types.)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

