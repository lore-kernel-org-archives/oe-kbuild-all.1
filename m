Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B75274B4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696992; cv=none; b=L6oOjg23Y65IpTQtbgKgDF3hWOzwT4ElqNjgqK5xqeq6Mlnej5ipBbiHapsgLUXv3ZpxyixBtWyjuXXAj8FC2Wd1k+leicpjobAGQJa4WfppZZGdzVg4Z5SegRhvsZOIQelOhM01yDQZ5PvTcbgY6JHcj38YIZ7uhtvoY/EsGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696992; c=relaxed/simple;
	bh=3yxAVP73TMzcwXRIwPDNqsUrMnE4pFsz8MO+1+OngHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HNMWBdpPzdFPVMBg8umHFeBzwdNlB58+dMJCLLOE18CYrQKIX+oad6ioPIaBPweL6hXmMLWEuvj/sVHy+H0xQ7s0LT9zB10nEPE5ON1gFOoCUHNenQkpcNKpJy1j0VKrl7eTZK5wzAt0XTFsxLENGmhSqsuI0bf04PWDg7//b+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKjN9NTD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKjN9NTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766696990; x=1798232990;
  h=date:from:to:cc:subject:message-id;
  bh=3yxAVP73TMzcwXRIwPDNqsUrMnE4pFsz8MO+1+OngHY=;
  b=LKjN9NTD1jLHTGO+eRFBNwKxzAGX92iUe4kj9ldCAXd7E1qTz3U2uz9O
   a06F0pLcTsqtgWskNnLSPlPXSW70c+CIdZuG9HFFyd7IAt9Ejgd/ERndR
   cjn4ryxWZjf1kf/cKkDX49vntcHD9uZS/o2WaZZP3tgkZVYtg70yb/MN7
   FBqWOYcxEXEU+dyeGXnRYDvhhLJbOpBicOX55mQWpeddNa0ZB8fC+efYG
   X2O0ffWHmKCd+pmC76pfpxKYLm4kxodTJrqEzpmE82GO20KpJrNoF3/Yy
   vsBkbRPbWOvl3UgMJDWLbT4DQboDlKSUg3cQnlw6L9KjHIWmmGnbFnyON
   A==;
X-CSE-ConnectionGUID: JBRPlSvAS4K2bDjZy9Yfxg==
X-CSE-MsgGUID: UtpZCnvPQYWeStoYal2xWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68238938"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68238938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:09:51 -0800
X-CSE-ConnectionGUID: 9Do7bk2NQ1Cm/x/YffOVVQ==
X-CSE-MsgGUID: icjWcqugSPmUZjA7VmoNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200021313"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Dec 2025 13:09:49 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYsa3-000000004Sj-2C66;
	Thu, 25 Dec 2025 21:09:18 +0000
Date: Fri, 26 Dec 2025 05:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileyhQmWY 15/16]
 drivers/usb/core/driver.c:1816:16: error: void value not ignored as it ought
 to be
Message-ID: <202512260516.2eP96Prm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileyhQmWY
head:   63a83a6e40a3f55fbf3887370f4a6b64fc656924
commit: 1d3dcf1b026121c179aec3afdec4fb22509dfc8d [15/16] PM: runtime: Change pm_runtime_put() return type to void
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251226/202512260516.2eP96Prm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260516.2eP96Prm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260516.2eP96Prm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/core/driver.c: In function 'usb_autopm_put_interface_async':
>> drivers/usb/core/driver.c:1816:16: error: void value not ignored as it ought to be
    1816 |         status = pm_runtime_put(&intf->dev);
         |                ^
--
   kernel/irq/chip.c: In function 'irq_chip_pm_put':
>> kernel/irq/chip.c:1546:24: error: void value not ignored as it ought to be
    1546 |                 retval = pm_runtime_put(dev);
         |                        ^


vim +1816 drivers/usb/core/driver.c

645daaab0b6adc Alan Stern 2006-08-30  1794  
9ac39f28b5237a Alan Stern 2008-11-12  1795  /**
9ac39f28b5237a Alan Stern 2008-11-12  1796   * usb_autopm_put_interface_async - decrement a USB interface's PM-usage counter
9ac39f28b5237a Alan Stern 2008-11-12  1797   * @intf: the usb_interface whose counter should be decremented
9ac39f28b5237a Alan Stern 2008-11-12  1798   *
9bbdf1e0afe771 Alan Stern 2010-01-08  1799   * This routine does much the same thing as usb_autopm_put_interface():
9bbdf1e0afe771 Alan Stern 2010-01-08  1800   * It decrements @intf's usage counter and schedules a delayed
9bbdf1e0afe771 Alan Stern 2010-01-08  1801   * autosuspend request if the counter is <= 0.  The difference is that it
9bbdf1e0afe771 Alan Stern 2010-01-08  1802   * does not perform any synchronization; callers should hold a private
9bbdf1e0afe771 Alan Stern 2010-01-08  1803   * lock and handle all synchronization issues themselves.
9ac39f28b5237a Alan Stern 2008-11-12  1804   *
9ac39f28b5237a Alan Stern 2008-11-12  1805   * Typically a driver would call this routine during an URB's completion
9ac39f28b5237a Alan Stern 2008-11-12  1806   * handler, if no more URBs were pending.
9ac39f28b5237a Alan Stern 2008-11-12  1807   *
9ac39f28b5237a Alan Stern 2008-11-12  1808   * This routine can run in atomic context.
9ac39f28b5237a Alan Stern 2008-11-12  1809   */
9ac39f28b5237a Alan Stern 2008-11-12  1810  void usb_autopm_put_interface_async(struct usb_interface *intf)
9ac39f28b5237a Alan Stern 2008-11-12  1811  {
9ac39f28b5237a Alan Stern 2008-11-12  1812  	struct usb_device	*udev = interface_to_usbdev(intf);
fcc4a01eb86612 Alan Stern 2010-11-15  1813  	int			status;
9ac39f28b5237a Alan Stern 2008-11-12  1814  
6ddf27cdbc218a Ming Lei   2010-11-15  1815  	usb_mark_last_busy(udev);
fcc4a01eb86612 Alan Stern 2010-11-15 @1816  	status = pm_runtime_put(&intf->dev);
9bbdf1e0afe771 Alan Stern 2010-01-08  1817  	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
9bbdf1e0afe771 Alan Stern 2010-01-08  1818  			__func__, atomic_read(&intf->dev.power.usage_count),
9bbdf1e0afe771 Alan Stern 2010-01-08  1819  			status);
9ac39f28b5237a Alan Stern 2008-11-12  1820  }
9ac39f28b5237a Alan Stern 2008-11-12  1821  EXPORT_SYMBOL_GPL(usb_autopm_put_interface_async);
9ac39f28b5237a Alan Stern 2008-11-12  1822  

:::::: The code at line 1816 was first introduced by commit
:::::: fcc4a01eb8661226e80632327673f67bf6a5840b USB: use the runtime-PM autosuspend implementation

:::::: TO: Alan Stern <stern@rowland.harvard.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
