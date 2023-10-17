Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D5C3D994
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNW/xPlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697546531; x=1729082531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mc1baTcI/qYeAyGU8xJNMZnxeFM4RBzgOGNlnIazyi4=;
  b=FNW/xPlu0hjg4HUXHNS1yt6cdfer9uvFeYiwrsY8yZS4E7uP5fwzhUTR
   obFsUr8Xj7o1ikMwVncvIA+PP2VC3Z8zJ7SO8wNZIwFyPGlOsyPne0HFJ
   Z9dBmtfT6ODgVSq7ynXjdRBh+KvzqFs7I80cQVlPxAp1DTVJ6KhcLje82
   jJbU8VpLjUNn4UFP5YItozMaS25CX5Q50Wii1D8U3VdYSFPc+170GLooE
   dm8Kkx3Zlc/Vl+b+BtAL7pNv/mLGyy9hmB3SZAccg4VVA7iVk89vJTmHD
   6sjrCLHLs+plezz4fQOkXQvIxG2I5BjddOepWC8PuHmCSYBcV40nQUhmd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="4371703"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="4371703"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 05:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785475595"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="785475595"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Oct 2023 05:42:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsjOg-0009at-35;
	Tue, 17 Oct 2023 12:42:06 +0000
Date: Tue, 17 Oct 2023 20:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 15/16] csiostor: use separate TMF command
Message-ID: <202310172018.GYoBeO72-lkp@intel.com>
References: <20231017100729.123506-16-hare@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017100729.123506-16-hare@suse.de>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/zfcp-do-not-wait-for-rports-to-become-unblocked-after-host-reset/20231017-181107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017100729.123506-16-hare%40suse.de
patch subject: [PATCH 15/16] csiostor: use separate TMF command
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172018.GYoBeO72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172018.GYoBeO72-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#185: FILE: drivers/scsi/csiostor/csio_scsi.c:2226:
 			 "Attempt to abort I/Os during LUN reset of %llu"
+			 " returned %d\n", sdev->lun, retval);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
