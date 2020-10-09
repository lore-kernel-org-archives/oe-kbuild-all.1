Content-Type: multipart/mixed; boundary="===============1380797111954430713=="
MIME-Version: 1.0
From: Martin K. Petersen <martin.petersen@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [mkp-scsi:for-next 230/248] drivers/scsi/pm8001/pm8001_init.c:1193 pm8001_init_ccb_tag() warn: level not at start of string
Date: Fri, 09 Oct 2020 07:41:19 -0400
Message-ID: <yq1pn5ry6fv.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <20201009101549.GD1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1380797111954430713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi Dan!

> New smatch warnings:
> drivers/scsi/pm8001/pm8001_init.c:1193 pm8001_init_ccb_tag() warn: KERN_*=
 level not at start of string

I fixed these up a couple of days ago. Should be gone in latest -next.

Thanks!

-- =

Martin K. Petersen	Oracle Linux Engineering
--===============1380797111954430713==--

