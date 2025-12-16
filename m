Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873BA32143E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765883712; cv=none; b=nB1nUsE1uwqFTqMouQCY6BuqIgsJjHNw5WW2dY3hvDPHptZOPUqZUpYeZ7j+Xr8W98kjtKhxE9c28cbDaUvJF1g+qBBbtnEPKyqDR1iGOwkVnJhYPHC5UsKRoPYuIsRQaGPa6OPX4YudLOEnsy9p8ZfOAmIN5avC6Vpp7ZRbgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765883712; c=relaxed/simple;
	bh=BBwbPv6peH1O5d0/RsOUMDxJe6Kt8Lw20gPkU3Haqeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rM3T61p5K0Px/1vGdZCOQaeN1ukeUX1Gmt/RBf4AcnAFmRELIttfDgi9Uk5l5Y9MRd4nIYG0gkSeFtoMKPZX6iU6Eya9mQVpb2ydjXhWfKImKmdvES8cvESt/SfaVLx31G2nd32a66eoYrnDBOLIrwTpzZ4rNCfz5Gt9T1jq5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1XtmG7u; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1XtmG7u"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso31234535ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765883710; x=1766488510; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pa/R0f7apMOn2D0iStNavYUHvbbAQjxSO588dE4NM9E=;
        b=k1XtmG7uGv/feHq9lg0XWSAaGtTEEIKze9JhaAwqbalzafC7UGql5ShxJZk6XSVL/5
         lpMIdn1y1VUje0JKYva+ArjpRI8Jla4qghrEXTOJUusC/y62D5z8KQpc2hEB6ToSJeku
         G7X2ZDd2j0NABpE54Y9qb7EBUn/oBeEAYW7D0HAtfW7cIIW+IUguaoaye6BBKx480qif
         m2EClV386OopQuAfncxuEU9o33WQj91Y351gJ3qua+ApFp7yqFtkerNvOkiv/ZW1MLWo
         CKsvR7H2/4md2FAnZAYWmQqPydA3proaila1nb5eTK6KWlUXnqJkfSjEiEF5JbXoSvYP
         UkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883710; x=1766488510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pa/R0f7apMOn2D0iStNavYUHvbbAQjxSO588dE4NM9E=;
        b=NnYuQJ6vDPY6xuCIoK0TfdL9iYFQjFe5vCWe7XT8VSKkPBVWRgtd/pNMXicR3OjOmu
         QH1bmADVQBvE6rfSvyiu226gfjruzf5mf1jX9NY1LVCLTk6Aaj9b/aPnmLy5NHk3NlVe
         iqo1qdjLN2tVj0CQtcQTHVXGaBMT7m8HmuTVzgpxHyMv9fujaDRpEN91YmL2euta6lue
         rFfGoaIhuIwLUixN+aI2XkfWdhNGfBo/deI+jQXabEa1jx8ZgNiTl37m2LzDq/ZBEIxD
         HsZPpewo544/H5sVR1o5f+TbvZhh7uU0KPkOPN1eINdyj4Uma3SSK26VyDEFOOAuftMP
         iWag==
X-Forwarded-Encrypted: i=1; AJvYcCU9MHkk0SzpIhZGKjWFON62pSSGhQpx1uN0lxdz+QfUI1jIOPI7bBD/ViyRbVhvdfy6bKU+GS4EXVb3KkJH@lists.linux.dev
X-Gm-Message-State: AOJu0YxsOtbpklCP8v89ZwIqX7S8Jo3LfbUJ07vS8QeQ07WeEbKT5sgT
	WUplqtBYhQ1vCQD0F5oc0oDigLHPzdU9cgXzpRc4ldSaW2jBPkJizMfY
