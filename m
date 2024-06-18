Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240777764E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 16:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728810; cv=none; b=kgFEFDrNbkhZGORMSJy/2WWhEwUZyuwjNh3Q8wG1eobhfddI239mqikCw8ph5NqWSwEWa5En3vAHxcsj1EhVuyfr870KHkHIz5MMcjd3V9Aef6nMhkzgRl/+o/dwhnLn985VOKwLMqCrb7EIHk1YlMShwzCAcUVKkex3nQrbKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728810; c=relaxed/simple;
	bh=lfGwpboJIZvnNozny8lj51El7mjKNdu7E7ipcnS8v8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=os3ZMEn6AI70qotVT04h0OGylpa++b5G/emay4E6jSu3QGx/vKBaKq06WVq7DTbrj6I9sZpEMSJ+qbxn33B9+2WyAOSnlpwjUjWHwfD5Pxe0aD4kPbOEZn1xYGdHmRXpQWYfEPhhtcMioeUK0Z1jmeVAV36wKbtkC5x1aEtAPi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XE1dWDqV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XE1dWDqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718728808; x=1750264808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfGwpboJIZvnNozny8lj51El7mjKNdu7E7ipcnS8v8E=;
  b=XE1dWDqVcZTl/hDNzKvxyZlA5qYviv3WvgfvoXu+J2RoZt5QMapr8rjk
   WPcmJv3rw76IErL/avo3WKKWDK60uhUGF7QNLRIS5ukYek2m0SfJQZ/9/
   DpHxIuxNYHOOnaQBqw9MlncNJeUKh0cyxxosnxh2jzOzKyyC9N/CdaWBX
   qt1NOzsn2onUWPtVT6vNsnp2VwHA6ki+dqGAghxdQ69juef/Du6aeEqXa
   4SwVs36gYG+QJWsP+R+fjKISj4yPUr7p79KvHtaqRI4s7nW9N2PwsNc5c
   OO+gjSEqkaE1fsSGXBSYQkfsPtyhkCgThU7/bvG1+ht8UPTrB0uKCYctR
   A==;
X-CSE-ConnectionGUID: v+VWF3/OS1mlVHHp2AEkFQ==
X-CSE-MsgGUID: o9WUImC9R0y0/pwhmAGgHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27039225"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="27039225"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 09:40:07 -0700
X-CSE-ConnectionGUID: gM1toMzWRuyx220vxic/pw==
X-CSE-MsgGUID: yKfcGQkETWOzvd04maxJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="41713676"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2024 09:40:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJbsK-0005iq-1h;
	Tue, 18 Jun 2024 16:40:04 +0000
Date: Wed, 19 Jun 2024 00:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4991/6864]
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000:
 'clock-names' is a required property
Message-ID: <202406190037.pVMRi4dB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
commit: 75c183f5dd6a1722d172bcdca01db7fd1ae97d36 [4991/6864] arm64: dts: mediatek: mt8188: Add Global Command Engine mailboxes
config: arm64-randconfig-051-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190037.pVMRi4dB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190037.pVMRi4dB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190037.pVMRi4dB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic: failed to match any schema with compatible: ['mediatek,mt6359']
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: /soc/pwrap@10024000/pmic/mt6359rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: $nodename:0: 'clock-controller@14000000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: clock-controller@14000000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys0'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
