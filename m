Content-Type: multipart/mixed; boundary="===============2231297421999693882=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: ".crypto_skcipher_setkey" undefined!
Date: Mon, 04 Jan 2021 13:51:46 +0800
Message-ID: <5896922a-5895-d240-e436-d3789f18cd58@intel.com>
In-Reply-To: <20210104052111.GA18507@gondor.apana.org.au>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2231297421999693882==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/4/2021 1:21 PM, Herbert Xu wrote:
> On Sun, Jan 03, 2021 at 02:37:42AM +0800, kernel test robot wrote:
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     ERROR: ".kmem_cache_alloc" [net/nfc/nfc.ko] undefined!
>>     ERROR: ".__ubsan_handle_type_mismatch_v1" [net/nfc/nfc.ko] undefined!
>>     ERROR: ".find_next_zero_bit" [net/nfc/nfc.ko] undefined!
> =

> ...
> =

>>>> ERROR: ".crypto_skcipher_setkey" [net/ceph/libceph.ko] undefined!
> =

> This looks like a bug in lkp.  Could you please have a look?

Hi Herbert,

Sorry for the inconvenience, the bot is not smart enough, we'll
optimize it to avoid such report.

Best Regards,
Rong Chen

> =

> Thanks,
>=20
--===============2231297421999693882==--

