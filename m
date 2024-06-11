Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DB18EB1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118582; cv=none; b=NG/t60HkZJioSWweXfUjenur4s9JBn1Xxy/yKc/wDkMj+H/kopiA28UGYHbjOE7qw1Jjpdk+SGEh0I43joBU2RjmMK1N73NJ1WF68BVBi+443evQo5qq9Y2fFOEjfPGcZeAQJMy4NSMh2qnPLzpO2l3vW4FKveVemJK9yiaH0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118582; c=relaxed/simple;
	bh=rsY84SXvFA1kn/q7K73tdH1TMrxHw29izEH554nfs8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kV+kNk7IArKHOijsVPfaL7dShrDRcYsd1Z/imqyCDAO4PDu5osZNpXlvmaVev58v8XkEQxJDt2O0Y8Yaui/sbPsHkWEXEt8cjsORotSMF3ohmL1bmCUkAeLzvRUPu6K54I0Wol5kQ4TnSQtT3rpoO1fn5gmcfzsPs63cTi4Ueyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxf4PG9r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxf4PG9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718118581; x=1749654581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsY84SXvFA1kn/q7K73tdH1TMrxHw29izEH554nfs8Q=;
  b=cxf4PG9rQliSSTSpE3ZxR3WfXF7LZeUnNAp8bKS4zBkcl9wj129QPUGx
   orxm5rx708nlxm5cBP7mGoa1ZHp34kDjBtVelD2L3uNkxrDCHcc30PSna
   w3jE47UvJ++stN1aVd9Tl/byp9cKvXskvSi4SOaU0hP3OwMFQCwS1kyw4
   7xvoQpcrKX1S9lQey4R9pEYvwHduQvvdJ+6ElBaEX9MUds+zwyVhJgxF6
   NkAGVEDIL3tOGRJTV5BpLSuopCU06W59wUrjQ7mg9MJYrQuU8ssnObjfr
   Sc01gThVIwVOPLXelDnT8VQZFynWCrW5P+LDdw+6hi9Zid+vocSDRDr8w
   g==;
X-CSE-ConnectionGUID: wGu6UViGS2eFJvqS5czOZQ==
X-CSE-MsgGUID: FA41zPfRRgyFxgv7bZ434Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26236694"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="26236694"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:09:40 -0700
X-CSE-ConnectionGUID: SzC2jvBrRZ2mJ0ygyKqgFw==
X-CSE-MsgGUID: 7XPB17MhQc+ZFBCftf93GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="44595728"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2024 08:09:39 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH37x-0000a2-0j;
	Tue, 11 Jun 2024 15:09:37 +0000
Date: Tue, 11 Jun 2024 23:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3958/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406112257.DbfBeNnW-lkp@intel.com>
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
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240611/202406112257.DbfBeNnW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112257.DbfBeNnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112257.DbfBeNnW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
--
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
