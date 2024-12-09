Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB6C35971
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753622; cv=none; b=uZyjrqKmiqzRcp/zZoLtzowPf9Dwk2wwWJPAIaZJwQ1mluD94L9D1zCIY0ZeqgX/c4MhH6XywgtgpjFwpLwD9nQLGcbF3OYN6dbILZIshHT5EzqWXPDT6hJhf6/79tOa7pcZ5Fh4rWQmBCOxMWd9lhrhcu1RVjOIegsKDbdFsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753622; c=relaxed/simple;
	bh=hkFFobiPfJFgKqd6pacUZzf5t/NkeN1EYKEHfXVZS4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMkPOIQiRVbbZMQV0xeXBg5mk089Tl+eISd0PKgGpebTLBZD1rQIRPRDwhpUwP8AGtY6jmFHA60c5r4NJgmBm1vEXqjKOT9PA1tox9OkcRdZXT150ulhzrfyHAXBQaRxuyefmmaPwhvqc6fg6U9vOyG9rjeeumHcFOnc4jXsrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7AC113E;
	Mon,  9 Dec 2024 06:14:07 -0800 (PST)
Received: from [10.163.51.127] (unknown [10.163.51.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5715B3F720;
	Mon,  9 Dec 2024 06:13:36 -0800 (PST)
Message-ID: <f492ac51-9dad-4b18-8cd4-81dc236b3162@arm.com>
Date: Mon, 9 Dec 2024 19:43:32 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on
 EXECMEM
To: kernel test robot <lkp@intel.com>, linux-mm@kvack.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241209031251.515903-1-anshuman.khandual@arm.com>
 <202412092048.tTzJ5szH-lkp@intel.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <202412092048.tTzJ5szH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/24 18:06, kernel test robot wrote:
> Hi Anshuman,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-execmem-Make-ARCH_WANTS_EXECMEM_LATE-depend-on-EXECMEM/20241209-111533
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20241209031251.515903-1-anshuman.khandual%40arm.com
> patch subject: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on EXECMEM
> config: arm64-kismet-CONFIG_ARCH_WANTS_EXECMEM_LATE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412092048.tTzJ5szH-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE when selected by ARM64
>    WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE
>      Depends on [n]: EXECMEM [=n]
>      Selected by [y]:
>      - ARM64 [=y]

Although above mentioned config here has CONFIG_ARCH_WANTS_EXECMEM_LATE=y
and CONFIG_EXECMEM=n (actually absent), could that really happen though ?

Tried making CONFIG_EXECMEM=n (rather deselecting) but that did now allow
setting CONFIG_EXECMEM=n, it always remained set. Reverting this patch i.e
the current behaviour is also the same (CONFIG_EXECMEM always remains set).

select ARCH_WANTS_EXECMEM_LATE if EXECMEM

Above statement seems to be selecting EXECMEM as well but the intent seems
to be a dependency check instead! OR arch selection for a config brings in
all its dependencies as well.

If the selection is always, should this change be like the following ?

config ARCH_WANTS_EXECMEM_LATE
 	bool
	selects EXECMEM

Although a similar config ARCH_WANTS_EXECMEM_ROX is dependent on MMU and
!HIGHMEM at the generic memory level.
