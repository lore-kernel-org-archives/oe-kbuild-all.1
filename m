Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FCB1EC01B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049270; cv=none; b=HZPKnV2M6k645nDaz6Re3gg9APvuxNdI4en6BwGI0q75EIVIraHOUObUd/FGnMKuFAZU2QDHbbmnHoOGnS2DR4Gwc02ZkPpIqNoR0SzS7lMvJ9xaS9ILztOBDFVeJPg0eaAmJr8evVq90DMo5Vwo0xJF0sxZekZmp7a7oKbKs2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049270; c=relaxed/simple;
	bh=XJnKiA924nmBNlnppA4hfHsRRPYQC3Q7CH//FY73qQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDzVVsCkTyuQV4aMjQ/AKfc4yxp9AisI2TjceKMMAK2UOADDr0cIm5sSpvdtvPshhJYmPdJCIkXGgZ+1A5Z2CBMCqsaH2QznD4L4JhFlMIbLYCMMeAtu9ChirUUGohfz7SH8M1ENglsSbjtAhiYyrF22YLofoq4pHrKULTv/BIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vM+8JUBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vM+8JUBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8978FC4CEE3;
	Fri, 27 Jun 2025 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751049269;
	bh=XJnKiA924nmBNlnppA4hfHsRRPYQC3Q7CH//FY73qQ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vM+8JUBrdciX36wfJHn9Vm+aWqXHcLG3Q+B1b+Jp7AR0PG7EEyQ//VULT9dz1ZPjq
	 Im3rIkWklrZ4bIBenW4TlZrIRGhoAKSZ+CSlTMzPqjwnGa9Voa6oTxbyg4HCr9wvPw
	 nI8z/9DaodxNzzgTB1miwtWknY2vWEK45DL+xdyBnxwDzCuTryhrCqxnqdxbIqLVMC
	 5A+xsnZwTjEFZUlBUu21LfJz+064LuQ0LvJQbN/pgFedPrLgAOZgvGsZCDIRTLzRCK
	 Sn4UAS99uiEDsvtzZa860Z/cGvknuUM91G5L3vIP8diMlmP7rFeMVIkbnghWtp7yZ0
	 SgjpjU0xYNXaw==
Message-ID: <ebb0d6fc-e0eb-4ba9-ba0e-125be9e4b0ff@kernel.org>
Date: Fri, 27 Jun 2025 21:34:25 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [djakov-icc:icc-fixes 5/5]
 include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name'
 defined but not used
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Gabor Juhos <j4g8y7@gmail.com>,
 kernel test robot <lkp@intel.com>
References: <202506280134.bxPIYES0-lkp@intel.com>
 <aF7h4v3powZzxQbL@hovoldconsulting.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <aF7h4v3powZzxQbL@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 21:24, Johan Hovold wrote:
> On Sat, Jun 28, 2025 at 01:56:21AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git icc-fixes
>> head:   65fceba30d6f1e7849048d0b292d3541695403f3
>> commit: 65fceba30d6f1e7849048d0b292d3541695403f3 [5/5] interconnect: avoid memory allocation when 'icc_bw_lock' is held
>> config: i386-buildonly-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506280134.bxPIYES0-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from include/soc/tegra/mc.h:12,
>>                      from drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c:10:
>>>> include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name' defined but not used [-Wunused-function]
>>       156 | static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)
>>           |            ^~~~~~~~~~~~~~~~~
>>
>>
>> vim +/icc_node_set_name +156 include/linux/interconnect-provider.h
>>
>>     155	
>>   > 156	static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)
> 
> Bah, I forgot the inline keyword.
> 
> Georgi, can you fix up this commit in your branch, or do you want me to
> send an incremental fix for this?

I'll fix it! Big thanks to you guys for working on this patch!

BR,
Georgi
