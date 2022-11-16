Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBEE2CA4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Nov 2022 22:40:13 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-43-QmRQHnZtPD-f-gfapKz2sw-1; Wed, 16 Nov 2022 22:40:10 +0000
X-MC-Unique: QmRQHnZtPD-f-gfapKz2sw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 16 Nov
 2022 22:40:09 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Wed, 16 Nov 2022 22:40:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Kirill A. Shutemov'" <kirill.shutemov@linux.intel.com>,
	"kirill@shutemov.name" <kirill@shutemov.name>
CC: "dave.hansen@intel.com" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lkp@intel.com" <lkp@intel.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH 1/2] scsi: Fix get_user() in call sg_scsi_ioctl()
Thread-Topic: [PATCH 1/2] scsi: Fix get_user() in call sg_scsi_ioctl()
Thread-Index: AQHY+VSNJhar89N50E24WEBG2HeXiK5CJcRg
Date: Wed, 16 Nov 2022 22:40:09 +0000
Message-ID: <9d59ec367e0445028775d304bcf64704@AcuMS.aculab.com>
References: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
 <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
 <20221116004353.15052-2-kirill.shutemov@linux.intel.com>
In-Reply-To: <20221116004353.15052-2-kirill.shutemov@linux.intel.com>
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

From: Kirill A. Shutemov
> Sent: 16 November 2022 00:44
>=20
> get_user() expects the pointer to be pointer-to-simple-variable type,
> but sic->data is array of 'unsigned char'. It violates get_user()
> contracts.
>=20
> Cast it explicitly to 'unsigned char __user *'. It matches current
> behaviour.
>=20
> This is preparation for fixing sparse warnings caused by Linear Address
> Masking patchset.
>=20
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> ---
>  drivers/scsi/scsi_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
> index 2d20da55fb64..72b3ab5137b8 100644
> --- a/drivers/scsi/scsi_ioctl.c
> +++ b/drivers/scsi/scsi_ioctl.c
> @@ -519,7 +519,7 @@ static int sg_scsi_ioctl(struct request_queue *q, fmo=
de_t mode,
>  =09=09return -EFAULT;
>  =09if (in_len > PAGE_SIZE || out_len > PAGE_SIZE)
>  =09=09return -EINVAL;
> -=09if (get_user(opcode, sic->data))
> +=09if (get_user(opcode, (unsigned char __user *)sic->data))

Using &sic->data[0] should work and is much nicer than the cast.

=09David

>  =09=09return -EFAULT;
>=20
>  =09bytes =3D max(in_len, out_len);
> --
> 2.38.0

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

