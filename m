Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EAD63C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669822832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0CKS5W5YyquILV8EC0DuOBYp5ROVbCHJz6y2aZfVyc=;
	b=Z8z35DbyZzZTOTwL98A9qaB69+TRK1pru7gK5gmCN2658qz/q299eN/0v41I9KPTfcENWQ
	vNc5VDIu7an6zb83eyG145QTP39ZnyAkIskVhV7P9Dk5le34k8Ug1MixZ0/IOBc6N1JUqH
	HguPMtEtmMtuaEhgzuqKe8sRrcCcVdk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-KawN9yaQOfqQJJ-KbyhaZQ-1; Wed, 30 Nov 2022 10:40:31 -0500
X-MC-Unique: KawN9yaQOfqQJJ-KbyhaZQ-1
Received: by mail-qt1-f200.google.com with SMTP id cj6-20020a05622a258600b003a519d02f59so28838474qtb.5
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 07:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0CKS5W5YyquILV8EC0DuOBYp5ROVbCHJz6y2aZfVyc=;
        b=n9DUR311U+7bdompzjSrnp7/cPokKF5urV3AlbwREa9YulK+/GLb/xzmhqC8GYAKgX
         4p4CvvEjFMHAVejFD1UqiMi+kmxjEGnSG/OVoiR7equXgXyqaqRBACEsNet16Rv8ZJYI
         0duZzlSSBWhDXu9HgVFx6AWGQHr3uFjNZci2hsssCYHh7Yi9tEnaZFyFl+y3h8ven1Ak
         hLdRSv23LhAA+bUEWFtKBPAqqYKN2vDcXKGysU/YFOi4PhFMhXmslllV4gu7j4TUKYOl
         +3BsW3QKKNxf5EhSBBwE8SN09gy9YgP5BI7g9nPMfZc3W5B4JzbyLilNQJBjM1aZmxYd
         Vfjg==
X-Gm-Message-State: ANoB5pkcAFFeylvb+dQXHUbwg/yoKjPGPXGARhRZb8Klsl3KGPPuiwNs
	l837wP/q2LaLKY3AYDudwGRjLaGoASYbmF85mM0mmHpdcAhTKiZIkOqtsMu6sWXUxVYKGuH63ui
	5xlKjlO6sRRbd34u3KLnGlfa1Mw==
X-Received: by 2002:a05:622a:4ac9:b0:3a5:ae7:9ada with SMTP id fx9-20020a05622a4ac900b003a50ae79adamr41887178qtb.191.1669822830261;
        Wed, 30 Nov 2022 07:40:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49PO4/Y09HHKvL7oOBFOQuWQv0P2A3iYkddiq90jng9QHLi7urAcbNE2CnpxeXQwst7R/vmQ==
X-Received: by 2002:a05:622a:4ac9:b0:3a5:ae7:9ada with SMTP id fx9-20020a05622a4ac900b003a50ae79adamr41887157qtb.191.1669822829971;
        Wed, 30 Nov 2022 07:40:29 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id br36-20020a05620a462400b006faa2c0100bsm1349526qkb.110.2022.11.30.07.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:40:29 -0800 (PST)
Date: Wed, 30 Nov 2022 10:40:28 -0500
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 11904/12006] include/linux/hugetlb.h:1262:56:
 error: invalid use of undefined type 'struct hugetlb_vma_lock'
