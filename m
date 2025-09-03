Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB1275B18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895066; cv=none; b=EKRnzaut8M4yo+tMNRL1olt0Zmrlf4Epsy3Yb65s0dO1Ytro+41t90768Or2+wMshAcr1Ta9R4fnTsCjKViNSaTi9jVjTVNZ1nEs1scjkwd2KF/tA3f/6BVKgOhf/ukrOEWQnuLdM+lFZ4NxOkZszUINcaLAFffri2dmPNDPTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895066; c=relaxed/simple;
	bh=2bsuSPa5RSiA+pJ8tdEfR/bTf9nbuZTAkLBuJJINhj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee/ABuwAi8+C0xT499vWX4lb3rTJTmmw6wCLUQSVpAA6+4y2YMOx/wyaHiS3WXzAWmEwANpgommxB79uNSw3igK7S6URUcUhvTWztInMEeqm8ZTje7ieXuC103ejZH94TnZDBo+J0IwJwkWirpGgP31ZzYqSMJTl5YNqAoTWdQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkrOwb/S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkrOwb/S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b8b02dd14so20600475e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Sep 2025 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756895063; x=1757499863; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iq+2oZ/KcgO95X7z7Iwm4V3d8FmvBHKC4zBSx2fR9sg=;
        b=hkrOwb/S5RGj7Xcp0WzYJS+I9+jW0Yiu7HbvhGv3r2PHWmoJKYEDACNdLhfNcjVK3U
         O3NhMfO7l744unApEyUmM4fbmNXAlhe5l0Uz6NvHozaUCI98kBcwcHSBTofYV2yihPKE
         b842ayOUYHuyXoaXnf5DZqpoSU+LoqNmNE36W/c6bheuvnqIko5cLDQ/nRqITk1FAK+7
         UuxoCKoJzllWb81NuztBFjZlXVX9Mxf5FVdvZVqBeXC5dIHP4Z7odcOO+HwKVSjmkt+K
         aEPTtUWcfs5NKiivoe2uW/4lAyXPj5myiBXctPkG405wn0wagx7axZwlPrQ/lYAartYa
         yhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895063; x=1757499863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq+2oZ/KcgO95X7z7Iwm4V3d8FmvBHKC4zBSx2fR9sg=;
        b=D5wAvxEQNtQ7hIMyLJtKINjh7BiHIGSeqDLkc8xQEwBubqriLHn3QEkLb+F4/ugKrE
         TH7a7e3OSCqXOsk1ZmdauFJFhTtrqZ8geVbIKnFOEx34e64tWvsLXvHrDEkxREGWA/Ql
         RzBDkgJ/RTYBACMHPT0bY8uS5qHcY08E2jRDqpJAzkIAMzl30B3mZMgiIK0nFZwNeWcK
         3A7Qttux1ZchhqUhSyGuPuSQulPonxMpTQslZ8nTRteAU9gpSFVjvfloSFzUn5YbfNnH
         b7KkSh+mRj7Yeh8YGnL2dwRLOIQ40LMn/H8wpGYA+i/S/MaPODMG/wSRfQtkPY1LxZb+
         SZqA==
X-Forwarded-Encrypted: i=1; AJvYcCUCQuISsfw119b7eHUBJhrTuQXfC9y4/vMeS77EeQC4ipMiwFdk1iU6WOPeUhFYJa4CFEpcRs62BHNNK6Zh@lists.linux.dev
X-Gm-Message-State: AOJu0YzUDKo/Sf3OBCNWIbpd9cwidnGY8emKRBw6a1YMxvGQztbZa3aR
	RUxeGZM56mJhUscysb5sseLb9PKj/kGRX9A1XIOGgWyUx9jNo843qPLc
X-Gm-Gg: ASbGncuSs7pGvutz/Bdvg4XHmQ1eJI6cIhj7prXOo0biAcDbIKz+KUpxWkYk6aEON/v
	KrPVA3KHSzQswY9v5Uay2PHoeLAd+Z7Q1tS2XCbDJB4EYKR5wMFpDwIqhlq9NbLCZMUA3xqVcJx
	eiWGQZzSG6gcxV3wX6l+oZNw9XAUqWVosrP7Od63qFgt03UDkgwNsO2uSEEZyZatEobB6Yak9ti
	AbEiUMC03jV0R3Byo/xxmmH5NwMY5GWpVw+/MpMyAoe2/xaOFD+cWuCp3sFEs8xciPIIHPePpxr
	hV27RLRuHH3g0YGAhBmaGpJh04wGOPUKq6as1MPUilgt7OVOoX7UUktpqxHuvtJXxboXXzv/8ZH
	EEnvvL3cj0OYufwDbasMyjD59vUAj40bqZmdkAlR+xsuunnGa4A==
X-Google-Smtp-Source: AGHT+IHjlg0yHyZ7YsY89pq9m16v4pKhC6s3zw1wicDWknab221B4wj1sid8VcPOZQd1k2UL+vWaMw==
X-Received: by 2002:a05:600c:c8a:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-45b9afeaeefmr51851595e9.16.1756895063039;
        Wed, 03 Sep 2025 03:24:23 -0700 (PDT)
