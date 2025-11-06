Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12819F48D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762434388; cv=none; b=Gwuti+CuuCgc2LEsRrcuu0jsLRQsxEFFON6G37XdmkK5TU6k74piAo/kbontBQJgTGlU5XpdtzoK13XR08M7iNFgTStjFCMV5mtPuetGpiLjGiP9Y7EdpWR31v7XZ/h13bBAZq3Ul3XYcS+PNFMfzAJYZYLoHlzLRmFEx8XoKao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762434388; c=relaxed/simple;
	bh=iI2NJYD1CIno2ykIBK664P7diNWSCh4Bks7z/kjGqZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWdUWz2yjHTkFfM3f0q5DidPSCIGOhM8JFSoHYiCejT/jIKu705qfgNY6FsdnlrzxNMooPNFOCPK3PYORZ8OpQ9OzCEtQqN3Qt72XnrSVRWE7MXQqh/iJR1j9bK/osD2vd2CbQ/yVowr7PpsTySqAxZRoE0qYkNoIXYyODDwY+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STh9WcQi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STh9WcQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762434386; x=1793970386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iI2NJYD1CIno2ykIBK664P7diNWSCh4Bks7z/kjGqZM=;
  b=STh9WcQinMKclX9jyajkWnawCdq7YkpuNCs3+So1NT62tpJ1ZYvshiu9
   sbMR+iL/6sj3vYAm3UeE/Gyc98pKvihpG0JQDZyIgEO/welFZDc4nj5F0
   huVGWWaMa+MDKDYlWHuIy3TRH1GlOlD/oH4R+Rxqsx81WpwFgRs4MYJgl
   h2HIz5mSed1k4j1Mzf1VwclxDNypz8enUlfqdeN+f2TbSWcGG2Ao86FQD
   bJq5g7Sy7zUI35QddOaTCYDrx28966B/oHIaxjRCILHNggBcKooQTNSlY
   cT6C9XQkZ4ADldNb2AqJWAXwqNoolJXxeablzRWPGBLJwP6JheHZInmQJ
   w==;
X-CSE-ConnectionGUID: lUw+oSYUS1Cu5YJmOd7X+Q==
X-CSE-MsgGUID: KWwezxl5TXyX55slgSAsJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64266320"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64266320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 05:06:26 -0800
X-CSE-ConnectionGUID: p2f8c0NHRrCoEaKD5Rtjvw==
X-CSE-MsgGUID: HbzC+o1XScSpusplVmFV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187696628"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 05:06:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGzgv-000Twa-2W;
	Thu, 06 Nov 2025 13:06:18 +0000
Date: Thu, 6 Nov 2025 21:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6708/6818] Warning:
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed
 mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32
 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; };
 error: Cannot parse struct or union!
Message-ID: <202511062050.2oBQXuua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
commit: 3c5407381ace4fe499adce63c43da0da89bbcc5a [6708/6818] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511062050.2oBQXuua-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062050.2oBQXuua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062050.2oBQXuua-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:244 struct __packed mtk_mfg_opp_entry { __le32 freq_khz; __le32 voltage_core; __le32 voltage_sram; __le32 posdiv; __le32 voltage_margin; __le32 power_mw; }; error: Cannot parse struct or union!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
