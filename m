Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECC453E31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291285; cv=none; b=U/pDWjlFlkm1chFSettMFNPuHJjsv4l5fXLfE/6drJihICx27QkXsAiHnTlnk8+bIGzxBU8tO64q+PpamTomGVEVSKLGf9Ta/Hx6yy6IV/Bxen846XSOjvOQxLAtJW9gu3Ax9F7/g4bTWVBaMzBS8zl3reTGn1fUPbwS7YQUmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291285; c=relaxed/simple;
	bh=oRcTniXJ8Vjw7+y0NtqV1bcp9DxZCmF4CuHxjZ+u+YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHjcNyPua5KmlzI2MlKy7Zw4sWX2EeZV+Mj/qWMirz7P2kruQf4kf9P2NB66/n0tmTZBIR3671b7Lu7QTIolMW4jBR1Ark14qQIewIHk57hlERWyJy2BTg4LXKnalVMA7nuALAbHMLMH162LLK+0fWwjwyK7DQzFMP5OidmD8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDSu0sVn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDSu0sVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718291284; x=1749827284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRcTniXJ8Vjw7+y0NtqV1bcp9DxZCmF4CuHxjZ+u+YU=;
  b=bDSu0sVnUbBxSHbWoBvu7q4ehVbmj42rYqgqAgLRnS/kRy72/qmt3uTV
   VmLTih9D14ashQYWZ02ZGWFGTSm42paTIYDEERXFcRh6Y7BJZuFNcobj5
   RUgGMmc6ast4Tp/bWOdLcs6DNPJ6c34fZe0Y8abGJwOsRr/cqewtasAR5
   799LzCSj51w2FudFxIBBFPCNDb9t+nk/YUb/0VcNBIfmMkO85ZVw+7C07
   QZvdTZaQhAGj87NzQpFAmPSE/aC4Fw3UFYCThmHNI7fgrZnBSjrVXOkw0
   69xb5p062guFcol5oZBqnvQGS/Mf6AT21j5/9w9Ty33vyksvNkaqVpjAy
   g==;
X-CSE-ConnectionGUID: o6/+IvIDSpi5Q96Yzph9Ag==
X-CSE-MsgGUID: xnHDnGfURNG3rxsvu/pohg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18044927"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18044927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:08:03 -0700
X-CSE-ConnectionGUID: 5Xk0CjYBTZysgl5EtfCG1w==
X-CSE-MsgGUID: ddUJa8fiScyaZqm+0nqFcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40132551"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 08:08:02 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHm3T-000098-2z;
	Thu, 13 Jun 2024 15:07:59 +0000
Date: Thu, 13 Jun 2024 23:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3958/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406132328.CAy4s0Ra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 5d63770a26dcbf9965903c2df51f1aaf176c53f8 [3958/9999] arm64: dts: renesas: r8a774c0: Add PCIe EP node
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240613/202406132328.CAy4s0Ra-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406132328.CAy4s0Ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406132328.CAy4s0Ra-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
