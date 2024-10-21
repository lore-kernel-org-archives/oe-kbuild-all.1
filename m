Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4D2C95
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729483239; cv=none; b=l2337sSDvrp9AZhSBJaxkzz6hax+5yPN4G+zNTujooCNtqWoamsArBlYnaJEqYimGOZTFUG4tkwPS1nPSFXIfgpkVhxxAlDSudgIrh5B5Uh/C2apoc1s0czoNOBN2bng1jl9YMjTsdpUt1UMSkrEplLwedUv7cdUW3gW6lpJbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729483239; c=relaxed/simple;
	bh=UMjcoFXgiOjHkZx1Rqfv6O4DDvxeoSD50kFBqTfDilo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwPvxPRn1e9Arfed86eGH7nGbgeawu91Ojn5vAbEZTo+g6L8KfFeVwpahSzJAlrAx1NCnxy2rsg9J+aaqI0RmBDwTrAf0yUQ0Jf15lbZImJDySdiZzb72EXGnfNg5fJKYN4gFJRJIv3fJN2uM8pvHaTEF55axczgZxUu/xirQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDXQ9FwY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDXQ9FwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729483238; x=1761019238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMjcoFXgiOjHkZx1Rqfv6O4DDvxeoSD50kFBqTfDilo=;
  b=TDXQ9FwYV3Vb0y9MjrW0xufXbiUdRrbcc0xdUGIFolnSPdWimi4jhtdU
   n05N5O7mL5om+TlZw7DvV6f9oU+oWnjEP/64Ts3lv1jj/eYXN45g0IjVu
   U/UabeBwwq7KuL5ShtsRWGYSb2S4X7pgOdKadFxcSJ8ExcPADVDUzhZH4
   QWrr1BQyhKwquS3VLecTpiJSc0ml6W/UzK3LGI48fRBIxwqbbdQlQjzcL
   n8QBHK4p+DyWlw4lsvZ6UeolRMewzRYz0zGSJbkK4A1o9oNFi8DbAPH4X
   C25et0eVAR/Wg1Nkknra0jZ2tA3zLfO3beH5GK8nW/vVrfx01vFtLrGbE
   g==;
X-CSE-ConnectionGUID: nsixUQkJSDSabrkVqjZZYg==
X-CSE-MsgGUID: /a3n/d8iT7mrXNpyTyFKQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28829387"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28829387"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 21:00:38 -0700
X-CSE-ConnectionGUID: CxD0cc80TluD3WTtRTFshg==
X-CSE-MsgGUID: p59DQtVgSE6a2lQaYa1gwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79052798"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 21:00:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2jas-000R7r-0R;
	Mon, 21 Oct 2024 04:00:34 +0000
Date: Mon, 21 Oct 2024 11:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4041/5686]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800:
 interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too
 short
Message-ID: <202410211112.oHihIlsP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: f5b788d0e8cdaac7df6ec9a24926672965d87dfc [4041/5686] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
config: arm64-randconfig-051-20241017 (https://download.01.org/0day-ci/archive/20241021/202410211112.oHihIlsP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410211112.oHihIlsP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211112.oHihIlsP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4146.11-4156.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
