Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83815B4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685673539; x=1717209539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BE08BwvuLjzi+GbAqGNlznMI6GVM+02gHjKfpB/U1OE=;
  b=GhSWqZlBeW+Y8HKv3n4JkpcZzmGg9G+L2u0ZTga3kNCEOpGR/H5DOVh2
   F+LTvcILDChwlWFhRR9cCjekzbMmJnY4yaBr0mTX4xyqjphOJcPbCm2/I
   FMNtvqalZ08FCa74F3A0Mte7F4+Ubzfq6AmBduerGpn/aKPPxWux3vylj
   ESfs0aYMzyPV/vxMPxhrGGD16hrtiZqm/iExbW2piao1NEih12wAeGroO
   EhriKxwFIBqkXIzM8I39rdqWai21a6WUPRNZBVzC/K9dNlaZ61uUK9e3n
   Xhn//YswSxT1KKYYA1ZUW0Fc5IyDzDB+I0EZSTbgnYmEM2hRbqFMQ65uS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421563128"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="421563128"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 19:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="820084758"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="820084758"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2023 19:38:56 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ugp-0002wc-1d;
	Fri, 02 Jun 2023 02:38:55 +0000
Date: Fri, 2 Jun 2023 10:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Saravanan Vajravel <saravanan.vajravel@broadcom.com>,
	selvin.xavier@broadcom.com, jgg@ziepe.ca, leon@kernel.org,
	sagi@grimberg.me
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	Saravanan Vajravel <saravanan.vajravel@broadcom.com>
Subject: Re: [PATCH for-rc 1/3] IB/isert: Fix dead lock in ib_isert
Message-ID: <202306021057.prO0j0bN-lkp@intel.com>
References: <20230601094220.64810-2-saravanan.vajravel@broadcom.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601094220.64810-2-saravanan.vajravel@broadcom.com>

Hi Saravanan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saravanan-Vajravel/IB-isert-Fix-dead-lock-in-ib_isert/20230601-225628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20230601094220.64810-2-saravanan.vajravel%40broadcom.com
patch subject: [PATCH for-rc 1/3] IB/isert: Fix dead lock in ib_isert
config: x86_64-buildonly-randconfig-r005-20230602 (https://download.01.org/0day-ci/archive/20230602/202306021057.prO0j0bN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/c7031144a2a9b6f14201977b35600ab80ee30e09
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Saravanan-Vajravel/IB-isert-Fix-dead-lock-in-ib_isert/20230601-225628
        git checkout c7031144a2a9b6f14201977b35600ab80ee30e09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/ulp/isert/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021057.prO0j0bN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/ulp/isert/ib_isert.c: In function 'isert_free_np':
>> drivers/infiniband/ulp/isert/ib_isert.c:2454:75: error: expected ';' before '}' token
    2454 |                         list_move_tail(&isert_conn->node, &drop_conn_list)
         |                                                                           ^
         |                                                                           ;
    2455 |                 }
         |                 ~                                                          


vim +2454 drivers/infiniband/ulp/isert/ib_isert.c

  2428	
  2429	static void
  2430	isert_free_np(struct iscsi_np *np)
  2431	{
  2432		struct isert_np *isert_np = np->np_context;
  2433		struct isert_conn *isert_conn, *n;
  2434		LIST_HEAD(drop_conn_list);
  2435	
  2436		if (isert_np->cm_id)
  2437			rdma_destroy_id(isert_np->cm_id);
  2438	
  2439		/*
  2440		 * FIXME: At this point we don't have a good way to insure
  2441		 * that at this point we don't have hanging connections that
  2442		 * completed RDMA establishment but didn't start iscsi login
  2443		 * process. So work-around this by cleaning up what ever piled
  2444		 * up in accepted and pending lists.
  2445		 */
  2446		mutex_lock(&isert_np->mutex);
  2447		if (!list_empty(&isert_np->pending)) {
  2448			isert_info("Still have isert pending connections\n");
  2449			list_for_each_entry_safe(isert_conn, n,
  2450						 &isert_np->pending,
  2451						 node) {
  2452				isert_info("cleaning isert_conn %p state (%d)\n",
  2453					   isert_conn, isert_conn->state);
> 2454				list_move_tail(&isert_conn->node, &drop_conn_list)
  2455			}
  2456		}
  2457	
  2458		if (!list_empty(&isert_np->accepted)) {
  2459			isert_info("Still have isert accepted connections\n");
  2460			list_for_each_entry_safe(isert_conn, n,
  2461						 &isert_np->accepted,
  2462						 node) {
  2463				isert_info("cleaning isert_conn %p state (%d)\n",
  2464					   isert_conn, isert_conn->state);
  2465				list_move_tail(&isert_conn->node, &drop_conn_list);
  2466			}
  2467		}
  2468		mutex_unlock(&isert_np->mutex);
  2469	
  2470		list_for_each_entry_safe(isert_conn, n, &drop_conn_list, node) {
  2471			list_del_init(&isert_conn->node);
  2472			isert_connect_release(isert_conn);
  2473		}
  2474	
  2475		np->np_context = NULL;
  2476		kfree(isert_np);
  2477	}
  2478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
