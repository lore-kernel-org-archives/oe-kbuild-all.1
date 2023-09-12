Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743555688
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 09:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694510261; x=1726046261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=76LYHFnxt3VRf3kTnVT7UE/ECnFeE/FhnxT3niq7iPw=;
  b=ZkMoLYXRD1dzzCm7SAeOMW4LemYP1c/exntxrMbtWw/D8ReJwz3G2g9r
   ezf+aKpFB0Z2AE0GBngmWk77/JyAn9j7iQEEioo5WoFJPNdb+ZuoDawFF
   N8YhXZhKix3ZH2lSdNxSezniOJE9d0EcqRXELB8kpwN7PnbkS9uq+1w57
   EwCZn+fcLKOYfRUdzugoio3ajExVDGdYYjEEcsee4UEXY0KZ/smEOOuRU
   EXDggsEockS2QghuY0cN5dR6vrQ6+zkKzmqttzdo51qnZQcyia37A4Kj3
   /ReYCMd2V7/zuatAjYLqcQf3gE5eOAgSYXuYefqwTpL5SFY2ea4pm2CYF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381022678"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="381022678"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 02:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990436572"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="990436572"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 02:17:39 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfzWF-0000C6-01;
	Tue, 12 Sep 2023 09:17:16 +0000
Date: Tue, 12 Sep 2023 17:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest 9/9]
 drivers/virt/coco/tdx-guest/tdx-guest.c:163:35: warning: variable 'size' set
 but not used
Message-ID: <202309121756.9Zp1Jql5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   af7df693905dad1ebb64bb16cf45af9c6515adfc
commit: af7df693905dad1ebb64bb16cf45af9c6515adfc [9/9] virt: tdx-guest: Add RTMR extend event logging support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230912/202309121756.9Zp1Jql5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121756.9Zp1Jql5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121756.9Zp1Jql5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/coco/tdx-guest/tdx-guest.c: In function 'acpi_ccel_next_event':
>> drivers/virt/coco/tdx-guest/tdx-guest.c:163:35: warning: variable 'size' set but not used [-Wunused-but-set-variable]
     163 |         u64 index = 0, start = 0, size = 0;
         |                                   ^~~~


vim +/size +163 drivers/virt/coco/tdx-guest/tdx-guest.c

   157	
   158	
   159	static void* acpi_ccel_next_event(void)
   160	{
   161		struct cc_event_head *evhead;
   162		struct acpi_table_ccel *ccel;
 > 163		u64 index = 0, start = 0, size = 0;
   164		acpi_status status;
   165		void *data;
   166	
   167		status = acpi_get_table(ACPI_SIG_CCEL, 0, (struct acpi_table_header **)&ccel);
   168		if (ACPI_FAILURE(status))
   169			return NULL;
   170	
   171		data = acpi_os_map_iomem(ccel->log_area_start_address, ccel->log_area_minimum_length);
   172	
   173		ccel_addr = data;
   174		ccel_len = ccel->log_area_minimum_length;
   175	
   176		while (index < ccel->log_area_minimum_length) {
   177			evhead = data + index;
   178			start = index;
   179	
   180			if (evhead->mr_idx == CC_INVALID_RTMR_IDX)
   181		                break;
   182	
   183			if (evhead->event_type == EV_NO_ACTION)
   184				index += parse_spec_id_event(evhead);
   185			else
   186				index += parse_cc_event(evhead);
   187	
   188			size = index - start;
   189		}
   190	
   191		return evhead;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
