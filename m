Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A8C29A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730000773; cv=none; b=UoeJP/FS1zc4kxl8OyLcWTb2ZSUrvKmPULu4H5qUl8EkCq1tQGZHv30c11wGq2e7cy7nG4E3kp2+r2tEkOCo28RIIeZa2tGs8dd1mvDno/59MTrSqbcrqruT+yBnApfO2/hbsTbxGPDI9PAqBYMs6IMEjUEcfa0jKm0FrEFhCRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730000773; c=relaxed/simple;
	bh=g3QdbvcVLACWZ0+DzoK2X8NaMKq0/Ni2vDXGwwq9Uy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gU5SVNIeB4+Jgx4Amuqmad3IlqshIRFVllIU9uTMWuzt591FbGfUjjmBVQlq6KfAXXQZ9jh5OmERAEbThtqTIKkp4QdEegK4YcPYYhUdoKAt13Tu0MO+63r9Hmua6Z7orh65GJmO4O7AxeKW4Od621zWcGTh+10pharSP8dzl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POCBUEYs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POCBUEYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730000771; x=1761536771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g3QdbvcVLACWZ0+DzoK2X8NaMKq0/Ni2vDXGwwq9Uy0=;
  b=POCBUEYs6ZSLKMqrmkcM6YQQoGQA2ILnBMY+oKlSW782DnXdkqdq9jUw
   XWtx3S5IeHZCZuG96kHfWRJ4fXISVcQc3W68ll/uv6ZBLPqrPe7O8RoES
   C3L8TX5bkesEuiEugLhYzKb6Ri3dZ+kcqx6UPDAyC+ZXxYRLf+7DzEWHw
   OeImI1GFBeAgvkNUU4XnF/Wn4BWV8Rjzf0kxZCZthLMQZJd91KYcF2uwx
   U3Ff4Ngh7EBDjtFuzP1vsklILE8tc8VOzkE6na65ZVVvRugM54kYfLYar
   qrr5ptWAFqpZ1LuGyKKEY5RndwdMHmCTi/JqXQphqZLIQ7mMZMRICQZxc
   g==;
X-CSE-ConnectionGUID: W1ffMDbJRiinimxXmvtriw==
X-CSE-MsgGUID: sIHCrgdRSlqLW50fyXZJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29815971"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29815971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:46:08 -0700
X-CSE-ConnectionGUID: HAHKFlqsQNaR4cqfLG3RTw==
X-CSE-MsgGUID: caca+UUHSYm9yFJL4jdYyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85242922"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 20:46:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uE8-000aKe-2l;
	Sun, 27 Oct 2024 03:46:04 +0000
Date: Sun, 27 Oct 2024 11:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2208/30000] drivers/tty/tty_buffer.c:177:2:
 error: implicit declaration of function 'printk_safe_exit'
Message-ID: <202410271126.TEOt1E2D-lkp@intel.com>
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
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2208/30000] tty: fix possible deadlock in console_unlock
config: x86_64-buildonly-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271126.TEOt1E2D-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271126.TEOt1E2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271126.TEOt1E2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/tty_buffer.c:175:2: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
     175 |         printk_safe_enter();
         |         ^
   drivers/tty/tty_buffer.c:175:2: note: did you mean 'printk_nmi_enter'?
   include/linux/printk.h:158:20: note: 'printk_nmi_enter' declared here
     158 | static inline void printk_nmi_enter(void) { }
         |                    ^
>> drivers/tty/tty_buffer.c:177:2: error: implicit declaration of function 'printk_safe_exit' [-Werror,-Wimplicit-function-declaration]
     177 |         printk_safe_exit();
         |         ^
   2 errors generated.


vim +/printk_safe_exit +177 drivers/tty/tty_buffer.c

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
 > 175		printk_safe_enter();
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
