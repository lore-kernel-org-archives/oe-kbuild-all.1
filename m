Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF18F1DA5F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748548553; cv=none; b=O+C73cRyk018E3jbISh26FAdBiwehg932iiWWnkKnpj4+vXVxwnVUtaqZE1o+4ivTh5KdrzcRcFboq5fXj6wfW/ME25sg+wXKi+sx6veQk9bbNTqys2GH3rQmPiUmP+EeDlO23cPP4X6XOgjTcKqePup7B9+KxCSB9xUDP6P+LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748548553; c=relaxed/simple;
	bh=yg7fMXwpahMebuyt1sJqJtN82c+H3ZSsW0LaxvSj+iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCyjnBJ1X2jixyrTyqRgsPiexQ6D7YkgpvP2X0gTnrlYg8raAyHora53LkQyWRJTAXAnmbtCju8Md1rkAyjVp2qCkALDCKj6wjnxEWUWgU6aUIAockSuuH3X5KQlDee6qKs36fxaHW8N6MrhG2dNYR+MSRWYvtJCX9IZ69DExhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSBHAJi8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSBHAJi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748548552; x=1780084552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yg7fMXwpahMebuyt1sJqJtN82c+H3ZSsW0LaxvSj+iI=;
  b=OSBHAJi8ho5VyqkfyAENn7DB2S0Uo8L/baWnC3ACNc9Pv2zXa4u4HBZ+
   zeRZ29u+Wk7+TM3vNtSMOzTO5EU3ppD3IcoAHsxOOmdRlhkHLAvrexivD
   6uYYLce75x593h/HhkB9Lq7CKvHmSI07xvbcX5QlggY6MZEau230Lj0eE
   mJluSXhjeacG0ovIIt63Y88MxT996UygKUSD0r9WMeiK7q8d5yIkcW3E1
   Xs4FH9/bgl9u8UpQ5pmeckv1p1yhl3manH5TRcwYM6f6gnQ3wi3hYHlGh
   PcV9+VQ/ZvS3+EfhTWUdO5opXCVOk6AWrOWag1d2ujgVmPPdcGNg1/QJD
   w==;
X-CSE-ConnectionGUID: AuOJndlDSDqaynoJxJKLaA==
X-CSE-MsgGUID: DovcOYBTR/mpYPRoEea0xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61294106"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="61294106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 12:55:51 -0700
X-CSE-ConnectionGUID: XPWBEC9+QMi3aRByUYr5pg==
X-CSE-MsgGUID: 91WMK08eQHGqI9iLdGr25w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="144646337"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2025 12:55:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKjLv-000X36-2w;
	Thu, 29 May 2025 19:55:47 +0000
Date: Fri, 30 May 2025 03:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 8683/13944]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb:
 nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
Message-ID: <202505300337.V5fnqtr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: 0d57ac1f92c7558b5d1b8f9780b9eb2f0d06b284 [8683/13944] Merge tag 'socfpga_dts_updates_for_v6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300337.V5fnqtr3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300337.V5fnqtr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300337.V5fnqtr3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
