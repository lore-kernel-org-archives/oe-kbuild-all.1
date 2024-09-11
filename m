Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A91F951
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 05:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726032135; cv=none; b=mM1so3Woss3ePTgdrVexHXg7CmZU1QbtZz/hYBFgVn02eAQxDGBvNM9oc08u8ufWFWQ1mHOSANjBqfXjKf9AencCrNTeYLWccIwcaoTSuvs2Gr3nTccrhX4aEUu7tWuOJvZ9CM4Gh0wiAgTKh5Du5/Vm92mgVQmz9DscqD1XNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726032135; c=relaxed/simple;
	bh=fOQJKeXoo0J5Jf2UkW332F7tvEqUUop5G1yJ4OcGFQQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQbiB7PCkQ3JEC/BLH9qrSpkVf45n5P2bPp3G8aqtqRuB3NGAGuenKVs7GMuDd5HKO9pzBT+J5a33FDeKfhxSTcxrhqVlxDAmDXQGimEbLyKtfrAMmYMmU3QQtqG3kJybnoSMZzGqV32bwvc6Q9u1UWuuVS/emAiEgtN+y/vOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHn+R5kU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHn+R5kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726032134; x=1757568134;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=fOQJKeXoo0J5Jf2UkW332F7tvEqUUop5G1yJ4OcGFQQ=;
  b=dHn+R5kU4GHcJlllCZMTq+DrqXDC5qFR0YDC6LgEFZNHAhP/pUoN9RY1
   7BloPY3Hy1px2zU73o5oN5yzP65x4i5ryO+L/BtjxuXxKTDHjh8Azp+yP
   D5KQRNOMZBtrXLfjRzGUzvbOY5jY0Fo1+YvOf1Ra2hPzeXSgZTZMhqniR
   PCvCu8AyMcQMVuE09fRy/+iDCy6yM1xWJktSEjq7kI0v0+OpG357nEA4i
   C/7yU6yb50noVxGxX7lc6g1RSbMYn0iYBnWBSPi/gwJTBO64iZavTodU2
   tSv7edEfwEnRNrXUDWJNtYa68Jtg4yTow1SMmXHpICLC9H9jQgspoxQTW
   w==;
X-CSE-ConnectionGUID: mfwtV/7LSbufNAGkOmvAew==
X-CSE-MsgGUID: 46wWZ1rAQ6OV99yiqMrXmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24679628"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24679628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:22:14 -0700
X-CSE-ConnectionGUID: tRWuOCHCQJSSLX1p0+vMwQ==
X-CSE-MsgGUID: uF8FTi2ESCeBdITbc2P7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72051162"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:22:12 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,  kernel test robot
 <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,  Linux Memory Management
 List <linux-mm@kvack.org>,  Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
In-Reply-To: <20240910204534.94fe988e2865c0e187b7653b@linux-foundation.org>
	(Andrew Morton's message of "Tue, 10 Sep 2024 20:45:34 -0700")
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	<87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
	<87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<20240910204534.94fe988e2865c0e187b7653b@linux-foundation.org>
Date: Wed, 11 Sep 2024 13:18:39 +0800
Message-ID: <87ldzywyxc.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 11 Sep 2024 09:06:53 +0800 "Huang, Ying" <ying.huang@intel.com> wrote:
>
>> > linux-next?) requires the presence of ea72ce5da228 ("x86/kaslr: Expose
>> > and use the end of the physical memory address space"), which is not
>> > present in mm.git.  Yet mm.git exhibits the build failure.
>> 
>> The original test report is against linux-next tree instead mm tree.
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> 
>> The first bad commit (bisection result) is:
>> 
>> 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>> 
>> That is, mm tree is merged in linux-next, and commit ea72ce5da228
>> ("x86/kaslr: Expose and use the end of the physical memory address
>> space") is merged in linux-next too.  In fact, there's a merge conflict
>> for MAX_PHYSMEM_BITS related code.  Maybe this can be part of merge
>> conflict resolving patch?
>> 
>> Hi, Stephen,
>> 
>> Can you use the patch above as part of merged conflict resolving patch
>> for patch
>> 
>> e2941fe697c8 ("resource, kunit: add test case for region_intersects()")
>> 
>> You have resolved it in
>> 
>> https://lore.kernel.org/lkml/20240909100043.60668995@canb.auug.org.au/
>
> mm-unstable is presently broken, and fixing up linux-next won't change that.
>
> I'd prefer to fix mm-stable and then provide Linus directions for merging that
> with the x86 tree.

The real bug fix patch is [1/3]:

  resource: Fix region_intersects() vs add_memory_driver_managed()

The merge conflict is for the new kunit test case, which isn't urgent.

So, another option is to merge the bug fix ([1/3]) through mm now and
backport it to stable kernels.  Then I can resend the kunit test case
after v6.12-rc1 is released.

--
Best Regards,
Huang, Ying
