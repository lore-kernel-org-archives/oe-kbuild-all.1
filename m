Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316915B57C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 20:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727470005; cv=none; b=gX6FR9EGpAxjY+ZeWWGjHx+8Ttu8mhF6jRfc+UwXtajaEbvaE9I5IltzcNsXd2g0b9RmmCvjwcSbWcz06jHYGdmPSBDNXmGfxZXCw8qRLv7dDmuJyvn7XPeUGTsEqeZxVaz+ywykg2DEbxAg5OPG93nZpUmaVtcaot5Dw4ab2Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727470005; c=relaxed/simple;
	bh=AaWakQO6YQepNrsDyuKVRee3sYuV0Y2LFoJ84CbvW38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHFYMj6TrgWxYtlhXinXNkHiQN1suWhxj8KtwqU8TI5oP7JM+yyY6T0jpXm/kTy0hrj7Otf1IPCZ4USDyjzfAEa4OTz+pacyGhmmFAXm3Fz+VMRnqeWXTgZtZc9Y6rVDyCEVC9fZR7EifUQ/gy5KCUC26xszLwyQZ0TzUVPtF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbxEbaU1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbxEbaU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727470003; x=1759006003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AaWakQO6YQepNrsDyuKVRee3sYuV0Y2LFoJ84CbvW38=;
  b=RbxEbaU1X9ODF+SrRJGPaxWG3IowzGMMJ8As9MFELKtyp4Eg+GydyxRg
   leTB1Cp+mmZNrR/TtBBAT7y36UtdZVfgywhMkim13yAXjw8BQTzXZBTHs
   4yMlrXrMurZxlq0brHtpOfiMO3mpQUKcdeDqJrPvnvnh6BUuoBROtbGQl
   0ZZ4HgyduJa2VHF7Q0BcXoVG6XIX7bE16/X20sUruTX6BxpWoZIx56KHH
   2LQM0YjdGa5bMjT6PsgphoUAO0j2sdSuHkq/bFf6fvUV8KNL/8w1LR6Zp
   3aauG1EC+lMkbozkz2U06NdyJkBu3sVDaccVYK0qz2cPIfoOgGNOInbbI
   w==;
X-CSE-ConnectionGUID: U7V545OPQQ+KxINfujNpEA==
X-CSE-MsgGUID: 4WmZt9zyTzCOcfTzlwNxFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26805907"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26805907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 13:46:43 -0700
X-CSE-ConnectionGUID: IKyVv2DyQWynWuv2voBpOw==
X-CSE-MsgGUID: I8mbF8LRRyCC3o7PQ6EGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="76729964"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2024 13:46:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suHrL-000MbT-1J;
	Fri, 27 Sep 2024 20:46:39 +0000
Date: Sat, 28 Sep 2024 04:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2613/30000] drivers/tty/tty_buffer.c:177:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202409280444.fQT7iGoe-lkp@intel.com>
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
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2613/30000] tty: fix possible deadlock in console_unlock
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280444.fQT7iGoe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280444.fQT7iGoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280444.fQT7iGoe-lkp@intel.com/

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
