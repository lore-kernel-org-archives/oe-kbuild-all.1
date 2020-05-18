Content-Type: multipart/mixed; boundary="===============8131909629000134143=="
MIME-Version: 1.0
From: Ramuthevar, Vadivel MuruganX <vadivel.muruganx.ramuthevar@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Mon, 18 May 2020 19:39:22 +0800
Message-ID: <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
In-Reply-To: <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8131909629000134143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Andy,

On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrot=
e:
>>
>>> sparse warnings: (new ones prefixed by >>)
>>>
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: =
incorrect type in argument 1 (different base types) @@    expected unsigned=
 int val @@    got restricted __be32 [assignedunsigned int val @@
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expec=
ted unsigned int val
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got r=
estricted __be32 [assigned] [usertype] reg
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse=
: incorrect type in argument 1 (different base types) @@    expected unsign=
ed int val @@    got restricted __be32 [assignedunsigned int val @@
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    exp=
ected unsigned int val
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got=
 restricted __be32 [assigned] [usertype] reg
>>>
>>>     440                  reg =3D cpu_to_be32(*pdata++);
>>>   > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
>>>     442
>>>     443                  reg =3D cpu_to_be32(*pdata);
>>>     444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
>>
>> On BE:
>> cpu_to_be32 -> no-op
>> writel() -> converts reg to LE
>>
>> On LE:
>> cpu_to_be32 -> converts to BE
>> writel() -> no-op (in terms of conversion)
>>
>> Seems to me that the proper API (if above is intended) should be swab32(=
).
>> But something tells me that above is broken (or my understanding is wron=
g).
> =

> iowrite_be32() is the correct way to store word into a big-endian mmio re=
gister,
> if that is the intention here.
Thank you for suggestions to use iowrite32be(), it suits exactly.

Regards
Vadivel

> =

>        Arnd
>=20
--===============8131909629000134143==--

