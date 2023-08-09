Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68C24513
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 19:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691610104; x=1723146104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i+csQsRU+UWiwA3wqKo97BA19L3OGHcRVoG2wzehYcs=;
  b=Y8zKWOlgsevfO21MwBkrKRFs9XCSzeYBHlZ5ujjl2TQYFueTL8VIkCG5
   oY1flkfN02ys2AWBHw9x8kx5woFOkiDOdAX6JWkfyn9cIeuPCdw3Pi9Xa
   GP8jjM2xPNCb+/u4WweTpw8WwJAZJD4olmE3trFCiQFxcKDtE+7LPoGFz
   n3TKFAvJCvJRfKe+wt0xBVktbmdxkUcPjKK8ROfwOlObh6d7maG/IyX5w
   DRbEVl93CKDvODHiA+EZR1O2bJWJFM3XYM5/ZmPNOL3ft/KdnXw9XERPT
   tCea0bCDZXqpXER5vednfcpp7ibA/ZbqyRU+rRjrmkehgbedcnMykPOpk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361346430"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="361346430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 12:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="766972927"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="766972927"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Aug 2023 12:41:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTp3t-0006LW-2X;
	Wed, 09 Aug 2023 19:41:41 +0000
Date: Thu, 10 Aug 2023 03:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 6/17] bugs.c:undefined reference to
 `srso_return_thunk'
Message-ID: <202308100352.FWbF5FoO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/srso
head:   c11a8b2bc1bb3ad76d8d28b283552768d665208c
commit: 953a4955188e0ec86ce13daf1e5d4fbbba2db8fc [6/17] x86/cpu: Add SRSO untrain to retbleed=
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230810/202308100352.FWbF5FoO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100352.FWbF5FoO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100352.FWbF5FoO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/bugs.o: in function `retbleed_select_mitigation':
>> bugs.c:(.init.text+0xf3): undefined reference to `srso_return_thunk'
>> ld: bugs.c:(.init.text+0xf8): undefined reference to `x86_return_thunk'
>> ld: bugs.c:(.init.text+0x2d1): undefined reference to `srso_alias_return_thunk'
   ld: bugs.c:(.init.text+0x2d6): undefined reference to `x86_return_thunk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
