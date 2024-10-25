Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE513E898
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729822719; cv=none; b=LO8H8ppCG5EO4GqYE2SlVqcINFcbfUzNIyFvOJAQWnmFjc+YlCX7RXnyVv1N2mGLhqRfBDDPZ+2U6oDexNPd3O2kSZFySBL3OHHed5glgiL33LdJtIkZdarre0Fnw9BIXCPJqA6XYeOLVFzp/KMx7jxPMfFDIH3TSyW1WbskKP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729822719; c=relaxed/simple;
	bh=7rHdv5ANwHjE2qgw1NnWd9SxkdNIEcBq6Z4uzirTGr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XaY2zf67QyMqKtE81yH31DNwe6f8mu+N08CaIWoaWaco2g3fV60am47SS/Mu0jmtRuy1Z/8BqdYRwO8KGgjTc7aY1OXPIg5o1PdYEyBy5cCbpth6ID9GBWr+g8Sjv4buEy7Taii1s98GhRRNf2wDM2fOzMSb776gOpMBKhKG78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2NlRSU3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2NlRSU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729822718; x=1761358718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rHdv5ANwHjE2qgw1NnWd9SxkdNIEcBq6Z4uzirTGr8=;
  b=I2NlRSU3bZrxkSCQ87NLw+2TPPAMMEuFNACov4bQhs6uZnBaDySKxy/O
   tSOISczwuGzU3I5EZ+Ui9O/gBvqPSidTmW7cX4cyU1fyb862hf6dclZ4t
   I61GYBDSAyVpkBZQzks03aW+NNfll+Hu9gqYAgXYtyJfJz2wgOUIcWSoo
   FQVOuEP24b84ibxCz8QGF1bpoymqC9qZoYDkbL7bdSlBykcmr5AaaESb1
   pHuHmqwnTLNAx2bF/q5rZXVei+/05BvZKEr5wNV6rXVa/nM5lJquk/RaB
   1k1FBFIi6dWjaBskj0F3WxkZyvaFRV6CDYpDViIoYI9ypBkt2rhrz0oAb
   Q==;
X-CSE-ConnectionGUID: 9z2itspFSMeawuv29sjBMQ==
X-CSE-MsgGUID: PGMHp6zVSOOpp3mJWR4sVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29422414"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29422414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 19:18:37 -0700
X-CSE-ConnectionGUID: Gf1/hLnUQSKllS68NwktBA==
X-CSE-MsgGUID: NxH2OJSzRyakwfxtXgk23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="111592638"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2024 19:18:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t49uL-000XSS-0Y;
	Fri, 25 Oct 2024 02:18:33 +0000
Date: Fri, 25 Oct 2024 10:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 3143/23857]
 drivers/tty/tty_buffer.c:172:9: error: implicit declaration of function
 'printk_safe_exit'; did you mean 'printk_safe_init'?
Message-ID: <202410251039.YhQeKMJn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fc5b1a61061cb6d640f3336024fb616182ef2614
commit: 325d9be9a6518184aec9fdbd87f11759b1e32a56 [3143/23857] tty: fix possible deadlock in console_unlock
config: arm64-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251039.YhQeKMJn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251039.YhQeKMJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251039.YhQeKMJn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/tty_buffer.c: In function 'tty_buffer_alloc':
   drivers/tty/tty_buffer.c:170:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_safe_init'? [-Werror=implicit-function-declaration]
     170 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_safe_init
>> drivers/tty/tty_buffer.c:172:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_safe_init'? [-Werror=implicit-function-declaration]
     172 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_safe_init
   cc1: some warnings being treated as errors


vim +172 drivers/tty/tty_buffer.c

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
   170		printk_safe_enter();
   171		p = kmalloc(sizeof(struct tty_buffer) + 2 * size, GFP_ATOMIC);
 > 172		printk_safe_exit();
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
