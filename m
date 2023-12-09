Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747E187C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAxSOpA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702137885; x=1733673885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mbwyxV6Emt7SDz2s/R8taFzxiWC37ANwbG4JfXiR2GI=;
  b=HAxSOpA7vlTtDgIifpohzo3Rjth9L0y7qfyVHWWGAsfOI+kBajCKHTaw
   lsLfjCFJ2PbosMzUk5Hk93U+wRFvPtqElx646wkpPDuG5DRxhqkBJfKps
   h1kVvmPUpAQmsRa6dbgvuHqXWY66El2Ge1BMmKXLhHQTF4WBRankHO34p
   wUqYoYyOkEXMUhsSpyrK8xVV0oa1ZNhNCXPy3/YSw1IynMf/0jYm7irHD
   V91RZUHd9N4DuoQNQ5o5u3aHX2UobnCbc5ui+OHm+g8REKTsiaoveP4yR
   SNeAgmF58rHdGu6HUbYI9/+T+EFdEqrwqfTJf0Qqh12GOP8sbg8Op+KZc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398379218"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="398379218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 08:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="13818109"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2023 08:04:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBzon-000FZ3-1a;
	Sat, 09 Dec 2023 16:04:41 +0000
Date: Sun, 10 Dec 2023 00:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/rv.c:244: warning: Function parameter or member
 'mdef' not described in 'rv_disable_monitor'
Message-ID: <202312100010.bWNK9nlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 102227b970a15256f5ffd12a6a276ddf978e6caf rv: Add Runtime Verification (RV) interface
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231210/202312100010.bWNK9nlA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312100010.bWNK9nlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312100010.bWNK9nlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/rv/rv.c:244: warning: Function parameter or member 'mdef' not described in 'rv_disable_monitor'
>> kernel/trace/rv/rv.c:255: warning: Function parameter or member 'mdef' not described in 'rv_enable_monitor'


vim +244 kernel/trace/rv/rv.c

   237	
   238	/**
   239	 * rv_disable_monitor - disable a given runtime monitor
   240	 *
   241	 * Returns 0 on success.
   242	 */
   243	int rv_disable_monitor(struct rv_monitor_def *mdef)
 > 244	{
   245		__rv_disable_monitor(mdef, true);
   246		return 0;
   247	}
   248	
   249	/**
   250	 * rv_enable_monitor - enable a given runtime monitor
   251	 *
   252	 * Returns 0 on success, error otherwise.
   253	 */
   254	int rv_enable_monitor(struct rv_monitor_def *mdef)
 > 255	{
   256		int retval;
   257	
   258		lockdep_assert_held(&rv_interface_lock);
   259	
   260		if (mdef->monitor->enabled)
   261			return 0;
   262	
   263		retval = mdef->monitor->enable();
   264	
   265		if (!retval)
   266			mdef->monitor->enabled = 1;
   267	
   268		return retval;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
