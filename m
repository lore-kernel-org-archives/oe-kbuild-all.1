Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BF516FF41
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718540719; cv=none; b=SpANO6h6p+6J4hsMFVjxuek5cAg+1CbIiTtcjfgWi2QJ7szPgr0AlH3DW0EzGnnWPNMKxyLw7flZF+nhpiVrY2YFlLjEXytJQ9YoBIsSKZeNDseSfBAgRt3C1DSRZt8oljoguB+dGPz5r3ENioDU3jAWW4fM2zlzQ8Xw6p2N8UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718540719; c=relaxed/simple;
	bh=Na1LsHmN3Xa5O+xmVNgKDwST6XdGc9J5nbpnvaKe7hs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW70211xJhEodzR3SGs5si+8RDo8xVKYMNAz1KYU2V0Cy/VRLtWj7dMTN5kkc4iC4oPMb9ia105DNQ9C6M5S2KRoEeB0Gux+/0RknI4tMRqYVN9ZHI3jqFct9VwYPIa8S79tKoN3prY2mGa067bElGa3xJ1Gfa5tKFQgh+f0ddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6hcOlfT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6hcOlfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718540717; x=1750076717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Na1LsHmN3Xa5O+xmVNgKDwST6XdGc9J5nbpnvaKe7hs=;
  b=a6hcOlfTo3Krj2j9/bJqHcBl/NgHvvQkkEbWxHfglbjlTu9DBVPJEafy
   2EmGIiEPjppLrIdD7hf1dNhGHZFAdBwH9T4X+WwYtaGccBZq17pP1cEXQ
   Drd/b16kKYyf5TyborZIIDzbSMDtXNsOPwT1LsuabLH/mXcbM0z94b+3o
   C18PCKJ5z+WF9wAPlHQ7Wr16FtvIxX01N6oBuEgMGmLk4qxsmfXmteH9k
   IjgWvtDaxlEur/uFOz1w9IePq6m9WkPm7ZiPqnxaDKXSqzsKAYAV9H4wE
   EQk8S+A3gXbYXkQOcBIMMVptHTGGGwZ9+P9F6X1ocJ4NNVN2wagm9Ot1h
   Q==;
X-CSE-ConnectionGUID: 1RTehdKvRYSdCKRHi+02wQ==
X-CSE-MsgGUID: v+t5N6lsSu2nuhzEgmp8rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="32923761"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="32923761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 05:25:17 -0700
X-CSE-ConnectionGUID: C+J0lTjgQsa2KqUvaJ7O8w==
X-CSE-MsgGUID: hzaqfKDrTMO09rBbL4uj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="64155460"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2024 05:25:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIowb-0002li-05;
	Sun, 16 Jun 2024 12:25:13 +0000
Date: Sun, 16 Jun 2024 20:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 45/67]
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: fixedregulator-dp0-pwr:
 'pinctrl-0' is a dependency of 'pinctrl-names'
Message-ID: <202406162019.AhOVkslM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   038aa785c74b05cb8f4b574c972272e77a6dfb57
commit: a581aac010e0bce887c97910f251ddeceefcca47 [45/67] HACK: arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-1
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240616/202406162019.AhOVkslM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406162019.AhOVkslM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406162019.AhOVkslM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: fixedregulator-dp0-pwr: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
