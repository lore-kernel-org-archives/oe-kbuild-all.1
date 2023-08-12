Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9271CCAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691847317; x=1723383317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BZe1vrWy6Pzn5cePalPFiV3eg0SX7oZk11/1/EncdBw=;
  b=mPOb7JQETxAa0iTvvq+hQ3c/altQHt6VfPTfkWlqAwctjxn0TdTk9Vr5
   VAk/Zs7dgU3ANlvgjCZ7GRcilwlJSpk0XSYuuSeYj6u6pt4gqGKZniBy0
   9HMpIE0yG12/VLJCDvvaf7Vbo8k4d+CI9rvhDTv8QwV78VwPL0w9T7hZy
   G6AGw6Ff3GWRREqjO8IpkVboqILXqkRBG2Eu1Y7kudSDkq0FtlG+J3vgm
   UPRNzf8rW5mGY+9rRQgQsnK8cDQ2RLWBldIRU2AiQOC8N0iXPu/Ab+cLs
   w7jBcVn6p6C1bgVrUo7VjyEYO0g0At7fisF948tJ+oeOJRy/CNn1p7RLL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="369297955"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="369297955"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 06:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="979491511"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="979491511"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Aug 2023 06:35:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUolu-0008bA-16;
	Sat, 12 Aug 2023 13:35:14 +0000
Date: Sat, 12 Aug 2023 21:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v12 18/19] drivers/nvme/target/tcp.c:1850:1: warning:
 label 'out_destroy_sq' defined but not used
Message-ID: <202308122158.Xrjfbq5A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v12
head:   c623bc8e57d23dde503188eacbf2d11e7dfe0564
commit: 2a255c0e370975ef7a7b22e4fce2d77080280761 [18/19] nvmet-tcp: enable TLS handshake upcall
config: i386-randconfig-i002-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122158.Xrjfbq5A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122158.Xrjfbq5A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308122158.Xrjfbq5A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/target/tcp.c: In function 'nvmet_tcp_alloc_queue':
>> drivers/nvme/target/tcp.c:1850:1: warning: label 'out_destroy_sq' defined but not used [-Wunused-label]
    1850 | out_destroy_sq:
         | ^~~~~~~~~~~~~~


vim +/out_destroy_sq +1850 drivers/nvme/target/tcp.c

  1845	
  1846		ret = nvmet_tcp_set_queue_sock(queue);
  1847		if (!ret)
  1848			return;
  1849	
> 1850	out_destroy_sq:
  1851		queue->state = NVMET_TCP_Q_DISCONNECTING;
  1852		mutex_lock(&nvmet_tcp_queue_mutex);
  1853		list_del_init(&queue->queue_list);
  1854		mutex_unlock(&nvmet_tcp_queue_mutex);
  1855		nvmet_tcp_put_queue(queue);
  1856		return;
  1857	out_free_connect:
  1858		nvmet_tcp_free_cmd(&queue->connect);
  1859	out_ida_remove:
  1860		ida_free(&nvmet_tcp_queue_ida, queue->idx);
  1861	out_sock:
  1862		fput(queue->sock->file);
  1863	out_free_queue:
  1864		kfree(queue);
  1865	out_release:
  1866		pr_err("failed to allocate queue, error %d\n", ret);
  1867		if (!sock_file)
  1868			sock_release(newsock);
  1869	}
  1870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
