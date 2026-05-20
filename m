Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C32E9ED6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 06:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258229; cv=none; b=ev6g8NLn9Tm+RVL60b4E8yt83ZAEuPlAtRpa/l4ftxDbKZMHE6IAGeV7CoJAZ1TmiIN3wd4SotN4NICCJUIkOx8zBvIBqQ2EmuDBCsgoxwII4zMJQu4ikxo2NdNvEbdAU+6trPD1PQVXeFHL0x8rMxGViyDwqdNZmZf4sdxBxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258229; c=relaxed/simple;
	bh=4eh7OI4YeUKaNoJbnkWoq3HktROaoLSIjldeZv3g3d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHRjgLAHvAZtRkkgzKWiXkWFBhkueEFobhFwo9O2+tSBdfyb6iWSYglH42/2U6unENVnQB/7aH1fTEm6mM74KOtDOf07F/OPjF4UUYX1GVwSlQfudGGUhUw36f4vWCEMrKn6mBqgAxQ2ldz8+vp+aLUWMiMfzHYuk28IHnILzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBSYkbES; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBSYkbES"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2be75f658f3so4136625ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 23:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779258227; x=1779863027; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1suTFoH1EtOKjY9tGXkwvOUanGUsdAx5moIqDv9CmZQ=;
        b=eBSYkbESOr+U7bZ+GWR9HQFBwSbyoyXqXwawvk7HUgMKt889M/s3U/2MwxPP6Y4IXZ
         ROQK3UMxSGMb8admbiRh5aJPzjy0p6+rOqDQyqb2q88EIcwC8zjM6LKbtH55RXnSSidM
         OvuMxzwUw9Kg2HguVkigG7TCxFcGprrt3/LdOywMDACyXzRXIGJr8QfPc5FHB8eCKfqr
         sX50PP5f/B/fwyysSsA4mqPbzdHWQvkvER+gczHwpKN7cOValbqKmR8voiRF8CHzAVIi
         /aic4F6JS+onuN77DelFOfDmI+Wyl6tXPG1dffw9GAHB26HyRv4/LuOjFNeIeY9UFEyX
         dkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779258227; x=1779863027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1suTFoH1EtOKjY9tGXkwvOUanGUsdAx5moIqDv9CmZQ=;
        b=jlolMDuntDVfmlE1YAxd0jYklLrsABjE+rhXPWh2E+NpfhIpLZluoCjoSSZ3sjagxh
         KC3Geq8OYlzAwVfBqW4FKwyEqE1zJw5TvUOAW7VcWqEMoN7I4uGu4h14U182XGivab2N
         m8naK3xiWFmQVe0erAp+8bCMhcOfBEG0yJFLWacH8dNehSFax29QzjbMvtVJlF29cCuh
         wMnfu9FT3kPeADJIZbx1YW8SXkkg5DLHrQiBoEmLuQd0B+CB9OoP1DqHOGHuuaRuyODZ
         bI05lsSrkoaDTHo4vNyjZSFAWQ46Ymkz1CoFpUDcowbj3/LS2z7blVgcJvx6X61xutKO
         7Q5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9BT/WHRXtE3Os5nTsMJv1oCydqAkyxgZP2LcqKMenEE5MEIMXl/Pvwn4vgRT/cQd+5QJB3zpUFhjyKG3jH@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0PgkHBlCN794NGurKGl8eU85tU1uVV0V8XMECmETplsJfKp/V
	rY2ex78jOmuAQIfskDd1zOi0zMKaRvB7p4BPEtB0PRYKhdnUKosDlU1E
