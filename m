Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C742056
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 03:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726026336; cv=none; b=n+kaHfkLZBhLJNJnSJfN6g6grnNj4RFXN6iY/ZJKkld+Hmiipa1xliropGM0KOnUahC7eHYPywo6zIm9LPfUq1p5hbOGwrvrhdOcKf1MBy0SlslICS+iQvzVKJgB3ihurDQ5lNlTNF/2qgBIRAyYLd4+GAqvaVnFVtMIYsAal0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726026336; c=relaxed/simple;
	bh=IHsswWe6pKkM79oNXwzIWBuXtbNIZv7CfOUp588UaLM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Oolz0K0mAYhc+CJpqfjqpe+wM80ZWYZXObGWhSWam99vTLV41iCbF9qlD59p92qxBwN4eVSWlCIhG/Fn15MRpK3ahVNTcskL1b+PoQEb3lU8BnJMMKchMYbcyb/FDOX/sHwbZeKrvCOQEfAuTqN8bmCagfjSMahlDOLzflBZZYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fCFKIXPP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fCFKIXPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41348C4CEC5;
	Wed, 11 Sep 2024 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1726026335;
	bh=IHsswWe6pKkM79oNXwzIWBuXtbNIZv7CfOUp588UaLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fCFKIXPP/iJqpPVE2DPqVBcfEP9e+3I/XukrUvBAFQAnS50+hRhK9HDmZBfCAp5Vl
	 ymG66uNkJFDLQlXHdLhh8J+RChWf7N74ZcyGzJ/8HBOtWz3WZfbIAFCludYsX9Lb2r
	 sKdZsP47kXW9VAjPPfbIX1yRLk2Td4B6oy/SsVsU=
Date: Tue, 10 Sep 2024 20:45:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot
 <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux Memory Management
 List <linux-mm@kvack.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
Message-Id: <20240910204534.94fe988e2865c0e187b7653b@linux-foundation.org>
In-Reply-To: <87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	<87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
	<87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Sep 2024 09:06:53 +0800 "Huang, Ying" <ying.huang@intel.com> wrote:

> > linux-next?) requires the presence of ea72ce5da228 ("x86/kaslr: Expose
> > and use the end of the physical memory address space"), which is not
> > present in mm.git.  Yet mm.git exhibits the build failure.
> 
> The original test report is against linux-next tree instead mm tree.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> The first bad commit (bisection result) is:
> 
> 5f445800cbdfc4b4185d496a43dfd78df63d2265 [10352/10516] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> 
> That is, mm tree is merged in linux-next, and commit ea72ce5da228
> ("x86/kaslr: Expose and use the end of the physical memory address
> space") is merged in linux-next too.  In fact, there's a merge conflict
> for MAX_PHYSMEM_BITS related code.  Maybe this can be part of merge
> conflict resolving patch?
> 
> Hi, Stephen,
> 
> Can you use the patch above as part of merged conflict resolving patch
> for patch
> 
> e2941fe697c8 ("resource, kunit: add test case for region_intersects()")
> 
> You have resolved it in
> 
> https://lore.kernel.org/lkml/20240909100043.60668995@canb.auug.org.au/

mm-unstable is presently broken, and fixing up linux-next won't change that.

I'd prefer to fix mm-stable and then provide Linus directions for merging that
with the x86 tree.
