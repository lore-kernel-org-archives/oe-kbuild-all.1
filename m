Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17CE14BFBF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726575115; cv=none; b=kU12PlXgAD9rnqZXHPF967aYQwTTP3E0bGxjwY4r4o4rOJ1hXlJsbD8IzRp3BEb7KMmb5IjFVfmi6X6sUHsXwWpZXFHKYVOrNyfiZxLXILUJqYwmRwiSFI6H73P15qS0DW9LWgdeDBA5jav2lLmjbWdnle2KmtQHHzncQTqG6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726575115; c=relaxed/simple;
	bh=aWYSdleccHLfIZAdozoHiH76a067cg/tvnibnZr87CU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U1UTqXBaz4tcv8aW1uJS82mFlYWDQYpoa7pyu12zan5t6Bv0riN8ehGTVByCN/K0ybrLRln6+V8hkJvKMvCWYNqK5ELMqgL9sISWYDnlnWblVPqbNxqNYnwz0fJ8PqFs8KUuYnXyPeBQHdDLg7ZKQaBu0tkPiKlfiwMW9sICy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=d3XfgZEC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d3XfgZEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6CFC4CEC5;
	Tue, 17 Sep 2024 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1726575114;
	bh=aWYSdleccHLfIZAdozoHiH76a067cg/tvnibnZr87CU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d3XfgZECFaNKOjWIvkw91pWFcJi0Xk/To7xixDPKqYWUaRKFiPzEdquIJMULKsrpt
	 0yV2WtWil1yvQ23cwYvW1yLc0Sk4efzrOSpyh68xHt6/kqPyT+ltpWMcOojFE58ksq
	 8Rgw9EM+xB3Hn57NgWy6foUuR9RF0EvvAJes+RVA=
Date: Tue, 17 Sep 2024 05:11:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [linux-next:master 12061/12283] mm/khugepaged.c:435:undefined
 reference to `shmem_hpage_pmd_enabled'
Message-Id: <20240917051150.5779e3b1b351cb83662674cc@linux-foundation.org>
In-Reply-To: <202409171905.9gqKNeeL-lkp@intel.com>
References: <202409171905.9gqKNeeL-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Sep 2024 19:36:47 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
> commit: 8b07e88e36961c4785dd13dbdbb5d7977b458940 [12061/12283] mm: shmem: fix khugepaged activation policy for shmem
> config: loongarch-randconfig-s042-20221209 (https://download.01.org/0day-ci/archive/20240917/202409171905.9gqKNeeL-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171905.9gqKNeeL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409171905.9gqKNeeL-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    loongarch64-linux-ld: mm/khugepaged.o: in function `hugepage_pmd_enabled':
> >> mm/khugepaged.c:435:(.text+0x2338): undefined reference to `shmem_hpage_pmd_enabled'

Thanks.  I think this:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-shmem-fix-khugepaged-activation-policy-for-shmem-fix
Date: Tue Sep 17 05:06:48 AM PDT 2024

fix build with CONFIG_SHMEM=n

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409171905.9gqKNeeL-lkp@intel.com/
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/shmem_fs.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- a/include/linux/shmem_fs.h~mm-shmem-fix-khugepaged-activation-policy-for-shmem-fix
+++ a/include/linux/shmem_fs.h
@@ -114,7 +114,6 @@ int shmem_unuse(unsigned int type);
 unsigned long shmem_allowable_huge_orders(struct inode *inode,
 				struct vm_area_struct *vma, pgoff_t index,
 				loff_t write_end, bool shmem_huge_force);
-bool shmem_hpage_pmd_enabled(void);
 #else
 static inline unsigned long shmem_allowable_huge_orders(struct inode *inode,
 				struct vm_area_struct *vma, pgoff_t index,
@@ -123,6 +122,11 @@ static inline unsigned long shmem_allowa
 	return 0;
 }
 
+#endif
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && defined(SHMEM)
+bool shmem_hpage_pmd_enabled(void);
+#else
 static inline bool shmem_hpage_pmd_enabled(void)
 {
 	return false;
_

