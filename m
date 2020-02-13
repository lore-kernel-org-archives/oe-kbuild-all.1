Content-Type: multipart/mixed; boundary="===============1385624612346211993=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [usb:usb-testing 18/18] drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted __le16 degrades to integer
Date: Thu, 13 Feb 2020 11:37:47 +0100
Message-ID: <1581590267.21415.12.camel@suse.de>
In-Reply-To: <034bc43c35a75a84787bc786c8694607552a8139.camel@hadess.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1385624612346211993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 13.02.2020, 09:56 +0100 schrieb Bastien Nocera:
> =

> Is that something I should be fixing? I'm guessing that I just need to
> cast the constant side to a type the same size as those fields, but is
> that necessary?

Hi,

I am on it. Expect a patch in half an hour.

	Regards
		Oliver

--===============1385624612346211993==--

