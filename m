Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545131B0F17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702364; cv=none; b=VMKUBiFzJp74YEPFfrts5dxRI1b3cv9lVOQVy4O2/Ev9ZXWNK+W7ejIqgXYhPAftLKRdb5djUSpIFpQTiYJQlNecZuMIpxRarKE9nJSnOZbJTJN+29n2MfniuBzUx9PHoal8QEz28CB5k2GizXAhmcvl5bhQflp2MC7AA9nH4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702364; c=relaxed/simple;
	bh=ZhXES0ZbSeNJ1gyds2iF0Qt0L9e6b4laYLr8B95hYoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Lzfmj3FEPlUn9okjgjm4gQNxvCt98MctbFV4nLVvGSSWw3PgX7GWcp+odSau/qCUeoOQo03OHHKKKw1l1JX3rxE6u5J7om6aGqxvlJqJ3p5NN51c32SLoDsQbdsvGMt5n8UvVS9HoE8hceeTUxhbdzQPuT0p8OPC1U78xh/pcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqPwdO6R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqPwdO6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750702361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iav4YsZh0lX7sUJ5ofhiLBwN9GmAGN5M/lgmtGwU0kw=;
	b=dqPwdO6RgoXNENwtjBmYSlleDe1x2YVRFMqyTYsfiH2MAyJvqBZrDfsgtS8lmOcghDdhNw
	GyXDAeoDmKIX8bW+r0dLJe8+zfhh6p8uC/t7DtgrrEV2koHYBwJULJoZyVt9UXRpu80RrO
	pxEa71rVaLqDqlaXm3REJRMAbbWhHiE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-2kCoUoN7OGyDyVcHbmQt3g-1; Mon, 23 Jun 2025 14:12:39 -0400
X-MC-Unique: 2kCoUoN7OGyDyVcHbmQt3g-1
X-Mimecast-MFC-AGG-ID: 2kCoUoN7OGyDyVcHbmQt3g_1750702359
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so728566185a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 11:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750702359; x=1751307159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iav4YsZh0lX7sUJ5ofhiLBwN9GmAGN5M/lgmtGwU0kw=;
        b=jdgQ7QhY/MyhkBo/iR8WIHV0kicRwpHorubn1D8X8nI/bLJBuYHA0tRDYJ54GyjYON
         bu1Ndw46nPbGvTwxZpkAynEk1t0s2JhHfTDmk9vPhGeOKazDo1frIRBt1GyLAzWUTt9z
         gtgbcQ8JVz2InSDgnGdzBlhrgxhrmwnbAKZIAHaszTb4inb7F8hLVarry+uFfea9g/h5
         96W3W+GyjddlWvoHHgAluNYc21n9d43t3q76aC/TWHXErneEFUnjn41M42WmLyr3ZiRm
         miBDNzIEvZ79iG0ci6BZ6iJX0ePme4Wh+AHQBb2HaJAM0UnUGGl63LpkezcCKMmH5gYP
         ax6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV22Zo4VtPRu4u0uOWjRxObUmxOFchwU+aM0CWHWjqvYV7fqt8pwMDEbOFZOH9C3Cmu5u2DgHhfdcZr5mh2@lists.linux.dev
X-Gm-Message-State: AOJu0YyJcTxMgft7BqDsI6b/Dp7INHYrtRpYNQ1L9v5yLiPqNeHRVJQw
	IS2u1Hoi7HFVQk//UVypICd3cQOkSFI5m7yuaXSKn80d1rNILrCHyp/5spqznDGQXBYO4bu8k8Z
	/ZDkRyEadg5p9ba7/ktt7+kHVsmL+I0tzT3ysnfUPr5sBL6UNLYWWxz/WZG4tB/Hkrl8=