X-Gm-Gg: Acq92OGTTIi/14ShSCis0hJAWbBxC1pXzWf4JE/zESXWjhxkJhKOSPxd9c6yecs8F2W
	Bbfm4T6UIw9R2cQjvnm9dVnsH2rST5sQHy+6GJpmjwvwrHa7gnPNwnod0dZJoqbkURtHcT+PlcS
	C9e0dkunKv1n7g+lE/ba+XF4QDbjuPQxEPo7/AKBgTg0wr3Sjxg2MxbNUoFtS2+qKascMNMbyq2
	JqQNhFyeWvTqptkIKmrPbkuzocBRrObpLXNyMs7uwKwiJyiwzsYIKl9Y0W3Pd+ajadQm4IEFjc9
	0RZQGBiGP7WqRezmEJNlXrhjnxut6O9UyeQyyl5PWxNxeF+JnIBHl8kh1S8Dy+oPo3dqU24n2FZ
	y7Sei5hl8OE7UXtJR+ZHaXPH5sWe3INZMsa0X0lXFuvKh0VJJqRIGyDvCDRC2/qhTsAcRIp3tT+
	0lkM6+t63qvhSiKm2hC0JPXISTihfFTdNVxC5+1Zu6XW4t9LUohn9buhTiH0SEnMxtgbK6
X-Received: by 2002:a17:903:37ce:b0:2bd:a403:1d82 with SMTP id d9443c01a7336-2bda4031ef2mr184057385ad.21.1779258226945;
        Tue, 19 May 2026 23:23:46 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb35sm204241485ad.12.2026.05.19.23.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:23:46 -0700 (PDT)
Date: Wed, 20 May 2026 14:23:41 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Kairui Song <kasong@tencent.com>, 
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org
Subject: Re: [akpm-mm:mm-new 323/362] mm/memcontrol-v1.c:651:31: error:
 implicit declaration of function 'swp_cluster_offset'
Message-ID: <ag0mdxBWcrZ8hxPP@KASONG-MC4>
References: <202605200624.e9eMvkBW-lkp@intel.com>
 <20260519152620.b7b5fd2d68d635ec8d34ad2c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519152620.b7b5fd2d68d635ec8d34ad2c@linux-foundation.org>

