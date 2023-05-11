Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13934369
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1683813790; bh=535/H9AZBcljuFulBnAulAjlubwZxug7JeX4NBgvoLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JRInyDloqhWfvqXDWVviNHQUcuKrZGIbV4F6Sf3/HrAHzJaQaM7v8mp73j1UK0uiQ
	 TPhgwa4yBLEzTYVVW5FH3a04xBIr4XJXZ9Tfbsf/wAe2E/yE1qtEJZAJfw+Ej7xmMB
	 uMwoKKho3nbkzKJvPItB6nlaJWH46IaZNZ9omctg=
Received: from [100.100.57.122] (unknown [58.34.185.106])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6144F60106;
	Thu, 11 May 2023 22:03:10 +0800 (CST)
Message-ID: <cf8f8460-c2c8-cf57-c6fb-d289c8727745@xen0n.name>
Date: Thu, 11 May 2023 22:03:09 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [agd5f:drm-next 226/226]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17: error:
 implicit declaration of function 'kernel_fpu_begin'; did you mean
 'dc_fpu_begin'?
Content-Language: en-US
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 kernel test robot <lkp@intel.com>, Huacai Chen <chenhuacai@loongson.cn>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
References: <202305111617.0zRJPm91-lkp@intel.com>
 <b13b1fa3-8afb-b5d0-c48d-a97b0ac9a475@xen0n.name>
 <BL1PR12MB51442230AD12A99CEF9EA1BEF7749@BL1PR12MB5144.namprd12.prod.outlook.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <BL1PR12MB51442230AD12A99CEF9EA1BEF7749@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/5/11 21:07, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: WANG Xuerui <kernel@xen0n.name>
>> Sent: Thursday, May 11, 2023 4:54 AM
>> To: kernel test robot <lkp@intel.com>; Huacai Chen
>> <chenhuacai@loongson.cn>
>> Cc: oe-kbuild-all@lists.linux.dev; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Mahfooz, Hamza
>> <Hamza.Mahfooz@amd.com>
>> Subject: Re: [agd5f:drm-next 226/226]
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17:
>> error: implicit declaration of function 'kernel_fpu_begin'; did you mean
>> 'dc_fpu_begin'?
>>
>> On 2023/5/11 16:42, kernel test robot wrote:
>>> [snip]
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In
>> function 'dc_fpu_begin':
>>>>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:95:17:
>>>>> error: implicit declaration of function 'kernel_fpu_begin'; did you
>>>>> mean 'dc_fpu_begin'? [-Werror=implicit-function-declaration]
>>>         95 |                 kernel_fpu_begin();
>>>            |                 ^~~~~~~~~~~~~~~~
>>>            |                 dc_fpu_begin
>>>      drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In
>> function 'dc_fpu_end':
>>>>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:134:17:
>>>>> error: implicit declaration of function 'kernel_fpu_end'; did you
>>>>> mean 'kernel_read'? [-Werror=implicit-function-declaration]
>>>        134 |                 kernel_fpu_end();
>>>            |                 ^~~~~~~~~~~~~~
>>>            |                 kernel_read
>>>      cc1: some warnings being treated as errors
>>>
>>> [snip]
>> I checked the https://gitlab.freedesktop.org/agd5f/linux repo and it seems
>> the baseline is still v6.1.11. The arch/loongarch FPU functions only appeared
>> in upstream v6.3. Do we arch/loongarch porters need to do anything to
>> handle such a combination, or can the baseline be updated somehow?
> 
> I can drop it until drm-next moves to 6.3 and then add it back at that time.

Fine with me, sorry for the inconvenience caused.

BTW, how long will it approximately take for such a baseline bump? Would 
probably be nice to know that as it can help managing expectations e.g. 
at Loongson side and for community users.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

