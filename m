Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF721343
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 19:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695497822; x=1727033822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6g67LLrncTlHdW55/38tQYPwB4qTaFuNDMpLAGuw44Y=;
  b=CFleVOLURv3DNbszR0/1vCq2iXl+kaIdh1jahSIyzXdjyp6Qa1BM1NHp
   TlCAGYcI1qkHbd1XHXM3xT/aR6+93D/51yU40PBDjbarFKJTfVhmmL5OJ
   ZOcoNTbw+gUY/Q2BcqxqrzSCLIbXLFvCduC9deyQmXYQ2l1RPToMzw4Wx
   k2V9OyGi6bKUHnshN01Nlr+xMDYNkmXlFZTOCRcPlqXlUFh7m6RT0pg4e
   7ElciTCTl4A+qtt0+2e0uX2lbdL0oKPKj/rv2U7yXv3uonmr96uSTeDLk
   F+IR6erkd/qXDnvFFFnkpG3b8Yw9v6aE7PfajLJrUlDUHcYCUQFTeT+Z0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="384881399"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="384881399"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 12:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="751216589"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="751216589"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2023 12:36:59 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk8Qz-0002mC-3B;
	Sat, 23 Sep 2023 19:36:57 +0000
Date: Sun, 24 Sep 2023 03:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/7] lsm: Add audit_log_lsm_data() helper
Message-ID: <202309240339.vX7ZxegR-lkp@intel.com>
References: <20230921061641.273654-2-mic@digikod.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921061641.273654-2-mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ce9ecca0238b140b88f43859b211c9fdfd8e5b70]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/lsm-Add-audit_log_lsm_data-helper/20230922-052237
base:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
patch link:    https://lore.kernel.org/r/20230921061641.273654-2-mic%40digikod.net
patch subject: [RFC PATCH v1 1/7] lsm: Add audit_log_lsm_data() helper
config: s390-randconfig-002-20230924 (https://download.01.org/0day-ci/archive/20230924/202309240339.vX7ZxegR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309240339.vX7ZxegR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309240339.vX7ZxegR-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: security/lsm_audit.o: in function `audit_log_lsm_data':
   lsm_audit.c:(.text+0x46a): undefined reference to `init_net'
>> s390-linux-ld: lsm_audit.c:(.text+0x474): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
