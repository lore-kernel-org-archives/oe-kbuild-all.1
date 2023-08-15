Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7FB5C9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692109564; x=1723645564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bfP/6ZleK2YfKKSiAE32jHQQbUsH5WMiJOiTsErv54=;
  b=dY7XDBaa1X03/vVK31xiJ36YhZS5E/fiJeCBMGAoxjz87yH6r2IELqrI
   rfOj07ZVtHD/n0gKJOSwkQB2RdEnGPdO8bwa1q99y5OEAqOkcPGFeI0hN
   JWBvNP50tmbXiE+qWeQpwHd/Z5Gy2eoaEZOQoni2T7cV+z23H5jPWbwG6
   gWZ9RbZEqbilMaeATsR/qKp5XO4PbDgqrDaZXQr25sl9SxW2llMh72emL
   /JbSiNIhgXC7pOJ1wUlOMbVOxAUforGZbgq4894czImhb6ZKvNCdM3PUf
   gvVqLagG5/M21gxc+ttuT5JLPTIbzq1qR+TugODRgBspC0t3OBq948zOZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372281268"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="372281268"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 07:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907598634"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="907598634"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Aug 2023 07:25:59 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVuz2-00011T-0K;
	Tue, 15 Aug 2023 14:25:38 +0000
Date: Tue, 15 Aug 2023 22:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjiang Tu <tujinjiang@huawei.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com, liushixin2@huawei.com
Cc: oe-kbuild-all@lists.linux.dev, tujinjiang@huawei.com
Subject: Re: [PATCH 2/6] mm/page_owner: show modules allocating pages when
 oom occurred
Message-ID: <202308152233.SyFFj1kn-lkp@intel.com>
References: <20230815125251.2865852-3-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815125251.2865852-3-tujinjiang@huawei.com>

Hi Jinjiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on mcgrof/modules-next linus/master v6.5-rc6 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-page_owner-support-identifying-pages-allocated-by-modules/20230815-195940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230815125251.2865852-3-tujinjiang%40huawei.com
patch subject: [PATCH 2/6] mm/page_owner: show modules allocating pages when oom occurred
config: sparc64-randconfig-r035-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152233.SyFFj1kn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152233.SyFFj1kn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152233.SyFFj1kn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/page_owner.c:34:6: warning: no previous prototype for 'po_register_oom_notifier' [-Wmissing-prototypes]
      34 | void po_register_oom_notifier(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/po_register_oom_notifier +34 kernel/module/page_owner.c

    33	
  > 34	void po_register_oom_notifier(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
