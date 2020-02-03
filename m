Content-Type: multipart/mixed; boundary="===============1259088124064592386=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [lee:android-3.18-preview 136/224] drivers/media/radio/si470x/radio-si470x-i2c.c:462:25-30: ERROR: reference preceded by free on line 460 (fwd)
Date: Mon, 03 Feb 2020 10:32:51 +0000
Message-ID: <20200203103251.GA3117936@kroah.com>
In-Reply-To: <20200131150809.GF3548@dell>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1259088124064592386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2020 at 03:08:09PM +0000, Lee Jones wrote:
> On Fri, 31 Jan 2020, Julia Lawall wrote:
> =

> > The code on line 462 looks suspicious.
> =

> Thank you Julia.
> =

> Have you already reported this to the other Stable Maintainers?
> =

> This issue appears to affect; 4.4, 4.9, 4.14 and 4.19.

Ick :(

Can you send us a fix-up patch for this to be applied everywhere?

thanks,

greg k-h
--===============1259088124064592386==--