Received: from devbig569.cln6.facebook.com ([2a03:2880:31ff:52::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm22895356f8f.61.2025.09.03.03.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:24:22 -0700 (PDT)
Date: Wed, 3 Sep 2025 03:24:20 -0700
From: Yueyang Pan <pyyjason@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm/show_mem: Add trylock while printing alloc info
Message-ID: <aLgXVIxyFpvZ9PU7@devbig569.cln6.facebook.com>
References: <1491df0ac12a7626b7c9b00e26a6e10adb8c9045.1756827906.git.pyyjason@gmail.com>
 <202509031744.HcibSETe-lkp@intel.com>
 <c41c82f0-e5c3-4c2e-b711-3ddf8fcb0135@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c41c82f0-e5c3-4c2e-b711-3ddf8fcb0135@suse.cz>

On Wed, Sep 03, 2025 at 12:16:45PM +0200, Vlastimil Babka wrote:
> On 9/3/25 11:47, kernel test robot wrote:
> > Hi Yueyang,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Yueyang-Pan/mm-show_mem-Dump-the-status-of-the-mem-alloc-profiling-before-printing/20250903-000616
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/1491df0ac12a7626b7c9b00e26a6e10adb8c9045.1756827906.git.pyyjason%40gmail.com
> > patch subject: [PATCH v2 2/2] mm/show_mem: Add trylock while printing alloc info
> > config: i386-buildonly-randconfig-001-20250903 (https://download.01.org/0day-ci/archive/20250903/202509031744.HcibSETe-lkp@intel.com/config)
> > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509031744.HcibSETe-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509031744.HcibSETe-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from mm/show_mem.c:18:
> >    mm/show_mem.c: In function 'show_free_areas':
> >    mm/show_mem.c:336:49: error: 'NR_ZSPAGES' undeclared (first use in this function); did you mean 'NR_STATS'?
> >      336 |                         K(zone_page_state(zone, NR_ZSPAGES)),
> >          |                                                 ^~~~~~~~~~
> 
> This is from a different patch and being fixed. Interesting that lkp will
> report additional warnings even in presence of prior errors.

Thanks. Understood.

> 
> >    mm/internal.h:560:16: note: in definition of macro 'K'
> >      560 | #define K(x) ((x) << (PAGE_SHIFT-10))
> >          |                ^
> >    include/linux/printk.h:512:26: note: in expansion of macro 'printk_index_wrap'
> >      512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
> >          |                          ^~~~~~~~~~~~~~~~~
> >    mm/show_mem.c:298:17: note: in expansion of macro 'printk'
> >      298 |                 printk(KERN_CONT
> >          |                 ^~~~~~
> >    mm/show_mem.c:336:49: note: each undeclared identifier is reported only once for each function it appears in
> >      336 |                         K(zone_page_state(zone, NR_ZSPAGES)),
> >          |                                                 ^~~~~~~~~~
> >    mm/internal.h:560:16: note: in definition of macro 'K'
> >      560 | #define K(x) ((x) << (PAGE_SHIFT-10))
> >          |                ^
> >    include/linux/printk.h:512:26: note: in expansion of macro 'printk_index_wrap'
> >      512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
> >          |                          ^~~~~~~~~~~~~~~~~
> >    mm/show_mem.c:298:17: note: in expansion of macro 'printk'
> >      298 |                 printk(KERN_CONT
> >          |                 ^~~~~~
> >    In file included from include/linux/spinlock.h:89,
> >                     from include/linux/wait.h:9,
> >                     from include/linux/wait_bit.h:8,
> >                     from include/linux/fs.h:7,
> >                     from include/linux/highmem.h:5,
> >                     from include/linux/bvec.h:10,
> >                     from include/linux/blk_types.h:10,
> >                     from include/linux/blkdev.h:9,
> >                     from mm/show_mem.c:8:
> >    mm/show_mem.c: In function '__show_mem':
> >>> mm/show_mem.c:399:32: warning: unused variable 'mem_alloc_profiling_spinlock' [-Wunused-variable]
> >      399 |         static DEFINE_SPINLOCK(mem_alloc_profiling_spinlock);
> 
> This is the warning
> 
> I think you can simply move the definition to the existing #ifdef
> CONFIG_MEM_ALLOC_PROFILING block above the spin_trylock(). The kernel now
> uses a new enough C standard to allow this and not only at the beginning of
> a cuntion. While not encouraged to do that in general, this seems to be a
> valid use case.
> 

Let me quickly fix both and push v3

> 
> >          |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/spinlock_types.h:43:44: note: in definition of macro 'DEFINE_SPINLOCK'
> >       43 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
> >          |                                            ^
> > 
> > 
> > vim +/mem_alloc_profiling_spinlock +399 mm/show_mem.c
> > 
> >    396	
> >    397	void __show_mem(unsigned int filter, nodemask_t *nodemask, int max_zone_idx)
> >    398	{
> >  > 399		static DEFINE_SPINLOCK(mem_alloc_profiling_spinlock);
> > 
> 
