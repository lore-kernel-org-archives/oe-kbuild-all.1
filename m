Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791E28F5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 02:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709693217; cv=none; b=CWYUv92VMYBXK767NxX7JZ+c1y6JCJqDNqyY7Q0yR+/CUyIOu5Qg5t+O9ATcWMyxK4aNzred2m9QzocmYLzDTZiLNXZGOl3Q42NAcAZYHIUlwy1g+bgTplLa0AJ8VusQyLoCW4+HaSTyUnapb8lpaAnX1cdnnGf24KTYFsrLeIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709693217; c=relaxed/simple;
	bh=MIH5Qi3RQ9UnJd0tZRlmS/3dTAs+TslwYiYPsWnCOC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMRFp3hXBy8dk+yYUl0tY/3uwrpwZU1HrCViDHWm7BSTu5taiQFs26bjSuc3aiYy7Lp+shhvquYfLxiHsewEirsIYYR90cWik36AYMRc7rJ0yAM8MbDlI4Iq5L4F5l9hLmwskmUKPtM05Fc2j1pvJLP9p6ZAX6LMvl+217rRo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DifVA3Oo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DifVA3Oo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cfcf509fbdso2407926a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Mar 2024 18:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709693214; x=1710298014; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZCr6ySc1bBgULJ6PnDdM+jqKWeT1mYSFSiXluejWa1Y=;
        b=DifVA3OomMGNlO9bXILYOOE9vAqOeDu5i3ldaQjEo+G0Y5iUkyPjkDzGqJzeG/x5RX
         9jd/kjC/xK7iZ3/Qfiaefxl4lHlSOctwShzUMZ7SMbcwRrZjYCuN8J0h+N61HzoGtRmh
         kxNYWJg1oZItxDR8P1M5HQ6a3N0LmaDeG1eHoELvc1LziIEDmEoRcLDFHyhhki0WU6DX
         5mSQIz9uVMPbCJ5hUz3G3kh2oVsRITkCWhFsd3ZuheHggBXQavz3Sa1ElJ+uRHbZlLQI
         afA164FJxriKtI23ZAAuEv51bVpIKFVud+k6p8974A8+vH8DvHQ8BWpC6cvN5y2MDB+z
         Ze4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709693214; x=1710298014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCr6ySc1bBgULJ6PnDdM+jqKWeT1mYSFSiXluejWa1Y=;
        b=ijVD08FBu/70+1KtIITppdkWaLOp+xU6jTGuB/GnN5lvXYjZzhJkFFFJ+GNETVfqaf
         K8Iizr9x4W6OfLApWLqRElo2zeWtI6WQX0AEGnsd3pBklSfOFdS8d2LvVZXQJKJMHPWD
         KLaLQ3DBl9jQhilCODaYsQhWhXgPyl6Q+6i7prfkLj6GVD87W5vw+WNxTH4TXxKdUEw9
         e9r9hZ0Tpbd8OsK/dq8Qc/LOnF99iFj1TtKlSFVYeCOTxec+c/m5c8Ok7FWiWEjG1a0h
         8HVCIdkP92cD2ACWfT3AI40QGoAyyDKBSV7kZokXZjNI240RPtlSHNLlOJR8u7wGhjMx
         YsBQ==
X-Gm-Message-State: AOJu0YxvV2XymAqO8i622HXnE1D0o4EKbJwVGKlA3zTMiGacDBLCNRa7
	8QVfI51nW3dgCP7CTOgpNuXrUAn+2BnJ1jD6zjZrZplbrpbhIzjg2p2gLO6tT89+WUr3Cu8gawl
	a
X-Google-Smtp-Source: AGHT+IGfxcYjxcq/k7nzALn3dbxFbo8VqlYHyRHRpzmZPT0iRiJR8rbl8TBTk1Kabk3GsDaM1UjDWQ==
X-Received: by 2002:a17:902:c94a:b0:1dc:fcde:853a with SMTP id i10-20020a170902c94a00b001dcfcde853amr2376964pla.1.1709693214482;
        Tue, 05 Mar 2024 18:46:54 -0800 (PST)
Received: from [10.84.154.17] ([203.208.167.155])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902f54f00b001d974ffa1fcsm11311890plf.173.2024.03.05.18.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 18:46:53 -0800 (PST)
Message-ID: <742a5f0a-8e7f-4993-b3eb-598c6b237ccd@bytedance.com>
Date: Wed, 6 Mar 2024 10:46:49 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] s390: supplement for ptdesc conversion
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch@bytedance.com>
 <202403060651.ld11yLEn-lkp@intel.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <202403060651.ld11yLEn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks a lot for testing! And the following errors have been fixed by
https://lore.kernel.org/lkml/20240305072154.26168-1-zhengqi.arch@bytedance.com/.

Thanks,
Qi

