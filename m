Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97F4D9F9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709628106; cv=none; b=qmo83Q0sP08N+NVssnP8Rdv/mjgkJ6fD+BsimFxxDRvlNw6ZbEp01PQH1D6tUiWpiADe9IXz6ZdgfcSQL8jtfYn7ecKlHH5sd8XBPgmhQFnrxIOvayPvUHqn4sNGe8nKWdWTSF7VoxkAWfyux24aFgSzbzAKZYLtDlMcWKDl9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709628106; c=relaxed/simple;
	bh=byuayN/Up+EvLq9jeOPsYEs/zaXSwWYZwbBOElbepbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwYrV2GzsGnctn7TOmwjOlV3DvNCejrbEEZ6VqIGbnzAgUiCQ9p+wRd6G2kfOgA8KaXjaIdjgCuyws/6aTxlqNEXbOx/7cus7kGeKf9i7NRJRUzGdwXcuPcZKRMXY8ChEy7XSGnzChXEaT401KkAL+Nx6xWFp0EI9djaKk3tSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIDrdQBD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIDrdQBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709628105; x=1741164105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=byuayN/Up+EvLq9jeOPsYEs/zaXSwWYZwbBOElbepbQ=;
  b=SIDrdQBD0sVlZRDPQLGtpRYSfY8gmUq5XZMOtc3Ccbd7E4VUjxhij6wA
   6pSpstRUB1opYbMOFMyKWzXfTCc5qdgwMdWZfdJ+VzZfZAdNvDwS2eIvt
   LcgB20RvWoV73FsGk9kO4cFlVdZmpbIqLuDxRQZ9stTjz5kdb0kITmXfm
   FRIExBSl+D2TGuPGceKVB49FdOrXyt8FmYv0ekzRB6Hlpva4DYQHlLGh9
   Hv4BDjbjLt4XV7H5vYxo5ka754C0/2XJJH8S8LsVGJJ/0fV3/gjYHKAUT
   X25eycwlBWzOx3CN4n8h2WtN+Ko2lSTZ6YBywU++QWc13wDAAnK3C6Kut
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7111880"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="7111880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 00:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13981635"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2024 00:41:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQMi-0003A3-1e;
	Tue, 05 Mar 2024 08:41:36 +0000
Date: Tue, 5 Mar 2024 16:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: ERROR: "pxm_to_node" [drivers/acpi/nfit/nfit.ko] undefined!
Message-ID: <202403051623.5tACttE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 4f1b2fe4c38e4ec603acb83371eb39818036ee30 ACPI: Do not create new NUMA domains from ACPI static tables that are not SRAT
date:   9 months ago
config: x86_64-oc_base_config-func (https://download.01.org/0day-ci/archive/20240305/202403051623.5tACttE4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051623.5tACttE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051623.5tACttE4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "pxm_to_node" [drivers/acpi/nfit/nfit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
