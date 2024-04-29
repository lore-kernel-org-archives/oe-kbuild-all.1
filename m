Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADA015E8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714378416; cv=none; b=fKjiiFXaTCSgwBtVti/2tt/rwxi6I5RFTl9tM/5ujwybbyPdB82dVHiOWB5KJvyPKtgjgG8t4nPglLuWNrgDfjxjwIl4FLrWVWF5YKWNwxQUfBXsryddJbLgnCh6uleVKtMkVas92P5wYA+wGE2M2tsrNh16VglWxuptf/KTzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714378416; c=relaxed/simple;
	bh=ENmTS/LVLYsp5BcqrJkqE7tRs3Mp3DCwknW7RwKrj5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYovWGyDrsvcvx0LSbnBEDwW5SxZJ0sZoHXzCIpY4X2BH0yz4WnqhcmAC4UKTWW9u7ZTn4a/SdX/JH/FsBI1Db8F+ZTVL7Si/kvj1zmcrM2SpQF6l51XiC+ZLQ6Dh5z7HUivVVsMVEUkPvoq2e/q8hau4s3urzfPOq9hjJ8XnsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLn6WnJE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLn6WnJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714378415; x=1745914415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENmTS/LVLYsp5BcqrJkqE7tRs3Mp3DCwknW7RwKrj5Q=;
  b=dLn6WnJE/ovSJ3r4UHB7/W9821O4vJDI+8y52DAgsgfEwSeeaafAQXRx
   P6ZVd9AJ9NZ98XGcrReMaceX6uIDsZwnuwKTyseRmogNRn+FwQwRwwkEL
   Upn7w58uB4iowQYHPkLXlsjMOstMIUIOmrpSxoJKSav9aLnTl/Bf2Phfh
   Pa0GlbrpaV+QoogMLVW5MHWo8xKPzYBWTmb34/eLrJyCRc/NuFRawvp0B
   Mmoo4L2MnDlN5su1Ah+KzeKe+4jrJjZGSGB9cNKZ5qtgat9wV8xENDXMH
   g3gaOhDap1xIs67NdpcPL2H35ZkDo3sJkAQLoMJfW0haBxXyMXlIt74AX
   A==;
X-CSE-ConnectionGUID: FOqT4WKuQJOVqAsgkC9lew==
X-CSE-MsgGUID: oKf0SchbSZaTgOlV4IMRgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9859040"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9859040"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:13:35 -0700
X-CSE-ConnectionGUID: ShVojvMiQK+ndQo8MvMVNQ==
X-CSE-MsgGUID: x4L3MVXMSde+C2HGD0o3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30842034"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 01:13:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1M8g-00073K-2u;
	Mon, 29 Apr 2024 08:13:30 +0000
Date: Mon, 29 Apr 2024 16:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14935/22243]
 lib/.tmp_test_free_pages.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202404291621.rVAVL8pw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e924d38574213276d8b3fc8ad9a7b7258d4bd05a
commit: 07bfcd6945a587611c2812377494457fd2c4c452 [14935/22243] mm/page_alloc.c: fix freeing non-compound pages
config: x86_64-buildonly-randconfig-004-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291621.rVAVL8pw-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291621.rVAVL8pw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291621.rVAVL8pw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/.tmp_test_free_pages.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