On 2024/3/6 06:32, kernel test robot wrote:
> Hi Qi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on s390/features]
> [also build test ERROR on kvms390/next linus/master v6.8-rc7]
> [cannot apply to akpm-mm/mm-everything next-20240305]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-pgtable-correct-the-wrong-comment-about-ptdesc-__page_flags/20240304-191006
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
> patch link:    https://lore.kernel.org/r/04beaf3255056ffe131a5ea595736066c1e84756.1709541697.git.zhengqi.arch%40bytedance.com
> patch subject: [PATCH 3/3] s390: supplement for ptdesc conversion
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060651.ld11yLEn-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060651.ld11yLEn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403060651.ld11yLEn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/smp.h:12,
>                      from include/linux/lockdep.h:14,
>                      from include/linux/spinlock.h:63,
>                      from include/linux/mmzone.h:8,
>                      from include/linux/gfp.h:7,
>                      from include/linux/mm.h:7,
>                      from include/linux/pagewalk.h:5,
>                      from arch/s390/mm/gmap.c:12:
>     arch/s390/mm/gmap.c: In function 'gmap_free':
>>> include/linux/list.h:866:19: error: assignment to 'struct page *' from incompatible pointer type 'struct ptdesc *' [-Werror=incompatible-pointer-types]
>       866 |                 n = list_next_entry(pos, member);                       \
>           |                   ^
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>> include/linux/list.h:868:18: error: assignment to 'struct ptdesc *' from incompatible pointer type 'struct page *' [-Werror=incompatible-pointer-types]
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                  ^
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from include/linux/kernel.h:22,
>                      from arch/s390/mm/gmap.c:11:
>>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                                                                        ^~~~~~~
>     include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
>        19 |         void *__mptr = (void *)(ptr);                                   \
>           |                                 ^~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from include/linux/container_of.h:5:
>>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                                                                        ^~~~~~~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>       601 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                                                                        ^~~~~~~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>       601 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                                                                        ^~~~~~~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
>        21 |                       __same_type(*(ptr), void),                        \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>       601 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/compiler_types.h:376:27: error: expression in static assertion is not an integer
>       376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>           |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>           |                                                        ^~~~
>     include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |         ^~~~~~~~~~~~~
>     include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>        20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>           |                       ^~~~~~~~~~~
>     include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>       601 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from include/uapi/linux/posix_types.h:5,
>                      from include/uapi/linux/types.h:14,
>                      from include/linux/types.h:6,
>                      from include/linux/kasan-checks.h:5,
>                      from include/asm-generic/rwonce.h:26,
>                      from arch/s390/include/asm/rwonce.h:29,
>                      from include/linux/compiler.h:251,
>                      from include/linux/array_size.h:5,
>                      from include/linux/kernel.h:16:
>>> arch/s390/mm/gmap.c:212:72: error: 'struct page' has no member named 'pt_list'; did you mean 'pcp_list'?
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                                                                        ^~~~~~~
>     include/linux/stddef.h:16:58: note: in definition of macro 'offsetof'
>        16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>           |                                                          ^~~~~~
>     include/linux/list.h:601:9: note: in expansion of macro 'container_of'
>       601 |         container_of(ptr, type, member)
>           |         ^~~~~~~~~~~~
>     include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
>       645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
>           |         ^~~~~~~~~~
>     include/linux/list.h:868:27: note: in expansion of macro 'list_next_entry'
>       868 |              pos = n, n = list_next_entry(n, member))
>           |                           ^~~~~~~~~~~~~~~
>     arch/s390/mm/gmap.c:212:17: note: in expansion of macro 'list_for_each_entry_safe'
>       212 |                 list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> 
> vim +212 arch/s390/mm/gmap.c
> 
>     187	
>     188	/**
>     189	 * gmap_free - free a guest address space
>     190	 * @gmap: pointer to the guest address space structure
>     191	 *
>     192	 * No locks required. There are no references to this gmap anymore.
>     193	 */
>     194	static void gmap_free(struct gmap *gmap)
>     195	{
>     196		struct page *page, *next;
>     197	
>     198		/* Flush tlb of all gmaps (if not already done for shadows) */
>     199		if (!(gmap_is_shadow(gmap) && gmap->removed))
>     200			gmap_flush_tlb(gmap);
>     201		/* Free all segment & region tables. */
>     202		list_for_each_entry_safe(page, next, &gmap->crst_list, lru)
>     203			__free_pages(page, CRST_ALLOC_ORDER);
>     204		gmap_radix_tree_free(&gmap->guest_to_host);
>     205		gmap_radix_tree_free(&gmap->host_to_guest);
>     206	
>     207		/* Free additional data for a shadow gmap */
>     208		if (gmap_is_shadow(gmap)) {
>     209			struct ptdesc *ptdesc;
>     210	
>     211			/* Free all page tables. */
>   > 212			list_for_each_entry_safe(ptdesc, next, &gmap->pt_list, pt_list)
>     213				page_table_free_pgste(ptdesc);
>     214			gmap_rmap_radix_tree_free(&gmap->host_to_rmap);
>     215			/* Release reference to the parent */
>     216			gmap_put(gmap->parent);
>     217		}
>     218	
>     219		kfree(gmap);
>     220	}
>     221	
> 
