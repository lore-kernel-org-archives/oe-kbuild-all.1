Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80A8820
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 06:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7MS85Sl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699078900; x=1730614900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWXfOWmYj+Ds8e7KIPLMXDjCzFoz16RM+HQare7RBnQ=;
  b=M7MS85SlEvOMwIKWvX9p8tqJegySn5+eKt6gye0/3yV0AVyXzbOa75/b
   KKLyh7FIkXm/ldmK7cqJeLsuPD8sNTiyvT+RxMN3otKV8jAdyzRM6dbR5
   AYS0Cb3hNT2hJ64dBmAwAr6K0wTRajyGyAF7VNHKE+C9xaOix6zewcDFb
   GBchUjmw1Gc+TRzcVQ8YwaEDZF++62JSYZxhxRGCZzj97vzeZbeEG5W/X
   K49roz/NdYwefJxb+8+5yXEyUixRSaX62P7oTO3dKCOpDljb0ADAVouAr
   6CWNQOXupBAUTNVmndLeczh3mc/WxFKQWaUHdnH69ANXtvhM7TyoAGwjf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369272429"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="369272429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832230965"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832230965"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 23:21:36 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzA2J-0003Y0-0E;
	Sat, 04 Nov 2023 06:21:35 +0000
Date: Sat, 4 Nov 2023 14:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Adam Davis <eadavis@qq.com>, richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net,
	habetsm.xilinx@gmail.com, jeremy@jcline.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	reibax@gmail.com,
	syzbot+df3f3ef31f60781fa911@syzkaller.appspotmail.com
Subject: Re: [PATCH net-next V4] ptp: fix corrupted list in ptp_open
Message-ID: <202311041344.zDyYh5Ty-lkp@intel.com>
References: <tencent_8A38BBB333189E6E1B4A4B821BF82569BA08@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_8A38BBB333189E6E1B4A4B821BF82569BA08@qq.com>

Hi Edward,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Edward-Adam-Davis/ptp-fix-corrupted-list-in-ptp_open/20231104-112916
base:   net-next/main
patch link:    https://lore.kernel.org/r/tencent_8A38BBB333189E6E1B4A4B821BF82569BA08%40qq.com
patch subject: [PATCH net-next V4] ptp: fix corrupted list in ptp_open
config: arc-randconfig-001-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041344.zDyYh5Ty-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041344.zDyYh5Ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041344.zDyYh5Ty-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_chardev.c: In function 'ptp_release':
>> drivers/ptp/ptp_chardev.c:148:23: warning: unused variable 'flags' [-Wunused-variable]
     148 |         unsigned long flags;
         |                       ^~~~~


vim +/flags +148 drivers/ptp/ptp_chardev.c

8f5de6fb245326 Xabier Marquiegui 2023-10-12  142  
8f5de6fb245326 Xabier Marquiegui 2023-10-12  143  int ptp_release(struct posix_clock_context *pccontext)
8f5de6fb245326 Xabier Marquiegui 2023-10-12  144  {
8f5de6fb245326 Xabier Marquiegui 2023-10-12  145  	struct timestamp_event_queue *queue = pccontext->private_clkdata;
f0e5eaa3097d80 Edward Adam Davis 2023-11-04  146  	struct ptp_clock *ptp =
f0e5eaa3097d80 Edward Adam Davis 2023-11-04  147  		container_of(pccontext->clk, struct ptp_clock, clock);
8f5de6fb245326 Xabier Marquiegui 2023-10-12 @148  	unsigned long flags;
8f5de6fb245326 Xabier Marquiegui 2023-10-12  149  
8f5de6fb245326 Xabier Marquiegui 2023-10-12  150  	if (queue) {
f0e5eaa3097d80 Edward Adam Davis 2023-11-04  151  		mutex_lock(&ptp->tsevq_mux);
403376ddb4221b Xabier Marquiegui 2023-10-12  152  		debugfs_remove(queue->debugfs_instance);
8f5de6fb245326 Xabier Marquiegui 2023-10-12  153  		pccontext->private_clkdata = NULL;
8f5de6fb245326 Xabier Marquiegui 2023-10-12  154  		list_del(&queue->qlist);
f0e5eaa3097d80 Edward Adam Davis 2023-11-04  155  		mutex_unlock(&ptp->tsevq_mux);
c5a445b1e9347b Xabier Marquiegui 2023-10-12  156  		bitmap_free(queue->mask);
8f5de6fb245326 Xabier Marquiegui 2023-10-12  157  		kfree(queue);
8f5de6fb245326 Xabier Marquiegui 2023-10-12  158  	}
d94ba80ebbea17 Richard Cochran   2011-04-22  159  	return 0;
d94ba80ebbea17 Richard Cochran   2011-04-22  160  }
d94ba80ebbea17 Richard Cochran   2011-04-22  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
