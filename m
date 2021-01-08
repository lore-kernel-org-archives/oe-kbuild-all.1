Content-Type: multipart/mixed; boundary="===============0616597226827442357=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 19/19] can: flexcan: add CAN wakeup function for i.MX8QM
Date: Fri, 08 Jan 2021 09:01:17 +0100
Message-ID: <ffddcd05-39d2-c739-86af-1e63bdb9f572@pengutronix.de>
In-Reply-To: <42ec4ab0-b544-e7d7-d5e9-7609cb2273d3@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0616597226827442357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/8/21 8:07 AM, Rong Chen wrote:
>>>>> ERROR: modpost: "imx_scu_get_handle" [drivers/net/can/flexcan.ko] und=
efined!
>> Another false positive, due to the old net-next/master base.

> Sorry for the inconvenience, we'll take a look at this problem.

No problem. The kernel test robot is a great service nonetheless!

Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============0616597226827442357==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwvNEVVMEFDZ2tRcWNsYWl2cnQKNzZtZjdnZitLYUlKd2FrK0VN
am8xaUdoTjNTbTdCTnJ6OWwyOG5VbFBCYzZnbWJqL2RKWDFBaklCSHFnQ2lPYgoxSTk1dWt0MGN1
NEpBT042dmNURmNyNnp1ZHlacXlXMHIxdGdqRjVCRkp6WC9CT2Q1MU1MbFRHT0M0VHd3YXJZCnhw
RndtM0pLWUoydW1yVjlZdGw5L08vNFJRZGFpTEQ3d2xocmVGWW9pcC9abVlOVXI0QU9CVW9wQU5V
NmR5S2YKT0drWllCWXpQUldEVjkwNDRHNGxzdTlqMkhvZ2RuNitTbENIdDYrREpiZktSRnU1KzJx
THFLZDdpTWxPanFraQo4VnZOdmZjUEdHMFVGSlFWNzNlQVJoUlRacmRockZVY2p5dllqQ1FVWHJY
VENlQStJbmhtMWMzSENaalg5RzR2ClJ1ckIrblp5Y3c2Q2J5TTFXMkRDS2kxVVMwZWdZZz09Cj1u
Mnh3Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0616597226827442357==--

