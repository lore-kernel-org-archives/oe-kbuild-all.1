Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B1A23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ECB/2XqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702344189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MmWLQ8S7dWkSauCMe9+QRo60HBpBohLa6sWyfno5d6Q=;
	b=ECB/2XqNTRlE/8zOg1wEx4sh0BLAdLfumxNmLwgg00Bz7/Eq+Gacit/zk4Kl9/hIonPcna
	aPuo0i3sWCGLtYzZSNrPCrBxnTjl3FB/TMEu28TMo33a69R06Rp9dGsHJHZ2Ynm7f0/SxA
	hIP0NgcZmjMOdeipkJRQ/jfZTJgglV4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-o1RwP8zqOfKVizhJ0VPGhg-1; Mon,
 11 Dec 2023 20:23:06 -0500
X-MC-Unique: o1RwP8zqOfKVizhJ0VPGhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBAA21C05AA0;
	Tue, 12 Dec 2023 01:23:05 +0000 (UTC)
Received: from localhost (unknown [10.72.112.218])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47DF12166B31;
	Tue, 12 Dec 2023 01:23:04 +0000 (UTC)
Date: Tue, 12 Dec 2023 09:23:02 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6231/6992] kernel/events/core.c:7477
 perf_virt_to_phys() warn: always true condition '(virt >= (0)) => (0-u64max
 >= 0)'
Message-ID: <ZXe19jRuQLVb+lLm@MiWiFi-R3L-srv>
References: <202312120428.kUWabWlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202312120428.kUWabWlC-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/12/23 at 04:37am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bbd220ce4e29ed55ab079007cff0b550895258eb
> commit: 8a651e8f1fca74c7c2b033d9a0ad5214ac5d46e4 [6231/6992] riscv: fix VMALLOC_START definition
> config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231212/202312120428.kUWabWlC-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231212/202312120428.kUWabWlC-lkp@intel.com/reproduce)

Thanks for reporting this. While I can't open the reproduce link,
can you double check it?

> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312120428.kUWabWlC-lkp@intel.com/
> 
> New smatch warnings:
> kernel/events/core.c:7477 perf_virt_to_phys() warn: always true condition '(virt >= (0)) => (0-u64max >= 0)'
> drivers/clk/ingenic/tcu.c:455 ingenic_tcu_probe() warn: 'tcu->clk' from clk_prepare_enable() not released on lines: 455.
> 
> Old smatch warnings:
> arch/riscv/include/asm/atomic.h:225 arch_atomic64_fetch_add_unless() warn: inconsistent indenting
> arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

From the config, it has:
------------------------
# CONFIG_MMU is not set
------------------------

On RISC-V, we have definitions as below. So this sounds like a redundant
warning. I will see if I can mute it anyway.

arch/riscv/include/asm/pgtable.h:
#ifdef CONFIG_MMU
......
#else /* CONFIG_MMU */

#define PAGE_SHARED             __pgprot(0)
#define PAGE_KERNEL             __pgprot(0)
#define swapper_pg_dir          NULL
#define TASK_SIZE               0xffffffffUL
#define VMALLOC_START           0
#define VMALLOC_END             TASK_SIZE

#endif /* !CONFIG_MMU */

> 
> vim +7477 kernel/events/core.c
> 
> 5622f295b53fb6 kernel/perf_counter.c Markus Metzger   2009-09-15  7466  
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7467  static u64 perf_virt_to_phys(u64 virt)
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7468  {
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7469  	u64 phys_addr = 0;
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7470  
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7471  	if (!virt)
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7472  		return 0;
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7473  
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7474  	if (virt >= TASK_SIZE) {
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7475  		/* If it's vmalloc()d memory, leave phys_addr as 0 */
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7476  		if (virt_addr_valid((void *)(uintptr_t)virt) &&
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28 @7477  		    !(virt >= VMALLOC_START && virt < VMALLOC_END))
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7478  			phys_addr = (u64)virt_to_phys((void *)(uintptr_t)virt);
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7479  	} else {
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7480  		/*
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7481  		 * Walking the pages tables for user address.
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7482  		 * Interrupts are disabled, so it prevents any tear down
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7483  		 * of the page tables.
> dadbb612f6e50b kernel/events/core.c  Souptick Joarder 2020-06-07  7484  		 * Try IRQ-safe get_user_page_fast_only first.
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7485  		 * If failed, leave phys_addr as 0.
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7486  		 */
> d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7487  		if (current->mm != NULL) {
> 4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7488  			struct page *p;
> 4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7489  
> d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7490  			pagefault_disable();
> 4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7491  			if (get_user_page_fast_only(virt, 0, &p)) {
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7492  				phys_addr = page_to_phys(p) + virt % PAGE_SIZE;
> 4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7493  				put_page(p);
> 4716023a8f6a0f kernel/events/core.c  Greg Thelen      2021-11-10  7494  			}
> d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7495  			pagefault_enable();
> d3296fb372bf74 kernel/events/core.c  Jiri Olsa        2020-04-07  7496  		}
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7497  	}
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7498  
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7499  	return phys_addr;
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7500  }
> fc7ce9c74c3ad2 kernel/events/core.c  Kan Liang        2017-08-28  7501  
> 
> :::::: The code at line 7477 was first introduced by commit
> :::::: fc7ce9c74c3ad232b084d80148654f926d01ece7 perf/core, x86: Add PERF_SAMPLE_PHYS_ADDR
> 
> :::::: TO: Kan Liang <kan.liang@intel.com>
> :::::: CC: Ingo Molnar <mingo@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

