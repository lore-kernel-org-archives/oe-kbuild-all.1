Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5245829B777
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765792646; cv=none; b=XveIsp7rSnVZUKyh2TYopw1Cb1XEEOGzN7kqfxXwZnSS9VBDmLlLnovk6GQZOdPChcOSf/+vG++MraNpXpQpRDglBOyS07rjVLQivRpKRUU3ztJKFcNNcBXJ75Cqsnvt3TFFIHjNjWlksn/KfH2ky1dDEaN1IyxvSwOJLDhEuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765792646; c=relaxed/simple;
	bh=GPrmPY5eUuBUMJbjpKFyLdbuR1MxBqJ791EHwgjiiak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/Z/rx0DMJ1bIDF98+y8hUL747nUeitJPb6u3aE/yFQYRZCEMIeUsmeFkaSGd4wg7G75lrUAbEbPdv4zjyrTXI6d6wvY8LHcmAad7Y8qxDUoporzgkrmcCVEXIcrACqeOMcRZthI1fjZ53wPyqQGB3ryzp4Hf9PoU2T5Da7lLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfRpo7pI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfRpo7pI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC45C4CEF5;
	Mon, 15 Dec 2025 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765792645;
	bh=GPrmPY5eUuBUMJbjpKFyLdbuR1MxBqJ791EHwgjiiak=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kfRpo7pI6klAD59sB0cD6S3/GFnnwUrV+YplaYrk5ik353YyYbTWLPj6zXBXYQQhc
	 NlZ9TRdCiv9+EKfYY/M/s2SS9P7cn81NKg8AbAVOJmf4eFUB2w3vgJ0wsxFegm4Jb4
	 TFmZXXLSW9/it5njtO0S1YGXOkjHNbAdJJ635VfwTsF+LxXBRPkCzBErtmucrDqI8c
	 x4GiXkyHfxaM1WPWTHzMJAv3lo06siCI5zjWoDZYfoDtXSJ0vwOsZNyNa9Aq5Ha+ZF
	 N6Fpoj0olzFpLi/ncx/EpUS+rnDJ9nncwjvdrG7EG3k/oJ9pExegOaV/lhgCozsX3X
	 kaxgha2GILX1A==
Message-ID: <a30a0ab2-4fea-4d17-b170-d9433630973e@kernel.org>
Date: Mon, 15 Dec 2025 10:57:20 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [ebiggers:wip-nh-lib 14/20] lib/crypto/nh.c:82:1: sparse: sparse:
 static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Oliver Sang <oliver.sang@intel.com>,
 Eric Biggers <ebiggers@kernel.org>, oe-kbuild-all@lists.linux.dev
References: <202512090359.7BkUaiC9-lkp@intel.com>
 <gszvkjbpxa5ny7c4vtpmklgibxxrqkf2xkfwum5vrg4ooipxl5@uqvhrmvtzfsw>
 <aTgeGoq1JjCfuYXc@rli9-mobl>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <aTgeGoq1JjCfuYXc@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/12/2025 22.03, Philip Li wrote:
> On Tue, Dec 09, 2025 at 05:28:07PM +0900, Daniel Gomez wrote:
>> On Tue, Dec 09, 2025 at 03:33:11AM +0900, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
>>> head:   d471b579f29c765ebaeba7a3b653052f029dc550
>>> commit: 7f1c9dc7e0f3540a978f65f4d2d48ea1cd475a3e [14/20] crypto: adiantum - Convert to use NH library
>>> config: i386-randconfig-r134-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/config)
>>> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202512090359.7BkUaiC9-lkp@intel.com/
>>>
>>> sparse warnings: (new ones prefixed by >>)
>>>    lib/crypto/nh.c:81:1: sparse: sparse: bad integer constant expression
>>>    lib/crypto/nh.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
>>>    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
>>>>> lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>>>    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
>>>    lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
>>
>> Can you check which version of sparse this test was run against? The patch below
> 
> The version used in this report is
> 
> 	sparse version: v0.6.4-73-gfbdde312
> 
>> is required to avoid the issues described above:
>>
>>   fbdde312 (HEAD -> master, origin/master) builtin: implement __builtin_strlen() for constants
>>
>> https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
>>
>> Note: this is required after the following patch series was merged into Linus'
> 
> Thanks for the information, i will configure the bot to avoid sending this kind
> of issues anymore.

FYI, I initially thought Dan's patch fixed the issues reported here, but the
problem still persists after it. We are currently discussing a possible solution
[1].

Link: https://lore.kernel.org/linux-modules/20251008033844.work.801-kees@kernel.org/T/#m105211ebc13435b3d88cac132c05f66aeabd4741 [1]

I'm not sure if I understand your comment correctly, but reporting these
problems is not an issue at all. Thanks for doing so. I initially thought
the tool just needed an update, but the fix is still ongoing. Sorry for the
confusion.

> 
> 
>> tree:
>> https://lore.kernel.org/linux-modules/20251008033844.work.801-kees@kernel.org/T/#m320036927843f7b372765ddf2b7b47b32c9a81e8
