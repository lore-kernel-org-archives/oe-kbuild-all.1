Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5818B49A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382171; cv=none; b=BlNYt9QSHvC7Ls69l9iI3XnnlhPwKWcDjUA02nAxftU9oKv/w3TYQthsRQ8LIwg/6RPE/vrmxSSqcTBR2opW7ZRud+juD/pCwih/lm3sxjxMZvSAQAm+HrsCBWC3fplBwrzCB44Kk5e8B+nDEdctaXf4y8kFhRpyrzfHU6xO32w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382171; c=relaxed/simple;
	bh=0t7g0Ur+ndTcSoVEWt9k2/ejXIconQnXJleLp13SnMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIM+84R0giCDBABOCjO3oO68dweZ562U7EX1haUBlsoQB48RO8CqRe6YliSotwRwmQAwTPIzEzJ+FTR6l0iKgxnOj+RGMypjNXSXXOREoKmvlcKEm7/gZvxKqiG9Psw45x+L4s8mFy1d0nBaWsOUQFGH7aQDPvhyWBpfnS1f5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wys6H4FxCz9sSH;
	Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkSNo9e_bVqz; Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wys6H3Grvz9sSC;
	Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B9FE8B778;
	Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dCik_HARaarL; Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
Received: from [192.168.234.228] (unknown [192.168.234.228])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FF168B774;
	Tue,  3 Sep 2024 18:49:27 +0200 (CEST)
Message-ID: <4c575fd3-0495-4007-bc56-d252e18675c7@csgroup.eu>
Date: Tue, 3 Sep 2024 18:49:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7055/8400]
 include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_303' declared with attribute error: BUILD_BUG_ON
 failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
To: kernel test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202409022326.gjEmSP9K-lkp@intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <202409022326.gjEmSP9K-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 17:21, kernel test robot a écrit :
> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337867768%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=H5sX0rEqtyFbPUsWEKZD0cj28q2zgyqJn1yzu0nQbWo%3D&reserved=0 master
> head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
> commit: 2f2b9a3adc66e978a1248ffb38df8477e8e97c57 [7055/8400] powerpc/32s: Reduce default size of module/execmem area
> config: powerpc-buildonly-randconfig-r006-20220613 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20240902%2F202409022326.gjEmSP9K-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337877719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=bgGDd4mH5eoPA4vSpBfvYt2LwGGNyAXLDhQF52TKovM%3D&reserved=0)
> compiler: powerpc-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20240902%2F202409022326.gjEmSP9K-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337883106%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=xlUQb5dKchpZQgrvc1l6JML%2FWpGE87zJ930ehEXAdcE%3D&reserved=0)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202409022326.gjEmSP9K-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6fb61314a5dd4f0fc8e808dccb6303dd%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638608873337888358%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=DLTfKPILhI%2B8s3tLIq34L6jcWoL%2FysLWHcYDknvxRlc%3D&reserved=0
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from <command-line>:
>     arch/powerpc/mm/book3s32/mmu.c: In function 'mmu_mark_initmem_nx':
>>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_303' declared with attribute error: BUILD_BUG_ON failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
>       510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

You hit the BUILD_BUG_ON() that was added by that commit, the behaviour 
is as expected: you have set CONFIG_TASK_SIZE_BOOL which is reserved for 
experts, then you have set CONFIG_TASK_SIZE to 0xc0000000 and 
CONFIG_PAGE_OFFSET has the same value which means there is no space for 
modules. I don't think I can do much about it.

If you hadn't CONFIG_TASK_SIZE_BOOL you would have got the default value 
which is 0xb0000000 which is all fine.

Christophe

