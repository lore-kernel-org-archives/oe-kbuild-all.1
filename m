Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541A213CFAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727650644; cv=none; b=Pq/Mr3kHBSjNul9e9qmdJyWciOsn1EpjJDEThTrEMAjKsbdYKTwJ5wSEAYH/SINeoQiQRlhSSpI3eOw4uYPVGk2ofJWWh6F0Q6424qCsMpix6oTzF/4ZyzaNVnWOFFZbKSf7YmJKmiE0eGgcNYC+ivIG9RIxKYKxFdP1oDTHBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727650644; c=relaxed/simple;
	bh=HzlUIQ7kcAGLNIZlpnq3O7HUb0oDZv0h+Px/k7lge1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/yyFx266rEnvXSyBkRqjuPy3m+axvXmWSgO4gEakoikrIdjmDZ5pnkOxJCYvmjuXYddMLy1Gjt0z6kmtJ59vkA0sT5Wj9qhuLL9N/34OsWbYYydFFRHzBqFtBgiv6sMFTs28z2e7qzH9Gt6UVjoF6q6W2J2edwfQqrx7bRntVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7yVXCMx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7yVXCMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727650642; x=1759186642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HzlUIQ7kcAGLNIZlpnq3O7HUb0oDZv0h+Px/k7lge1U=;
  b=U7yVXCMxASq++tBg8H2KSNjreHf2QGUZ2z+Svm2HhmLWB938FwSzSq0W
   zPm0LyZ1ANzRuxdssKHICI/uGFqZ3zetnwIhsxiza/rXFt/PfI7BjhwyW
   x2Kk3xWO+TJpswhW1o1dRXYtknKms9F9Z56D69UG+sjPkR14R/idw01TC
   rhaSUFBNREdQMvsGNFlmyXlcft6VNvTSAVd2UC0lx96y79qqbN0sBggrC
   aL/A8MffQawvOhfHD9OnWgyl8GN5Kl9SIU28dqK04D7H98gubExFjZCiK
   UM5SIMpai2vhpsTISPb7ydIgZ8TgJ8LsPZ6RU38Qjem43CB3Z/5qVyqO+
   w==;
X-CSE-ConnectionGUID: gTHBG1VITp2wsI68TWa01Q==
X-CSE-MsgGUID: d7jCdNR7QW2wUWzLNUKtiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26192999"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26192999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 15:57:20 -0700
X-CSE-ConnectionGUID: s/IZCGAmTvKmP6RDvI01IQ==
X-CSE-MsgGUID: bo2UqPrlRbamNjK7MORZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73432373"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Sep 2024 15:57:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv2qp-000On7-0v;
	Sun, 29 Sep 2024 22:57:15 +0000
Date: Mon, 30 Sep 2024 06:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6954/12031] drivers/ptp/ptp_hisi.c:731:36:
 warning: 'hisi_ptp_acpi_match' defined but not used
Message-ID: <202409300645.KixlBAyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: b3d33603591c477d56f59972f85d4b97e7ee12d7 [6954/12031] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300645.KixlBAyk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300645.KixlBAyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300645.KixlBAyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_hisi.c:731:36: warning: 'hisi_ptp_acpi_match' defined but not used [-Wunused-const-variable=]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
