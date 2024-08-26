Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A259517C9AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680332; cv=none; b=hlnds8TQjKFyFX4307rrYPYZbDpX6ZMn5WC3UsNx2/h0MpK8K93IQXhtYLWtpkGNhgizhERuO8LEgC0c7cxTB9R0QfdzifFjlbwmIMP0YT0VXXmKxvPjDv9OQFODgWthK0H2AXrSbUwPNax09j0HN/zCAq8hwGLLFEYgbBRt6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680332; c=relaxed/simple;
	bh=O4IyW9m3dy5GTdD4Hs9UvuTX4SG+N/BRy3edsMu8tZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtrCUmOW9eLjsIk1blzJRoowP7xfpg85xCGcZO66VPvfU32YDCedf3KeHaKienCo5CuIAKNkZOUoTb1dHeTtIGx9DMaC1cxsL0GfDUN8xn/PxGLOWPFJzLNPK25iNTflAEXY6u5cWI9dcHG7SR3v0RWSXNQIw7UZl851YFVJ3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fL7Moibg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fL7Moibg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724680330; x=1756216330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O4IyW9m3dy5GTdD4Hs9UvuTX4SG+N/BRy3edsMu8tZU=;
  b=fL7Moibg1B9EwyqDOmzaTZjydMEZPU9ZQsWvDlWog6MfH+U/rkDB55m9
   K9FI+b7DwCxGiJgfp8PapQb9oW/ZfQpqRumQGC3qQJGk4h2ORoPs/2kub
   Y0AAQDGWCSuyiE55a5U0uQ8QbW49qNvlLK0LnHWq2FfJ6V3XyIvJCZ5YU
   HdEqbw50B8O0TkbE7mKDfFR7OjiEFBzFftKMMy7i4I39cwgEwo1qm96EU
   /s7O+4oW1HtvzjCARNRddjmdkuqVC98YvmKTeEqAOC0bd7QPuhmC5gwLG
   KnGdEmthTNAQc+48xcvLcEjM06emXGYtjMNmy76RslJN2J7L538srvoh/
   w==;
X-CSE-ConnectionGUID: 58WIaS/jS2Kt1/Lypx6Ijg==
X-CSE-MsgGUID: Gn3Oo5vZQ0ma6OrdRG+w2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33673335"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33673335"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:52:08 -0700
X-CSE-ConnectionGUID: mybZbMz1R1WpzAjNJPMFIQ==
X-CSE-MsgGUID: /a7JtitpSYe93ckCyfHfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93246372"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:52:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sia8b-000HA2-18;
	Mon, 26 Aug 2024 13:52:05 +0000
Date: Mon, 26 Aug 2024 21:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kinga Stefaniuk <kinga.stefaniuk@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v11 1/1] md: generate CHANGE uevents for md device
Message-ID: <202408262105.6VV4gSqy-lkp@intel.com>
References: <20240823145438.23432-2-kinga.stefaniuk@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823145438.23432-2-kinga.stefaniuk@intel.com>

Hi Kinga,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.11-rc5]
[also build test WARNING on linus/master]
[cannot apply to song-md/md-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kinga-Stefaniuk/md-generate-CHANGE-uevents-for-md-device/20240826-145852
base:   v6.11-rc5
patch link:    https://lore.kernel.org/r/20240823145438.23432-2-kinga.stefaniuk%40intel.com
patch subject: [PATCH v11 1/1] md: generate CHANGE uevents for md device
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240826/202408262105.6VV4gSqy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262105.6VV4gSqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262105.6VV4gSqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/md.c: In function 'md_new_event':
>> drivers/md/md.c:367:31: warning: unused variable 'flags' [-Wunused-variable]
     367 |                 unsigned long flags;
         |                               ^~~~~


vim +/flags +367 drivers/md/md.c

   357	
   358	void md_new_event(struct mddev *mddev, bool sync)
   359	{
   360		atomic_inc(&md_event_count);
   361		wake_up(&md_event_waiters);
   362	
   363		if (mddev_is_dm(mddev))
   364			return;
   365	
   366		if (!sync) {
 > 367			unsigned long flags;
   368	
   369			spin_lock_irq(&all_mddevs_lock);
   370			mddev = mddev_get(mddev);
   371			spin_unlock_irq(&all_mddevs_lock);
   372			if (mddev == NULL)
   373				return;
   374			queue_work(md_wq, &mddev->uevent_work);
   375		}
   376		kobject_uevent(&disk_to_dev(mddev->gendisk)->kobj, KOBJ_CHANGE);
   377	}
   378	EXPORT_SYMBOL_GPL(md_new_event);
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
