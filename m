Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7681DF990
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184864; cv=none; b=qMYCZ5OIkfsNe90uo+tWuEmqe2vgK40GJbP5t0hj6U6ISSVESOMjGEWADE27GVi0/s4XerUwk4Uk5WduUyTruVybEtBCMBzULatNN/DfoUsHDE7Ni8ndSqCGqoigWWwyf/2CvykAwfAa+La8LAaWNC4hPXRJQlR1nZFfg78RlM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184864; c=relaxed/simple;
	bh=ECtNTpYiPR1nYUAymnP/MYE1h/NkvfoDLvk1QX8tuBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLyJr2BSrZGzJcDg2lhqjp1lIQMsvaqRU8IaN61XnDzfuQznDG5X1aYtROETIa7Fl0f/0VfkvGQrxYooMpHfbOtcB73QxafrmLUWX3379AcYoRO+/zAHLm8ZGMKaEdCPfamp8wSBb4Bk8qiB9onH9O0pousDXc57e8lXQUxybeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjCfvi78; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjCfvi78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729184859; x=1760720859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ECtNTpYiPR1nYUAymnP/MYE1h/NkvfoDLvk1QX8tuBo=;
  b=UjCfvi78S7WxQj+05ieHp0PUUyOS+qaJxHHKiWPi1q679UhXkEsT5vMJ
   KMFu+Axes2KoGf3kd53P314ZTNhOJT4z/SA02Qdbg0EPMoQIHz3piXwAg
   G8dTVW2OlwqvDZ4CFd7ZB31Fu3VQNJLlYH6lQ2HhqTssJkbq0OV4jYDZa
   HB3D24AxdbXeEAh0pzI/jvhIv2CsFEtpI2mfeBIB/GgFyyvtwPfmwOheQ
   XpTGXIG5E0VmOK42w3uzcAiOg3wzChmOBD2IOou4mENNT0uLABddGbx3z
   21iRh1ZUWt4UYZYyOD+ypx3oISfNyDBSspnQv1u193ZEnmM+QXEK21+fn
   w==;
X-CSE-ConnectionGUID: idVH2bGDSYilIdxeWyTS6g==
X-CSE-MsgGUID: 1ZFpo2tST2G+Iu3mzCHuGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="40053438"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="40053438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 10:07:38 -0700
X-CSE-ConnectionGUID: 040IIrs4SgmTniiHjzUaow==
X-CSE-MsgGUID: TiVyRNenRFaEeEoOay/Sdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83443914"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Oct 2024 10:07:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1TyI-000Mdx-1r;
	Thu, 17 Oct 2024 17:07:34 +0000
Date: Fri, 18 Oct 2024 01:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410180059.uIEiTNr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 1eef2deae95a3f819afbe06798f1fd70a0048e11 [376/382] arm64: dts: ti: k3-am62a7-sk: Add peripherals and pinmux to enable display
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241018/202410180059.uIEiTNr2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180059.uIEiTNr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180059.uIEiTNr2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +844 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi

555df2427c6270 Aradhya Bhatia 2023-04-21 @844  		dss_ports: ports {

:::::: The code at line 844 was first introduced by commit
:::::: 555df2427c62703f82029d150939d027a85c50c2 arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem

:::::: TO: Aradhya Bhatia <a-bhatia1@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
