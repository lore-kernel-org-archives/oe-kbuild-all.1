Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6512E0927
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 04:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761800373; cv=none; b=nzmgFtRAswuxB7fUSwZyO2eieyvn5vBCr18Rqo/5RlwUIE/fEkziE/OMOjCLXymZ4A7u+6ob7Ghe3Dr+z2b0Ok15Wkk4pBm9M0MS/DahHSXGAaXGKtlqZcxPSxM5izpaCK0gT08eJ9A15mQRtdDt7rzyfMeqd9uIkKNpgib00Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761800373; c=relaxed/simple;
	bh=L50Z6pr6vgwKgFXUkNNCOZDLv4Y4+9RsVx/MU7O5RM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aJeC8lcPc6My/gaKWesPIHN6o++KFQZv3z1Jn00YlCMvnqqHOaZCtZh5TWKIG3p3OoWlPnwUiKhvygMOydl8lLvrvHX4X0FptO65GU/onLjyCAUH6WBgkBzySHIox7AvmCSQLfIMqO4yvNXl8utmIF24WA2Qtp6s1FkNU6xBGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Re3Ap4gr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Re3Ap4gr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761800371; x=1793336371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L50Z6pr6vgwKgFXUkNNCOZDLv4Y4+9RsVx/MU7O5RM8=;
  b=Re3Ap4gr06xI51tuhtkJq5Tushv63lzrA66OB53popiV6HlYxjc/HTEK
   hqMS5Q5HDmC9+aneHctIp1gAL4CfND33Zukmt7lhIX5Xve9MttzHDrasA
   t6OaGHLvmcdgInhKLqBlIp0yCESvSd1n8XCAHlMS3vA0n0LevGVz+uUjy
   +gWLxrA0zNqgNylex5//BF5D4DQv/S7JcU31IzrsaTO6gsbjPCAPC7Lym
   rPTyno14+RsUXmrrwv8FISbrDAC1HrE2aULEhuC/g3Y55+vmCHuNz6JoI
   4ZZgb5Aae4R8Va2oHeB6NfGaDsCP+/1OjaQK0POeTxfuqP4s1ppGD+ucl
   A==;
X-CSE-ConnectionGUID: Fqtd9FLuSPa4jIrfF7JEQg==
X-CSE-MsgGUID: ImlE5ZCSSR6hVySoFBoqrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51506206"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="51506206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:59:30 -0700
X-CSE-ConnectionGUID: PLCTrSurTfiw6wmuz6BYpQ==
X-CSE-MsgGUID: oXuPe4biQbG42Z1ATqGD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186594862"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2025 21:59:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEKkx-000LTu-13;
	Thu, 30 Oct 2025 04:59:27 +0000
Date: Thu, 30 Oct 2025 12:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3257/3257]
 drivers/gpu/drm/inspur/inspur_cursor.c:54:32: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202510301254.n0HWSdf0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   13f149450a6b4609c03a79beee0859dfe43ca949
commit: b9d65551a3adfa87a7c5d33391187ee60a1b501d [3257/3257] drm: add inspur drm driver support
config: x86_64-randconfig-121-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301254.n0HWSdf0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301254.n0HWSdf0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301254.n0HWSdf0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/inspur/inspur_cursor.c:54:32: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +54 drivers/gpu/drm/inspur/inspur_cursor.c

    49	
    50	#define HW_FLAG_OFFSET 0x01ffff00
    51	#define HW_FLAG_ENABLE 0x1bd40750
    52	unsigned char getKVMHWCursorSetting(struct inspur_drm_private *priv)
    53	{
  > 54		unsigned int value = *(unsigned int *)(priv->fb_map + HW_FLAG_OFFSET);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
