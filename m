Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A092E2DDD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686382; cv=none; b=hZboGdGa+8wWcm2wxUgjRNjEQLpJEo+O2pTQcR2UvibkEHznyJ+ebfiOsmRYye0se5lq7kqh/j8LhsqnPYB74/441ONnMSR2lb2E2ZlD0dfb/Cawj9S98ao1syjBXHTRvrbYC6huCGvY+bNvHpedtYs/gVFHB56CH/rq5Nrn8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686382; c=relaxed/simple;
	bh=oJ7eX6Cr5MC+UWmH243rR3j1t09yrQpwK8VcV4x8/8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDb7szMkCRGGi2Ld4ez39Bq0DiLFBK8N4F0k8H1rSBLsCg7UUhAyZKqOw3Bm/oyxR48z1gNWUpk093Jo2+K/taIOj2+5oL38Jv2nF+bNvvvbEW4HqQr8QlXwfy2ACKHwT2CD7uJVjnDIOT+NJTRSeQkcqev8F0mMhdRKO8ziv/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eci2odmY; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eci2odmY"
Message-ID: <d9510f7c-c9a0-4ebe-87d5-19ad6a783121@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755686369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JEL0qQNPV6M/qOGIsQOAetnYYV4YPCbvB8NI4rcmrw=;
	b=eci2odmY5AvMvqAXli7nCNec0jkbmwDAhyukUUGK62nOaIEuwrgywZPdZcyNRvpAebM5+I
	9TJEGKYFlNJXi9+sIRDBTSFavKfrP3vtRrMG+Jz4nyHtAT3Bb+fexCktTxAKI5kHRGhm8H
	5OxSh3bIArxMHr6twIFrcXSObG+juGM=
Date: Wed, 20 Aug 2025 18:39:21 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] panic: Clean up message about deprecated 'panic_print'
 parameter
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, paulmck@kernel.org, john.ogness@linutronix.de,
 kernel test robot <lkp@intel.com>, Feng Tang <feng.tang@linux.alibaba.com>
References: <aKRJKZHgcxyNF3y7@pathway.suse.cz>
 <202508200907.PsZ3geub-lkp@intel.com>
 <ae9bb2ea-c6e5-4a4b-ae25-aea1d6fe084d@linux.dev>
 <33a897b4-7d9a-4641-9c7a-07c19bb9cb6f@linux.dev>
 <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>
 <aKWWcPOf9qPIoCe4@pathway.suse.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aKWWcPOf9qPIoCe4@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/8/20 17:33, Petr Mladek wrote:
> On Wed 2025-08-20 16:57:48, Lance Yang wrote:
>> On 2025/8/20 09:56, Lance Yang wrote:
>>> On 2025/8/20 09:54, Lance Yang wrote:
>>>> On 2025/8/20 09:31, kernel test robot wrote:
>>>>> All errors (new ones prefixed by >>):
>>>>>
>>>>>>> kernel/panic.c:952:2: error: call to undeclared function
>>>>>>> 'panic_print_deprecated'; ISO C99 and later do not
>>>>>>> support implicit function declarations
>>>>>>> [-Wimplicit-function-declaration]
>>>>>        952 |         panic_print_deprecated();
>>>>>            |         ^
>>>>>      kernel/panic.c:958:2: error: call to undeclared function
>>>>> 'panic_print_deprecated'; ISO C99 and later do not support
>>>>> implicit function declarations [-Wimplicit-function-declaration]
>>>>>        958 |         panic_print_deprecated();
>>>>>            |         ^
>>>>>      2 errors generated.
>>>>
>>>>
>>>> Oops, panic_print_deprecated() is defined within the #ifdef
>>>> CONFIG_PROC_SYSCTL block, but it's also called from panic_print_set()
>>>
>>
>> If Petr is cool, @Andrew could you squash the following?
>>
>> ---
>> Subject: [PATCH 1/1] fixup: panic: clean up message about deprecated
>>   'panic_print' parameter
> 
> The patch was malformed probably by your mail client.
> Below is the fixed and revied variant.

Yes. My client messed up the formatting - git send-email it is ;)

Thanks,
Lance
