Content-Type: multipart/mixed; boundary="===============8278991561945650752=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 19:00:34 +0300
Message-ID: <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
In-Reply-To: <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8278991561945650752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

11.05.2021 18:31, Krzysztof Kozlowski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
...
                                      ~~~~~~~~~~~~~~~~~~~~~^
>>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit convers=
ion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 1=
8446744071562067985 to 2147483665 [-Wconstant-conversion]
>>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC=
_ZQ_CAL);
>>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macr=
o 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>>    13 warnings generated.
>>
>> This doesn't look like a useful warning from clang, it should see that
>> the constant value itself isn't truncated, hence it should be a problem
>> of clang. Do you think it's okay to ignore this nonsense?
> =

> I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
> in u32 and there is no other bitwise arithmetic than just OR, so why
> clang assumes it can have 32 most signifcant bits toggled on?
> =

> +Cc Nathan and Nick,
> Maybe you could shed some light here on this warning?
> =

> Dmitry,
> In general you should not ignore it because:
> 1. This breaks allyesconfig with clang on powerpc (or it is one of the
> stoppers),
> 2. We might want in some future to build it with clang.

I meant to ignore it from the perspective of the memory drivers, i.e. it
likely should be fixed in clang and not worked around in the code. Thank
you for pinging the right people.
--===============8278991561945650752==--

