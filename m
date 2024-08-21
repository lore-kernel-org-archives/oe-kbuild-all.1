Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097B16DC11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 19:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724269200; cv=none; b=ung75PuHJlg9wNMYEuhUUEKMHX+ST79nhfpgTIvGDnFmD6NV9JFXrWV1ZoT+W/5QrEFSgpzggxUlKXflO2PWOaA9s6mNMv2HPqlvgRvQCwxJFd30VdxtPmiSObg6xRHKJKllE1O/T62Fdoh5djxzmWO6gLT9jrZXQZpuLipb2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724269200; c=relaxed/simple;
	bh=GqtTU2pwnbwN9pKdPr5a5j2qfxWh+fH3MfTOE+Ctdnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJhIcuKTu5CPSqwUH00vODX9wcO+PZ1iZ5wLZrMlPSMOhCG6s2i+QpSxtoG3cSUsAAYrmbnsUwbxBjznYiBKVYiMsdofYwFdoDe3KYa7WpjNDrdpJRbc+paMZwosL8DRndXeWnY2DIVQJs51k6LsWkj+9yvBsaxT7Ec2k8JdOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSqYuyK+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSqYuyK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724269198; x=1755805198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GqtTU2pwnbwN9pKdPr5a5j2qfxWh+fH3MfTOE+Ctdnw=;
  b=ZSqYuyK+ULP6xszNIrnN/vG+zj0daiLrNvLt2fyJ+QtoQSlP1sRKUU4w
   eluv5gGrh/tPr9vHpomU0ZUmr1SOoC/bJGMCi7hFQMQhLeiE+hQsLL5d0
   SvR9HJMDzy2EDkbyd89hktC8ZMGEf1qkYwCyXtVWMbgcaHBdBDu7s+cfM
   aLkybVdHbt8Tzp49wkoSirOzqRz2NTCkIZujSMU/lGo53i10KuLHU1umr
   uB/yXlvL89rESdFAtfAGoFJQo+8/3fJ/Mcgs0pYOl3oLCIRXCj4gBiHgZ
   zTQQ2NDES9XoOKsMGdMEVLg6BF83oZGtAKMdRezry+u3FEQ0V/u5ZqtvX
   A==;
X-CSE-ConnectionGUID: Gx8dmhKQSgGmK/i49TG3Vg==
X-CSE-MsgGUID: ZxUyVXLTQ9mFu1hbsSxs+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48048253"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="48048253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 12:39:57 -0700
X-CSE-ConnectionGUID: avW6OdbRQ4KQKItJp/DYcQ==
X-CSE-MsgGUID: snymui+kTXeeCdg22yL3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61191564"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 12:39:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgrBR-000BsW-1z;
	Wed, 21 Aug 2024 19:39:53 +0000
Date: Thu, 22 Aug 2024 03:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4740/5728]
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: audio-codec@18:
 Unevaluated properties are not allowed ('clocks' was unexpected)
Message-ID: <202408220318.McWAeAZS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
commit: e486feb7b8ec04ec7cd53476acc9e18afd4a6a7d [4740/5728] ASoC: dt-bindings: convert tlv320aic31xx.txt to yaml
config: arm64-randconfig-052-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220318.McWAeAZS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220318.McWAeAZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220318.McWAeAZS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mn.dtsi:1128.11-1138.7: Warning (graph_child_address): /soc@0/bus@32c00000/isi@32e20000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb: audio-codec@18: Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320dac3100.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
