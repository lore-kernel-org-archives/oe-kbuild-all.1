Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329A433A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723952; cv=none; b=En4ZgZHHwde9d5QK59vLmp02GuzdBA7xbucVKzjF2Kvvv6xFRXgY5Ja0aYpZ4cbs4vCsk1IL7KIQ2vrT8hrf+1YWhn2Z54WqdVptT5SLVqTGEaFHgPar1iO4xYcZexFQZClHzjE+TBW6Rsz5kPhKqCaof6CcOKJl9kvgGv3XOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723952; c=relaxed/simple;
	bh=mV33ujwTjAwD7XIcAfkMjjE/1FDu2YjXmR7k3PEYnPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ra1jtXU0cROVyRCrgduJs7Ex7LETuHcgGyNJQq1FWlpZ43xVBPEGPFgNF7Si5YaTcsBe5UyQh2TjP/PUxFgncWC/JpwxcgtZVngGnbj+vPZj4OIXEgKR5/giPks3BiVSybTOYD1wiKj6pn6zVtKvtSNIsNpFbp8rpxFOiAXehQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyJlTLHj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyJlTLHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732723950; x=1764259950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mV33ujwTjAwD7XIcAfkMjjE/1FDu2YjXmR7k3PEYnPo=;
  b=RyJlTLHj1Jx8r/W+wOr1qtmGD70nd1u90lnP6JnmZHijv4poMjS0u/jk
   tshGE0LBjL1xLvufzKtRUEEMdCU9rX5U5J0cGE8NzSwItrNEMuc8kHaST
   Vy47UOcGpiFHmWg2zMvrl9D6PDzBbngGN3aHyNnf0OKH7+0EQhanjYgI2
   9DEATVzVBf8cJHZmLnanU5mizBTs5cJXlkCME3wivrqwCIlpsKqQ23RgM
   ojIQovALn7R1qD/kSRSQK4kXAdelhv33S26/9h3wPfLWe8POPElWQ0RK9
   4LRm6AHUmAx7oiOwo9oAqGKPpngqUaySrR6pykF767CJKzCGwKy5AGJwO
   g==;
X-CSE-ConnectionGUID: i+SrYY9MQlKTSZl5tCrjWg==
X-CSE-MsgGUID: 7GQbKHIVSDawn1Fv8LIWxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="35798698"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="35798698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:12:29 -0800
X-CSE-ConnectionGUID: Q8v3yncNQsWSsd8rsjQGjA==
X-CSE-MsgGUID: W7TxdIchTbGUNPhYX/IvOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92820564"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 08:12:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGKeP-00087e-0Y;
	Wed, 27 Nov 2024 16:12:25 +0000
Date: Thu, 28 Nov 2024 00:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1312/1312]
 drivers/tty/tty_buffer.c:170:9: error: implicit declaration of function
 'printk_safe_enter'; did you mean 'printk_safe_init'?
Message-ID: <202411280023.3EwZG5dg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f763890ac28e4d36527b22a830c5e95cae55470
commit: 325d9be9a6518184aec9fdbd87f11759b1e32a56 [1312/1312] tty: fix possible deadlock in console_unlock
config: arm64-randconfig-002-20241127 (https://download.01.org/0day-ci/archive/20241128/202411280023.3EwZG5dg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280023.3EwZG5dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280023.3EwZG5dg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/tty_buffer.c: In function 'tty_buffer_alloc':
>> drivers/tty/tty_buffer.c:170:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_safe_init'? [-Werror=implicit-function-declaration]
     170 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_safe_init
   drivers/tty/tty_buffer.c:172:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_safe_init'? [-Werror=implicit-function-declaration]
     172 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_safe_init
   drivers/tty/tty_buffer.c: In function '__tty_insert_flip_char':
   drivers/tty/tty_buffer.c:386:45: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     386 |                 *flag_buf_ptr(tb, tb->used) = flag;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   In file included from drivers/tty/tty_buffer.c:8:
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   drivers/tty/tty_buffer.c:387:39: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     387 |         *char_buf_ptr(tb, tb->used++) = ch;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/tty.h:69:23: note: destination object 'data' of size 0
      69 |         unsigned long data[0];
         |                       ^~~~
   cc1: some warnings being treated as errors


vim +170 drivers/tty/tty_buffer.c

   137	
   138	/**
   139	 *	tty_buffer_alloc	-	allocate a tty buffer
   140	 *	@tty: tty device
   141	 *	@size: desired size (characters)
   142	 *
   143	 *	Allocate a new tty buffer to hold the desired number of characters.
   144	 *	We round our buffers off in 256 character chunks to get better
   145	 *	allocation behaviour.
   146	 *	Return NULL if out of memory or the allocation would exceed the
   147	 *	per device queue
   148	 */
   149	
   150	static struct tty_buffer *tty_buffer_alloc(struct tty_port *port, size_t size)
   151	{
   152		struct llist_node *free;
   153		struct tty_buffer *p;
   154	
   155		/* Round the buffer size out */
   156		size = __ALIGN_MASK(size, TTYB_ALIGN_MASK);
   157	
   158		if (size <= MIN_TTYB_SIZE) {
   159			free = llist_del_first(&port->buf.free);
   160			if (free) {
   161				p = llist_entry(free, struct tty_buffer, free);
   162				goto found;
   163			}
   164		}
   165	
   166		/* Should possibly check if this fails for the largest buffer we
   167		   have queued and recycle that ? */
   168		if (atomic_read(&port->buf.mem_used) > port->buf.mem_limit)
   169			return NULL;
 > 170		printk_safe_enter();
   171		p = kmalloc(sizeof(struct tty_buffer) + 2 * size, GFP_ATOMIC);
   172		printk_safe_exit();
   173		if (p == NULL)
   174			return NULL;
   175	
   176	found:
   177		tty_buffer_reset(p, size);
   178		atomic_add(size, &port->buf.mem_used);
   179		return p;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
