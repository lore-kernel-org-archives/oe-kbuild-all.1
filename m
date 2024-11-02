Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412114AD20
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 21:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730583538; cv=none; b=Pc8N1csg/vL/cPlgBdZqjgRWyCgOYmjt7adt0uxdh9aC2rIkJMmiqaUmR7TJIXjJneEcuPx6VDWwfXfIn64pHUAN602dyoNgUeO7V17ujMYAdJjaFOBZZsUqP9rJ31MEr990FwoAIBfTOLz6iq68jw9uw2H4Jots7DaIpRIn8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730583538; c=relaxed/simple;
	bh=x8vTW0f+hFrpTPQePTX5JkDK1K2Ph/zMvyfh2wqI4n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MqFbKeI2tPOMAUzrdxPWLugQkKivXPtgty9IpUtt0bLmSKJF7V34THBOMCiwXwUnb6JF9267jNi5g7izR1F8B0wu3/WmsF2jbnIeazoqYz8v0dQ79kaCIudzdcM6Bn6ZNuuLWqpwSCUPxtumyP0z/J5bMzHoA4wQyooKqRe2tGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsWVkvm0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsWVkvm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730583536; x=1762119536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8vTW0f+hFrpTPQePTX5JkDK1K2Ph/zMvyfh2wqI4n4=;
  b=EsWVkvm0Z85YmhDEDo87p48+3rku5x/1by02Zr/XNTetzXWHIyQdgLQs
   iKBj898wfmIUvTcGeYpV4kDVL8LSFYUYA6qdunIG4Ritz5cFm98KWJ8en
   ThK/Jnf/H8qnoZysYPJQ9Cj9eRwTSjNpCeySkq28e+mBIyXOl415nPHA1
   E62O1uw+TAXnD4ijX4FMiY77PiFNBWbUMQ8YZSh7xCrX9qemyTrgwFr1s
   3v0LTbXimkKZ+6cbtYMchRDz+FjhiK7QD8cPrF8Xy5JWmsJqPUT1Fkuij
   r2i3lqHj9VhbhLUFSy+zw/7IvgACfMWKnm2g/gqf49mawPsguse/Osea1
   w==;
X-CSE-ConnectionGUID: 9jCcrK9zR8W9a7ojcQlhMg==
X-CSE-MsgGUID: AT9PVaWbRDqXMjoWf0dYDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29739578"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="29739578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 14:38:56 -0700
X-CSE-ConnectionGUID: TO5YzHXhTZqhUykvqCk13A==
X-CSE-MsgGUID: M+XI3fjfSKSMh2dyGV5qSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83392860"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2024 14:38:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Lpd-000jNd-05;
	Sat, 02 Nov 2024 21:38:53 +0000
Date: Sun, 3 Nov 2024 05:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-group 5/6] io_uring/filetable.h:55:33: sparse:
 sparse: non size-preserving pointer to integer cast
Message-ID: <202411030559.jWlE4R0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-group
head:   a2a81f77e792828fb8e8888c201f2ff1448ecf06
commit: 62db18ef7237fef8c03edb11965d083d439c1a2b [5/6] io_uring: extend io_uring_sqe flags bits
config: i386-randconfig-062-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030559.jWlE4R0e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030559.jWlE4R0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030559.jWlE4R0e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   io_uring/filetable.h:56:35: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/filetable.h:55:33: sparse: sparse: non size-preserving pointer to integer cast
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/filetable.h:56:35: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/filetable.h:55:33: sparse: sparse: non size-preserving pointer to integer cast
   io_uring/filetable.h:56:35: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/filetable.h:55:33: sparse: sparse: non size-preserving pointer to integer cast

vim +55 io_uring/filetable.h

    51	
    52	static inline void io_fixed_file_set(struct io_rsrc_node *node,
    53					     struct file *file)
    54	{
  > 55		node->file_ptr = (__u64)file |
  > 56			(io_file_get_flags(file) >> REQ_F_SUPPORT_NOWAIT_BIT);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
