Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286B14D2B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 04:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251289; cv=none; b=eHgL7JJGvQcQmhgNBSjXzOmEUYnSSycNS2pTScCEKGt8d8TAlzTpss6Qvym+V4xkYJyeoFE2lFFOSFKfM3BzSeCa+jY1xLY66lndjiv+391iB4P1rlela+Eyl4ydVqrqrCb+YphzCJpxfMXZkBhLghbdHoJqTZMEWwAjsZbSH2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251289; c=relaxed/simple;
	bh=SoHUT0fOaLfs6jAY89//3HYhMPr8Wj5KvnV1DmPpNRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQ7u+H/0l8lrkOxC+ZLPaaeTJdp5AodkVTaznxDi2OxEecTCZ3Mksg56m8xDWFkPsfggrqEbf1yv+qwA/6ogb+s1jHk2ttUOURe5AeUjUoYYUUsViQooXqt/WG3q8yZjW3p59VQJvLs2HL5T3FHZqLRwSgDPpw04PCuJu5/T4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1I3weLE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1I3weLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732251287; x=1763787287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoHUT0fOaLfs6jAY89//3HYhMPr8Wj5KvnV1DmPpNRw=;
  b=b1I3weLEQlmCDtMM66Cm38cwUQ/zMg9Q4TF5NnB29PU+HkeBlxG/r3hv
   E1ztXHzc8bYiMsf/JnpnPfy7j5kye739K4QS6PeCasZ/CtwHqlaHJsmqm
   S1FF02N+vyhCK2bZJH+BQ1+YvkLI0qdj4nGQ4U0vTq9jwOJ4F/iDIy/aO
   ASdDlHF2neU3gUUHnS0+WTNUyXtvuqEAOoDy+1gJdkb5ohILY5/e9U1qv
   TXq7oCVl4D9ipnkNKXhAbJ8pQFhr6j6w02EQdSGa4gXVdX97wwDTbHZ4M
   eQzkddc0OqyFFC3VdyhZ0XNsAXcJIJSBA1NnrQA+FFcA3TKmyB6IllT0t
   Q==;
X-CSE-ConnectionGUID: h2rIymEBT7qMx4L/gLbnqw==
X-CSE-MsgGUID: lkp1oZrLQCSLK6mcdJ3fMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32324676"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="32324676"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 20:54:47 -0800
X-CSE-ConnectionGUID: lLN9EGFcQs2vhafUB5g2Hw==
X-CSE-MsgGUID: dQg6ZYFWTcC+RQUQOgVkdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="90880510"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2024 20:54:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tELgp-0003gJ-0K;
	Fri, 22 Nov 2024 04:54:43 +0000
Date: Fri, 22 Nov 2024 12:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "Carrie.Cai" <carrie.cai@montage-tech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1513/1513]
 drivers/crypto/montage/tsse/tsse_ipc_api.c:62:36: warning: variable
 'device_handle' is uninitialized when used here
Message-ID: <202411221252.PUnKjTWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dccd6d8473b2f20aaa76e23820a3bf4934fc8d36
commit: 914854f2adb6988ac3b6521088ec96833d6743e2 [1513/1513] driver: crypto - update support for Mont-TSSE Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241122/202411221252.PUnKjTWH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221252.PUnKjTWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221252.PUnKjTWH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/montage/tsse/tsse_ipc_api.c:10:
   In file included from drivers/crypto/montage/tsse/tsse_dev.h:13:
   In file included from include/linux/pci.h:1669:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2243:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/montage/tsse/tsse_ipc_api.c:62:36: warning: variable 'device_handle' is uninitialized when used here [-Wuninitialized]
      62 |         service_instance->device_handle = device_handle;
         |                                           ^~~~~~~~~~~~~
   drivers/crypto/montage/tsse/tsse_ipc_api.c:56:19: note: initialize the variable 'device_handle' to silence this warning
      56 |         int device_handle;
         |                          ^
         |                           = 0
   6 warnings generated.


vim +/device_handle +62 drivers/crypto/montage/tsse/tsse_ipc_api.c

    41	
    42	/**
    43	 * tsse_im_service_handle_alloc() - Allocate IPC Message service handle for specific service.
    44	 * @name: IPC Message service name
    45	 * @cb: request callback for the service
    46	 * @handle: function output for the service handle
    47	 * Return: 0 if allocated successfully, other values for failure
    48	 */
    49	int tsse_im_service_handle_alloc(
    50		const char *name,
    51		tsse_im_cb_func cb,
    52		tsse_im_service_handle *handle)
    53	{
    54		struct tsse_service_instance *service_instance;
    55		int ret;
    56		int device_handle;
    57	
    58		service_instance = kzalloc(sizeof(struct tsse_service_instance), GFP_ATOMIC);
    59		if (!service_instance)
    60			return -ENOMEM;
    61		service_instance->service_opened = 0;
  > 62		service_instance->device_handle = device_handle;
    63		service_instance->cb = cb;
    64		strscpy(service_instance->service_name, name, TSSE_IM_SERVICE_NAME_LEN);
    65	
    66		ret = tsse_schedule_device_handle(service_instance);
    67		if (ret) {
    68			kfree(service_instance);
    69			return ret;
    70		}
    71	
    72		ret = tsse_service_open(service_instance);
    73		if (ret) {
    74			pr_err("%s(): open service: %s failed: %d\n",
    75				__func__, service_instance->service_name, ret);
    76			kfree(service_instance);
    77			return ret;
    78		}
    79		*handle = service_instance;
    80		return 0;
    81	}
    82	EXPORT_SYMBOL_GPL(tsse_im_service_handle_alloc);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
