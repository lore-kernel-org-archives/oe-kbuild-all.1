Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E21863E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 01:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726017031; cv=none; b=h+UmR94Pi9VoKrMmUSBY2GN2lCHPzN4JSsiOQKsJ+WJong1MJ58wlzmyQCr+9WidIGMmR8Pi8xivZ0XydX4KDc5+K1W+3WnpGomRJgZQI4zlbzX2QuVWQ4Im6C+R/jd3r0mqDo63juI+y0f1Csvz+wy6EcUtzOxYl/IP5eoAw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726017031; c=relaxed/simple;
	bh=riNq3pM/DId4C30DQEIiavYhDshRICeniueLV2tGyug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NqRw1fZ+3brFQWcbD4LBPccB1oGgnMawe8NWBvyt4rZFDw1I6nqy+UxIxUNxFdn9sbzFnfJlCx7o8j+pP+fsdNSErW3UP1x7Rf/Oy9tI910GM3SfsWjst2+bWhMLSAjBi5sjaTCVCpjtSzgzzlafmizXQZXwvhW8VIxpC7Poxjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KcdavCn5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcdavCn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726017030; x=1757553030;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=riNq3pM/DId4C30DQEIiavYhDshRICeniueLV2tGyug=;
  b=KcdavCn5ufJ9xxB+YV/l/6wBaojq9cFDNeMjhbHZ3tsive4EP+ShjeBq
   /0aoF8+TQIPfGVDbWV7tcKd4dKvuLFBvVAYOG18+7/ON6nQL67XRUMNYp
   68b4ONZ9hz51oXH70Xsw2ajgM1efcRD6AxrT8DrKVTePvcGPVgei+MpUg
   j2EEqa6lsaQo1nOyE2OqkTRn3fdee6eikCiSudGjSUf4ACNTMHbMR+YS6
   cM43szwWc0iUGczKhOWZBr9t1Yy3RTj129Z5nTaO9o2ylMtSItiYYGSMy
   Gubm5SJ1Lo27sXlNsHlk2oKc/J9zJR8bso4EkeytgaR2FsiNNEYRfV8bh
   Q==;
X-CSE-ConnectionGUID: 9pRIZIG3RsGXZTkSmS+5EA==
X-CSE-MsgGUID: ftSgvT16QT+bJmsIs2qJ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24662107"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24662107"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:10:29 -0700
X-CSE-ConnectionGUID: dFNXcVp+QQ2VTJyJF8yO9A==
X-CSE-MsgGUID: aG3CQ8UkRryMt0Evaq9njA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67218580"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:10:26 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
  Linux Memory Management List <linux-mm@kvack.org>,  Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
In-Reply-To: <20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
	(Andrew Morton's message of "Tue, 10 Sep 2024 10:40:56 -0700")
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	<87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
Date: Wed, 11 Sep 2024 09:06:53 +0800
Message-ID: <87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Andrew Morton <akpm@linux-foundation.org> writes:

> On Tue, 10 Sep 2024 13:42:30 +0800 "Huang, Ying" <ying.huang@intel.com> wrote:
>
>> >>       93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>> >>          |                                      ^
>> >
>> > Thanks. "resource, kunit: add test case for region_intersects" is the culprit.
>> 
>> Yes.  Although the definition in include/linux/mm.h introduced in
>> 
>>   commit ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory address space")
>> 
>> doesn't compile on m68k.  There are no users of PHYSMEM_END before patch
>> "resource, kunit: add test case for region_intersects".  This can be
>> fixed via the following patch.
>> 
>> ---------------------------------8<--------------------------------------
>> >From 00d176e0cd07e3df1ea37a5e56ca576c819b585a Mon Sep 17 00:00:00 2001
>> From: Huang Ying <ying.huang@intel.com>
>> Date: Tue, 10 Sep 2024 13:20:40 +0800
>> Subject: [PATCH] mm: fix PHYSMEM_END build error on m68k
>> 
>> 0Day build system reported build error on m68k architecture for missing
>> the definition of MAX_PHYSMEM_BITS when defining PHYSMEM_END.  Fixed it
>> via making PHYSMEM_END definition depends on MAX_PHYSMEM_BITS definition
>> conditionally.
>> 
>> Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202409100913.RxkfrKU6-lkp@intel.com/
>> ---
>>  include/linux/mm.h | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 147073601716..62bb7e7e0a17 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -98,7 +98,11 @@ extern int mmap_rnd_compat_bits __read_mostly;
>>  #endif
>>  
>>  #ifndef PHYSMEM_END
>> -# define PHYSMEM_END	((1ULL << MAX_PHYSMEM_BITS) - 1)
>> +# ifdef MAX_PHYSMEM_BITS
>> +#  define PHYSMEM_END		((1ULL << MAX_PHYSMEM_BITS) - 1)
>> +# else
>> +#  define PHYSMEM_END		(-1ULL)
>> +# endif
>>  #endif
>>  
>>  #include <asm/page.h>
>
> I'm not really understanding.  This patch (which I assume is against
> linux-next?) requires the presence of ea72ce5da228 ("x86/kaslr: Expose
> and use the end of the physical memory address space"), which is not
> present in mm.git.  Yet mm.git exhibits the build failure.

The original test report is against linux-next tree instead mm tree.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

The first bad commit (bisection result) is:

5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

That is, mm tree is merged in linux-next, and commit ea72ce5da228
("x86/kaslr: Expose and use the end of the physical memory address
space") is merged in linux-next too.  In fact, there's a merge conflict
for MAX_PHYSMEM_BITS related code.  Maybe this can be part of merge
conflict resolving patch?

Hi, Stephen,

Can you use the patch above as part of merged conflict resolving patch
for patch

e2941fe697c8 ("resource, kunit: add test case for region_intersects()")

You have resolved it in

https://lore.kernel.org/lkml/20240909100043.60668995@canb.auug.org.au/

--
Best Regards,
Huang, Ying
