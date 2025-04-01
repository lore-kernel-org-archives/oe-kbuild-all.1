Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1909C7081C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533242; cv=none; b=s4Hoe25qVsLJnyDau3D8JALR1B+aTHIRdiaA3nzcT0wpToP57lY8NO72BOEif/Pa+RrBE0KKnnQgGAun840qML0GhcHE2UaqaLhohknL5Kjpar7jUmXB9kgO9zViOy8tfdojY5Hd8P6vZZ87n3KZeREelLr5KMJ0ZdFtQ98MsK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533242; c=relaxed/simple;
	bh=0+xzJBXRfXfFkyA9FENNRq1ZDv0uIQUnzmQSpSZpJx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLcFhWKr7WO07u3jOlKY6nA5mdOhL/7+Xx1HgFiMNy5IQLun820S3B/5Wu/RBST9B07LNmDhKfQSD+bbVu5CZRv4dIRgYT88MQ4W8nRnsfVhT6dDrStuHLG8x7NmhpSncxrUx8OvvdZwAjDiV5hngvR9LTG0Zf8bV6P6iw5c7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjcIBv83; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjcIBv83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743533241; x=1775069241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+xzJBXRfXfFkyA9FENNRq1ZDv0uIQUnzmQSpSZpJx4=;
  b=XjcIBv83vph1OgtM1U/CC63+JLNyVdAlIQFMy+/lhsfX8NLFKft+WT/3
   4ERmRIuoYT2ZPRYJccy4uPNKS62FA6aHRd9Jtw6lmfy7WVppTQCyVJnRl
   uaHLt18tKBzQ/9AFikIOP6bNlbF5PoMs4ZH8Hh8NI8QMjxtfsM635qdSy
   +ATgzu4irbJwZ+5OdkeyZVmp30IolgwHujs63Ptn+ditCR37/A8khB8qz
   bMSi7XB5L2W/ETidmDF/6mYHwlk70JpGfEPB4Bilwjg33Cu9J8EodKIhr
   AkWriMUW047VFrf8YdFr8p2Tu45NEpumO4iVhNO5elEQh/3C9RzJRsPWr
   g==;
X-CSE-ConnectionGUID: Jz7UU3IEQG6OVXfx0+NCMw==
X-CSE-MsgGUID: jgiowY0TQ/iI4Hs4uqlTvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70234168"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="70234168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 11:47:20 -0700
X-CSE-ConnectionGUID: 6crO5/vXRWWDgB/ZX6oXYg==
X-CSE-MsgGUID: 7nadFSH2Q5inR4E8QeRVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126721294"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Apr 2025 11:47:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzgdp-000A4M-25;
	Tue, 01 Apr 2025 18:47:17 +0000
Date: Wed, 2 Apr 2025 02:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-thread 1/2] ERROR: modpost: "kthread_start"
 [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202504020257.OojyYLtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-thread
head:   cfff97083d56d7a0f53230aa88a1602696cc0c6e
commit: c3657cf33b1afec64100b8c6ded6d48e2f8bffd8 [1/2] kthread: Add kthread_start()
config: csky-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020257.OojyYLtM-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020257.OojyYLtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020257.OojyYLtM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "kthread_start" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "kthread_start" [kernel/trace/preemptirq_delay_test.ko] undefined!
>> ERROR: modpost: "kthread_start" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "kthread_start" [lib/test_rhashtable.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/char/hw_random/rng-core.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/media/rc/rc-core.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/hwmon/adt7470.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/mmc/core/mmc_core.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/iio/chemical/sgp30.ko] undefined!
>> ERROR: modpost: "kthread_start" [drivers/iio/trigger/iio-trig-loop.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
