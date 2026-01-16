Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB22EA743
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605302; cv=none; b=RFoqK/I7+0DyafyZ/coLhycB1z6/LJ4M3LVNfdyIJy7hbVM/pMgF1WED8PbjCl8B2bwKrIjhrct6aVNYMnBoyK89PO3SpSS0PpOqSb3QeQG/Tf0VAo98jrIM3BEgHWZs4VrjXyUbhxkTEg023PnyXzo9J8LvhEVhRzfZM+BJlgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605302; c=relaxed/simple;
	bh=+0CNKwKHffjPLmqUX+TzPn4+iKRnH11I0K5ejqSDu5k=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TB7B7F4jDrrpnzcyNY3M1QxaSsxutE8HQXam3S4atw03b4H/3MbTi+wCzOsIrRylrY2EjUVxRIKHe0AHpEVhBC+uGYBAp3wjS+RtdNQrhtNLPtQ+JOmviLvz8fAWdQcGcMm4UAPsJtY6EyiJeDOHlZqMxUBCROPd/3jxH6yubHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TfRQjOtL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TfRQjOtL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61204C116C6;
	Fri, 16 Jan 2026 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768605301;
	bh=+0CNKwKHffjPLmqUX+TzPn4+iKRnH11I0K5ejqSDu5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TfRQjOtL4rSSQvu8aV2jJSu5THwCjnEUAVm0VwaK2ToWV+ONPhsz14b5ZHcvvuKIf
	 XDKokYSXlVCIMuQt1oc8/m8PXJrrogzxEnV5XFViBVnDndqeWjnsMch8/xUD6uvP8V
	 7iUPcTO2ajsfjvPOoYXrLOBdUozU9/mbKQdyE3bs=
Date: Fri, 16 Jan 2026 15:15:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Byungchul Park <byungchul@sk.com>, oe-kbuild-all@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Pavel Begunkov <asml.silence@gmail.com>,
 =?ISO-8859-1?Q?"Toke_H=F8iland-J=F8rgensen"?= <toke@redhat.com>
Subject: Re: [akpm-mm:mm-unstable /301] net/core/page_pool.c:713:71: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-Id: <20260116151500.b56d0cc2525072123ad2d86d@linux-foundation.org>
In-Reply-To: <202601161606.8RuyUh2k-lkp@intel.com>
References: <202601161606.8RuyUh2k-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 16:41:32 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   fe2c34b6ea5a0e1175c30d59bc1c28caafb02c62
> commit: 7699fe82442a62ea29a3745b29dbb8ef8c42d8db [/301] mm: introduce a new page type for page pool in page type
> config: x86_64-randconfig-122-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601161606.8RuyUh2k-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> net/core/page_pool.c:713:71: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
>    net/core/page_pool.c:713:71: sparse:     expected restricted netmem_ref [usertype] netmem
>    net/core/page_pool.c:713:71: sparse:     got unsigned long
>    net/core/page_pool.c:734:73: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
>    net/core/page_pool.c:734:73: sparse:     expected restricted netmem_ref [usertype] netmem
>    net/core/page_pool.c:734:73: sparse:     got unsigned long

Oh, OK.

Byungchul, please remind me why I'm carrying a page-pool patch?  I
applied it because email headers and because Suggested-by:David, but
these things are usually carried in the networking tree.  

And I never applied [patch 2/2]
(https://lkml.kernel.org/r/20251215071001.78263-3-byungchul@sk.com)
because "kernel test robot" reported a build error.

In fact, I'll drop the patch - please let's have a redo.
