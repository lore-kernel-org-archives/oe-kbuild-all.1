Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302B219D06A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333761; cv=none; b=dfBf9XhvrFlUroSiHFYTlRsgO2Q/40v7w1t72WK3M0v5Zn7n1x7SqmQmXE72R6zj0e4pHxMw7oGVriM5jXwuAkGC88pDHwVv4TX+Cb+zvJoDs2QOyhLMD+FZYHlt5Es/KJZjteTw5i6GMY075qxRPGesSnehASyCX+Sak3F0OJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333761; c=relaxed/simple;
	bh=iUTKZcrAdb7caFpFVfJdQSP0t9GNUtusPAnatchIUBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttUPm1eYg2QQPqTd+YwW9qHb6EtpOguKvq+//+SF/sTrHmvjX87UXVpQKHMTAp55lumbYhG4GGWXDDlRxZhhdlzE7sbqn36BOWn/ti/Ot/wAA9Es2/EOT0UjExNvkB3bwQ5mu+YyCFLWWEFFdOug+8LfnKk+WYp3bA8SFSzdP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi+bnY8v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi+bnY8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736333759; x=1767869759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUTKZcrAdb7caFpFVfJdQSP0t9GNUtusPAnatchIUBE=;
  b=Hi+bnY8vbpiE9dlwA/Vc5XWnFXw4d+rfuZ2TXSOeEv8qUWMmdamfBnez
   fTWvn+hJjMxefwcn3xi4FJBt900Uh5rOQNXrE+YhlNkCz9bQbtJk+wbBc
   rc/3tiB/AAKhyam0OzwavSVs8ecE72Y7416N+QlIPUe2NwdmrnoaAggO+
   U7Itob8o141RCm7PzqsG0EEUneJDXNenoG/PpzZnQkVbRc21WR4fHd/ID
   pkxhS3YJI/UEkJVHQ0jft83JcK32RzJNa+tgG+cGTDaQAtOPpMcuM7gDw
   HKOGQX1bmhFSfv/HXxaIl/uChyazrFrCpXfM6n9SIarlTM/QbeaSi4pCM
   w==;
X-CSE-ConnectionGUID: +BUIHPfqTr6GqBiud/mI8A==
X-CSE-MsgGUID: PH+necDMTzyCqyUrIdAgqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36435890"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36435890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:55:59 -0800
X-CSE-ConnectionGUID: MtuCnSr4SIKJ/IGI0N4Fug==
X-CSE-MsgGUID: VwgcpXYRRp65h5fYK3WZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140398105"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jan 2025 02:55:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTj9-000FxX-0t;
	Wed, 08 Jan 2025 10:55:55 +0000
Date: Wed, 8 Jan 2025 18:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2668/2668] fs/cachefiles/ondemand.c:211:9:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202501081846.dn5sbz8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ed8467e701e8f5ed9f2b39cf55710a156fc2593f
commit: 2937cd5f8c58bd8e7895f6b2698057721442248e [2668/2668] cachefiles: notify the user daemon when looking up cookie
config: x86_64-randconfig-121-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081846.dn5sbz8W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081846.dn5sbz8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081846.dn5sbz8W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/cachefiles/ondemand.c:211:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/ondemand.c:211:9: sparse:     expected void **slot
   fs/cachefiles/ondemand.c:211:9: sparse:     got void [noderef] __rcu **
>> fs/cachefiles/ondemand.c:211:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/ondemand.c:211:9: sparse:     expected void **slot
   fs/cachefiles/ondemand.c:211:9: sparse:     got void [noderef] __rcu **
>> fs/cachefiles/ondemand.c:213:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/cachefiles/ondemand.c:213:55: sparse:     expected void [noderef] __rcu **slot
   fs/cachefiles/ondemand.c:213:55: sparse:     got void **slot
   fs/cachefiles/ondemand.c:211:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/cachefiles/ondemand.c:211:9: sparse:     expected void [noderef] __rcu **slot
   fs/cachefiles/ondemand.c:211:9: sparse:     got void **slot
>> fs/cachefiles/ondemand.c:211:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/ondemand.c:211:9: sparse:     expected void **slot
   fs/cachefiles/ondemand.c:211:9: sparse:     got void [noderef] __rcu **
--
>> fs/cachefiles/daemon.c:155:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/daemon.c:155:9: sparse:     expected void **slot
   fs/cachefiles/daemon.c:155:9: sparse:     got void [noderef] __rcu **
>> fs/cachefiles/daemon.c:155:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/daemon.c:155:9: sparse:     expected void **slot
   fs/cachefiles/daemon.c:155:9: sparse:     got void [noderef] __rcu **
>> fs/cachefiles/daemon.c:156:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/cachefiles/daemon.c:156:55: sparse:     expected void [noderef] __rcu **slot
   fs/cachefiles/daemon.c:156:55: sparse:     got void **slot
   fs/cachefiles/daemon.c:155:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void **slot @@
   fs/cachefiles/daemon.c:155:9: sparse:     expected void [noderef] __rcu **slot
   fs/cachefiles/daemon.c:155:9: sparse:     got void **slot
>> fs/cachefiles/daemon.c:155:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void **slot @@     got void [noderef] __rcu ** @@
   fs/cachefiles/daemon.c:155:9: sparse:     expected void **slot
   fs/cachefiles/daemon.c:155:9: sparse:     got void [noderef] __rcu **

vim +211 fs/cachefiles/ondemand.c

   194	
   195	ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
   196						char __user *_buffer, size_t buflen, loff_t *pos)
   197	{
   198		struct cachefiles_req *req;
   199		struct cachefiles_msg *msg;
   200		unsigned long id = 0;
   201		size_t n;
   202		int ret = 0;
   203		struct radix_tree_iter iter;
   204		void **slot;
   205	
   206		/*
   207		 * Search for a request that has not ever been processed, to prevent
   208		 * requests from being processed repeatedly.
   209		 */
   210		xa_lock(&cache->reqs);
 > 211		radix_tree_for_each_tagged(slot, &cache->reqs, &iter, 0,
   212					   CACHEFILES_REQ_NEW) {
 > 213			req = radix_tree_deref_slot_protected(slot,
   214					&cache->reqs.xa_lock);
   215	
   216			msg = &req->msg;
   217			n = msg->len;
   218	
   219			if (n > buflen) {
   220				xa_unlock(&cache->reqs);
   221				return -EMSGSIZE;
   222			}
   223	
   224			radix_tree_iter_tag_clear(&cache->reqs, &iter,
   225					CACHEFILES_REQ_NEW);
   226			xa_unlock(&cache->reqs);
   227	
   228			id = iter.index;
   229			msg->msg_id = id;
   230	
   231			if (msg->opcode == CACHEFILES_OP_OPEN) {
   232				ret = cachefiles_ondemand_get_fd(req);
   233				if (ret)
   234					goto error;
   235			}
   236	
   237			if (copy_to_user(_buffer, msg, n) != 0) {
   238				ret = -EFAULT;
   239				goto err_put_fd;
   240			}
   241			return n;
   242		}
   243		xa_unlock(&cache->reqs);
   244		return 0;
   245	
   246	err_put_fd:
   247		if (msg->opcode == CACHEFILES_OP_OPEN)
   248			__close_fd(current->files,
   249				   ((struct cachefiles_open *)msg->data)->fd);
   250	error:
   251		xa_lock(&cache->reqs);
   252		radix_tree_delete(&cache->reqs, id);
   253		xa_unlock(&cache->reqs);
   254		req->error = ret;
   255		complete(&req->done);
   256		return ret;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
