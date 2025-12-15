Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491DA314A6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765765814; cv=none; b=F/Mn9pvi0aUMPUkKmveP1+/3IOkEqt9DzZ/j/6B5N4kSkVPMS0oH6YJr0aI8eHB0S6mnAGx3wJRnkwvI2XzplL7RFROZLkibqR+eb5PHa/4vND/rDe4a8PPo/bMU71WiIRyo6JjQjqBD437T+BKCEO6JpZyntbwTrzMb3dNo18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765765814; c=relaxed/simple;
	bh=a/CCxhq3Xgkr3G3px6ZQDNvxIrCYv8DahE0lYrnzGUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8vpa7HdLxoRLIvVn63lL9MdCVkhKq+2Xy/e0BTHgZQ8WioI9MJj9j389esGiHjs+p5hg/0Yo5ZKKcvFb0vu0cdwum6VrvkkviH2zszvvR1HiqW/getGyP7+OMIVGjGshmllha9S6O80k6lYubSK7p/xd3bgkMWTlCMNJvStcZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY/ac7g1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY/ac7g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765765812; x=1797301812;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a/CCxhq3Xgkr3G3px6ZQDNvxIrCYv8DahE0lYrnzGUI=;
  b=lY/ac7g1y2mUhLF49DcwPQscqCYvRas2f6flBfU+mEk2vcqf8KwAEjcb
   rjmmbPPc/RZSyrq0jhN72AEFx13UyPVWZ4cm4STn29ZtkdOO/QkghuDgo
   t+1v51xM3XkVdwkXRb4MAiCwkdaxp2O3n0e0nJRPgcvRbND9vLNgqjuLi
   s5BN+k1M/4v5YLTi3AaKCJTpdCRUiDYGy6yD3GvtiJc1l2ue3dOIajobe
   xxqEQYqxj2PsQpjYIWQkRdlcZIPHJ7lzD59EkbFMdk5YbQRBGMCEKHmRC
   utnAfA3eyPOrP6red2vyi3y8pJQUr8NSFk6F/xwWiqJUdR++WjWUdSgs6
   Q==;
X-CSE-ConnectionGUID: bdhUw7WLSIGSP30xlNnGyQ==
X-CSE-MsgGUID: 8cx5d1yZQGq4Qqr1SzwIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71292756"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71292756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 18:30:12 -0800
X-CSE-ConnectionGUID: OFNhsBfFS8qZj9RgaUi8Xg==
X-CSE-MsgGUID: ITL3jXxaQ0K8etdXMhNqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197888515"
Received: from unknown (HELO [10.238.0.255]) ([10.238.0.255])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 18:30:10 -0800
Message-ID: <2df1a0c0-31a6-45c9-a92e-abdbfddbd9b6@intel.com>
Date: Mon, 15 Dec 2025 10:30:06 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf
 while the MMU is direct
To: Sean Christopherson <seanjc@google.com>, kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, oe-kbuild-all@lists.linux.dev,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, farrah.chen@intel.com
References: <20251212135051.2155280-1-xiaoyao.li@intel.com>
 <202512130717.aHH8rXSC-lkp@intel.com> <aTy7AG2y1OwIXfqs@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <aTy7AG2y1OwIXfqs@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2025 9:01 AM, Sean Christopherson wrote:
> On Sat, Dec 13, 2025, kernel test robot wrote:
>> Hi Xiaoyao,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyao-Li/KVM-x86-Don-t-read-guest-CR3-when-doing-async-pf-while-the-MMU-is-direct/20251212-220612
>> base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
>> patch link:    https://lore.kernel.org/r/20251212135051.2155280-1-xiaoyao.li%40intel.com
>> patch subject: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf while the MMU is direct
>> config: i386-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/config)
>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202512130717.aHH8rXSC-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from include/linux/kvm_host.h:43,
>>                      from arch/x86/kvm/irq.h:15,
>>                      from arch/x86/kvm/mmu/mmu.c:19:
>>     arch/x86/kvm/mmu/mmu.c: In function 'kvm_arch_setup_async_pf':
>>>> include/linux/kvm_types.h:54:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>>        54 | #define INVALID_GPA     (~(gpa_t)0)
>>           |                         ^
>>     arch/x86/kvm/mmu/mmu.c:4525:28: note: in expansion of macro 'INVALID_GPA'
>>      4525 |                 arch.cr3 = INVALID_GPA;
>>           |                            ^~~~~~~~~~~
> 
> Well that's just annoying.  Can we kill 32-bit yet?  Anyways, just ignore this
> (unless it causes my KVM_WERROR=1 builds to fail, in which case I'll just add an
> explicit cast, but I think we can just ignore it).

If your KVM_WERROR=1 builds contain 32-bit config, I think it will fail. 
I think we do need to add the explicit cast.

You will handle it when applying, right? Thus no need for a v3.
