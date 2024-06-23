Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D32F4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719105552; cv=none; b=JKj1E89k1IqFp1uQzsi2YWrSRiqZwFhlAztN6ZqVQ70La4VgY0D5xlyhC8qPjo+2ijzK3Xm2Q4zrJ0yQ/USlWfGPFCPSwcVJhyNOWBal2ggMf/NmZqtE9kdP1/tFukKGqsE2LGGiqhCEd3nLu8HUbL4KzIdhwgO2rEWhhbAWN5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719105552; c=relaxed/simple;
	bh=FMZqxBjLDrCnChiLcM/4bGeukt1Y14TMbTZMaZ0Aei0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TaNuf9ex1e8ZxSPPfcORqYYGWFlo+CNUPYUuMH3emmwrvk1PgvjyVdGB7r8Sq0It/V69VTJtQGe2jXcT6wBDTUx6T1l3LJB+c84uB2C/iiKoNoqiMQWVc7N732M2W8n7/sh0+FWgGCY5QeIACL091JgKQ1wr9AZqWmA9QKHSh98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcmhBHhU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcmhBHhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719105551; x=1750641551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMZqxBjLDrCnChiLcM/4bGeukt1Y14TMbTZMaZ0Aei0=;
  b=lcmhBHhUm6GvBOa/o+EKxDimrj7NB1d4wdSNr0Ll4u7ejg6ez8pOYfjG
   8BILmKkfK7R0yUj00OxN17UZoTMcHWTSC57bWzSnhujirg6PpMr4pavCe
   38XS0xgoNut5lGAq7o2mOAOWjQkq5Fl8xWyYf+tVsn5ZkFpC3ck7jsNLZ
   5XglfEE3utet/Pju9IiR6LwotWfOGUoV54l1DtYGzj8BB+85wjXP3Z8X0
   f3x4s2ehaAgqR/xWpKizzanqVcdRZ2LpDtnaV4Ko1QLaVGAtoHE83Hos1
   c9CvNi59CzMWh2ABjpAWYo+2YOmfbx2vADAXZ878P6fLX9mtpFyTs6yQr
   A==;
X-CSE-ConnectionGUID: HsQlnXVcR1uwBTsC/8/SAQ==
X-CSE-MsgGUID: H5BTd6UxSSijaFElrY/2zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16077841"
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="16077841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 18:19:11 -0700
X-CSE-ConnectionGUID: EQ1I1KGSQZKrzQUFLt3Hug==
X-CSE-MsgGUID: 7jLxDAfyS+mTFsNNo1MdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,258,1712646000"; 
   d="scan'208";a="42761311"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2024 18:19:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLBso-000A86-2U;
	Sun, 23 Jun 2024 01:19:06 +0000
Date: Sun, 23 Jun 2024 09:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 40/41] htmldocs: Warning: .clang-format references a
 file that doesn't exist: Documentation/process/clang-format.rst
Message-ID: <202406230906.sb8Wo0Vp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   43e3d7f62f7784b3fa9a05d39fb576e7bb726907
commit: 8988ac5c02860893281688b11c2d0edd3ca8181a [40/41] Docs: Move clang-format from process/ to dev-tools/
reproduce: (https://download.01.org/0day-ci/archive/20240623/202406230906.sb8Wo0Vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406230906.sb8Wo0Vp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: .clang-format references a file that doesn't exist: Documentation/process/clang-format.rst
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: Documentation/process/coding-style.rst references a file that doesn't exist: Documentation/process/clang-format.rst
>> Warning: Documentation/translations/it_IT/process/clang-format.rst references a file that doesn't exist: Documentation/process/clang-format.rst
   Warning: Documentation/translations/it_IT/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/sp_SP/process/coding-style.rst references a file that doesn't exist: Documentation/process/clang-format.rst
   Warning: Documentation/translations/sp_SP/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/zh_CN/process/4.Coding.rst references a file that doesn't exist: Documentation/process/clang-format.rst
>> Warning: Documentation/translations/zh_CN/process/coding-style.rst references a file that doesn't exist: Documentation/process/clang-format.rst
   Warning: Documentation/translations/zh_CN/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
>> Warning: Documentation/translations/zh_TW/process/4.Coding.rst references a file that doesn't exist: Documentation/process/clang-format.rst
>> Warning: Documentation/translations/zh_TW/process/coding-style.rst references a file that doesn't exist: Documentation/process/clang-format.rst
   Warning: Documentation/translations/zh_TW/process/magic-number.rst references a file that doesn't exist: Documentation/process/magic-number.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
