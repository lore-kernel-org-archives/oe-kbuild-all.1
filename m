Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30D7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694162218; x=1725698218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gwB16yk+TdgAjBzE8qwvUdTFw9lG8Dj60s9M3XHPuS0=;
  b=c/Fka67A25zERHxAdTVpD3RApV+C89yWafdlr47cgTueuRlBM/g/Fddd
   MErUt1047OKBMJXXNXCSk6xjWiSe8CBjYNcpm3PhaMs3cKkOn2aNRs4hj
   b+4bs46ngBOnKx95ci5CcVa2Q1NZ18vkB/CLaOnGAnx913LaB7uEWgVvN
   GDPhkJ6TcmKswD0tvLvfMkbZoa1BqdJ8+/x0wK0vjuBgFJlUGp5ZMBUS5
   wV2lFNnJTKGz6uSTaZ0uXGyL0HAXDrQ8/GH9JtJ50WKPdOeCSOnUggfg4
   s6KdLHBmKzicRxlOajz4Nn+6+/p0iACQLXJCzk7KLt4DtIu6yLIvTnjLq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408587366"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="408587366"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 01:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885586110"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="885586110"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2023 01:36:41 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeWz0-00024p-1S;
	Fri, 08 Sep 2023 08:36:54 +0000
Date: Fri, 8 Sep 2023 16:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] kthread: Add kthread_stop_put
Message-ID: <202309081653.IMl41FhS-lkp@intel.com>
References: <20230907234048.2499820-1-agruenba@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907234048.2499820-1-agruenba@redhat.com>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20230908]
[cannot apply to drm-misc/drm-misc-next akpm-mm/mm-everything linux/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Gruenbacher/kthread-Add-kthread_stop_put/20230908-074348
base:   linus/master
patch link:    https://lore.kernel.org/r/20230907234048.2499820-1-agruenba%40redhat.com
patch subject: [RFC] kthread: Add kthread_stop_put
reproduce: (https://download.01.org/0day-ci/archive/20230908/202309081653.IMl41FhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081653.IMl41FhS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/basics:81: ./kernel/kthread.c:726: WARNING: Unexpected indentation.
>> Documentation/driver-api/basics:81: ./kernel/kthread.c:728: WARNING: Block quote ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
