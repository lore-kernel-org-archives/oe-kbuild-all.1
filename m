Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF96A349
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 21:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708033356; cv=none; b=h5R1mFwGc7wEPS80wzdiqG8x+xu3b0fL0pha8dfZe0MEyg+LLsCll54+5zZmNRnUq0CmNgTC8YaDdElpHMgudi3GDga20zMRu/yQu9tR9+oExuqYTdT3RyGA1bYGZCh+Uu1cwmhZUrz4NsIPIdk/x/cD468C8HccdhddyQ3j14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708033356; c=relaxed/simple;
	bh=u7eJ9oD6rfGT/t89U70vxMsyL1Dfwz/FgrWYzFBcieI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWaBQVy+Iqq9JQhRaYi4HBXQSd8MbLu48kRcYc5xqP5fZwB2kXQV9I8O0rw0wJLB2gqPJEx5ehraBFWzwbJCPRuASt5IVcw7bOG94+tuCg06y+ip4lGTdLl5mtpw2C4Gz1TXNgAPuG5Y0f0Tk+8og0HcOPUeb9rs8xqgvp/uCE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/wm/VaZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/wm/VaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708033354; x=1739569354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u7eJ9oD6rfGT/t89U70vxMsyL1Dfwz/FgrWYzFBcieI=;
  b=R/wm/VaZHyGENntV8SNmx1260ekd+coo7SPnhf8WgIEfPIsrOQ8WcMPf
   r7A3xSs95zWe1m01xp63NdAzAn6f0vLkQR2qIto4SIDyqEDVMmHok9s0p
   76JVCrSfpRxYMaPIn1GOwLTsITbiXVgaHUAPWoU/bFNnk6Xun4HNngJJB
   gWasUEV3yG2BoNNHvxrPPRAouSt+MPkvkaGgcKACTCgAUNf5BJjj9U1pq
   OyXW5MDi4K3Bg8EmlsHLWr2cI5kqoaCak9cjUGZvP9jkLPlwR4PlLcceX
   5H1nF/FBQvyEsiVvMS0wg1hr7t7+Quq5/eUN77uR21B1v9SEmBlmGD7mk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5980336"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="5980336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 13:42:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3825246"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2024 13:42:20 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rajUn-0000mk-2a;
	Thu, 15 Feb 2024 21:42:17 +0000
Date: Fri, 16 Feb 2024 05:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 2/2] i915/pmu: Cleanup pending events on unbind
Message-ID: <202402160519.aioEuNOJ-lkp@intel.com>
References: <20240213180302.47266-3-umesh.nerlige.ramappa@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213180302.47266-3-umesh.nerlige.ramappa@intel.com>

Hi Umesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.8-rc4 next-20240215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umesh-Nerlige-Ramappa/i915-pmu-Add-pmu_teardown-helper/20240214-020605
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240213180302.47266-3-umesh.nerlige.ramappa%40intel.com
patch subject: [PATCH 2/2] i915/pmu: Cleanup pending events on unbind
config: x86_64-randconfig-121-20240214 (https://download.01.org/0day-ci/archive/20240216/202402160519.aioEuNOJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160519.aioEuNOJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160519.aioEuNOJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_pmu.c:1405:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   drivers/gpu/drm/i915/i915_pmu.c:1405:44: sparse:     expected struct file *file
   drivers/gpu/drm/i915/i915_pmu.c:1405:44: sparse:     got struct file [noderef] __rcu *
   drivers/gpu/drm/i915/i915_pmu.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/fdtable.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1405 drivers/gpu/drm/i915/i915_pmu.c

  1385	
  1386	static void close_event_file(struct perf_event *event)
  1387	{
  1388		unsigned int max_open_fds, fd;
  1389		struct files_struct *files;
  1390		struct task_struct *task;
  1391		struct fdtable *fdt;
  1392	
  1393		task = event->owner;
  1394		if (!task)
  1395			return;
  1396	
  1397		files = task->files;
  1398		if (!files)
  1399			return;
  1400	
  1401		spin_lock(&files->file_lock);
  1402		fdt = files_fdtable(files);
  1403		max_open_fds = __open_files(fdt);
  1404		for (fd = 0; fd < max_open_fds; fd++) {
> 1405			struct file *file = fdt->fd[fd];
  1406	
  1407			if (!file || file->private_data != event)
  1408				continue;
  1409	
  1410			rcu_assign_pointer(fdt->fd[fd], NULL);
  1411			__clear_bit(fd, fdt->open_fds);
  1412			__clear_bit(fd / BITS_PER_LONG, fdt->full_fds_bits);
  1413			if (fd < files->next_fd)
  1414				files->next_fd = fd;
  1415			filp_close(file, files);
  1416			break;
  1417		}
  1418		spin_unlock(&files->file_lock);
  1419	}
  1420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
