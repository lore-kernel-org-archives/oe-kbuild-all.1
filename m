Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7ED31282F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392345; cv=none; b=BhAPLah0mT0wEPC05wca3RH1piiO0u9w/gIRSInyCaxJDdBP7o694JvnPYoSlYXjQrzPzlWZ8cFJ/7MKgs3Kz96oFH3W9otDYE06H23k+remf4TA6rVBGHwuPN6DJKWhbDFPJ0rZ+Mu+J0D0j15JYB2r6jrNUVHQL3w4JnZaimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392345; c=relaxed/simple;
	bh=U/Uigv6B+liFNfU9HRCcMdcdphV8Q2wIAVILb6dJ/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUw8kZOgY8Jmtqho2ZVDXHHqBN5OJmNXQgPBSOesdekzrIwm7QzzcMgV2qGTJkmqqMuAwbAA7ZqzOUQzWRbwuW0iwtRBxhd4JMvJCzolBLuKpl59P1CKPoGdjDZDp6GIkumkxzggN8VEYXd79wGAGsW2fIy8CroHOkcZNW/tE8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYevOCZT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYevOCZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756392342; x=1787928342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/Uigv6B+liFNfU9HRCcMdcdphV8Q2wIAVILb6dJ/iI=;
  b=lYevOCZTjxfH7rFxNDkpZzCwVHcKwjuWy8bhUgFtshaNF/qDvh5l++05
   8IjkRCsbLW8Mt3nmU8ZqZMD3TulOpCQbQZSC2OdoP3YXmjh0psbUvUqjS
   t0D8Fnkk6kqO1YCUQp+IC8uCgIZ7KAZpMYiv0sLnHPGWtXYXJ5CMynl8A
   K3C3MuRcM1dTlvyUgW1AqrCfR2Ytkt2GmvjedDUZribEgQMajI8jeAhfZ
   Cx2YPjwzzJu8ZwErVlaL6WaGvHOFNN4rsNYz1J2W8YX0566NjNO56XjxK
   NUQ5RwuZXaSQo90D38IQyAsqlOkkKtX2ixHV5QkjutvQPEKwjVDmD5cok
   Q==;
X-CSE-ConnectionGUID: htOQI209Syq4p44En18Dxw==
X-CSE-MsgGUID: bBtIJBgtRQiHps1P4gm8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62487007"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62487007"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:45:41 -0700
X-CSE-ConnectionGUID: EUMKxhXcSeemU1kr7pZVjw==
X-CSE-MsgGUID: 8PoshxoEROyG+YBjHqZDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174298257"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Aug 2025 07:45:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urdsS-000TlL-1q;
	Thu, 28 Aug 2025 14:45:28 +0000
Date: Thu, 28 Aug 2025 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 454/454]
 arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mminfra@1e800000: failed
 to match any schema with compatible: ['mediatek,mt8189-mminfra']
Message-ID: <202508282211.ITzVf3yL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   815b7f84c23bfa95fad38f9f70984c3febcb429b
commit: 67e0e1a3a6365e8d2eff88acdb907427a817b57d [454/454] CHROMIUM: arm64: dts: mt8189: Add mminfra device node
config: arm64-randconfig-051-20250827 (https://download.01.org/0day-ci/archive/20250828/202508282211.ITzVf3yL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508282211.ITzVf3yL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508282211.ITzVf3yL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131072.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131073.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-obiwan-sku131078.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196608.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196609.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196612.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196614.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-quigon-sku196617.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/spmi@1cc06000: failed to match any schema with compatible: ['mediatek,mt8189-spmi']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: mt6319@7 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: mt6319@8 (mediatek,mt6315-regulator): 'buck1-modeset-mask' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6315-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/timer@1cc10000: failed to match any schema with compatible: ['mediatek,mt8189-timer', 'mediatek,mt6878-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/syscon@1e010000: failed to match any schema with compatible: ['mediatek,mt8189-vadsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/devapc@1e019000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/mminfra@1e800000: failed to match any schema with compatible: ['mediatek,mt8189-mminfra']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/syscon@1e800100: failed to match any schema with compatible: ['mediatek,mt8189-mm-infra', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/smi@1e801000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: iommu@1e802000 (mediatek,mt8189-iommu-mm): interrupts: [[0, 278, 4, 0], [0, 279, 4, 0], [0, 280, 4, 0], [0, 281, 4, 0], [0, 282, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/smi@1e807000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/smi@1e808000: failed to match any schema with compatible: ['mediatek,mt8189-smi-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/smi@1e809000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/smi@1e80a000: failed to match any schema with compatible: ['mediatek,mt8189-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/devapc@1e826000: failed to match any schema with compatible: ['mediatek,mt8189-devapc']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: gce@1e980000 (mediatek,mt8189-gce): 'power-domains' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
