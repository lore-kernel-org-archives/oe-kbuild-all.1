Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA1B41E5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwTt4sXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697545555; x=1729081555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7nHN9ogUwv52ITLXjhiyQ4aEek9fTkbUHHk4QRgL1X8=;
  b=UwTt4sXJM4LTKGG5gPN/Tq6XFd0FlIa8xSm71vKSBW8RvlKLf/MCEfB4
   Yjhp842MNZKSh1VvOZf98OHb0QaZ1QoKjv5yncIPyb1jUl1Az8PoPMcRy
   PLX/mKmEcnjek2P0AUWotK1YY6VxRPxnzYuSdBEd+2UoY9TMGtG8+oSy8
   dCnhh4B3MC0eSIby7sbQCHIOA+zwTmQCcyFAZghRC+oSvWOzUPnKPX9IC
   fhyxc17CLbh9tzv+eoR+AYQ7q1Yvx+BUhvP3Pl9OadILMjjZ3iM5VhLuk
   OayvdKCA+q1TkoE4dik/ysN3eZtbh8HDVchM3Tx2UT/HlQ5rJhQJYewN5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="366029406"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="366029406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 05:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749669237"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="749669237"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 05:25:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsj8w-0009a9-2H;
	Tue, 17 Oct 2023 12:25:50 +0000
Date: Tue, 17 Oct 2023 20:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/16] fnic: allocate device reset command on the fly
Message-ID: <202310172055.XjlOW4CU-lkp@intel.com>
References: <20231017100729.123506-14-hare@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017100729.123506-14-hare@suse.de>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/zfcp-do-not-wait-for-rports-to-become-unblocked-after-host-reset/20231017-181107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231017100729.123506-14-hare%40suse.de
patch subject: [PATCH 13/16] fnic: allocate device reset command on the fly
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172055.XjlOW4CU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172055.XjlOW4CU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#241: FILE: drivers/scsi/fnic/fnic_scsi.c:2326:
 				"Abort and terminate issued on Device reset "
+				"tag 0x%x\n", tag);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