X-Gm-Gg: ASbGncspKhm9B45YXpG7r9xC0iBVxjQKvab3iv78lPgv0+TU0EAsD+Cf+ZAYqCWHiio
	wMTTaX5/GVweOyjXNShuqpTMtBeuuwcpp9cqOfAmPVlHEsc6YPH3mqrcQBNZqPCjt8MO/vbspjx
	wQn7aqkTmc++GCQam6rC2mhcYojkvusgSXHCsZ59RC267j/OQ2Rhs8Tj3UQ4DP/2ZKBMqc9D8T2
	zZtxON0sMN7et/AXxM5RGv280AHMng+l6r5ZActE2uedOp+jFhtPQxWXYKIoFLZhGG4olL4sVbm
	y5mn//YVsCkvAQ==
X-Received: by 2002:a05:620a:838a:b0:7d3:910e:4a76 with SMTP id af79cd13be357-7d41ec19ed4mr68829685a.7.1750702359192;
        Mon, 23 Jun 2025 11:12:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgT47ZCKXFLELEORYNnyqp2jHGSbfohR2YiK4ItxepExn16fOZExu87ZTR5++yYdLc7Raq8w==
X-Received: by 2002:a05:620a:838a:b0:7d3:910e:4a76 with SMTP id af79cd13be357-7d41ec19ed4mr68825685a.7.1750702358681;
        Mon, 23 Jun 2025 11:12:38 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99efa3esm415953685a.75.2025.06.23.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:12:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:12:34 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
Message-ID: <aFmZEtZWtnFCj3gm@x1.local>
References: <20250620190342.1780170-5-peterx@redhat.com>
 <202506230216.JVgQj2Si-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202506230216.JVgQj2Si-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Eb76NpsxDOd0ZSNip6yW4pIgL9_8XBQKTGlBHFH2OQ_1750702359
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jun 23, 2025 at 03:09:13AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20250620]
> [cannot apply to akpm-mm/mm-everything linus/master v6.16-rc2 v6.16-rc1 v6.15 v6.16-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Introduce-vm_uffd_ops-API/20250621-030557
> base:   next-20250620
> patch link:    https://lore.kernel.org/r/20250620190342.1780170-5-peterx%40redhat.com
> patch subject: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
> config: i386-randconfig-061-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506230216.JVgQj2Si-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506230216.JVgQj2Si-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    mm/shmem.c: note: in included file (through include/linux/shmem_fs.h):
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> --
>    mm/hugetlb.c:669:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
>    mm/hugetlb.c:740:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
>    mm/hugetlb.c:807:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
>    mm/hugetlb.c:5798:20: sparse: sparse: context imbalance in 'move_huge_pte' - different lock contexts for basic block
>    mm/hugetlb.c: note: in included file:
>    include/linux/mm.h:1391:22: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock
>    mm/hugetlb.c: note: in included file (through include/linux/hugetlb.h, include/linux/migrate.h):
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> --
>    mm/userfaultfd.c:270:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
>    mm/userfaultfd.c:412:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
>    mm/userfaultfd.c:498:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
>    mm/userfaultfd.c: note: in included file:
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
> >> include/linux/userfaultfd_k.h:90:17: sparse: sparse: cast from restricted uffd_flags_t
>    mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
>    include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'move_pages_pte' - unexpected unlock
> 
> vim +90 include/linux/userfaultfd_k.h
> 
>     87	
>     88	static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
>     89	{
>   > 90		return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
>     91	}
>     92	

Sigh.. I thought the cast would helped to tell sparse on this.  Looks like
I need __force..

I'll squash below change when repost:

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 6064f9542d5b..6c5ca68204dd 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -87,7 +87,7 @@ extern vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason);

 static inline enum mfill_atomic_mode uffd_flags_get_mode(uffd_flags_t flags)
 {
-       return (enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
+       return (__force enum mfill_atomic_mode)(flags & MFILL_ATOMIC_MODE_MASK);
 }

 static inline bool uffd_flags_mode_is(uffd_flags_t flags, enum mfill_atomic_mode expected)

-- 
Peter Xu

