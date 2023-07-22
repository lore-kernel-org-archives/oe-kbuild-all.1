Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E0F9F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690014208; x=1721550208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZFD5chvhuRahCWBOjEd074w+a/BnIwnOyMgXTNyoxg=;
  b=lJ7qPIneqdAGVxBPwWzkvuOIEbaiy/kAYFGilZXGcyYmwQESZD/jy5bE
   9bolHOSs+C0H0Kd+hj7vDZn0QuyC/HXZXUYBB5ezkwcXs165ADonTW/sG
   djT4KL2qK2wvr9URVDvi9OFM7oUXcoUwNW00Dwwk9ZvOpzFYUWW6U06Sp
   eWjSQhCaaGAW5NsqJNgG+nB2dR62n3+q7GEy7jWc42AuBrpnXdtl90vZA
   b5eiZBKC3GQ4OjFOAfeyLTz/aNZXXlIDaeGEbcrboDsQYVx7zJomERa7v
   12lud3wa4+N9ToN/GlEl3TqCXh+TPljhQb2RKE1+CmIa9WDQDOdHro994
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="357174201"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="357174201"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 01:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055836305"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="1055836305"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jul 2023 01:23:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN7tf-00089x-0m;
	Sat, 22 Jul 2023 08:23:27 +0000
Date: Sat, 22 Jul 2023 16:23:13 +0800
From: kernel test robot <lkp@intel.com>
To: Avadhut Naik <avadhut.naik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs/sp_SP: Add translation of
 process/contribution-maturity-model
Message-ID: <202307221642.nEBAfROh-lkp@intel.com>
References: <20230717181602.3468421-1-avadhut.naik@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717181602.3468421-1-avadhut.naik@amd.com>

Hi Avadhut,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on next-20230721]
[cannot apply to linus/master v6.5-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avadhut-Naik/docs-sp_SP-Add-translation-of-process-contribution-maturity-model/20230718-185746
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20230717181602.3468421-1-avadhut.naik%40amd.com
patch subject: [PATCH] docs/sp_SP: Add translation of process/contribution-maturity-model
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221642.nEBAfROh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221642.nEBAfROh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/translations/sp_SP/process/contribution-maturity-model.rst:4: WARNING: undefined label: documentation/process/contribution-maturity-model.rst (if the link has no caption the label must precede a section header)

vim +4 Documentation/translations/sp_SP/process/contribution-maturity-model.rst

     3	
   > 4	:Original: :ref:`Documentation/process/contribution-maturity-model.rst`
     5	:Translator: Avadhut Naik <avadhut.naik@amd.com>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
