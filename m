Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0C1850A4;
	Sat, 17 Jan 2026 03:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768620352; cv=none; b=iDF6kG0/YcAeg2yAoni3l0fJJOfAIek7wQdgr3LqaZeQl5me+LgfVZQ3S6+zY+cKcJffAL6ULw0IQv5tEH4Xjlsb4hyGwCvz+BBjDp30oWLov7ryq0xHc1zeQVaC6Qj1d0OAxeniCfh9FCMR6bE/Zh0eRwdWp/M2xoc7BpfYETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768620352; c=relaxed/simple;
	bh=7ae7fLInRW3PF4gX/7PThpzQFGun1slC2hqvJiPHk78=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=D+lIepHEmL+D/Vs5AOlHsNOwxho9H1p4jufmGC8p+qw1mzYNgzJxKjkH0gJKHrVXzXS3sx1sPPxNmPGLJbf4eDN9bK2VZFQ6DhoRAFLR/Q7DnJzsZYaa4Dbsc03UjpAq/08ufMNM4hrsQSYiQGJU1PkSek/SSKiwaqlZQLoIkjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SlqLB0L7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SlqLB0L7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE28C4CEF7;
	Sat, 17 Jan 2026 03:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768620351;
	bh=7ae7fLInRW3PF4gX/7PThpzQFGun1slC2hqvJiPHk78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SlqLB0L7dHRDimWhtUJAop2oLyN4oW1rAONvME0yhAz2TSP0cGxNJS9EiTDGwtIXh
	 VPbQNu7PygIY8+ALLOUnMo6fmJqqzEu84wcX7rsyv0jBfud8u2FC6Y6jjMsgkT/3Me
	 64pidhpf6L5odTdpFA3eU4UzpPFh6c7wJ3rqG5fs=
Date: Fri, 16 Jan 2026 19:25:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, Suren Baghdasaryan
 <surenb@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand
 <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Michal Hocko
 <mhocko@suse.com>, Jann Horn <jannh@google.com>, shikemeng@huaweicloud.com,
 kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org,
 chrisl@kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 08/10] mm/vma: Use unmap_desc in exit_mmap() and
 vms_clear_ptes()
Message-Id: <20260116192550.b4c4f18eed80b11ce39a1351@linux-foundation.org>
In-Reply-To: <20260117010707.202128-1-sj@kernel.org>
References: <vcxnsoihqohhmgurdkbx2hvybuhaql7yruv45k63jwevlpkdod@4eugq6xubcug>
	<20260117010707.202128-1-sj@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Jan 2026 17:07:06 -0800 SeongJae Park <sj@kernel.org> wrote:

> > > Suspect you need to add:
> > > 
> > > #include <linux/pgtable.h>
> > > 
> > > to mm/vma_internal.h.
> > > 
> > > Some arches don't define it and that header has:
> > > 
> > > #ifndef USER_PGTABLES_CEILING
> > > #define USER_PGTABLES_CEILING	0UL
> > > #endif
> > > 
> > > ...
> > > 
> > > #ifndef FIRST_USER_ADDRESS
> > > #define FIRST_USER_ADDRESS	0UL
> > > #endif
> 
> But the macro definitions are enclosed by '#ifdef CONFIG_MMU'.  I have
> !CONFIG_MMU build test, which shows similar errors, even after Lorenzo's
> suggestion is applied.  Should we move the definitions out of the '#ifdef
> CONFIG_MMU', or implement another unmap_all_init() for !CONFIG_MMU case?
> 
> I confirmed a simple version of the first option (moving definitions out of
> CONFIG_MMU, in addition to including pgtable.h) like below works at least for
> my !CONFIG_MMU test.
> 

Worked for me, thanks.  I also unbreaks arm allnoconfig.  I usually run
that but I must have missed this time.

I understand that v3 is in the works.  Meanwhile I'll include your patch to
make mm-new a happier place.

