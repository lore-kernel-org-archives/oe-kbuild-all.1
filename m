Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638028E8;
	Mon, 19 May 2025 03:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747625723; cv=none; b=ndmkrMCVIZoIu3K41mgK7aNsB04UI5wlMcfhu+RIghDWdHscbtxOfh2BvKECnKO2WTrslqMG1rz1dOGcd6Fi+n8OfiC/GjUxjh+HBDV23X46mzxDgU5JaUOOwTIByl+nJsVdLUV9NVpv3KxecqdyI03Al5Qf/k+0omAcw9ghbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747625723; c=relaxed/simple;
	bh=+TIUKqbNWj8El67cM0LX7cIkzJ44flltuheIe4cZGZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enPSmupUlf7N+uq291f1zdNvhMg6oZx0yIL++jn4kCY1lZAYjtfSp9GtGEJpSuvwNmGfxoK50MrZ6/OSlDzUcYOZtJUaI+19+C8GDqSXqIghG0xz/3y+WE3YmepZyEEwplJdU9Ao6AIJeh38RELC31yunHEWJ071/w3aZkrkVno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m72bsTa2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m72bsTa2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YLpVcbU5w36kKHD6zpWg7w/QDnaBA7lS0Nlj0sc0pGU=; b=m72bsTa2yeSmdl7lBYVDVCDTyO
	xzY7gYVzTgSEwnDGx0l9vyEA8M8PcC9Hwe3iflyaYYUfYopGi/p97Ji4c1CD/CLtSwWAtXxMaqodq
	CEqFDoxZoYxIJcjy7OHMgrGW+aIb7yY2YJAjRb3Oy1l2nGgani0yG9+FYhIFJ4AIOM/qZIzZV05o3
	e+TzxuSimwXpyN+i7zOPO/Q1AvTXLStBbLr1c9LluaKGxvdCCfIDWMkZHi58R/JnCsBFWJUGh7oYk
	Q/dbShXhuR/HXVdfGYNXxNlNeE6sw7MlLSYLJ5wTfQIj+hUHHdThOLcJtRlfhe/oUuwnLWtJNqeBR
	+KU49NKA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uGrHI-00000000ZKG-29lF;
	Mon, 19 May 2025 03:35:12 +0000
Message-ID: <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
Date: Sun, 18 May 2025 20:34:54 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
To: Philip Li <philip.li@intel.com>, Alex Shi <seakeel@gmail.com>
Cc: Yanteng Si <si.yanteng@linux.dev>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
References: <202505160627.WtzIIpL6-lkp@intel.com>
 <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
 <aCqhRwOxvUiCFtpN@rli9-mobl>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aCqhRwOxvUiCFtpN@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/18/25 8:11 PM, Philip Li wrote:
> On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
>> Yanteng Si <si.yanteng@linux.dev> 于2025年5月16日周五 18:02写道：
>>>
>>> Hi robot,
>>>
>>> 在 5/16/25 7:04 AM, kernel test robot 写道:
>>>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>>>
>>> I didn't reproduce this warning locally. It seems to be a difference
>>>
>>> between different versions of Sphinx.
>>>
>>> Could you please provide your Sphinx version?
>>
>>
>> I can't reproduce it too. My sphinx tools version is 7.2.6.
>> And it looks like a incorrect warnning.
> 
> Sorry for late response, the Sphinx version the bot use is 2.4.4, and it also enables

JFYI, Documentation/Changes says that the minimal Sphinx version is 3.4.3.


> kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS,
> refer to [1] for detail. Hope this is useful.
> 
> [1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzIIpL6-lkp@intel.com/reproduce
> 
>>
>> Alex
>>
> 

-- 
~Randy

