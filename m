Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738D1DB37F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729164504; cv=none; b=flYPBGaGAKR8b9427kESFO8ujVeYi+0eCPyucm1KcDZnYGxAXkh9KeGElEPF3SJv1KLGx0lcJY31JMyBXMqVzmXXF/vtbosF4gCX5oPfuEddDn1UAUHuj+6prXAupCvoWM8vcNtu4vPBDjNtdgzZP6Sl6/mvBrqT6O+osn3CMoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729164504; c=relaxed/simple;
	bh=MyXnOghYiNymDb4dG+GWlCpmc7SJaDn4qycXi5+HN4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcuUFE9GLh84BUhfwMmZbNw8ySS/cSrm4nQ+rjuvjjr3XGwmICnacOqTH+w6krsC3Iw/OyMTaSTrYX064GXxhmWqzOV2oEj83wy7xl8wFkcRC8mNauoS5h1opzFliqT+OzW3AyQsTDsyzsLDS6bxzK7VxpwlPurbSfTPcvJd0co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duFrpdyp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duFrpdyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729164501; x=1760700501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyXnOghYiNymDb4dG+GWlCpmc7SJaDn4qycXi5+HN4c=;
  b=duFrpdypmLR6kbYGHCr3HDWFWDKT7JgPagdUzD6QUBbOpKeWpAUB4kOj
   3s0Umql6Z9WqG+X2cu0RnnWSGepfSxZGCaVSchX7ApX9iQ+gfDlkXQsww
   FKuWFpWoduJquYIRm/TJEwyUCoN7keLs3F6G9P2Wm62X0MfvU5yfgANt6
   NbNnX4Jucu4cW0yUTTr32rVaUYqLTsfiLcBunLds24GZ6rnIa8Hnyt9YD
   H4KO13Ai0u0pCSF9+S9MI5v4kQtpkstc3W7tir3pO0CEiNhO9gJdkO/PG
   9yaUUGYBRMpsmEiy137Uov833g0x7MM4r9F6XOBL2VfH2zteJ3VorMK28
   g==;
X-CSE-ConnectionGUID: Zz3rGLgARM2gWNqQUgsaYA==
X-CSE-MsgGUID: oM/bNAOTT9uj6ZApovQCOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28530523"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28530523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 04:28:20 -0700
X-CSE-ConnectionGUID: w0V2eB2qScuHEi9A7i7uFQ==
X-CSE-MsgGUID: EyfSrS5hTrqb2jhdhFkuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78127433"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Oct 2024 04:28:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Ofw-000MFR-2j;
	Thu, 17 Oct 2024 11:28:16 +0000
Date: Thu, 17 Oct 2024 19:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Devarsh Thakkar <devarsht@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202410171947.kJRl17pa-lkp@intel.com>
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
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410171947.kJRl17pa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171947.kJRl17pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171947.kJRl17pa-lkp@intel.com/

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
