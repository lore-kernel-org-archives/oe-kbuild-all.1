Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12287C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 00:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668472431; x=1700008431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SXILu42ZF80KNGoxelf/WosLvSlJNbz2CfkArbmfUs=;
  b=YxcFwRyo/CO2Yb7iM7DmZe8RJnG7kSsNpF6eSZcr4qG661WAIkd5Inq2
   5RQVqGtxnJKS9XGUVzCoho0fN8HtwEtp/3/5rX9TgaPzzjq9VRtoWWYuA
   9a1PkvXZu2qV/XitdzO02kvIA8tUe2PigcyCFrXr2TxRLrXnDeT9+vDrs
   hMHwf+mUMH4qabBvdy1j3BQPUyKbLM8oXfAKWhQIJ+RNlzIrE/wLrrdy5
   B8fRDWdy6SOuxcXttVs1IkJL/sQnar3r/31KjfoZJwUkl+BZBaxQ5fzQs
   vkTzVY4KpwsUqqk4ucC8GU/PkjAIw+t7mXyplFxqirxerBP+gOpLaOH9T
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="295483669"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="295483669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 16:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="781139055"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="781139055"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2022 16:33:49 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oujtc-0000s5-1S;
	Tue, 15 Nov 2022 00:33:48 +0000
Date: Tue, 15 Nov 2022 08:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>
Subject: Re: [PATCH] tests/nvme: Add admin-passthru+reset race test
Message-ID: <202211150846.9Fnwxsg4-lkp@intel.com>
References: <20221114203412.383-1-jonathan.derrick@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114203412.383-1-jonathan.derrick@linux.dev>

Hi Jonathan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.1-rc5 next-20221114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Derrick/tests-nvme-Add-admin-passthru-reset-race-test/20221115-043752
patch link:    https://lore.kernel.org/r/20221114203412.383-1-jonathan.derrick%40linux.dev
patch subject: [PATCH] tests/nvme: Add admin-passthru+reset race test
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

spdxcheck warnings: (new ones prefixed by >>)
   drivers/cpufreq/amd-pstate-ut.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> tests/nvme/046: 2:27 Invalid License ID: GPL-3.0+

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
