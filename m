Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079C63A3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 12:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694089333; x=1725625333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8VOqPVSIgxAt6a/8mX2/g8iwKlyB7CfkDhVuX9gcRA=;
  b=llJOSFK5cWf+/fgpn5KySx2buKd/v0Pgp4iy2vAt9g/3l+tDf0FNu3ya
   FbnXN0gFCiliuiusPFt5yPNtz1ZNxOKjykHKSKFnJ6kI4HRnVZASZ/WzE
   VOb1HupNa6PztQElMP1qUvAGABKU29ZjYVzftkodrqxJlCJdDYFvvjnEf
   ywyEZCY7g80MXBMnfmSaeh2kfJvLk0MIWjmVSYYY0dA+P1nMDBG1kd+Et
   6sM9offcEAhtQMFgfI7ds5IKOiowgIYsqFZBpOOdIKgLADmSUY5JYZ2Uj
   +ZRKQ96prXJ3VXo1sNHRSJ38VipWqT3yAlhyvuYF3cqlx3kGENbuIVUxw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="381122700"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="381122700"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 05:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691767265"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691767265"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Sep 2023 05:22:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeE1J-0001D5-0X;
	Thu, 07 Sep 2023 12:22:01 +0000
Date: Thu, 7 Sep 2023 20:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: advantech.susiteam@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, wenkai.chung@advantech.com.tw,
	Susi.Driver@advantech.com, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mfd: eiois200: Add EIO-IS200 Series EC Core Driver
Message-ID: <202309071936.oPUjyLt5-lkp@intel.com>
References: <20230907031320.6814-5-advantech.susiteam@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907031320.6814-5-advantech.susiteam@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on linus/master next-20230907]
[cannot apply to lee-mfd/for-mfd-fixes v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/advantech-susiteam-gmail-com/mfd-eiois200-Insert-EIO-IS200-core-driver-to-Kconfig/20230907-111628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20230907031320.6814-5-advantech.susiteam%40gmail.com
patch subject: [PATCH 4/4] mfd: eiois200: Add EIO-IS200 Series EC Core Driver
config: x86_64-randconfig-121-20230907 (https://download.01.org/0day-ci/archive/20230907/202309071936.oPUjyLt5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071936.oPUjyLt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071936.oPUjyLt5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/eiois200_core.c:58:21: sparse: sparse: symbol 'is200_range' was not declared. Should it be static?
>> drivers/mfd/eiois200_core.c:438:5: sparse: sparse: symbol 'eiois200_probe' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
