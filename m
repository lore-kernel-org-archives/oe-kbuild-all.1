Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DC4B5AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 04:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJmu3ryj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703566511; x=1735102511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDOQg7UCIzDpFbgEUPoBkU8M70/nPYim+Dj4XEv2LI8=;
  b=PJmu3ryjR85gAIfA7pxteGdWhb38binAPG4+h4zkQo8KL6WNmslvFRjt
   wKKkl3uyWGca4sBz009u0gisjKdou4vVo9YbagjKTH23ape38VNyjDUse
   jWSBSR/QmTYOEpBxYJFc97MobLtiO4duLzIVV4xcl9Yy2AFiCmcvQ6qdv
   NMGsSVxcGb4W9bzd8/s185YjnOF/okkJaruZBiXrvJHPgR3ZxIVHwtU0L
   OAtTktnK3jBTacp8HwrLU3mDvSNGhARinoOVoJoz+sM6BRzPT6v5JMIu9
   rXCdnsUXvPilyRUmT5Da77x6KagF2V1GPh3iwUwk17YqJX95qolV4OkSd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3405028"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="3405028"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 20:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="843791204"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="843791204"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2023 20:54:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHzSx-000E0r-0e;
	Tue, 26 Dec 2023 04:54:55 +0000
Date: Tue, 26 Dec 2023 12:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4859/29953]
 drivers/power/supply/power_supply_core.c:739: warning: Excess function
 parameter 'ocv' description in 'power_supply_temp2resist_simple'
Message-ID: <202312261251.iZfXrSzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   c0585bc7c8352ddc3af0c88ef664317a48139bd8
commit: a96c947b075f9781a5d5941f560acf8b4c01405e [4859/29953] UPSTREAM: power: supply: core: Add battery internal resistance temperature table support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231226/202312261251.iZfXrSzF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261251.iZfXrSzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312261251.iZfXrSzF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/power_supply_core.c:739: warning: Function parameter or member 'temp' not described in 'power_supply_temp2resist_simple'
>> drivers/power/supply/power_supply_core.c:739: warning: Excess function parameter 'ocv' description in 'power_supply_temp2resist_simple'


vim +739 drivers/power/supply/power_supply_core.c

   722	
   723	/**
   724	 * power_supply_temp2resist_simple() - find the battery internal resistance
   725	 * percent
   726	 * @table: Pointer to battery resistance temperature table
   727	 * @table_len: The table length
   728	 * @ocv: Current temperature
   729	 *
   730	 * This helper function is used to look up battery internal resistance percent
   731	 * according to current temperature value from the resistance temperature table,
   732	 * and the table must be ordered descending. Then the actual battery internal
   733	 * resistance = the ideal battery internal resistance * percent / 100.
   734	 *
   735	 * Return: the battery internal resistance percent
   736	 */
   737	int power_supply_temp2resist_simple(struct power_supply_resistance_temp_table *table,
   738					    int table_len, int temp)
 > 739	{
   740		int i, resist;
   741	
   742		for (i = 0; i < table_len; i++)
   743			if (temp > table[i].temp)
   744				break;
   745	
   746		if (i > 0 && i < table_len) {
   747			int tmp;
   748	
   749			tmp = (table[i - 1].resistance - table[i].resistance) *
   750				(temp - table[i].temp);
   751			tmp /= table[i - 1].temp - table[i].temp;
   752			resist = tmp + table[i].resistance;
   753		} else if (i == 0) {
   754			resist = table[0].resistance;
   755		} else {
   756			resist = table[table_len - 1].resistance;
   757		}
   758	
   759		return resist;
   760	}
   761	EXPORT_SYMBOL_GPL(power_supply_temp2resist_simple);
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