On Tue, May 19, 2026 at 03:26:20PM +0800, Andrew Morton wrote:
> On Wed, 20 May 2026 06:16:25 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> > head:   ac33089a65a951edf4365b1ff7fbe5b5e8062d06
> > commit: dc1675a14ba774891fdf5212b7bedc7f50661862 [323/362] mm/memcg, swap: store cgroup id in cluster table directly
> > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605200624.e9eMvkBW-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200624.e9eMvkBW-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605200624.e9eMvkBW-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mm/memcontrol-v1.c: In function '__memcg1_swapout':
> > >> mm/memcontrol-v1.c:651:31: error: implicit declaration of function 'swp_cluster_offset' [-Wimplicit-function-declaration]
> >      651 |         __swap_cgroup_set(ci, swp_cluster_offset(folio->swap), nr_entries,
> >          |                               ^~~~~~~~~~~~~~~~~~
> 
> Thanks.  I added the below to fix the build, but I've no reason to
> believe that it's correct.
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-memcg-swap-store-cgroup-id-in-cluster-table-directly-fix
> Date: Tue May 19 03:23:38 PM PDT 2026
> 
> "fix" CONFIG_SWAP=n build
> 
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Chengming Zhou <chengming.zhou@linux.dev>
> Cc: Chris Li <chrisl@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Kairui Song <kasong@tencent.com>
> Cc: Kemeng Shi <shikemeng@huaweicloud.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Nhat Pham <nphamcs@gmail.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Shakeel Butt <shakeel.butt@linux.dev>
> Cc: Youngjun Park <youngjun.park@lge.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  mm/swap.h |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- a/mm/swap.h~mm-memcg-swap-store-cgroup-id-in-cluster-table-directly-fix
> +++ a/mm/swap.h
> @@ -482,5 +482,11 @@ static inline int swap_zeromap_batch(swp
>  {
>  	return 0;
>  }
> +
> +static inline unsigned int swp_cluster_offset(swp_entry_t entry)
> +{
> +	return 0;
> +}
> +
>  #endif /* CONFIG_SWAP */
>  #endif /* _MM_SWAP_H */
> _
> 

Thanks for the fix, this is not wrong at the moment, memcg1's swap code
is dead code with !CONFIG_SWAP so filling anything there is fine.

I didn't notice that memcg1 won't filter out the swap code when
!CONFIG_SWAP. So following patch should be better:

Just eliminate the dead code. It should be put before this series,
there will be a minor conflict in memcontrol.h as a few declarations
are moved by this, but should be easy to solve. I can send a rebased
version of this series if the conflict is too trouble some to solve,
or we can clean this up later and just keep this dummy swp_cluster_offset
for now.

From 55dd3196e47f3d148edb01f2a37057e6af4bcdaf Mon Sep 17 00:00:00 2001
From: Kairui Song <kasong@tencent.com>
Date: Wed, 20 May 2026 11:14:13 +0800
Subject: [PATCH] mm/memcg: v1: guard swap helpers under CONFIG_SWAP

These helpers are essentially dead weight when CONFIG_SWAP is disabled,
so just guard them with the right ifdef, we will have a smaller vmlinux:

./scripts/bloat-o-meter mm/memcontrol-v1.o.old mm/memcontrol-v1.o
add/remove: 0/3 grow/shrink: 0/0 up/down: 0/-473 (-473)
Function                                     old     new   delta
__UNIQUE_ID_addressable___SCK__preempt_schedule_53       8       -      -8
memcg1_swapin                                 12       -     -12
memcg1_swapout                               453       -    -453
Total: Before=17932, After=17459, chg -2.64%

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/memcontrol.h | 11 ++++++-----
 mm/memcontrol-v1.c         |  2 ++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index dc3fa687759b..1e02f0afecb6 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -1899,9 +1899,6 @@ static inline void mem_cgroup_exit_user_fault(void)
 	current->in_user_fault = 0;
 }
 
-void memcg1_swapout(struct folio *folio, swp_entry_t entry);
-void memcg1_swapin(swp_entry_t entry, unsigned int nr_pages);
-
 #else /* CONFIG_MEMCG_V1 */
 static inline
 unsigned long memcg1_soft_limit_reclaim(pg_data_t *pgdat, int order,
@@ -1928,7 +1925,12 @@ static inline void mem_cgroup_enter_user_fault(void)
 static inline void mem_cgroup_exit_user_fault(void)
 {
 }
+#endif /* CONFIG_MEMCG_V1 */
 
+#if defined(CONFIG_SWAP) && defined(CONFIG_MEMCG_V1)
+void memcg1_swapout(struct folio *folio, swp_entry_t entry);
+void memcg1_swapin(swp_entry_t entry, unsigned int nr_pages);
+#else
 static inline void memcg1_swapout(struct folio *folio, swp_entry_t entry)
 {
 }
@@ -1936,7 +1938,6 @@ static inline void memcg1_swapout(struct folio *folio, swp_entry_t entry)
 static inline void memcg1_swapin(swp_entry_t entry, unsigned int nr_pages)
 {
 }
-
-#endif /* CONFIG_MEMCG_V1 */
+#endif
 
 #endif /* _LINUX_MEMCONTROL_H */
diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 433bba9dfe71..8fb02dc5b259 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -603,6 +603,7 @@ void memcg1_commit_charge(struct folio *folio, struct mem_cgroup *memcg)
 	local_irq_restore(flags);
 }
 
+#ifdef CONFIG_SWAP
 /**
  * memcg1_swapout - transfer a memsw charge to swap
  * @folio: folio whose memsw charge to transfer
@@ -704,6 +705,7 @@ void memcg1_swapin(swp_entry_t entry, unsigned int nr_pages)
 		mem_cgroup_uncharge_swap(entry, nr_pages);
 	}
 }
+#endif /* CONFIG_SWAP */
 
 void memcg1_uncharge_batch(struct mem_cgroup *memcg, unsigned long pgpgout,
 			   unsigned long nr_memory, int nid)
-- 
2.54.0
