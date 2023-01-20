Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9233C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674233981; x=1705769981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g/9U7qFHvK1q5kFq1AYUIYzRnHK56T67zP1TqFIfKX8=;
  b=fAqW0vsP/ikpsooCDSoJ9yUn65vnq1pQv8IUBSDLjOsKA51BA97wDmF4
   32w302DcqwIWIOu6JE0pHcEiRPUtSZ9GCuEbE0BTXwQ2OcuR5rSnRuy4O
   BDNEOi2VIsqrMEoThR+04gVzSgZUOEbpxd5U7YqAsui5Q8D43OPj+C8jj
   Iyq4v/2F7Q+3Xu+se6Hv6JrMeOFuhKFvuT4t/rzpZqveRQVzmQm8ZnkBl
   IpJSWsvDv7FjUOa50N4HGxLXLvC1ArBKR5Tit5ZRYBGchax3lBh02NgGp
   BJBMViec5qutxhomcuyr296YSQBE3O1wLHOEsJG0BeN48ZnJTCZkexukz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327715722"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="327715722"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:59:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989451795"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="989451795"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [10.212.69.198]) ([10.212.69.198])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:59:41 -0800
Message-ID: <42170cea-cc63-8046-d0f2-6de3ad952a85@intel.com>
Date: Fri, 20 Jan 2023 09:59:40 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [djiang:cxl-emulate-hdm 1/9] arch/x86/pci/mmconfig-shared.c:451:
 undefined reference to `efi'
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20230120163205.GA642679@bhelgaas>
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20230120163205.GA642679@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/23 9:32 AM, Bjorn Helgaas wrote:
> On Fri, Jan 20, 2023 at 08:53:56AM +0800, kernel test robot wrote:
>> Hi Bjorn,
>>
>> FYI, the error/warning still remains.
> 
> Possibly the cxl-emulate-hdm branch should be updated?  The current
> file in Linus' tree does not have this problem:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/pci/mmconfig-shared.c?id=v6.2-rc4#n446
> 
> The commit that was merged is:
> 
>    https://git.kernel.org/linus/fd3a8cff4d4a

Yes sorry. I was still testing with one of your older patches. I'll rebase.

> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-emulate-hdm
>> head:   6c7fe26eb2f67816411bb41a976a6c50056aa574
>> commit: b2b6d47f1b29b36472a90db110c9d2d421f04627 [1/9] x86/pci: Treat EfiMemoryMappedIO as reservation of ECAM space
>> config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230120/202301200823.art1eu2t-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>> reproduce (this is a W=1 build):
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=b2b6d47f1b29b36472a90db110c9d2d421f04627
>>          git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
>>          git fetch --no-tags djiang cxl-emulate-hdm
>>          git checkout b2b6d47f1b29b36472a90db110c9d2d421f04627
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          make W=1 O=build_dir ARCH=i386 olddefconfig
>>          make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: arch/x86/pci/mmconfig-shared.o: in function `is_efi_reserved':
>>>> arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
>>>> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
>>>> ld: arch/x86/pci/mmconfig-shared.c:451: undefined reference to `efi'
>>
>>
>> vim +451 arch/x86/pci/mmconfig-shared.c
>>
>>     445	
>>     446	static bool is_efi_reserved(u64 start, u64 end, enum e820_type not_used)
>>     447	{
>>     448		efi_memory_desc_t *md;
>>     449		u64 size, mmio_start, mmio_end;
>>     450	
>>   > 451		for_each_efi_memory_desc(md) {
>>     452			if (md->type == EFI_MEMORY_MAPPED_IO) {
>>     453				size = md->num_pages << EFI_PAGE_SHIFT;
>>     454				mmio_start = md->phys_addr;
>>     455				mmio_end = mmio_start + size - 1;
>>     456	
>>     457				if (mmio_start <= start && end <= mmio_end)
>>     458					return true;
>>     459			}
>>     460		}
>>     461	
>>     462		return false;
>>     463	}
>>     464	
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests
