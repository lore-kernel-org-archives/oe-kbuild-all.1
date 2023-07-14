Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE966FC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 11:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333693; x=1720869693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qoJjqXu9Mti4xEZVwBI6X2qITDOCd8CJoxE337sIaWM=;
  b=KcTUmAkqDi97Ng4kHZKt7lcS9h0k43P/D4A6/lw4g2NRBTJk93KIoiVb
   a4dY42W1T05hNmB5ikpCYkUwGrQMALJfRdZV/cvFQRD1jAX9Zs0l3bwIy
   +vPZTxyhMLFWiVVn9qw5PHRgfqkNFRLmVo88cZdZf5JfbCxW9HjW0U5zK
   5Ad2NmQaBETPen7mPRhktxfJJg20ohwO6wjhh53bADuh1TasDcgc0bWMt
   4W9ikRnFdCB2Coz4/bOyBFyNE05J3NTWgVnRxuBtVGilzOHiDh4ceFXYw
   LM1SEMUHnNT22gK1m6BkpeMrzAdQ7pyy09l4yvTkzpltoRKGhuD2Gfpjp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396261866"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="396261866"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 04:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792409107"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="792409107"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 04:21:31 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKGra-0007Ot-1S;
	Fri, 14 Jul 2023 11:21:30 +0000
Date: Fri, 14 Jul 2023 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13] fs/select.c:236:31: sparse: sparse:
 restricted __poll_t degrades to integer
Message-ID: <202307141951.HIYZP1Zm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: um-randconfig-r071-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141951.HIYZP1Zm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141951.HIYZP1Zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141951.HIYZP1Zm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/select.c:236:31: sparse: sparse: restricted __poll_t degrades to integer
--
   fs/eventpoll.c:544:9: sparse: sparse: restricted __poll_t degrades to integer
   fs/eventpoll.c:544:9: sparse: sparse: cast to restricted __poll_t
   fs/eventpoll.c:1255:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1255:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1255:53: sparse:     got restricted __poll_t
   fs/eventpoll.c:1300:39: sparse: sparse: restricted __poll_t degrades to integer
>> fs/eventpoll.c:1300:25: sparse: sparse: dubious: x & !y

vim +236 fs/select.c

   228	
   229	/* Add a new entry */
   230	static void __pollwait(struct file *filp, wait_queue_head_t *wait_address,
   231					poll_table *p, unsigned long fixed_event)
   232	{
   233		struct poll_wqueues *pwq = container_of(p, struct poll_wqueues, pt);
   234		struct poll_table_entry *entry;
   235	
 > 236		if (fixed_event && !(p->_key & fixed_event))
   237			return;
   238	
   239		entry = poll_get_entry(pwq);
   240		if (!entry)
   241			return;
   242	
   243		entry->filp = get_file(filp);
   244		entry->wait_address = wait_address;
   245		entry->key = p->_key;
   246		entry->fixed_key = fixed_event;
   247		init_waitqueue_func_entry(&entry->wait, pollwake);
   248		entry->wait.private = pwq;
   249		add_wait_queue(wait_address, &entry->wait);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
