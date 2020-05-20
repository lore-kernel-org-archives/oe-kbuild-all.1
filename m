Content-Type: multipart/mixed; boundary="===============2043023351426659268=="
MIME-Version: 1.0
From: Daniel Axtens <dja@axtens.net>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 156/523] include/linux/string.h:307:9: note: in expansion of macro '__underlying_strncpy'
Date: Wed, 20 May 2020 13:57:16 +1000
Message-ID: <875zcri7hf.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <20200519184847.5affb9238b7358ac0d18c98e@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2043023351426659268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> 		inqdata[0] =3D TYPE_PROCESSOR;
> 		/* Periph Qualifier & Periph Dev Type */
> 		inqdata[1] =3D 0;
> 		/* rem media bit & Dev Type Modifier */
> 		inqdata[2] =3D 0;
> 		/* ISO, ECMA, & ANSI versions */
> 		inqdata[4] =3D 31;
> 		/* length of additional data */
> 		strncpy(&inqdata[8], "Areca   ", 8);
> 		/* Vendor Identification */
>>>>		strncpy(&inqdata[16], "RAID controller ", 16);
> 		/* Product Identification */
> 		strncpy(&inqdata[32], "R001", 4); /* Product Revision */


> That strncpy() will indeed fail to copy the trailing null, but it looks
> like that null isn't appropriate in the inquiry data.
>
> So I suspect this is a valid usage of strncpy() and the checking is
> just too strict.
>
> otoh if this is the only place where we hit this issue then perhaps we
> can switch to memcpy() and get on with life ;)

Hmm, yes, I think you're right and gcc is being a bit ambitious here -
although I can understand the warning given that the behaviour relied
upon here is rarely going to be what the developer intendend!

We could build the file with -Wno-stringop-truncation, but I do wonder
if memcpy might make the semantics more obvious...

Regards,
Daniel
--===============2043023351426659268==--

