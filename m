Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A879C8BE8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736672785; cv=none; b=AIZcmLTc0mIbPYjoQdb0/rhhaiaUcyaBhKoKvE++9TbpfCj0g7jpFsv5vmW7MKPUb2Ac1PpwZNcBmeOoMvffabtTgpEtgp+3c745BRu3ZLRwkwBnbGIEc8D1I49RA3zv5+X26EhxTktY4rPwA3mQ5CAFZuySrTo+CGVVibAUJzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736672785; c=relaxed/simple;
	bh=k6xvTEcur2BtKJyT5I0Zrb+I8Sbr28oDaPSnjeZK+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2iYcx1Q7vIXkXhFT3l/K72KA0/i2xqZLqDsh/FAAe2lyk/8x79fYS/fS2rikrtP72AV9gHPM67zr+Aps7b8O4KA1VeHr4ydzjetFKuzQODawdOlumAuJQLVIGdZ1NL03dpF+Lsl9Q3CutDE8U4ArS0XevCLqymmYY1pbaJa5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7MHbpUq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7MHbpUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736672783; x=1768208783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6xvTEcur2BtKJyT5I0Zrb+I8Sbr28oDaPSnjeZK+AY=;
  b=E7MHbpUqR4O87Wazte1eS5NJutCZd5UVGTkGcdPEhjzJi+oA0/IeZRWv
   h+divBTj3/Du3FxKyxaCZK8cQH6Jl2venMZecBY/LOkkD3KFrR7f/JOB1
   g2YvE81zROMKOt2bNYRRJlm8W17RiIFVxYCEG0JEIWKwDoubNP0/3ZL8/
   fXWmkqqwNJFkXzche2VJ04DYZ6RlHTkm0FB0HrIyYyUtfoRG2zA1ta9w4
   SvKBQkuVrWJRwGtPXct25EQn0aSlI4DuzHOOl5NgXNMzS0Pt6iozBrj8Y
   c021L0tT7qEjLrofUM9YFiEm9vts5FZCN8IRou0CU3z370MbDCMzT99sO
   g==;
X-CSE-ConnectionGUID: r2WLhUUBQ2ylf5zKECK0cA==
X-CSE-MsgGUID: ShT7poojR/+Mm4TPWOrdvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="54461817"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="54461817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 01:06:22 -0800
X-CSE-ConnectionGUID: awiXKEQUShShY8nlL6An4Q==
X-CSE-MsgGUID: 9jdqmz+sQxSzHLCNCpHiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104080821"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Jan 2025 01:06:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWtvG-000Ll5-1t;
	Sun, 12 Jan 2025 09:06:18 +0000
Date: Sun, 12 Jan 2025 17:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 267/504] kismet: WARNING: unmet direct
 dependencies detected for XILINX_HDCP_COMMON when selected by DRM_XLNX_HDCP
Message-ID: <202501121948.0cJwRfYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 6c8caf3eeadd38ffab47f6cfb7dba45556256143 [267/504] drm: xlnx: Add HDCP2X TX support
config: nios2-kismet-CONFIG_XILINX_HDCP_COMMON-CONFIG_DRM_XLNX_HDCP-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121948.0cJwRfYs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121948.0cJwRfYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121948.0cJwRfYs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for XILINX_HDCP_COMMON when selected by DRM_XLNX_HDCP
   WARNING: unmet direct dependencies detected for XILINX_HDCP_COMMON
     Depends on [n]: STAGING [=n]
     Selected by [y]:
     - DRM_XLNX_HDCP [=y] && HAS_IOMEM [=y] && DRM [=y] && (DRM_XLNX_DPTX [=y] || DRM_XLNX_HDMITX)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
