Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BA29AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 May 2023 20:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F4C433EF;
	Thu, 18 May 2023 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1684441969;
	bh=CrB/bMDggeeuRdZlMfMOz49UiznCyfb3hMwMaKppKro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DHB1WPZKWeMAcedwOTX9Wr5BxegeuSRQX4Xqfayg2lHYegoFMr8xZe8EDvYnlfei0
	 8Wi2V+960f6nZAgud2iJUTxmOlAbvfrlWr6DOm5O4J9phYs6Mm8wNSnr5NbJB8c+Uw
	 ZPm8oY1w7Sz1UnYCVS4oypVQa9gENAJuIhjjfEOI=
Date: Thu, 18 May 2023 13:32:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Oscar Salvador <osalvador@suse.de>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2908/3314] lib/stackdepot.c:544
 stack_print() warn: unsigned 'stack->size' is never less than zero.
Message-Id: <20230518133247.a0ece8de7c3fc5dca9e1b67d@linux-foundation.org>
In-Reply-To: <202305182345.LTMlWG84-lkp@intel.com>
References: <202305182345.LTMlWG84-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 May 2023 23:44:10 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   798d276b39e984345d52b933a900a71fa0815928
> commit: e435b85a4aea7a82259105d5d8025655460052e1 [2908/3314] mm, page_owner: add page_owner_stacks file to print out only stacks and their counte
> config: x86_64-randconfig-m001
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305182345.LTMlWG84-lkp@intel.com/
> 
> smatch warnings:
> lib/stackdepot.c:544 stack_print() warn: unsigned 'stack->size' is never less than zero.
> 

Linus would complain about that warning.

> 
>    537	
>    538	int stack_print(struct seq_file *m, void *v)
>    539	{
>    540		char *buf;
>    541		int ret = 0;
>    542		struct stack_record *stack = v;
>    543	
>  > 544		if (!stack->size || stack->size < 0 ||
>    545		    stack->size > PAGE_SIZE || stack->handle.valid != 1 ||
>    546		    refcount_read(&stack->count) < 1)

How about <=?

--- a/lib/stackdepot.c~mm-page_owner-add-page_owner_stacks-file-to-print-out-only-stacks-and-their-counte-fix-fix
+++ a/lib/stackdepot.c
@@ -541,9 +541,8 @@ int stack_print(struct seq_file *m, void
 	int ret = 0;
 	struct stack_record *stack = v;
 
-	if (!stack->size || stack->size < 0 ||
-	    stack->size > PAGE_SIZE || stack->handle.valid != 1 ||
-	    refcount_read(&stack->count) < 1)
+	if (stack->size <= 0 || stack->size > PAGE_SIZE ||
+	    stack->handle.valid != 1 || refcount_read(&stack->count) < 1)
 		return 0;
 
 	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
_


