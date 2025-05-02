Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32A158DA3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164697; cv=none; b=chUNGJiwkhzpmx4mKyN3wcBdhM3yTSW8/YTgFmiKa8zYBQKjk6ktrf/7d1+VVJIqB3zVZ9sirAMPVwZ6p7FRmKAPYXpAkinmek9MWct0kL5fsqaONo4d8p2nj94r6lcCwNwkUUa9ll2AeUMDf409t8LqjFzx34Gx3AOJzs+IZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164697; c=relaxed/simple;
	bh=/7CWSdjTo8m/FfaJDUb5Do/fAIFDLOenD5nHDv4VKug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtugKLnjJl5iMqzkqC7/7uzDb9nLiba5GlKhnYST7O9rPMzUq1gJUXba3YKGPCFlqOo6JRqqfPHcyc6dtbnTzOV4MkX3OxgywEx3XNS65xXxWAmhONG7wZTwYyUCM/ZVlk/6PSN3kqgqz/JWdBLqEX1sSXpsLUQlRLUITyRCtwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEeCnOBx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEeCnOBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746164696; x=1777700696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7CWSdjTo8m/FfaJDUb5Do/fAIFDLOenD5nHDv4VKug=;
  b=nEeCnOBxDiLlTX4Y+oIlIpurA4N1gIBwjLN/WfYj2rXZZBcmqrTAEVbm
   gnDZ9adUiDiYtsf68d+D3+dxWCzfDGN2U9EKI3YTQZ/CxEheQ0ONPpsrn
   ejmu2EQvTATgJNEE3GecrKCAAuoRODLUAmIG2C11LNlCoZnHAYOJfSFbt
   kiW/2tVAVNwBc1tmbWJDm4kbgXkQneHzTtV4G84bFfQ/LWXPV1GRd5iNF
   BJtAMB7EbP+HcsGpDvQuoFBZPYKiMdp9g5DhxFr7i3sbLmQN5tnuQCdXK
   jrjLr/sXHr0tVNJb8pUTzSiYhZNbypGxFGuNBstPyZ+/KoklRw+LjTvKH
   A==;
X-CSE-ConnectionGUID: RqwFmlGWT72ZK/1zCtAZMg==
X-CSE-MsgGUID: FtdiqyTlSr6Gm//Xg33how==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51663296"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="51663296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 22:44:55 -0700
X-CSE-ConnectionGUID: BICkAvxKSHO/2JH5kjJtiQ==
X-CSE-MsgGUID: DwnwzrALQQ+VpM4RZkKx1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139365606"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2025 22:44:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAjCc-0004Z3-2r;
	Fri, 02 May 2025 05:44:50 +0000
Date: Fri, 2 May 2025 13:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
	David Heidelberg <david@ixit.cz>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4996/7938]
 arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0):
 Unevaluated properties are not allowed ('altr,enable-hash',
 'altr,enable-sup-addr' were unexpected)
Message-ID: <202505021331.aPdRysUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
commit: dede36400714b34bdaf79be2c84f540f07102554 [4996/7938] dt-bindings: net: Add network-class schema for mac-address properties
config: nios2-randconfig-051-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021331.aPdRysUb-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021331.aPdRysUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021331.aPdRysUb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/sysid@18001528: failed to match any schema with compatible: ['altr,sysid-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:2: 'tx_csr' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): compatible: ['altr,tse-msgdma-1.0', 'altr,tse-1.0'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed ('altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml#
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@0: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@1: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@18001440: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014d0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014c0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@880: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: leds (gpio-leds): 'fpga0', 'fpga1', 'fpga2', 'fpga3' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
