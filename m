Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6FA1BD9C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808836; cv=none; b=YyDGfMSuP7lVk8E/znqf4I1/bkYUx8wtMSgLkMEkpQzZ2oncU04tQphvo7y9Cq1hTwMeXrVpgs/mGhsMTcRvsRxUinym5OjWTD6ylgaNXnLuTZWQSqVyReo2qMYNChVn9k0KGAfTXqpa9kaMd8lsoCWgHTFcgKvK2yn/5hJvAPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808836; c=relaxed/simple;
	bh=6j4gn110BVeQcSYvW4fwph3QkF0WQOBJsBOfTOg6u9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=La0fhWzfpOWzeWyU5MVGhHXkZgtYK4LLa25wVjwmUBHhK/6xTkj9sTEQQaXaY6LaIczyaWuJiCiY0iNsJDCj4p3f096BTtSVXr/L95Ol4beuziDPAGoV7JwgIyQlfAPNHFoXY0VagOfHr8pG7PlJaJRRNCnQYGWHRsOeRH0oxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGF36sUW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGF36sUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732808832; x=1764344832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6j4gn110BVeQcSYvW4fwph3QkF0WQOBJsBOfTOg6u9k=;
  b=MGF36sUWTo1V1BGwKtJV5f8euIY78CBneF3aWqAI1KPKmXs2GZpaxwni
   XLZc0Xrk2L6Ani6nu/mZs82UnssPZywsSKmPVU1ZTOWu/+1P+ISsHZvrY
   ho3JXfrCKIniLK/bWs1ZzcWEjRVxIN9yAJlNRtAlULLIenmrtrxF6AtpD
   3rGNnndTl5lMq7ZnB9mfoQU0LqQZEpj4z2twyS0AR4Q74qF9dEGjZF+m9
   XiyJmdw/v61Inc4ohetbUCaB/k6jRA0mDac/INtZGqkHZQnSBnhm/y7bC
   99Ci8e5o4BlCHX1mGz0gXpAuBFx9R72GyQsC5dB4qt1Ah0ySHQPh739Mg
   A==;
X-CSE-ConnectionGUID: IgR2qYddRn6hKVceLMLrCQ==
X-CSE-MsgGUID: fRpvi4dlSFuEnJ1cEoc0Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20637130"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="20637130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:47:12 -0800
X-CSE-ConnectionGUID: fqf4uKyTTqeWEUYNPNi2mg==
X-CSE-MsgGUID: 8IcTrri/SjKddprZEkhu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92735296"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 07:47:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGgjU-0009k5-2m;
	Thu, 28 Nov 2024 15:47:08 +0000
Date: Thu, 28 Nov 2024 23:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2461/2461] drivers/tty/tty_buffer.c:177:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202411282331.1ruwHvl7-lkp@intel.com>
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
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: 923efc4dc37c1a7cc91f0dd5dbdc87e0943ad1ae [2461/2461] tty: fix possible deadlock in console_unlock
config: arm64-randconfig-003-20241120 (https://download.01.org/0day-ci/archive/20241128/202411282331.1ruwHvl7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282331.1ruwHvl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282331.1ruwHvl7-lkp@intel.com/

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
