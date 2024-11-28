Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE7847B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 15:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807617; cv=none; b=o/WTzJaiSwD8thQodsQ0cIWhpEIKcSjikMKqHMzytU2qRgu5lM+XHySA6Vj8eQVqlxYAjgKJS3dtyxejFXt53CFPQKW9tSLbQbWccA7BPhD3Jb/spp7CKFGjV9s3FPUNek1WjC26iDCdvyKyXVBy4E6gLoo716K5Av5B9pch7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807617; c=relaxed/simple;
	bh=qfaDoLbsn3Sfqw2e+P+Coxn58OrUjq6nWVZN/XbZS0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWtTIsRt8fd04S51sYR0yUu0145tV1b0qJ3qzb6fdxFFEFTor/LFhBV6ay6Gzp/pCjfL6OrkUd5YfbJPmKfSEvFXmJKDpB6IG5VQZdEwtM7XAzRMddd8ZgziGT2nVsTcHu+zjNRd7pMFkd1H2SKOxEHJKySzoAuLZRTdJlAAoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwtEOb6i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwtEOb6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732807615; x=1764343615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfaDoLbsn3Sfqw2e+P+Coxn58OrUjq6nWVZN/XbZS0w=;
  b=nwtEOb6imt8KQbV12PPI4SvUFdI3yqyajt7Ec2vpK1X4Z2wUEs+3Y1+b
   xcYY1Q3Re+X3icHZuV4ZsMXd3kv6GNPxECBKUV3GEVZ1B6kIK8MrDCTsE
   +aqNKaj3KsquJYqk2xGLcIgOH4bx7EHbKKuH/hIgSZKUi9SjMjDha3Hdd
   Jahmdtt7l0N2n58BLj6Hs66rC1kqasUnsX16hqRhlxRURbcrK7LTciHlC
   r9ujM58PMz3b63nEgukOsrAuR6Jnhuhh3jJhiiocupr+5lYf9W/KdrJt/
   XIgXaMWga4xie1goy5YfpiDtGM3RC4vQTzKAa8649ldVdVU/e+w67PZJM
   A==;
X-CSE-ConnectionGUID: LGFsGB0hSnWLuYnVuTkFlg==
X-CSE-MsgGUID: 0adwgelNT2OiiNGiC3C2/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33175970"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33175970"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 07:26:53 -0800
X-CSE-ConnectionGUID: FJ2ljNDFScqQwO7QXm/siQ==
X-CSE-MsgGUID: ZpG6N5JrS9y1qQDdB907/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="92586806"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2024 07:26:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGgPq-0009i4-2G;
	Thu, 28 Nov 2024 15:26:50 +0000
Date: Thu, 28 Nov 2024 23:26:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 17/28]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ec@0: cbas:
 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202411282320.GOyc6dt7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3c6853ebba70a03ae7540022d1b4ecffe0da3703
commit: eb3cf66b297421942619a5d2c2c3fa5ec1373e30 [17/28] CHROMIUM: arm64: dts: mt8188: geralt: add trackpad node
config: arm64-randconfig-051-20241127 (https://download.01.org/0day-ci/archive/20241128/202411282320.GOyc6dt7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282320.GOyc6dt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282320.GOyc6dt7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b86100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b86100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible:0: 'mediatek,mt8188-adsp-mbox' is not one of ['mediatek,mt8195-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10b87100: compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/mtk,adsp-mbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/mailbox@10b87100: failed to match any schema with compatible: ['mediatek,mt8188-adsp-mbox', 'mediatek,mt8186-adsp-mbox']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ec@0: cbas: 'disable-whisker-input', 'hid-i2c-tp' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vccd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: touchscreen@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: ethernet@11021000: tx-queues-config:queue0:snps,priority: [0] is not of type 'integer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
