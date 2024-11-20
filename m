Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168F01420DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121897; cv=none; b=mdvwdFihj34iPgfoYl6XarT2DGW9GacS6MhvG9zeZYJ26hPjJsWXyDFPDjSxVMfANUxdDbeNv0s9wxP+XxHbYb1KGe01vO/zUoNbog4LTi/6Yw4yMr0jiQofCYYdV4GUAGmgvCqy2z2KmOxcgoHVaDeug0GyD1gfiD//2DzgWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121897; c=relaxed/simple;
	bh=bRnssTf7IZq1B60GGkM2yb8geP6Riqf2Fk5V56nV0IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxJGVdAGffjHdVh7pFzS7TijgYUPPmdwRjNxmTyEVa6IN1X+AHhcT7WYQUAuvBzigowqns/vBh/c6d51KGAI9ZBBPNlzZfncPnmKjwuQX2KdvcU7sbTLv7nbi3Ny34amxugeMiFkDnXeOJn+eSX00SDyJRsP9I/Wj/Zyc4oiJYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km/undOA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km/undOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732121896; x=1763657896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bRnssTf7IZq1B60GGkM2yb8geP6Riqf2Fk5V56nV0IU=;
  b=Km/undOAgNbs/ggZCKDX2kpVXFS2poLPPIzAyV6v6Ae/idk2E+neKKS2
   7KUjoVF6ompn84BiJWbbwO1XSOVJlH9voSzftiEgLU+HYbSLSAoJSoYgS
   tf87WcZPHWoQwA4LFVjtaAa+b3p+wqHxz8urdHd7PzEcTfO5kd0fTHA7o
   haCIVPeozWdPubvE4wUFVsGWDUiV/3nCioLMnbPCP5mOCahdthgFrXJwm
   dcdR6qy6o33aGeMdcyvVGrXRr+SOQ4eZAfeMqVq4WOtoo4KMslsck75Ys
   VERQdHDFRuqjkaQNfhGsGkrUzMiJlyzh4ihpYUoznHoHdPA5c1IriKcSp
   A==;
X-CSE-ConnectionGUID: 7b1TW4CoSty0zEgJT8GVXw==
X-CSE-MsgGUID: G0J5YNCmS+6gkBq7CARu9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="31589773"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="31589773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 08:58:15 -0800
X-CSE-ConnectionGUID: 4MG6NP/ISbuTlB7uG+dZPg==
X-CSE-MsgGUID: SCr5FT6ATQaCpFURPHQ7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="89783977"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 08:58:14 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDo1s-00012N-1X;
	Wed, 20 Nov 2024 16:58:12 +0000
Date: Thu, 21 Nov 2024 00:58:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2461/2461] drivers/tty/tty_buffer.c:177:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202411210035.9JVLQU7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongbo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bf0212daf6239e1b0e65e6dd7ee9fdec378c5dd4
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2461/2461] tty: fix possible deadlock in console_unlock
config: arm64-randconfig-003-20241120 (https://download.01.org/0day-ci/archive/20241121/202411210035.9JVLQU7Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210035.9JVLQU7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210035.9JVLQU7Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/tty_buffer.c: In function 'tty_buffer_alloc':
   drivers/tty/tty_buffer.c:175:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
     175 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> drivers/tty/tty_buffer.c:177:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
     177 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +177 drivers/tty/tty_buffer.c

   142	
   143	/**
   144	 *	tty_buffer_alloc	-	allocate a tty buffer
   145	 *	@port: tty port
   146	 *	@size: desired size (characters)
   147	 *
   148	 *	Allocate a new tty buffer to hold the desired number of characters.
   149	 *	We round our buffers off in 256 character chunks to get better
   150	 *	allocation behaviour.
   151	 *	Return NULL if out of memory or the allocation would exceed the
   152	 *	per device queue
   153	 */
   154	
   155	static struct tty_buffer *tty_buffer_alloc(struct tty_port *port, size_t size)
   156	{
   157		struct llist_node *free;
   158		struct tty_buffer *p;
   159	
   160		/* Round the buffer size out */
   161		size = __ALIGN_MASK(size, TTYB_ALIGN_MASK);
   162	
   163		if (size <= MIN_TTYB_SIZE) {
   164			free = llist_del_first(&port->buf.free);
   165			if (free) {
   166				p = llist_entry(free, struct tty_buffer, free);
   167				goto found;
   168			}
   169		}
   170	
   171		/* Should possibly check if this fails for the largest buffer we
   172		   have queued and recycle that ? */
   173		if (atomic_read(&port->buf.mem_used) > port->buf.mem_limit)
   174			return NULL;
   175		printk_safe_enter();
   176		p = kmalloc(sizeof(struct tty_buffer) + 2 * size, GFP_ATOMIC);
 > 177		printk_safe_exit();
   178		if (p == NULL)
   179			return NULL;
   180	
   181	found:
   182		tty_buffer_reset(p, size);
   183		atomic_add(size, &port->buf.mem_used);
   184		return p;
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