Message-ID: <Y4d5bLjo8ggay37M@x1n>
References: <202211302059.vIaoimsf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202211302059.vIaoimsf-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 30, 2022 at 08:33:11PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   700e0cd3a5ce6a2cb90d9a2aab729b52f092a7d6
> commit: 98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2 [11904/12006] mm/hugetlb: introduce hugetlb_walk()
> config: i386-randconfig-r004-20221128
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 98438ed47d60a6d30d5d2ad9c8786a0b92ca23f2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/bug.h:87,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:13,
>                     from arch/x86/include/asm/preempt.h:7,
>                     from include/linux/preempt.h:78,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/wait.h:9,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from fs/ubifs/ubifs.h:16,
>                     from fs/ubifs/file.c:40:
>    include/linux/hugetlb.h: In function 'hugetlb_walk':
> >> include/linux/hugetlb.h:1262:56: error: invalid use of undefined type 'struct hugetlb_vma_lock'
>     1262 |                 WARN_ON_ONCE(!lockdep_is_held(&vma_lock->rw_sema) &&
>          |                                                        ^~
>    include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
>      110 |         int __ret_warn_on = !!(condition);                      \
>          |                                ^~~~~~~~~
>    include/linux/hugetlb.h:1262:31: note: in expansion of macro 'lockdep_is_held'
>     1262 |                 WARN_ON_ONCE(!lockdep_is_held(&vma_lock->rw_sema) &&
>          |                               ^~~~~~~~~~~~~~~
> --
>    In file included from arch/x86/include/asm/bug.h:87,
>                     from include/linux/bug.h:5,
>                     from include/linux/fortify-string.h:5,
>                     from include/linux/string.h:253,
>                     from include/linux/bitmap.h:11,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/smp.h:13,
>                     from include/linux/lockdep.h:14,
>                     from include/linux/mutex.h:17,
>                     from include/linux/notifier.h:14,
>                     from include/linux/clk.h:14,
>                     from lib/vsprintf.c:22:
>    include/linux/hugetlb.h: In function 'hugetlb_walk':
> >> include/linux/hugetlb.h:1262:56: error: invalid use of undefined type 'struct hugetlb_vma_lock'
>     1262 |                 WARN_ON_ONCE(!lockdep_is_held(&vma_lock->rw_sema) &&
>          |                                                        ^~
>    include/asm-generic/bug.h:110:32: note: in definition of macro 'WARN_ON_ONCE'
>      110 |         int __ret_warn_on = !!(condition);                      \
>          |                                ^~~~~~~~~
>    include/linux/hugetlb.h:1262:31: note: in expansion of macro 'lockdep_is_held'
>     1262 |                 WARN_ON_ONCE(!lockdep_is_held(&vma_lock->rw_sema) &&
>          |                               ^~~~~~~~~~~~~~~
>    lib/vsprintf.c: In function 'va_format':
>    lib/vsprintf.c:1685:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     1685 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
>          |         ^~~
> 
> 
> vim +1262 include/linux/hugetlb.h
> 
>   1243	
>   1244	/*
>   1245	 * Safe version of huge_pte_offset() to check the locks.  See comments
>   1246	 * above huge_pte_offset().
>   1247	 */
>   1248	static inline pte_t *
>   1249	hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
>   1250	{
>   1251	#if defined(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) && defined(CONFIG_LOCKDEP)
>   1252		struct hugetlb_vma_lock *vma_lock = vma->vm_private_data;
>   1253	
>   1254		/*
>   1255		 * If pmd sharing possible, locking needed to safely walk the
>   1256		 * hugetlb pgtables.  More information can be found at the comment
>   1257		 * above huge_pte_offset() in the same file.
>   1258		 *
>   1259		 * NOTE: lockdep_is_held() is only defined with CONFIG_LOCKDEP.
>   1260		 */
>   1261		if (__vma_shareable_flags_pmd(vma))
> > 1262			WARN_ON_ONCE(!lockdep_is_held(&vma_lock->rw_sema) &&
>   1263				     !lockdep_is_held(
>   1264					 &vma->vm_file->f_mapping->i_mmap_rwsem));
>   1265	#endif
>   1266		return huge_pte_offset(vma->vm_mm, addr, sz);
>   1267	}
>   1268	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

[...]

> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y

This looks like the same issue as what Eric reported here:

https://lore.kernel.org/all/Y4d4qh0ACmo455Nj@x1n/

Thanks,

-- 
Peter Xu

