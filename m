Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03FE1DFFB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589310; cv=none; b=m+s87DX29xT20gjh/Wvz6I/PR0Lqmi0hXAZ+2maEMkDuOE8eFUjXMCdrl+texdolyThMDxKchq9VqaGVCsFgTsgN3UiDwje5/+3nLvvac9IzdgmbZbpySGpBxVWyBhWNbFbKU9il2AjXgaU6Co1j5XVIINgCRO1fYojEfeLD6kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589310; c=relaxed/simple;
	bh=IHJ+WL0cVa7RZfOP1r25uJJTXNAbWWjv4QSn6GWPoFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU4rBOxSpVJajxrWwvJhiOLD6plW4pf/csgOp3Pp3pE0PWgEi6zM22VcbJUx23sUU5sZQc15XPO1Z6ssO+j7p2RUzMJpZb2XP6UfnZvHrz0WlRmnHQOrPiyeeXg2EfU3o9SVN7HONy4rarqFG2k57AfXAEekSTo1wAUTk5nvazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J96w4SWh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J96w4SWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719589308; x=1751125308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHJ+WL0cVa7RZfOP1r25uJJTXNAbWWjv4QSn6GWPoFI=;
  b=J96w4SWh8wleI1W/7iYqyGZcMp2h8N0iDowJAE0WH9a/Yx14ZWcoYib8
   0WidMKNRW+wAMYpkf1F824EjJfqqeVbKo+k7c2NlG1f7SO8mN+DU4793h
   J57SFnhCu3bVo5vsiRpPwupndTTR6FhTahVelP9FyBjU94FsyQy6c1+XK
   Kz2Q9Fh7Xo4Fa4Y042oIjF2I6Kmmx+7uyoWqxCUBMpVMVEMsBBRLcVEKu
   ALmna03xAEkfV7WW8JRlQVffowf+RPoRFETItr5b16Gw/j+K2jqAeo9Tq
   7o9EhA0UG9forMNSf464XaEkD4E4zjY6gydWbqY/df71hbBZj+S3C9WGf
   Q==;
X-CSE-ConnectionGUID: 8hp4NZ7ySyGbPt2BKsAszg==
X-CSE-MsgGUID: LqOc4v5TRrmxILH/Ch4A+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="39294077"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="39294077"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:41:47 -0700
X-CSE-ConnectionGUID: RacXKUJBQHS352mb9/VZzA==
X-CSE-MsgGUID: BAZidLR0S0egDvoKw0m1Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44758001"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jun 2024 08:41:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNDjN-000HGE-0B;
	Fri, 28 Jun 2024 15:41:45 +0000
Date: Fri, 28 Jun 2024 23:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 111/251]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb:
 /soc@0/system-cache-controller@9200000: failed to match any schema with
 compatible: ['qcom,sa8775p-llcc']
Message-ID: <202406282334.68O8E6ob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: 809c20b1ffc80200bfcbbeceb0d946a3e0eed3a4 [111/251] arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240628/202406282334.68O8E6ob-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282334.68O8E6ob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282334.68O8E6ob-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/system-cache-controller@9200000: failed to match any schema with compatible: ['qcom,sa8775p-llcc']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
