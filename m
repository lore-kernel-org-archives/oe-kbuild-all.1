Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74248594B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712661671; cv=none; b=XppU4Ogm0HoYUjQRP+y/cgssSklAaY+l5eCNyzoBrZrO4zhJgYKsNep+h3YeRJguI0LE3K5DJyZlhLmT73DZELkYfRumsOuabKzxL37okinVkfHE2RHbZN12RMnWaTcw9SkxlwfM/1AoyZpMWjZZalOclZ4maDDFIT9u+80WLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712661671; c=relaxed/simple;
	bh=I5Nill/zwE+Mh4Sfpj0rcKfuB9AOB/tDY5kLf7cnk54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ersn7WhEwun+880ZuBJQVQWNhQTgstQsG++7LO7dbqs+Y5TjBTbq43TO1YjyUxjLP2BjK1q0ctQSbVgCkgMow5TF+PNLToW8hhhEHNgBAP+StBHXZmudfsl3Zvcmq8XLkWMjtCqekqBfLOw5VRbidUoxi80mxY1GVTnGimU93QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D7B71007;
	Tue,  9 Apr 2024 04:21:39 -0700 (PDT)
Received: from [10.1.33.185] (XHFQ2J9959.cambridge.arm.com [10.1.33.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 964543F766;
	Tue,  9 Apr 2024 04:21:08 -0700 (PDT)
Message-ID: <b7a3c729-af0f-4a49-97a0-c1b77f4e8fd6@arm.com>
Date: Tue, 9 Apr 2024 12:21:07 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4283/4584] lib/../mm/internal.h:206:70:
 warning: suggest parentheses around '+' in operand of '&'
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <202404091749.ScNPJ8j4-lkp@intel.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <202404091749.ScNPJ8j4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 10:29, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a053fd3ca5d1b927a8655f239c84b0d790218fda
> commit: 3317f7faabc24b500c26d02615ac75ca2786e272 [4283/4584] mm: swap: free_swap_and_cache_nr() as batched free_swap_and_cache()
> config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404091749.ScNPJ8j4-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404091749.ScNPJ8j4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404091749.ScNPJ8j4-lkp@intel.com/

Thanks for the report!

I've sent a fix to be squahed into the offending patch to:

https://lore.kernel.org/linux-mm/20240409111840.3173122-1-ryan.roberts@arm.com/

Thanks,
Ryan


> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:30,
>                     from include/linux/kallsyms.h:13,
>                     from lib/vsprintf.c:30:
>    lib/../mm/internal.h: In function 'pte_next_swp_offset':
>>> lib/../mm/internal.h:206:70: warning: suggest parentheses around '+' in operand of '&' [-Wparentheses]
>      206 |                                                    swp_offset(entry) + 1));
>          |                                                    ~~~~~~~~~~~~~~~~~~^~~
>    arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
>      432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
>          |                                                     ^
>    lib/../mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
>      205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
>          |                                        ^~~~~~~~~~~
>>> lib/../mm/internal.h:206:70: warning: suggest parentheses around '+' inside '>>' [-Wparentheses]
>      206 |                                                    swp_offset(entry) + 1));
>          |                                                    ~~~~~~~~~~~~~~~~~~^~~
>    arch/parisc/include/asm/pgtable.h:432:53: note: in definition of macro '__swp_entry_to_pte'
>      432 | #define __swp_entry_to_pte(x)           ((pte_t) { (x).val })
>          |                                                     ^
>    lib/../mm/internal.h:205:40: note: in expansion of macro '__swp_entry'
>      205 |         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
>          |                                        ^~~~~~~~~~~
>    lib/vsprintf.c: In function 'va_format':
>    lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
>          |         ^~~
> 
> 
> vim +206 lib/../mm/internal.h
> 
>    194	
>    195	/**
>    196	 * pte_next_swp_offset - Increment the swap entry offset field of a swap pte.
>    197	 * @pte: The initial pte state; is_swap_pte(pte) must be true.
>    198	 *
>    199	 * Increments the swap offset, while maintaining all other fields, including
>    200	 * swap type, and any swp pte bits. The resulting pte is returned.
>    201	 */
>    202	static inline pte_t pte_next_swp_offset(pte_t pte)
>    203	{
>    204		swp_entry_t entry = pte_to_swp_entry(pte);
>    205		pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
>  > 206							   swp_offset(entry) + 1));
>    207	
>    208		if (pte_swp_soft_dirty(pte))
>    209			new = pte_swp_mksoft_dirty(new);
>    210		if (pte_swp_exclusive(pte))
>    211			new = pte_swp_mkexclusive(new);
>    212		if (pte_swp_uffd_wp(pte))
>    213			new = pte_swp_mkuffd_wp(new);
>    214	
>    215		return new;
>    216	}
>    217	
> 

