Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205637C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEDEyfO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701044791; x=1732580791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sycGogBfqSN54svoUKkady4w+W/ELhYjWcxgkxk8Smg=;
  b=VEDEyfO+W0IlUM8C4zq24HxcCAwQvhukXh7RT6hTjQnS9fLE28U/Klp6
   RNjcAusXdVRwOiNjPM521FlKQr1gZNhD6zSvqJxIxh78XGa5WHAz1AToV
   PuG1+3EGwcpvNxK5aUiASonAFdiUEHsQISslnEC2JmrquDOhpJ7hneo/Y
   Lrx0i7Kspt4Z/zy1Vef4RxyyR3yDcP+TIU25/5t2wimM5qr9I3TeiRyC4
   CsfdDvxGeSWMFRUMkw/rCSv5G1Ts+tUVwfMAIt43E842eXGh8nzMcnqAs
   NLe+E2r5rnqRhN8MohZ/KnasTpNf+XtE9WbfahmTOEQqNKyGCagh1yZ0w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="395433433"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="395433433"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 16:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885839616"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="885839616"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2023 16:26:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7PSF-0005f3-1g;
	Mon, 27 Nov 2023 00:26:27 +0000
Date: Mon, 27 Nov 2023 08:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_bit 14/34] drivers/scsi/scsi_lib.c:2502:35: warning:
 expression result unused
Message-ID: <202311270605.6auJGE4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_bit
head:   0509c68d320cff2284c7fc39d37051e465c429ec
commit: 82d8aa9f9c50fa8c7049ba295a413770eefb41c1 [14/34] scsi: core: XXXX use atomic find_bit() API where appropriate
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231127/202311270605.6auJGE4i-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270605.6auJGE4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270605.6auJGE4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_lib.c:2502:35: warning: expression result unused [-Wunused-value]
           for_each_test_and_clear_bit_from(evt_type, sdev->pending_events, SDEV_EVT_LAST + 1)
                                            ^~~~~~~~
   include/linux/find.h:859:8: note: expanded from macro 'for_each_test_and_clear_bit_from'
           for ((bit); \
                 ^~~
   1 warning generated.


vim +2502 drivers/scsi/scsi_lib.c

  2486	
  2487	/**
  2488	 *	scsi_evt_thread - send a uevent for each scsi event
  2489	 *	@work: work struct for scsi_device
  2490	 *
  2491	 *	Dispatch queued events to their associated scsi_device kobjects
  2492	 *	as uevents.
  2493	 */
  2494	void scsi_evt_thread(struct work_struct *work)
  2495	{
  2496		struct scsi_device *sdev;
  2497		enum scsi_device_event evt_type = SDEV_EVT_FIRST;
  2498		LIST_HEAD(event_list);
  2499	
  2500		sdev = container_of(work, struct scsi_device, event_work);
  2501	
> 2502		for_each_test_and_clear_bit_from(evt_type, sdev->pending_events, SDEV_EVT_LAST + 1)
  2503			sdev_evt_send_simple(sdev, evt_type, GFP_KERNEL);
  2504	
  2505		while (1) {
  2506			struct scsi_event *evt;
  2507			struct list_head *this, *tmp;
  2508			unsigned long flags;
  2509	
  2510			spin_lock_irqsave(&sdev->list_lock, flags);
  2511			list_splice_init(&sdev->event_list, &event_list);
  2512			spin_unlock_irqrestore(&sdev->list_lock, flags);
  2513	
  2514			if (list_empty(&event_list))
  2515				break;
  2516	
  2517			list_for_each_safe(this, tmp, &event_list) {
  2518				evt = list_entry(this, struct scsi_event, node);
  2519				list_del(&evt->node);
  2520				scsi_evt_emit(sdev, evt);
  2521				kfree(evt);
  2522			}
  2523		}
  2524	}
  2525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
