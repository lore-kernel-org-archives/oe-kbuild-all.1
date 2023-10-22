Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097663CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFCZ0AIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698016940; x=1729552940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wIh60cYBGlcyhIPx8Rb2DUHiTOMsIGjty4AQPZH14cg=;
  b=FFCZ0AIrY5BcvXSlZGcWz4kN0Xw+4ip2qg1IetVUXfgXPV0TOzm8LrO5
   wuRzvcUY7xo4IistgFeNF9E3Hx/mKJ33O5Z/QCboqF+AoFvIdSaEk5NTG
   CWkXy9rFN0SRGR2aO8oyzuavJxQ2hzHShWiGZVUqVweBVjfgybytVvtlo
   g0/+afMDiH/88v8VdCXQL23LkQENvWbwVGXGuy/Sid1W2h0WHpuCEx7d/
   U9xrpbCNuEMiBsUJBnYbKzswacSq0HZ4tL8yjoiXxendmq4+GetHHWWxL
   +/Om/HfLdsU3q9Ldo+458HG2KWDm03CFmZ+/qKFBsgeJBFa61xPwHZygi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="385618857"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="385618857"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 16:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="881573846"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="881573846"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Oct 2023 16:22:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quhlw-0006MS-1Z;
	Sun, 22 Oct 2023 23:22:16 +0000
Date: Mon, 23 Oct 2023 07:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/4] PCI: Add support for drivers to decide bridge D3
 policy
Message-ID: <202310230613.iTTZYZrC-lkp@intel.com>
References: <20231009225653.36030-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009225653.36030-3-mario.limonciello@amd.com>

Hi Mario,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus rafael-pm/linux-next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-x86-s2idle-Export-symbol-for-fetching-constraints-for-module-use/20231010-065942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20231009225653.36030-3-mario.limonciello%40amd.com
patch subject: [RFC v1 2/4] PCI: Add support for drivers to decide bridge D3 policy
config: x86_64-randconfig-103-20231023 (https://download.01.org/0day-ci/archive/20231023/202310230613.iTTZYZrC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230613.iTTZYZrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230613.iTTZYZrC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/pci.c:3202:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
