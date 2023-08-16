Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C21AA95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 22:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692223698; x=1723759698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lll5KAQi4W7vfzba71CF5AHgH0JmiwGvHE7bYnj7pIw=;
  b=W1IJZRXUN3INs1foE1UUk/LgobT6WBUtCDPCIwsygHkm9+2LfqHC3IwE
   sMqUG4b3gHLGc8GPyPPxC0/Nv+F4MuEyl5J//jDGo/rKISyIQpcEv7Lv3
   nMDgl/xWlSces6raCWavM9VEH0mplXkjHrVsG4qnzv9DuBljH19p48Kj7
   +C28GJ13VG2i19vWfWc5G0O7WyVGHg+LZzzP2oEjIOd1K8lvDCjzemdfg
   5Zx22kZnXtyjVZAhe9uAWQAQKsxUM1fQbJOArd6KdjaAY+C40cCzDH3hZ
   IH1sRD6TaBA+zg+bUuahtWviLvP392pbYLN7XSngcAoE5AW8NXByM93ls
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436550457"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="436550457"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824385593"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="824385593"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2023 15:08:13 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOgW-0000bZ-1A;
	Wed, 16 Aug 2023 22:08:12 +0000
Date: Thu, 17 Aug 2023 06:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tanjore Suresh <tansuresh@google.com>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH] driver core: shut down devices asynchronously
Message-ID: <202308170534.naCLTFzQ-lkp@intel.com>
References: <20230816154518.3487-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816154518.3487-1-stuart.w.hayes@gmail.com>

Hi Stuart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc6 next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stuart-Hayes/driver-core-shut-down-devices-asynchronously/20230816-234737
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20230816154518.3487-1-stuart.w.hayes%40gmail.com
patch subject: [PATCH] driver core: shut down devices asynchronously
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308170534.naCLTFzQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170534.naCLTFzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170534.naCLTFzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.c:4762:6: warning: no previous prototype for 'shutdown_dev_work' [-Wmissing-prototypes]
    4762 | void shutdown_dev_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~


vim +/shutdown_dev_work +4762 drivers/base/core.c

  4761	
> 4762	void shutdown_dev_work(struct work_struct *work)
  4763	{
  4764		struct shutdown_work *sd_work = container_of(work, struct shutdown_work, work);
  4765		struct shutdown_work *child_sd_work;
  4766		struct device *dev = sd_work->dev;
  4767	
  4768		/*
  4769		 * wait for child devices to finish shutdown
  4770		 */
  4771		list_for_each_entry(child_sd_work, &sd_work->children, node) {
  4772			wait_for_completion(&child_sd_work->complete);
  4773		}
  4774	
  4775		if (dev) {
  4776			/*
  4777			 * Make sure the device is off the kset list, in the
  4778			 * event that dev->*->shutdown() doesn't remove it.
  4779			 */
  4780			spin_lock(&devices_kset->list_lock);
  4781			list_del_init(&dev->kobj.entry);
  4782			spin_unlock(&devices_kset->list_lock);
  4783	
  4784			shutdown_device(dev, dev->parent);
  4785		}
  4786	
  4787		complete(&sd_work->complete);
  4788	}
  4789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
