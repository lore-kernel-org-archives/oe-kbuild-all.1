Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC8F385
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695352210; x=1726888210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xs9YDPsH+5LNfjBS0C+jHD/S4YDLPaaF0rpdfiVIve0=;
  b=jAuDY1agrFbk6irF1P2qtl8yG/r5VDTYr3pfD73bzN+cBfJSIXGs9/sS
   lGy99L/BfaVjiHX9SC3OHSTeaJowxgumc7T1ttMLsgAj2NBwosy/n3CvO
   SidWIqKeSUGujEiw1M4zTlHq+iT4PfIIryOnMtc87FurVxGBO+QjOjxA1
   5uK0scVA/IPj/otuQ4PgGmVr3uk4k+xbtmI/tS8HeNyd6933JzSN4XOUB
   fQ5it4BXXAxbb41ZXkNDjnz4bCkN4Nv1rFtJrGnaPO9C/+EpJ5I6JrFyS
   r6H1yM0SN4YMsPomG04FptfCWLded2ZgEECv6TOvM+r4TU/kB+89IMNs+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384564522"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="384564522"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 20:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817623613"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817623613"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2023 20:10:07 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjWYP-0000kB-19;
	Fri, 22 Sep 2023 03:10:05 +0000
Date: Fri, 22 Sep 2023 11:09:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.5 25/166]
 drivers/regulator/max77857-regulator.c:70:22: sparse: sparse: symbol
 'max77857_regmap_config' was not declared. Should it be static?
Message-ID: <202309221026.XXKPIjPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   fd1a1970676435366dd0f58cb455292d92d7ecce
commit: bfce6add9cad1ff9ce759219a58b7ea892fb9535 [25/166] regulator: max77857: Add ADI MAX77857/59/MAX77831 Regulator Support
config: i386-randconfig-062-20230922 (https://download.01.org/0day-ci/archive/20230922/202309221026.XXKPIjPY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221026.XXKPIjPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221026.XXKPIjPY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/max77857-regulator.c:70:22: sparse: sparse: symbol 'max77857_regmap_config' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:209:5: sparse: sparse: symbol 'max77859_get_voltage_sel' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:221:5: sparse: sparse: symbol 'max77859_set_current_limit' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:235:5: sparse: sparse: symbol 'max77859_get_current_limit' was not declared. Should it be static?
   drivers/regulator/max77857-regulator.c:428:28: sparse: sparse: symbol 'max77857_id' was not declared. Should it be static?
>> drivers/regulator/max77857-regulator.c:446:19: sparse: sparse: symbol 'max77857_driver' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
