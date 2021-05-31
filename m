Content-Type: multipart/mixed; boundary="===============2812549246274465466=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 07:34:07 -0700
Message-ID: <0717b3a5-d838-e1ed-a4ac-80cf14f3a6aa@infradead.org>
In-Reply-To: <CAMuHMdW1xZ-vJe2eOehNSKCP3T=-eq7ji4MBo3D6oGJyPNXGDw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2812549246274465466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/31/21 12:36 AM, Geert Uytterhoeven wrote:
> On Mon, May 31, 2021 at 3:13 AM Randy Dunlap <rdunlap@infradead.org> wr=
ote:
>> On 5/30/21 5:05 PM, Randy Dunlap wrote:
>>> On 5/29/21 4:25 PM, kernel test robot wrote:
>>>> First bad commit (maybe !=3D root cause):
>>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
>>>> head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
>>>> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO =
drivers into a new subdirectory
>>>> date:   9 months ago
>>>> config: sh-allmodconfig (attached as .config)
>>>> compiler: sh4-linux-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=3D1 build):
>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>>         chmod +x ~/bin/make.cross
>>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3Da9770eac511ad82390b9f4a3c1728e078c387ac7
>>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>>         git fetch --no-tags linus master
>>>>         git checkout a9770eac511ad82390b9f4a3c1728e078c387ac7
>>>>         # save the attached .config to linux build tree
>>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Dsh
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>
>>>>>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefine=
d!
>>
>> Should we make this one driver depend on !SUPERH ?
> =

> No, we should just fix the driver instead.
> =

> +               /* Wait 1000 clocks so we don't saturate the RSL bus
> +                * doing reads.
> +                */
> +               __delay(1000);
> =

> As this is used only on Cavium Octeon and Thunder SoCs, running
> at 400-600 MHz resp. 1800-2000 Mhz, what about replacing the __delay()
> call by a call to udelay(1) or udelay(2)?

Yeah, I was planning to look into that change this week,
but it would probably be better for David to do it.


thanks.
-- =

~Randy

--===============2812549246274465466==--

