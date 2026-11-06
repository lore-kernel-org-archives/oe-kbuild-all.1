Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951598;
	b=xM4cIITLrRICSAcMnPtCCoEHZKJD4JnHPId0DG9iC6uxZSGrJSwemmX3eGxXZmHKzzS8
	 qIdTGTfNNsSlk2BCDTRH58DhHHKW0AuGAKLZ4PE6iYEcYF3qscA6CdU4ZuJYrq8ncIMsy
	 LtuFgj3o3LloNIL/5d2AI/AI6PuoOLcUVUK64k9ZQchzmlwGQkGvsATbFkjGEJEbQWzqn
	 2yti+wfWCkztYdknrJauzQD1glxM0rFOT661JnMiZN+3p7DwL3sJgHm7Eku68zOp66Fm/
	 Sj5cUHlYcQHkOR4Ca1jem2UXJxBi2iGLY9EgTb6Vl/trZ7xlu+p1mh64eVtZ2EtI46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951598;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nfNxFDQT6Xg6nXD5htivaWJyrQFYadRTu+IGG2oGCYk=;
	b=Z4e9/gyq3NtgKnCjOV6WT0h0jYgrlzYdwFperz7iX0Zeq5Xznl70dFO6hizGZTNGhCoJ
	 S4KVA65K4sxP30DoIRMjJLZ6H5Ewn2TIW3dx8euNgDDt9YUVV1/NTUgF61UpwWtjCICVC
	 3zJc/zWhwkc7UbTbkCAPb25FAaNVx42tWAnGnbf91+XtRoJiuhEpbimAxi3q/rImD4SI4
	 MH8vuq7EkB5mX66pR7bEp0fTZde+elsgNLPW4aOSfHvzszvnsKbpGem3DPT2oV+rLVJxj
	 oN9CEpil1KdqIj+ml0U7klTpGO7qu/mKIdedYmCKDIPVWLqVxOz7b2LPYxvrKXQt6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vrz8qWT1;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDAD606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 07:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDAD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Vrz8qWT1
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=n7/NfrBJOVijHE2gqo7g667Jx3EWyuJGPjofeyvSjCA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793951594; v=1; x=1794556394;
 b=Vrz8qWT1P4W9M1nqC7wjtd2uGW5JAlG9erVpQzw06B9GbkT6XnYaHIpRQcPtbd4IOmUWqM4H
 DVyTGInze+DPWjDsu8AJ43BejySZ2F3e/ej9Kc9jOPYkgMN29gUnE8PKXIsR4EeJl0O0LyCjyek
 7yhi2bihAA0XiJytIXTUi6ws=
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e8ec85b10918d5e0;
	Fri, 06 Nov 2026 07:53:14 +0000
X-Mizu-Trace-ID: e8ec85b10918d5e0
X-Migadu-Flow: FLOW_OUT
Message-ID: <9a4323e1-a966-41fe-8268-9d6621346fea@linux.dev>
Date: Fri, 6 Nov 2026 15:54:33 +0800
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] alloc_tag: Introduce IOCTLs to toggle allocation
 tracepoints
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <37ae7dca766994d3872fcc65b623a80d5d506369.1793818636.git.abhishekbapat@google.com>
 <202611052344.mDV2DB89-lkp@intel.com>
 <20261105172104.339c6f598a65056ed46e56fc@linux-foundation.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20261105172104.339c6f598a65056ed46e56fc@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew

On 2026/11/6 09:21, Andrew Morton wrote:
> On Thu, 5 Nov 2026 23:15:33 +0800 kernel test robot <lkp@intel.com> wrote:
> 
>> Hi Abhishek,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on bcc036cfa1670a64500f6d857eaa71908b79e3fb]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Bapat/alloc_tag-Add-trace-events-for-tracing-allocations/20261104-190336
>> base:   bcc036cfa1670a64500f6d857eaa71908b79e3fb
>> patch link:    https://lore.kernel.org/r/37ae7dca766994d3872fcc65b623a80d5d506369.1793818636.git.abhishekbapat%40google.com
>> patch subject: [PATCH v5 2/5] alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
>> config: xtensa-randconfig-1001-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052344.mDV2DB89-lkp@intel.com/config)
>> compiler: xtensa-linux-gcc (GCC) 8.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052344.mDV2DB89-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202611052344.mDV2DB89-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> WARNING: modpost: vmlinux: section mismatch in reference: alloc_tag_trace_enabled+0x2c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
> 
> Thanks.
> 
> #syz test
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: alloc_tag: force inline the allocation tracing check
> Date: Thu, 05 Nov 2026 17:18:09 -0800
> 
> alloc_tag_trace_enabled() is declared inline, but the compiler can
> still emit an out-of-line copy. Force it inline,
> 
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611052344.mDV2DB89-lkp@intel.com/
> Cc: Abhishek Bapat <abhishekbapat@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Hao Ge <hao.ge@linux.dev>
> ---
> 
>  include/linux/alloc_tag.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/include/linux/alloc_tag.h~alloc_tag-introduce-ioctls-to-toggle-allocation-tracepoints-fix
> +++ a/include/linux/alloc_tag.h
> @@ -161,7 +161,7 @@ static inline bool alloc_tag_is_traced(c
>  	return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_ON);
>  }
>  
> -static inline bool alloc_tag_trace_enabled(const struct alloc_tag *tag)
> +static __always_inline bool alloc_tag_trace_enabled(const struct alloc_tag *tag)
>  {
>  	if (static_branch_unlikely(&alloc_tag_trace_key))
>  		return tag && alloc_tag_is_traced(tag);
> _
> 


Thanks a lot for looking at this - and for putting together a fix at all.

Perhaps alloc_tag_is_traced needs the same treatment as well?

Even with your patch applied, I still hit the warning, just attributed to a different symbol:

WARNING: modpost: vmlinux: section mismatch in reference:
alloc_tag_is_traced+0x10 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

Marking both helpers __always_inline clears the warning in my build, and it would fit what the series
intends for the fast path anyway.

Thanks
Best Regards
Hao
