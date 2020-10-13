Content-Type: multipart/mixed; boundary="===============4845205793360685179=="
MIME-Version: 1.0
From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v8 3/3] leds: trigger: implement a tty trigger
Date: Tue, 13 Oct 2020 10:37:27 +0200
Message-ID: <20201013083727.bii6p6yhdh53zbko@pengutronix.de>
In-Reply-To: <202010122255.mTooYoPh-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4845205793360685179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 12, 2020 at 10:16:59PM +0800, kernel test robot wrote:
> Hi "Uwe,

I love your test report! Perhaps something to improve: The parser of the
From: line should drop the " :-)

>    drivers/leds/trigger/ledtrig-tty.c: In function 'ledtrig_tty_work':
> >> drivers/leds/trigger/ledtrig-tty.c:92:7: warning: variable 'firstrun' =
set but not used [-Wunused-but-set-variable]
>       92 |  bool firstrun =3D false;
>          |       ^~~~~~~~

Indeed, this line should just be dropped. I won't resend yet, waiting
for some feedback first and assuming reviewers are able to interpolate
how v9 will look like :-)

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--===============4845205793360685179==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ2dBZEZpRUVmbklxRnBBWXJQ
OCtkS1FMd2Z3VWVLM0s3QWtGQWwrRlowUUFDZ2tRd2Z3VWVLM0sKN0FsQnlRZi9RZXRyeWZndlJW
ZXBKQ1B5ZkgxNXNTNW42a1ZmSG9RUnc1OXN6OEdsYnFyYUJOdE8vbUY2K1VXeApVNEFoVEhoYS9E
YTFUOTdJZnZKRmdsWU1qMGovTUpuV01Vdk4rK3RrMkxHRjJwT1loVzhzeGl4SGloSGpoR3ZICjl6
YUUvMWhQVTk2b25JQTdNQ29pNUROMUVPbEVLVkhRQ2d0b1VXT0RZakI0SmFhb0puOXNVeHdGOCtt
YWIyQXUKNDlIN3JhdUE4VXU3RjFtVThlQnJibytKeW80MHJYZUNwRjdnbXEyRC9UNDU0KzJ6cFRm
U28vQ2c2NU90NmZhSApPT0RnY254SXpBK09TMDJYSnBob0F2YlBmYTBndm5ZNUxFb2o1V2NwdzlU
ZW4rYXplQitnU0ZCbVVMSXRNbExICm10ZmI5akhNN0U5VzZISjBQOGFDemh1cjdmVDdmUT09Cj1K
bERkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4845205793360685179==--

