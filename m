Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958E813B590
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715259554; cv=none; b=rNBS1qiSY9Xxf83dwFYvyvE0ctdOyyokUZcGsoGe3cZIe+MzoorYzJv4Xp7fTpF2qgeliN9rPnnHuUImw6k5WpCcE8wlARqExe726+hJ9sMYSNElFTZostR/i0I5KjnH2TywT6YhvLK6+UGBGRv8bB4GJGd+BK8LSy5qtvK6TAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715259554; c=relaxed/simple;
	bh=8IVJksWMMuCKpXBkkfoBoSBwRpGyqI4bFczp7eNlCkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyaPeJ+S+utI6VuXMJOylPHofE8Hrvk01uWpP/0mlB4fojWqDurW+HVfvR46ZViH3mx6mSgbd1/LhkwZ0JF0askh0v8E5SfoT7/SEbON7r4KGrMvM6V+Lp4KbDZxCYeoCTHSq9HVpWRZf9SIQnV3NQx5FxCp3nwnHXBYKscJaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53070106F;
	Thu,  9 May 2024 05:59:37 -0700 (PDT)
Received: from [10.1.38.172] (XHFQ2J9959.cambridge.arm.com [10.1.38.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DF473F6A8;
	Thu,  9 May 2024 05:59:11 -0700 (PDT)
Message-ID: <a6db13cf-227e-4588-a212-7c21055c7942@arm.com>
Date: Thu, 9 May 2024 13:59:09 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10159/12060]
 arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of
 function 'pud_valid'; did you mean 'pmd_valid'?
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <202405082221.43rfWxz5-lkp@intel.com>
 <10cd4b97-d780-4524-a0ee-89f26a7897fc@arm.com>
 <20240508171211.GB23294@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240508171211.GB23294@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2024 18:12, Will Deacon wrote:
> Hey Ryan,
> 
> On Wed, May 08, 2024 at 04:38:01PM +0100, Ryan Roberts wrote:
>> On 08/05/2024 15:24, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   e7b4ef8fffaca247809337bb78daceb406659f2d
>>> commit: f0f5863a0fb0fb48a5881c3f6acca1958899dd76 [10159/12060] arm64/mm: Remove PTE_PROT_NONE bit
>>> config: arm64-randconfig-r013-20230528 (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/config)
>>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202405082221.43rfWxz5-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from include/linux/pgtable.h:6,
>>>                     from arch/arm64/include/asm/io.h:12,
>>>                     from include/linux/io.h:13,
>>>                     from include/linux/irq.h:20,
>>>                     from include/asm-generic/hardirq.h:17,
>>>                     from arch/arm64/include/asm/hardirq.h:17,
>>>                     from include/linux/hardirq.h:11,
>>>                     from include/linux/interrupt.h:11,
>>>                     from include/linux/trace_recursion.h:5,
>>>                     from include/linux/ftrace.h:10,
>>>                     from arch/arm64/kernel/asm-offsets.c:12:
>>>    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>>>>> arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of function 'pud_valid'; did you mean 'pmd_valid'? [-Werror=implicit-function-declaration]
>>>     1102 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
>>>          |                ^~~~~~~~~
>>>          |                pmd_valid
>>
>> Hi Will,
>>
>> Looks like this is due to pud_valid() not being defined for
>> CONFIG_PGTABLE_LEVELS <= 2. Seems to me that this is the cleanest solution. But
>> pgtable folding breaks my brain so perhaps there is a better way?
> 
> I think your approach is the right idea. pgtable-nopmd.h defines
> pud_present() as 'return 1', but I think pud_valid() can be false given
> that it's only used directly by the arch code.
> 
>> What's the process here? Can you just merge this into the broken patch, or do I
>> need to re-post the series, or post a fix patch formally?
> 
> for-next/mm is stable, so please just submit proper patches on top of
> that (and you can add a Fixes: tag as well).

OK no problem - I've posted the patch. Sorry about this!

> 
> Cheers,
> 
> Will

