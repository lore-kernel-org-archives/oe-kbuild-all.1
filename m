Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47BDDC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753123688; cv=none; b=W2smDL3o59zZt+MrgcZttccpWVeJSr9mDs/hD0C5pH1doYksXLvQZ+DSLOuICXvHTlHJmUtzmcY2QrSm3eLbRtGt2IAbakiwrCbG0xLwrGuCfppNQ9HXClqTceTCXlkmZr5KRsLt2t9zvOVVwGmRCI2m3cweUSi9Iw0PcsQ4fAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753123688; c=relaxed/simple;
	bh=TLHosF16Gj0uCrzLgD7uTSPXrjbXwzCuXp+6jJRrLMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTu9xfVDOnpxlYI9RJ94x17Fk0hUlqVM++O5qbC6hpZI0NgihHAAo4ttBrUtCKjA7kT4alSN8+R2mBtVB42QGs4rkOS47mBEG9VvSqtBowuQvpSY0Avct7vOm1AYDa521HDhAk/TWfp6gqd1BXO5ofi9hME46USFqs+50v3TGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdXlSQyq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdXlSQyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753123687; x=1784659687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLHosF16Gj0uCrzLgD7uTSPXrjbXwzCuXp+6jJRrLMs=;
  b=JdXlSQyqVQpbetDlUOtIRKtq0Wmi8Ub8KAgN0H2o25EWIsYV0PkFpu7o
   cvlB6Y0TxaUgOKUJUxP2jC0qqVfKpcIaQ9B+EYksRWZfi5+j+nA5fHQXL
   Vwzu3FK/mzcE/hSpQPWlo1y6rgleV5epS6X6fmWEIWqcCVEUPGX7lOku5
   KN/VIv42KdmmwyTeb15BoWeVR6AYioO9EzcG/pX1TkQll5KHUz2Ux1S5f
   cOJ+uPoFZZsEceSvMDDFLWkYwAwyBA9nlGpSrcXW69OkflzyqEu94OV8t
   qGd4V+muSL3jacBvBfXhbxhUVcN7Aa2RCHDFMuzwibRlGitDOD4PUsMu9
   A==;
X-CSE-ConnectionGUID: KMdCeJC8SUqeIJvjSBv2Jw==
X-CSE-MsgGUID: vcUY8IVGQMO6g2j6Smj7kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66037870"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="66037870"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 11:48:06 -0700
X-CSE-ConnectionGUID: rwVAokZ/SpOv3bXX/Z/MNw==
X-CSE-MsgGUID: /ZP+aw4tS4aBbD0nA5u9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="158217099"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Jul 2025 11:48:05 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udvYR-000H5B-0Z;
	Mon, 21 Jul 2025 18:48:03 +0000
Date: Tue, 22 Jul 2025 02:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 5905/11398]
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: sdhci@d8010000
 (mobileye,eyeq-sd4hc): $nodename:0: 'sdhci@d8010000' does not match
 '^mmc(@.*)?$'
Message-ID: <202507220215.wVoUMK5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 71ad8d3c463ead1fc9392dfaff2fd977856c07d5 [5905/11398] MIPS: mobileye: dts: eyeq6h: add the emmc controller
config: mips-randconfig-052-20250722 (https://download.01.org/0day-ci/archive/20250722/202507220215.wVoUMK5B-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220215.wVoUMK5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220215.wVoUMK5B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: sdhci@d8010000 (mobileye,eyeq-sd4hc): $nodename:0: 'sdhci@d8010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: sdhci@d8010000 (mobileye,eyeq-sd4hc): compatible:0: 'mobileye,eyeq-sd4hc' is not one of ['amd,pensando-elba-sd4hc', 'microchip,mpfs-sd4hc', 'microchip,pic64gx-sd4hc', 'socionext,uniphier-sd4hc']
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: sdhci@d8010000 (mobileye,eyeq-sd4hc): Unevaluated properties are not allowed ('bus-width', 'compatible', 'max-frequency', 'mmc-ddr-1_8v', 'mmc-hs200-1_8v', 'mmc-hs400-1_8v', 'mmc-hs400-enhanced-strobe', 'sd-uhs-ddr50' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/cdns,sdhci.yaml#
   arch/mips/boot/dts/mobileye/eyeq6h-epm6.dtb: /soc/sdhci@d8010000: failed to match any schema with compatible: ['mobileye,eyeq-sd4hc', 'cdns,sd4hc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
