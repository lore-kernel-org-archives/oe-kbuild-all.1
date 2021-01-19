Content-Type: multipart/mixed; boundary="===============5403912163252672877=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 09/17] can: length: can_fd_len2dlc(): simplify length calculcation
Date: Tue, 19 Jan 2021 08:46:22 +0100
Message-ID: <8d4b7195-20cf-0a43-dc94-beb427c7a45d@pengutronix.de>
In-Reply-To: <20210119061726.GD2696@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5403912163252672877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/19/21 7:17 AM, Dan Carpenter wrote:
> Hi Marc,
> =

> url:    https://github.com/0day-ci/linux/commits/Marc-Kleine-Budde/MAINTA=
INERS-adjust-entry-to-tcan4x5x-file-split/20210114-102248
> base:    f50e2f9f791647aa4e5b19d0064f5cabf630bf6e
> config: i386-randconfig-m021-20210114 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> drivers/net/can/dev/length.c:38 can_fd_len2dlc() error: buffer overflow '=
len2dlc' 49 <=3D 49
> =

> vim +/len2dlc +38 drivers/net/can/dev/length.c
> =

> d4b90befe4bfafa1 Marc Kleine-Budde 2021-01-13  32  /* map the sanitized d=
ata length to an appropriate data length code */
> d4b90befe4bfafa1 Marc Kleine-Budde 2021-01-13  33  u8 can_fd_len2dlc(u8 l=
en)
> d4b90befe4bfafa1 Marc Kleine-Budde 2021-01-13  34  {
> 6ae761ad6c0557f0 Marc Kleine-Budde 2021-01-13  35  	if (len > ARRAY_SIZE(=
len2dlc))
>                                                                 ^
> This should be >=3D

ACK. We noticed that after I send the pull request, but before
it was merged. I send an updated pull request which contains
the fixed version. See:

| 652562e5ff06 can: length: can_fd_len2dlc(): simplify length calculcation

Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============5403912163252672877==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQW1BR2prNEFDZ2tRcWNsYWl2cnQKNzZsWkV3ZitKYTFaaVJRUmph
c2tNN3k1WlhNMXdvbE04R05xck4xMEROTnNXQWlCMm5KT2t5cnI0NFFwSUNvSQpqYTNncTA3N0g4
ODM4dHpDUXloNWE0cGw1dzUvdk9wQm1xVXdUWjY5MjIxT2V0dWU3eTQ3MW1LRHpMYzRXaHZNCkc3
cWhUblppODNjY2tZOXQzWmgxaWdGQ2U5NGZSZGlJSElCV042Y0J4TWZUZlJpekZEZG8wbWpNaUNJ
dHQwSngKckFCbDRWY291bUUramZsUVRHRm9xRklOUXc5RGJBVjNmTWtJTS9pWnVYVFcxalFGaGN6
TTF5dGwzdm5FR2w4cgpydDRmWmNNTHkxYWZrZWpYZ2w2VVpIcDUyZkc3cmVDYnlIdWZIa0NiNFFp
aktWTEZORHFkY2xzSWtKQXZ1OTN0CmZFaXpFVEhXaDlxK0dJcnN4b3RCSHlOaE9ES1Y5UT09Cj1o
ZkhNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5403912163252672877==--

