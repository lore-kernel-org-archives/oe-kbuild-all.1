Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95118199958
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725017412; cv=none; b=adxC4U8WpQto0Aq0HyhYK6Slsg4940iJxOyy06UivG5rtBMY3Kg2CxjIEuXyNrS164OiEz4QdoQjsydfVntlHTUmGk6+XI6MYVzxyYnedpmbRnzB2VmMjdwe86qQUiTWcCJQiTfSoCy1q+m14scb7LXIqetkccmzLiwko6T2aC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725017412; c=relaxed/simple;
	bh=Ipg4KZa0svOpTBAIBVCHWhBb9BpsJ12od4fwgluSXxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEmRWX7WdEdZSIOUBQKn60JehC+cxBjwqxs86LOyegCKPqAM58t6OgkChGS/RFVKOiQTmClYZx7B3uFr8dkjewhEJhYdTJ1mNNSR60a56jLExs/l1g/8v44oXKIW4sDL/qN0/u0TDwZb+/GbpGnqQFD7EOvFsHbFD5PysX8iJyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mv+Qhoyx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mv+Qhoyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725017409; x=1756553409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ipg4KZa0svOpTBAIBVCHWhBb9BpsJ12od4fwgluSXxc=;
  b=Mv+Qhoyx7cnwEBljn6j7/TZFu9VfxhluCN7JXdHB8tqmk+54p/Mjv8Cw
   QQww0TsEso4uZBnHaplBulHTF/qK4CISQxIB6jzcp1ZdwJF+fnjBGMhrt
   bHOUc+AjpgCIsmurWbicI4NLDClBe+E/2RJCVTYmwJoHRvkAnhERtyp15
   f917OreTq6T/UAhg+3ahUpoJnELAaiOjtQND8TK6eQ9PSkmHiGuHAaBds
   X21Iu49Z+zt+hkaTQYEIYgRLD571zkfUFstPhJOgs5N2o5gw6HEPCjttZ
   1NdaCd4OewoOUdVxpIqQFkc52jNX+ULJ9HPd5ggj6deq42pvXU62CJHKR
   w==;
X-CSE-ConnectionGUID: 3Bfi0/6nR2uffVT6e2RqsA==
X-CSE-MsgGUID: Fiyt6DwbRUy/YSVit80XCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23536229"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23536229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 04:30:09 -0700
X-CSE-ConnectionGUID: jPAqVEceRfi0aTnbWwJOdw==
X-CSE-MsgGUID: DBMX8A4VRQaRLiuroUH5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64057344"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2024 04:30:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjzpN-0001RQ-1z;
	Fri, 30 Aug 2024 11:30:05 +0000
Date: Fri, 30 Aug 2024 19:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [linux-next:master 3236/8126]
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb:
 clock-controller@30e20000: '#reset-cells' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202408301954.waraYCyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 64c9c977c802ceee6adf2e9cc5283c5d4d021e83 [3236/8126] arm64: dts: freescale: imx8mp-phycore: Add no-eth overlay
config: arm64-randconfig-052-20240830 (https://download.01.org/0day-ci/archive/20240830/202408301954.waraYCyg-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301954.waraYCyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301954.waraYCyg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30e20000: '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
