Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA0DF68
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPQX1ZlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699194579; x=1730730579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wmg84M1sU+MEgYHqacQ2UPoMYxs3XVG3/ZzIvhq9es8=;
  b=RPQX1ZlQV/umD/cIBL6SrCrmkvB/tW8ipe8n1Ddpgon/Wx230hjB89Lu
   rSMzrXuIKEDRrD8NoranmPoZez0LuM16/NZD9yufERdeAe04sVjjoWaAM
   gckFUdFwPJHXa3b2Wro5nK+U+iRa6pcZxrOlWFPyvI/rxDPn8eRVV+SYI
   AgEFjYISbnMLzzLDfY0V5pTwb37ft+KlcWROJm4LwdCUVQj/taXb/XmvX
   o99ToswWZ6aCAp+0B4R9eMDFqosyTfByRRPMYuSSGmOCSRDpPbp0eczQs
   OuCAFgxswRTYqXFx+zRkLUCwOyP3q4m5YnXiDx57oWyCthQZa6Qb+5XMK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392017566"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="392017566"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 06:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="905820098"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="905820098"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2023 06:29:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qze87-0005W8-14;
	Sun, 05 Nov 2023 14:29:35 +0000
Date: Sun, 5 Nov 2023 22:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 4859/29121]
 drivers/power/supply/power_supply_core.c:739: warning: Excess function
 parameter 'ocv' description in 'power_supply_temp2resist_simple'
Message-ID: <202311052238.LtCqw3IK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   2ac128c04e339e37898b7a798b7fcaa391d965c5
commit: a96c947b075f9781a5d5941f560acf8b4c01405e [4859/29121] UPSTREAM: power: supply: core: Add battery internal resistance temperature table support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231105/202311052238.LtCqw3IK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052238.LtCqw3IK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052238.LtCqw3IK-lkp@intel.com/

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
