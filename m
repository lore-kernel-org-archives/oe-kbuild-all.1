Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF915D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757743397; cv=none; b=VL6MZQH9pvy64foPSbxgPAp0RIy1rG3WwLeoK/xUAbktpar63l2aQFcRyR0M3oVnVwQqy1Uya3f58Pm2z615o6hCiLV/ED2qsSCPkZhNXetWCw959SfCJRlXUwb+OLfkZDeDDHS8zIhR6NRN5rYKEg3wCPZCZQLts18cquLUgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757743397; c=relaxed/simple;
	bh=OPDGHPzQlXuajBD01izlcWwSw/TlqiRzn+DG2j9F9IU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bGizgU59fnyibPgBa7ERdJnyJ4IzDIRxwn9Z0vq5TR0I3iK9qLQlOC7nrAPU/c87iyCDPMe3k+J+mtcqqZjmx2pkh7I3nh+XcB0hzHhAkfaBdeFWpHkyN73kUK3C3x74iTf7xzIYIfbR/YVa+dpURY1rLwgsmDRsxy8zaSSPl2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QlIoFsxk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QlIoFsxk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD6AC4CEEB;
	Sat, 13 Sep 2025 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757743394;
	bh=OPDGHPzQlXuajBD01izlcWwSw/TlqiRzn+DG2j9F9IU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QlIoFsxkv9E57eNIZrt3izyxqL5/+yb257rlCI+y7Vgf+G7+kZ9at8LrO9kNavjos
	 mRdMOy1ruxCK3N0+DP0pCJPgEaTItisd4p44dzAiHvToFFF6NCNV4jkZaxjT5XhTrd
	 21HGTdew+wfD/lLmrkJ525HRKxecw8Rj7C/yZLDQ=
Date: Fri, 12 Sep 2025 23:03:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 39/428] include/linux/pgtable.h:235:36:
 error: expected expression before 'do'
Message-Id: <20250912230313.117341d5491a3145e7bcf311@linux-foundation.org>
In-Reply-To: <202509131255.x9EfvIGt-lkp@intel.com>
References: <202509131255.x9EfvIGt-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 13 Sep 2025 12:53:27 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   8ded915c4409a5190b1c9c57c172d62ab5534274
> commit: f6748cc302fdca7c486c6098f315bd4174f5c614 [39/428] kasan: Fix warnings caused by use of arch_enter_lazy_mmu_mode()
> config: s390-randconfig-002-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509131255.x9EfvIGt-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kasan.h:37,
>                     from mm/kasan/shadow.c:14:
>    mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
> >> include/linux/pgtable.h:235:36: error: expected expression before 'do'
>     #define arch_enter_lazy_mmu_mode() do {} while (0)
>                                        ^~
>    mm/kasan/shadow.c:322:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>      (void)arch_enter_lazy_mmu_mode();
>            ^~~~~~~~~~~~~~~~~~~~~~~~
>    mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
> >> include/linux/pgtable.h:235:36: error: expected expression before 'do'
>     #define arch_enter_lazy_mmu_mode() do {} while (0)
>                                     ^~

Huh, thanks.  Another reason why static inlines are better than macros.

>    mm/kasan/shadow.c:497:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>      (void)arch_enter_lazy_mmu_mode();
>            ^~~~~~~~~~~~~~~~~~~~~~~~

You can't do that with them!

I'll add this.

--- a/mm/kasan/shadow.c~kasan-fix-warnings-caused-by-use-of-arch_enter_lazy_mmu_mode-fix
+++ a/mm/kasan/shadow.c
@@ -319,7 +319,7 @@ static int kasan_populate_vmalloc_pte(pt
 	}
 	spin_unlock(&init_mm.page_table_lock);
 
-	(void)arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode();
 
 	return 0;
 }
@@ -494,7 +494,7 @@ static int kasan_depopulate_vmalloc_pte(
 	if (likely(!none))
 		__free_page(pfn_to_page(pte_pfn(pte)));
 
-	(void)arch_enter_lazy_mmu_mode();
+	arch_enter_lazy_mmu_mode();
 
 	return 0;
 }
_

