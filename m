Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C5A1D31B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852160; cv=none; b=bGs5e+QGTn9zn/5ssJ2oRCO7WPYEpQiXhndRICpP6vN4kvEiBiovqkLEl5eYZ/6poShwt7yWzAAAz1uK+hNI2hOe6zDAP43qOOvvuGSDk+owhiN2QrOVWl8NuwmlNcpUm2yAFfJAt2G595tIC6sQE+e0KPjAIapUK7tQkSAMaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852160; c=relaxed/simple;
	bh=rOrqIm5yzPZ1+NhY95GTbpe9uBI28/rzZu0uZZH7eQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVdpchZCENl+y6ZxsnRVU1TX/UqJzia11NXUqih2tdAS0WYHUsCDr7IcL6cx8a20+c5+Sg13ZytYXZE+imw0ftASC2jYN5xl13wkYBmxTkp/9dD7g/vqJQsvSItRXpzuekBJ7xnj9EldH/RSzT59Pd5FGgaLW2PamiaEz19htEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW4PUUA3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW4PUUA3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7baf61be569so4887636b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 18:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765852157; x=1766456957; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULCZYLT60MGMdje4Il/iRob/OFjJYM9zEb5HnG006jM=;
        b=nW4PUUA3eDiXzyoRV2+Lk6M+MKGZ7W86YZVm08mJAPIjqXHKF4Sf9QDfiOXq6Vj1VX
         kZv3H+sc1lZfeJlTGCqkB+tSQ3DYJotxQOUe1UwejBUWEyVxnYRCR7hv18HloPYGT/IR
         aw4gvT+/trgX5/PaX64WFRgJZXZgmrAD/9bZNjl3IEQAoBD08ugPAeyyDnHixYPrwItm
         XTgQICFLUflEHw8EcBiQSJBPKYPrNsmFjbKRWDaIdqPDrSiZFaL4z1C6R923yzQoZ9vX
         Hga5T4pGwWu2gSlo+m6ViX+P4isln5KSiXEGPsPWqOXgAYCzE6ZtyVJMNVSBmt0+BXta
         KRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765852157; x=1766456957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULCZYLT60MGMdje4Il/iRob/OFjJYM9zEb5HnG006jM=;
        b=R1GzmOMqOLtCWrMeaHI1qepAQI9RbyOrffQNhogH5YGmyE7H3/yFmL0DKEJg5Ly+tH
         yIT9Tnmfj15Pxx8nagrkS7meD52V9Z93m5cx9BD+Ys5APtonlsCamoT8OWGRuPifpfVf
         ACX5EZxd78h1XzPdY2p+iKEC2EKwnX6S4YrwZuAVKPCQlk3F1bpXcKHKZYmRZt13tkLk
         1EyCwM8VX7SNh1vKqOVwKIOK9oqOJuJveO+mkJnXOsfReVnMnBI8pLPHLVtlG2ToZOV/
         lyN0+n4vJZ4Zr8G+djXyv2f1gkWysDqrkvdnYYlS/bVlj1ls+Hc44RnhqHgrHNacXfhS
         +bdQ==
X-Gm-Message-State: AOJu0Yy+8s6jBnffLRz9LEl5SQRn2HrGxAJsRYT0jBO4LbLKPNGQm0Mu
	cgWJE5Mq7ZK25cOh7P+K2PzOr/re6zAUn2nbicHALHaPYvUEzfTdWJ0J
X-Gm-Gg: AY/fxX6TUfBclaimvj+OMB+O/YccnNv0m98Yi9tcYzvLdEvMIkGOpcVjxiCWQpN1M2k
	4nozkQ2XJBoWRysaDpNfaYMcVT9H1ZJP28GAkETHzitVOKVoKqhAeyT7rJwICV9e2pEvHPRDKqp
	FcK2L2S/ovnAkeDArOTso7pBEc9m9DhWkEVQCdaGbg8UYguDn1GmuEBcioKiYPwWRtHN852cwva
	+x/DVeIE8HcMRTQWJ7Rfcgje2cTcMERoEruznF925AcxIK329Mb+BTY3xaloBp3DmwApiK6IIoX
	3lJoRgYOip5U4hVqMMOe87pbB7+eFkf4rQiu8PYiIeR8s2CI3Y/Q3xHlHbVbiUzIE8mauQrXX3x
	f4ooTqotU+s1pwPR01kt1IVvM5Kb3NQDC9QDDc9hbjFZxievIncOqeem2TDQ6eymA8RxvD2X49f
	nnwsvrY1lAbwEyyNyrERshG/miu7hrkamUYWF8EYP9RA2ox1oHaTUzTpC4iw==
X-Google-Smtp-Source: AGHT+IErF52AXXczQ3G+zOFS94xkqOFP8m8C/Qix97CtXS0jSDK2TXzNwtk0REWI0YWm46bll4Yy2w==
X-Received: by 2002:a05:6a00:451a:b0:7e8:4471:ae79 with SMTP id d2e1a72fcca58-7f66a375c23mr11420246b3a.69.1765852157404;
        Mon, 15 Dec 2025 18:29:17 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:294b:a829:99f2:e384? ([2405:201:3006:188a:294b:a829:99f2:e384])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093a56sm13807735b3a.47.2025.12.15.18.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 18:29:16 -0800 (PST)
Message-ID: <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
Date: Tue, 16 Dec 2025 11:29:10 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: kernel test robot <lkp@intel.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <202512160219.94nMjvxO-lkp@intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <202512160219.94nMjvxO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello ,

On 12/16/25 10:19, kernel test robot wrote:
> Hi Nitin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
> patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
> reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/

Thank you for reporting this issue and I will fix this issue .

I have already send patch v3 for this and will fix this warning in next 
patch version i.e v4 .

May i know, if its OK to add this Reported-by and closes tag in patch 
version v4 ?

>
> All warnings (new ones prefixed by >>):
>
>     WARNING: No kernel-doc for file ./include/linux/pci.h
>     ERROR: Cannot find file ./include/linux/mod_devicetable.h
>     WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>     ERROR: Cannot find file ./include/linux/bootconfig.h
>     WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.
> --
>     Hardware damage detection capability
>     ----------------- [docutils]
>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.

Ack. Thank you !

>
> vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst
>
>    1579	
>    1580	Hardware damage detection capability
>> 1581	-----------------
>    1582	
>
