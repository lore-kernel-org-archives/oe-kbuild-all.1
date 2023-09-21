Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AFE8F49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695284503; x=1726820503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5x+KNBv5KLNq6meBhJf5RBki/xqtHAyWsPVeeODhjfs=;
  b=Eo1ndYzKfAE2psTsRP9tg8bhYsMBi9VkhYkvulVuXoX8N5ECBGIS/bOI
   YW7KmzR7+0mdb1CuEzaDO+G1rx/NEaWNtUT5h9uivYB/xbOT05Ul1voBJ
   DxN0uM52ZKb1GpMkkHB5kNuTbzF8yVxumnzaKM/Ud4w1a0q3Rp2qtLm80
   m9VrfK0flzENNqxWby+TW759gJZzGK7QPm6JDZM6qlSnkOHR2g/gKccWn
   M1wMaLbPLWI4mY3bASdqAkEWHxwc2gID8kMFw3kxg1Z1rsQzZ05lSV8KS
   oidkTNhKO9fs6aNleHVq1X5UHCLrRqPaRp6KfinlGN3sl17SPjLfjmzET
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360703502"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="360703502"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="817281113"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="817281113"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2023 01:21:37 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjEwF-0009mH-20;
	Thu, 21 Sep 2023 08:21:31 +0000
Date: Thu, 21 Sep 2023 16:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hen Alon <halon@habana.ai>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Oded Gabbay <ogabbay@kernel.org>
Subject: [linux-next:master 5393/6975]
 drivers/accel/habanalabs/common/habanalabs_ioctl.c:323:30: error: implicit
 declaration of function 'rdtsc'
Message-ID: <202309211608.K2NtoA7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: 809a1971ce613ec22314ecfeb3ebccc7ee3a97c3 [5393/6975] accel/habanalabs: add tsc clock sampling to clock sync info
config: um-randconfig-r005-20230815 (https://download.01.org/0day-ci/archive/20230921/202309211608.K2NtoA7e-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211608.K2NtoA7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211608.K2NtoA7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/habanalabs/common/habanalabs_ioctl.c: In function 'time_sync_info':
>> drivers/accel/habanalabs/common/habanalabs_ioctl.c:323:30: error: implicit declaration of function 'rdtsc' [-Werror=implicit-function-declaration]
     323 |         time_sync.tsc_time = rdtsc();
         |                              ^~~~~
   cc1: some warnings being treated as errors


vim +/rdtsc +323 drivers/accel/habanalabs/common/habanalabs_ioctl.c

   311	
   312	static int time_sync_info(struct hl_device *hdev, struct hl_info_args *args)
   313	{
   314		struct hl_info_time_sync time_sync = {0};
   315		u32 max_size = args->return_size;
   316		void __user *out = (void __user *) (uintptr_t) args->return_pointer;
   317	
   318		if ((!max_size) || (!out))
   319			return -EINVAL;
   320	
   321		time_sync.device_time = hdev->asic_funcs->get_device_time(hdev);
   322		time_sync.host_time = ktime_get_raw_ns();
 > 323		time_sync.tsc_time = rdtsc();
   324	
   325		return copy_to_user(out, &time_sync,
   326			min((size_t) max_size, sizeof(time_sync))) ? -EFAULT : 0;
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
