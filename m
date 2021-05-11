Content-Type: multipart/mixed; boundary="===============3269582617803689489=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date: Tue, 11 May 2021 21:36:10 +0300
Message-ID: <ca2be6d1-5bb4-b44d-f306-cdf1dd369a39@gmail.com>
In-Reply-To: <YJrARxhVD7QM/GPv@archlinux-ax161>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3269582617803689489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

11.05.2021 20:35, Nathan Chancellor =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Tue, May 11, 2021 at 07:00:34PM +0300, Dmitry Osipenko wrote:
>> 11.05.2021 18:31, Krzysztof Kozlowski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>                                       ~~~~~~~~~~~~~~~~~~~~~^
>>>>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conve=
rsion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from=
 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>>>>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, E=
MC_ZQ_CAL);
>>>>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>>>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from ma=
cro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>>>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>>>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>>>>    13 warnings generated.
>>>>
>>>> This doesn't look like a useful warning from clang, it should see that
>>>> the constant value itself isn't truncated, hence it should be a problem
>>>> of clang. Do you think it's okay to ignore this nonsense?
>>>
>>> I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
>>> in u32 and there is no other bitwise arithmetic than just OR, so why
>>> clang assumes it can have 32 most signifcant bits toggled on?
>>>
>>> +Cc Nathan and Nick,
>>> Maybe you could shed some light here on this warning?
>>>
>>> Dmitry,
>>> In general you should not ignore it because:
>>> 1. This breaks allyesconfig with clang on powerpc (or it is one of the
>>> stoppers),
>>> 2. We might want in some future to build it with clang.
>>
>> I meant to ignore it from the perspective of the memory drivers, i.e. it
>> likely should be fixed in clang and not worked around in the code. Thank
>> you for pinging the right people.
> =

> I do not think this is a bug in clang, gcc warns the same (just not here
> in this case): https://godbolt.org/z/e9GWobMnd
> =

> DRAM_DEV_SEL_0 and DRAM_DEV_SEL_1 are implicitly signed integers because
> there is no suffix on the literal 1. DRAM_DEV_SEL_0 is 2 << 30, which
> can be turned into 1 << 31. That is equal to INT_MAX + 1, which then
> overflows and becomes INT_MIN (undefined behavior). INT_MIN is then
> promoted to unsigned long because EMC_ZQ_CAL_LONG and EMC_ZQ_CAL_CMD are
> unsigned long due to the BIT macro, resulting in the gigantic number
> that clang reports above.
> =

> I assume that this driver only runs on hardware where unsigned int is
> the same size as unsigned long, meaning this problem is merely
> theoretical?

Yes and no. The driver is built only for ARM32 today, but it's also
usable on ARM64, we just never got around to enable it for the 64bit
Tegra132 SoC.

> Regardless, defining DRAM_DEV_SEL_{0,1} with the BIT macro fixes the
> warning for me and should make everything work as expected.
> =

> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/t=
egra124-emc.c
> index 5699d909abc2..a21ca8e0841a 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -272,8 +272,8 @@
>  #define EMC_PUTERM_ADJ				0x574
>  =

>  #define DRAM_DEV_SEL_ALL			0
> -#define DRAM_DEV_SEL_0				(2 << 30)
> -#define DRAM_DEV_SEL_1				(1 << 30)
> +#define DRAM_DEV_SEL_0				BIT(31)
> +#define DRAM_DEV_SEL_1				BIT(30)
>  =

>  #define EMC_CFG_POWER_FEATURES_MASK		\
>  	(EMC_CFG_DYN_SREF | EMC_CFG_DRAM_ACPD | EMC_CFG_DRAM_CLKSTOP_SR | \
> =


Thank you for the clarification. So it's actually the code which needs
to be fixed.

The DRAM_DEV_SEL is a enum, hence I'll add patch in v2 that will make
the values unsigned.
--===============3269582617803689489==--

