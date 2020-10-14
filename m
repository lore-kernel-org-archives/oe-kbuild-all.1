Content-Type: multipart/mixed; boundary="===============8550612500923267429=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [patch 4/4] media: cx231xx: Consolidate dmesg output
Date: Wed, 14 Oct 2020 17:21:43 +0200
Message-ID: <87o8l4bzp4.fsf@nanos.tec.linutronix.de>
In-Reply-To: <202010142250.7T8Tm5kT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8550612500923267429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14 2020 at 22:36, kernel test robot wrote:
>    drivers/media/usb/cx231xx/cx231xx-vbi.c: In function 'cx231xx_init_vbi=
_isoc':
>>> drivers/media/usb/cx231xx/cx231xx-vbi.c:411:5: warning: format '%s' exp=
ects a matching 'char *' argument [-Wformat=3D]
>      411 |     "unable to allocate %i bytes for transfer buffer %i%s\n",

Duh.
--===============8550612500923267429==--

