Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D276A28
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676213808; x=1707749808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFNinxfcD9dDDlRx3ob1v4ZBndSVc6C/xhSprT6FREQ=;
  b=QPFjfJ5ux+WnMiT2g4P/krIAYznWzvrXs+quIURC57F7QZssJ2dbNwS+
   XVhv9aTvGhvzP0ND52h/bpBmqzX1DvT5eX/CqqDescYEzcxmAO1wphzo4
   Ae6e1ifUrWC0QNUuF//rDngeKbIgT5fSQJkzIdEdT6GFI9E4X7nFpPo1G
   FkFVEKJ6g+eF0ptXTJliBoPWhtg1xszYu10wZxuT6PWuSkHyE0Bhf/Oh/
   iX3J+FWRl3Wb/oKKMBXKpvDK+ioK1neeTAUCPAquywiC9ofcdycTZHenv
   JwURA/PTbfDptXzu7N6WRpTdV2WIiMwNqswK+P2JycqgLA/u0Qt5aW7VF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311081747"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="311081747"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 06:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="757294000"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="757294000"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2023 06:56:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRDmX-0007Fp-0C;
	Sun, 12 Feb 2023 14:56:45 +0000
Date: Sun, 12 Feb 2023 22:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202302122247.N4S791c4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   a6f8eedce38d194452c40540af6cc9cc2a035133
commit: ebf519710218814cf827adbf9111af081344c969 thermal: intel: powerclamp: Add two module parameters
date:   3 days ago
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?id=ebf519710218814cf827adbf9111af081344c969
        git remote add thermal git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git
        git fetch --no-tags thermal thermal/bleeding-edge
        git checkout ebf519710218814cf827adbf9111af081344c969
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302122247.N4S791c4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING: Inline emphasis start-string without end-string.

vim +328 Documentation/admin-guide/thermal/intel_powerclamp.rst

   326	
   327	``cpumask`` (RW)
 > 328		A bit mask of CPUs to inject idle. The format of the bitmask is same as
   329		used in other subsystems like in /proc/irq/*/smp_affinity. The mask is
   330		comma separated 32 bit groups. Each CPU is one bit. For example for a 256
   331		CPU system the full mask is:
   332		ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff
   333	
   334		The rightmost mask is for CPU 0-32.
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
