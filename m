Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158ACDF61
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691009068; x=1722545068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfUs7dIIMXqaIRKzaSQAAWRUV4nJmz+R8F3dtqbdyqQ=;
  b=bFY7060DnvmGuZBmDipIWYyKkw3IhXG8zqwboeGpH28KjyklOZ1YhseE
   kcR6e72VtN4L/d6tVuIFwuenJHaVRy9QKTprYGwHCnxuuGXxNRk4+0s44
   3CvEdArD9/2KBEQ5286pkapVVys5iuKVkB+rm8QVvc3i3vC7P/JaFrnhf
   M2Jbeznx4kBgEXSqRe6rloLn8jocgYe0Gc6mW8LGKsTkrqVvkDjOI2zhf
   vCpwMMJWeK8VtvhVW2Z6hUyFjuK9px9kUtvEAOCC7p0NZnEuwzIcxSS7E
   xRz+oe200cVtqy/wf0gPLICqwBUiE947QiS8cFuxzzw+clVs4rONCeYOL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369698551"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="369698551"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 13:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794731759"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="794731759"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 13:44:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRIhl-0001TD-0P;
	Wed, 02 Aug 2023 20:44:25 +0000
Date: Thu, 3 Aug 2023 04:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>, linux-doc@vger.kernel.org
Subject: [brauner-vfs:b4/vfs-super-exclusive.v2 6/6] htmldocs:
 Documentation/filesystems/api-summary:38: ./fs/super.c:558: WARNING:
 Unexpected indentation.
Message-ID: <202308030438.UYcxIMES-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-super-exclusive.v2
head:   cdcc91fd53b39d6b68bfdca0b21a7883cc6ec4ba
commit: cdcc91fd53b39d6b68bfdca0b21a7883cc6ec4ba [6/6] fs: add FSCONFIG_CMD_CREATE_EXCL
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030438.UYcxIMES-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030438.UYcxIMES-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/api-summary:38: ./fs/super.c:558: WARNING: Unexpected indentation.
>> Documentation/filesystems/api-summary:38: ./fs/super.c:559: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/filesystems/api-summary:38: ./fs/super.c:561: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
