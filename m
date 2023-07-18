Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A71174C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689710950; x=1721246950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0bxUuqsXf2bi0YRNYdHU5kXhlqdkElLMKw4EOc807So=;
  b=Pp2HHqo6lxoFN28dS/B+Y1auRwwy+Vel/bL7I0DApauNSUW1GA7tOiBE
   rsyog8FoQil+RaMjPXsNGF9jYA07Y54VZUiFVKsS+tJClSApdqA3syhOs
   QsTBXQvN46crVPqFgyUiwR1qghwVVWacSeKXzPE1et3swXGtn1IxT1TRB
   Bk2ivcX53mWKgIqpR5D3P8ZdK7P4wTUKZWIOFiS2lDQkVjKfCQ2JwE02p
   j2VhrwsQp00S2A3vYrWaTd6CZZVju3enyDbf5EGRYUZJQNPSIdf7+XSu6
   HeJYUn24zKiOJ2FOebPcBCb5XrRV5B9cgrtzNSHKbt/CWHYqr6LcPWTTn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="363761185"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="363761185"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847817906"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="847817906"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Jul 2023 13:09:08 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLr0N-0003rk-2R;
	Tue, 18 Jul 2023 20:09:07 +0000
Date: Wed, 19 Jul 2023 04:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL
 Switch mailbox CCI
Message-ID: <202307190326.roT6GWpa-lkp@intel.com>
References: <20230717162557.8625-5-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717162557.8625-5-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on pci/next pci/for-linus linus/master v6.5-rc2 next-20230718]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-mbox-Preparatory-move-of-functions-to-core-mbox-c/20230718-181730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230717162557.8625-5-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL Switch mailbox CCI
config: parisc-randconfig-r003-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190326.roT6GWpa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190326.roT6GWpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190326.roT6GWpa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/cxl/core/switch-cci.o', needed by 'drivers/cxl/core/built-in.a'.
   make[5]: *** [scripts/Makefile.build:252: drivers/cxl/core/mbox.o] Error 1 shuffle=4085622744
   make[5]: Target 'drivers/cxl/core/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
