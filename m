Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AF15AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+Png/VX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697960447; x=1729496447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h8WMHG0Hs95pZfCW6oNBQXaDVUlsTcugWjAwBtUeYJI=;
  b=k+Png/VXJxxqYW1ksICrkDL1ybzFs33rw2rasc/4JMPjRQhTVDw8AeTQ
   AVi2gIboGBQWaK4N09pWYW+PPO9X1woSOzfbEOZmetOM+uAC/huFVJm83
   I6lOni0qSyE+usV6GqvpfjM/asVLFmORihvZy3fH2ZUUMoekiHNVkYtGt
   R3fVk3gidgcgRpc9RIlD8OnHB/7WFUdJehoDHLKV54bm7nzDeR/vfd/Xd
   4k5w/6IIysc7LdPtGqHhEyr7imrfyAtrr6VTEbfqIRPGiTcDvkouYZuIe
   e45Eg/tYVSebOYdhyu3qGmg/ChkkGgbaF2/+YHgI4FK95/qpVNYuEhAyF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="371755988"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="371755988"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 00:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1005001025"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1005001025"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2023 00:40:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quT4l-0005hN-24;
	Sun, 22 Oct 2023 07:40:43 +0000
Date: Sun, 22 Oct 2023 15:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] tools/power turbostat: Do not print negative LPI
 residency
Message-ID: <202310221511.JAAHk5a1-lkp@intel.com>
References: <20231022055221.569634-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022055221.569634-1-yu.c.chen@intel.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on acpi/turbostat]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/tools-power-turbostat-Do-not-print-negative-LPI-residency/20231022-135448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
patch link:    https://lore.kernel.org/r/20231022055221.569634-1-yu.c.chen%40intel.com
patch subject: [RFC PATCH] tools/power turbostat: Do not print negative LPI residency
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221511.JAAHk5a1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221511.JAAHk5a1-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#38: FILE: tools/power/x86/turbostat/turbostat.c:2046:
+	if (new->cpu_lpi > old->cpu_lpi) {
[...]
+	} else {
[...]

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#43: FILE: tools/power/x86/turbostat/turbostat.c:2051:
+	if (new->sys_lpi > old->sys_lpi) {
[...]
+	} else {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
