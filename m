Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409F757CBA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 04:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725422632; cv=none; b=hqPRdsICmxm7STkNFVAsrc53qEfbyawu0gu/5zBMr3flc+U8fErNGMUUG/mlb5BulKe3lC+6F/NIsX3LOcRyDhaF3OseukblsYYRat1umy9uOFBVvNkson1BJ6vIVuI0tcsBG347HrsClz/wc66CMC75VPlAzLWSFvDr2/apwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725422632; c=relaxed/simple;
	bh=SOdCdZ5QctfE3jhhqqrVnu4eOwt9Nt3YBxvXEo/syn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lIXclSdu0wXarDPREbhS3cZizinM119LMQc43+HAPbYVmOvjxtVPyb3tHDA0JtTBoZfh9jRpmIUOFVIapj6bi2tMYHXn1QGbiIOFOazExvU2GS88M6ityRQL50DhUxYZUIGizXj+etmGOttUAcyWOOGe8UEEPWSJh6AsIVh23oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=pdISfQjE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="pdISfQjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725422627;
	bh=ag/n/AxPcp4GJ56FKlV3otNifysjvVUETh5UNfHYkQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pdISfQjELmG2itFC2rQXRgHTWh2uJFPs/CildCyO9Juu8ODDExQwhSdNIAlnaeohe
	 8kTlxusrpYnYKStY9Wvvnba+AxsbaD4B9MlsgslKgO2JGe15YRc1ytDvZqK98g5lXX
	 XxVhUSy/vRtZx6srJe89z2gfKrR4TGuGpfwM7+rmBmT4Spo9uVb5a/VzbWqF1ddQzK
	 uBiUBt8HJwnYeaU1cw8ph1D8avF+eYXGVCwsDwEbnCpFMelkQMj2cLuTB2FFIuqYiE
	 n13bazc3l+iJKK2MNWV4iIRlyhBKT90JGMiH/U6SX2VFWldbeYoogyhXmIzcQtTTqw
	 35GNCNFz9GBYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz84L5fWfz4x21;
	Wed,  4 Sep 2024 14:03:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, kernel test robot
 <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7055/8400]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_303' declared with attribute error: BUILD_BUG_ON
 failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
In-Reply-To: <4c575fd3-0495-4007-bc56-d252e18675c7@csgroup.eu>
References: <202409022326.gjEmSP9K-lkp@intel.com>
 <4c575fd3-0495-4007-bc56-d252e18675c7@csgroup.eu>
Date: Wed, 04 Sep 2024 14:03:46 +1000
Message-ID: <87seug5al9.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 02/09/2024 =C3=A0 17:21, kernel test robot a =C3=A9crit=C2=A0:
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.g=
it&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808d=
ccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337867768%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DH5sX0rEqtyFbPUsWEKZD0cj28q2zgyqJn1yzu0n=
QbWo%3D&reserved=3D0 master
>> head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
>> commit: 2f2b9a3adc66e978a1248ffb38df8477e8e97c57 [7055/8400] powerpc/32s=
: Reduce default size of module/execmem area
>> config: powerpc-buildonly-randconfig-r006-20220613 (https://eur01.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdownload.01.org%2F0day-ci%2=
Farchive%2F20240902%2F202409022326.gjEmSP9K-lkp%40intel.com%2Fconfig&data=
=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303=
dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337877719%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C0%7C%7C%7C&sdata=3DbgGDd4mH5eoPA4vSpBfvYt2LwGGNyAXLDhQF52TKovM%3D=
&reserved=3D0)
>> compiler: powerpc-linux-gcc (GCC) 13.3.0
>> reproduce (this is a W=3D1 build): (https://eur01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20240=
902%2F202409022326.gjEmSP9K-lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cch=
ristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303dd%7C8b87af7d86=
474dc78df45f69a2011bb5%7C0%7C0%7C638608873337883106%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&sdata=3DxlUQb5dKchpZQgrvc1l6JML%2FWpGE87zJ930ehEXAdcE%3D&reserved=3D0)
>>=20
>> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202409022326.gjEmSP9K-lkp%40intel.c=
om%2F&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e8=
08dccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C63860887333788835=
8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DDLTfKPILhI%2B8s3tLIq34L6jcWoL%2FysLW=
HcYDknvxRlc%3D&reserved=3D0
>>=20
>> All errors (new ones prefixed by >>):
>>=20
>>     In file included from <command-line>:
>>     arch/powerpc/mm/book3s32/mmu.c: In function 'mmu_mark_initmem_nx':
>>>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_a=
ssert_303' declared with attribute error: BUILD_BUG_ON failed: ALIGN_DOWN(M=
ODULES_VADDR, SZ_256M) < TASK_SIZE
>>       510 |         _compiletime_assert(condition, msg, __compiletime_as=
sert_, __COUNTER__)
>
> You hit the BUILD_BUG_ON() that was added by that commit, the behaviour=20
> is as expected: you have set CONFIG_TASK_SIZE_BOOL which is reserved for=
=20
> experts, then you have set CONFIG_TASK_SIZE to 0xc0000000 and=20
> CONFIG_PAGE_OFFSET has the same value which means there is no space for=20
> modules. I don't think I can do much about it.

We could make TASK_SIZE_BOOL, or ADVANCED_OPTIONS, depend on !COMPILE_TEST.

cheers
