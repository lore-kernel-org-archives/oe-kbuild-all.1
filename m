Content-Type: multipart/mixed; boundary="===============8602228993304655473=="
MIME-Version: 1.0
From: Dan Murphy <dmurphy@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/2] power: supply: bq25790: Introduce the BQ25790 charger driver
Date: Fri, 09 Oct 2020 07:18:20 -0500
Message-ID: <a38c3dcd-4e19-0d99-105c-c2cb0a645eb6@ti.com>
In-Reply-To: <20201009121532.GN1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8602228993304655473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dan

On 10/9/20 7:15 AM, Dan Carpenter wrote:
> Hi Dan,
>
> url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/dt-bindings-p=
ower-Add-the-bq25790-dt-bindings/20201008-234450
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-s=
upply.git for-next
> config: i386-randconfig-m021-20201009 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/power/supply/bq25790_charger.c:170 bq25790_usb_work() warn: ignor=
ing unreachable code.
> drivers/power/supply/bq25790_charger.c:624 bq25790_get_property() warn: s=
hould this be a bitwise op?

Fixing both of these now

Dan

--===============8602228993304655473==--