X-Gm-Gg: AY/fxX5H4QtLkldnWf8mxZ+bFau3SNKzerxIUqyibCS2WExki4IECTpjjgnLq+Gu+FV
	PCTvaTxcRizKKgyuTNV6T2FkXPaE5af7wOvh9dvhBEqxSGNYi0WrFk16AvaLKmwpsQkj65BvsWx
	hQihXdvMGzMiT4z7jltGaWYjMupWx7YQ+GJdS481TdEv1viSvPT8pf6iBuLJ8tKul8fypiVvZ44
	eBWZZQb1fY61uCbvxBZXTDxEz7XPFZ2b9zk0YAIcp6UZH2lIYMBLZtLZONTcoq7ZlP7agoqgweg
	PmFfh5j2QJS0EKfjr8MrGPNngUCgldW0gGby6rw/Xr9f4wmieDAw3NzeJZYEGEITJrBVS2iboNU
	PUTgfEmLO/iP3WseNTDQUN7fn6X3qQSXFGvektIaKYBmCzninhQP/CBIla+ojv+XMfmTb96h0Hp
	GjejtlTbeFYxmUrbbdCBYE3q0ixWC2CpGbj0KCLB8fxQa46tScLgbCfvdHIg==
X-Google-Smtp-Source: AGHT+IHjShZlqtrNatz0TeEfKLc+IYxMG7B7LV4mS/9omwYiNMA01BR3glT4ouu8CwPVBZrnNUvMwQ==
X-Received: by 2002:a17:902:ec8b:b0:29f:251b:c9d7 with SMTP id d9443c01a7336-29f251bcb21mr121735895ad.12.1765883709679;
        Tue, 16 Dec 2025 03:15:09 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:9344:a089:f162:6625? ([2405:201:3006:188a:9344:a089:f162:6625])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ad1sm160754585ad.29.2025.12.16.03.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 03:15:09 -0800 (PST)
Message-ID: <1ca74be1-7b4c-4a38-b507-f320104a7a60@gmail.com>
Date: Tue, 16 Dec 2025 20:15:04 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hansg@kernel.org>,
 oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <202512160219.94nMjvxO-lkp@intel.com>
 <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
 <2433802f-ba32-1549-41f1-5a77e998c139@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <2433802f-ba32-1549-41f1-5a77e998c139@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/16/25 19:19, Ilpo Järvinen wrote:
> On Tue, 16 Dec 2025, Nitin wrote:
>
>> Hello ,
>>
>> On 12/16/25 10:19, kernel test robot wrote:
>>> Hi Nitin,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on linus/master]
>>> [also build test WARNING on v6.19-rc1 next-20251215]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:
>>> https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
>>> base:   linus/master
>>> patch link:
>>> https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
>>> patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to
>>> detect hardware damage detection capability.
>>> reproduce:
>>> (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version
>>> of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>>> https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/
>> Thank you for reporting this issue and I will fix this issue .
>>
>> I have already send patch v3 for this and will fix this warning in next patch
>> version i.e v4 .
>>
>> May i know, if its OK to add this Reported-by and closes tag in patch version
>> v4 ?
> Hi,
>
> Please only add those tags when you're fixing code that exists in a repo
> already. For new work, we don't normally add lkp report tags despite the
> email suggesting you to do so (I know it's a bit confusing but it's sort
> of same as we don't normally mention all reviewers who gave improvement
> suggestions either).

Noted, Thank you for clarification . I will send next patch revision soon.

Thank you !

>>> All warnings (new ones prefixed by >>):
>>>
>>>      WARNING: No kernel-doc for file ./include/linux/pci.h
>>>      ERROR: Cannot find file ./include/linux/mod_devicetable.h
>>>      WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>>>      ERROR: Cannot find file ./include/linux/bootconfig.h
>>>      WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>>>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
>>>>> underline too short.
>>> --
>>>      Hardware damage detection capability
>>>      ----------------- [docutils]
>>>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
>>>>> underline too short.
>> Ack. Thank you !
>>
>>> vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>
>>>     1579	
>>>     1580	Hardware damage detection capability
>>>> 1581	-----------------
>>>     1582	
>>>
