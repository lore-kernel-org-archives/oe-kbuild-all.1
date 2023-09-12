Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB961775A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694513845; x=1726049845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvNTWeLJvOUbG4fllvoGy36HuWNW14mOiMJyBvaeUZk=;
  b=kr27DCr+SLdjN3Nzfiv7DNR7Kg/0sOsRsyrMuudAVD2ohA/dofwJA63i
   BzUpHrrFHPeXEHasaZ0t+m2wpJfSbA3aBeaqv6X7OYqZGQmN0Ea7slZKv
   1mEAdrDfMhUvvH2z24duh3R7bMyhUhGqXL5Lu8sAuEafO+mCethmOro5G
   jiCE38XN2to6yFqh/PMlCiG8YO/Hi/BQ2+p2BOCBcSq4S7aj5xFhQmgNX
   fcsRTxZAln52qyoSaUq0bH8Kc2GGso0ZXz3YInLoeLTwV6b+9c3HkIgfP
   uC+4SimA8X7PV2D0/joBSYfQFiBuPrjS3OKZ+JNvHeOgtDW+9GRNLdmsq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="363364543"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="363364543"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858742254"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="858742254"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 03:17:23 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg0SP-0000FE-1W;
	Tue, 12 Sep 2023 10:17:21 +0000
Date: Tue, 12 Sep 2023 18:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 4291/4552]
 arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: error: no previous
 prototype for 'plpks_init_var'
Message-ID: <202309121829.msXORndZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 9f2c7411ada98f9e062bcd493be7d6b694048505 [4291/4552] powerpc/pseries: PLPKS SED Opal keystore support
config: powerpc64-randconfig-r015-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121829.msXORndZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121829.msXORndZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121829.msXORndZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/plpks_sed_ops.c:42:6: error: no previous prototype for 'plpks_init_var' [-Werror=missing-prototypes]
      42 | void plpks_init_var(struct plpks_var *var, char *keyname)
         |      ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/plpks_init_var +42 arch/powerpc/platforms/pseries/plpks_sed_ops.c

    41	
  > 42	void plpks_init_var(struct plpks_var *var, char *keyname)
    43	{
    44		var->name = keyname;
    45		var->namelen = strlen(keyname);
    46		if (strcmp(PLPKS_SED_KEY, keyname) == 0) {
    47			var->name = PLPKS_SED_MANGLED_LABEL;
    48			var->namelen = strlen(keyname);
    49		}
    50		var->policy = PLPKS_WORLDREADABLE;
    51		var->os = PLPKS_VAR_COMMON;
    52		var->data = NULL;
    53		var->datalen = 0;
    54		var->component = PLPKS_SED_COMPONENT;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
