Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B8749A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726281399; cv=none; b=BqW6B3zF2u1nJOCCq7IGmwZ4NyEZyUF490Kmz7MFfYidmQtYota6hlv43rUwpKscKRI4VPvD/c6D15fLst3ddoWj2bUkLPZqJID1L18LH6Lru2FM57B5SVTCgLF+fkMBzlOwXDWrsxPdVSrC1BjmfQqIgb4lwxOP5s6pftI1kgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726281399; c=relaxed/simple;
	bh=FNXBYbdWzNgfjDSkNhEIFA6F9hPfy82GpWvz2tMAu1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVbj+y3kwsg6yArgS9gliezWQxWckCKle2QPjgf8esF18ACYWZPyG7gzoDanhTy6UpNiSWLfSRyuF/vsIVGBqAwpXb3u+TC+r2R7n79K8Ha1nIdUxExXVhtbzD1howPqFYwBwnll89Z51UMsctB8PYtiFRUxj6vqymlOokkbo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpteD+5K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpteD+5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726281398; x=1757817398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNXBYbdWzNgfjDSkNhEIFA6F9hPfy82GpWvz2tMAu1M=;
  b=bpteD+5KEmyxdImBPVcWbfu1E3r1stkjzlq07sGCY16aoYaUlgrlU3AZ
   aa80anSpbZTmd8D27ATujMlrF6hyJbBUWhzvJPSCiGIjPy9hEAuVD8qt/
   u+r8izDTUZRbsTd5Y6YeE1M4L5SbW9GWp6tQoEFWwwjQVE/rtcMmQ7EWO
   wOlX3LlyneP5g2LyejJQiuBc7ALZHiOw7AdqwMquEfCpBMVx/WJbGy8YJ
   v1Jv8KtFTO5Xe+VoN/Js8O9VlOtwHNpX4dwqxkCA6flMz7I7nA2YhIskf
   TRXJrVjaP0KLbuYNKZjLnDAg5jWy18XUxjjmoDv2pUA2KVCDtOewzyn0g
   A==;
X-CSE-ConnectionGUID: TPYQmwcEQym/r5RH1CeD2A==
X-CSE-MsgGUID: IWNTyILKTh+j6f8jfAmJwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25132702"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25132702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 19:36:37 -0700
X-CSE-ConnectionGUID: 78kiEkccRlW2tCXF4VPHKw==
X-CSE-MsgGUID: fhJIjyD5TmSUUbtf7mBzTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72659398"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 19:36:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spIeH-0007Gg-2O;
	Sat, 14 Sep 2024 02:36:33 +0000
Date: Sat, 14 Sep 2024 10:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2820/30000] drivers/tty/tty_buffer.c:175:2:
 error: implicit declaration of function 'printk_safe_enter'
Message-ID: <202409141036.Dno2bUGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5a1d9701155c6908c76c68951170f10279685143
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2820/30000] tty: fix possible deadlock in console_unlock
config: x86_64-buildonly-randconfig-003-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141036.Dno2bUGL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141036.Dno2bUGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141036.Dno2bUGL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/tty_buffer.c:175:2: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
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


vim +/printk_safe_enter +175 drivers/tty/tty_buffer.c

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
