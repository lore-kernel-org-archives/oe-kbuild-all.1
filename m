Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22791426B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690009837; x=1721545837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLLq/67eqxjKxGAqpiMGiZt2cSroLK2LzIWrgGCY6VU=;
  b=kmnvYyS+bTGgBb7TOVvSl+THYp5IrfTYPEXU5RzbMBjXmlbil31MxvmZ
   +W27twiiHgLvDfBvo9FEDl1JgpA2zdidAmnX1+OHaH5PQJ9RnT5Nc/hoD
   pgNjTFcROcfnIedkxx8utN0KpEx7gwO/OCdbm1SiYUAmgTbqt1pLJzQDK
   tYL5oefvIwcz0nz3bD+KGn0cI1MD3ioylV5ATIJPwPRu9H5Sl4HKbA8h3
   NavzbHKsdvmhLA1gQxIs2ZdfUBDXvSZI9Y20DoKRhSpBYFZ8ZcshjWgCw
   9nnFPx5Viz26bWXhOiXxVABuWC0f4Hf86/l0lveI3RQMpUkN60aOo5kTg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="352066492"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="352066492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 00:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754733822"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="754733822"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Jul 2023 00:10:36 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN6l9-00086r-1K;
	Sat, 22 Jul 2023 07:10:35 +0000
Date: Sat, 22 Jul 2023 15:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 442/462] drivers/scsi/sg.c:1569:31:
 warning: unused variable 'q'
Message-ID: <202307221530.rOEWV78w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   a9e3b323637a4cfb04b3352fa5efb74299c7c1f1
commit: d6ff60bb558b81f2fe30f4a5445c9fe28c4735de [442/462] scsi: sg: fix blktrace debugfs entries leakage
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230722/202307221530.rOEWV78w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221530.rOEWV78w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221530.rOEWV78w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/sg.c:45:
   drivers/scsi/sg.c: In function 'sg_device_destroy':
   include/linux/blktrace_api.h:93:57: warning: statement with no effect [-Wunused-value]
      93 | # define blk_trace_remove(q)                            (-ENOTTY)
         |                                                         ^
   drivers/scsi/sg.c:1577:9: note: in expansion of macro 'blk_trace_remove'
    1577 |         blk_trace_remove(q);
         |         ^~~~~~~~~~~~~~~~
>> drivers/scsi/sg.c:1569:31: warning: unused variable 'q' [-Wunused-variable]
    1569 |         struct request_queue *q = sdp->device->request_queue;
         |                               ^


vim +/q +1569 drivers/scsi/sg.c

  1564	
  1565	static void
  1566	sg_device_destroy(struct kref *kref)
  1567	{
  1568		struct sg_device *sdp = container_of(kref, struct sg_device, d_ref);
> 1569		struct request_queue *q = sdp->device->request_queue;
  1570		unsigned long flags;
  1571	
  1572		/* CAUTION!  Note that the device can still be found via idr_find()
  1573		 * even though the refcount is 0.  Therefore, do idr_remove() BEFORE
  1574		 * any other cleanup.
  1575		 */
  1576	
  1577		blk_trace_remove(q);
  1578		scsi_device_put(sdp->device);
  1579	
  1580		write_lock_irqsave(&sg_index_lock, flags);
  1581		idr_remove(&sg_index_idr, sdp->index);
  1582		write_unlock_irqrestore(&sg_index_lock, flags);
  1583	
  1584		SCSI_LOG_TIMEOUT(3,
  1585			sg_printk(KERN_INFO, sdp, "sg_device_destroy\n"));
  1586	
  1587		kfree(sdp);
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
