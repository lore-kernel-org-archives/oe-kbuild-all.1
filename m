Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79313959D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 03:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729135203; cv=none; b=HXtjsOVvOBM3vJCG4PEQr82P0rkmmMJqkD0Dil7IHX1NZwDFTIx48IwVt8AqoTXGtd8lLlWpuMpZ9a8GIeDe+8rvdWu/Dufc1GxmIuhxMWCE3gohmXhSI3484LCYXib9If3bQp0pnY3DKeGDA6Sd1hJ1sbh3L88/RDPyqW/Os88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729135203; c=relaxed/simple;
	bh=QpR4Zii1U6m84VnWdsjB3ejPAaWaCvzFThm/qYtJfJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rk4FDvRxNrRqd2vGWt10rmQdsnO95SiunD3VCKyczJdYKxrIdacTuyqL+VzYyeR6ptwmDPtEkJ89eMsZY1eMTIxD8E7j7rgUKMwtHJiNh8ylM6QzMuFSE3Dbg2UA0kZUHdz7dDr0sZF0wPWJTF19dFd2fv4hznhOF6Yq95mfWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N25BZbOj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N25BZbOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729135200; x=1760671200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QpR4Zii1U6m84VnWdsjB3ejPAaWaCvzFThm/qYtJfJA=;
  b=N25BZbOjtgAYhyIVJNau+hE0H6Y+X8HCEhyMSB9JHD3PHX0gJDyG5U7t
   fei/EqLOd67ElPlkDhpM0QFUnkr6Z9T0/vu+ZpXw84tfxfLYBfN31W/Ei
   uY/VAmTdGMpgJ76zDXcXY6fBTCXbufGkHLhRcgeg7SlwyutY1yosQDs7D
   dpjnLYAhZe/L1/QpBvqBdUSVROldqW7BSq5kImrKN/mbqorLLWpjvuac7
   Pu6QDvDIijoxPaQSfvBac9ErzCg8AkJWyxqx5kLhAEEV41ZfZYBXfJGg4
   wlNz+qftVwJCLcHLWNc0cTR407/6sC/MFZQOHSiN323aPPUUyVOGxxNt7
   A==;
X-CSE-ConnectionGUID: YGdgHpSlT9+IEHQQzIyD5w==
X-CSE-MsgGUID: d1l+2NJzTV2tcZhTxTZ2zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28812371"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28812371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 20:19:56 -0700
X-CSE-ConnectionGUID: YY2xbBM1S3K678gWyrx5OA==
X-CSE-MsgGUID: C3+yYf8ORZ27m3kiyqkrrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="79230898"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Oct 2024 20:19:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1H3I-000LgR-0g;
	Thu, 17 Oct 2024 03:19:52 +0000
Date: Thu, 17 Oct 2024 11:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ping-Ke Shih <pkshih@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Mohammed Anees <pvmohammedanees2003@gmail.com>
Subject: Re: [PATCH] wifi: rtw88: Refactor looping in
 rtw_phy_store_tx_power_by_rate
Message-ID: <202410171143.OnFlgIwK-lkp@intel.com>
References: <20241016060605.11359-1-pvmohammedanees2003@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016060605.11359-1-pvmohammedanees2003@gmail.com>

Hi Mohammed,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammed-Anees/wifi-rtw88-Refactor-looping-in-rtw_phy_store_tx_power_by_rate/20241016-140811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20241016060605.11359-1-pvmohammedanees2003%40gmail.com
patch subject: [PATCH] wifi: rtw88: Refactor looping in rtw_phy_store_tx_power_by_rate
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241017/202410171143.OnFlgIwK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171143.OnFlgIwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171143.OnFlgIwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/realtek/rtw88/phy.c: In function 'rtw_phy_store_tx_power_by_rate':
>> drivers/net/wireless/realtek/rtw88/phy.c:1468:48: error: 'PHY_BANK_2G' undeclared (first use in this function); did you mean 'PHY_BAND_2G'?
    1468 |         s8 (*tx_pwr_by_rate_offset) = (band == PHY_BANK_2G)
         |                                                ^~~~~~~~~~~
         |                                                PHY_BAND_2G
   drivers/net/wireless/realtek/rtw88/phy.c:1468:48: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +1468 drivers/net/wireless/realtek/rtw88/phy.c

  1447	
  1448	static void rtw_phy_store_tx_power_by_rate(struct rtw_dev *rtwdev,
  1449						   u32 band, u32 rfpath, u32 txnum,
  1450						   u32 regaddr, u32 bitmask, u32 data)
  1451	{
  1452		struct rtw_hal *hal = &rtwdev->hal;
  1453		u8 rate_num = 0;
  1454		u8 rate;
  1455		u8 rates[RTW_RF_PATH_MAX] = {0};
  1456		s8 offset;
  1457		s8 pwr_by_rate[RTW_RF_PATH_MAX] = {0};
  1458		int i;
  1459	
  1460		rtw_phy_get_rate_values_of_txpwr_by_rate(rtwdev, regaddr, bitmask, data,
  1461							 rates, pwr_by_rate, &rate_num);
  1462	
  1463		if (WARN_ON(rfpath >= RTW_RF_PATH_MAX ||
  1464			    (band != PHY_BAND_2G && band != PHY_BAND_5G) ||
  1465			    rate_num > RTW_RF_PATH_MAX))
  1466			return;
  1467	
> 1468		s8 (*tx_pwr_by_rate_offset) = (band == PHY_BANK_2G)
  1469							? hal->tx_pwr_by_rate_offset_2g[rfpath]
  1470							: hal->tx_pwr_by_rate_offset_5g[rfpath];
  1471	
  1472		for (i = 0; i < rate_num; i++) {
  1473			offset = pwr_by_rate[i];
  1474			rate = rates[i];
  1475			tx_pwr_by_rate_offset[rate] = offset;
  1476		}
  1477	}
  1478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
