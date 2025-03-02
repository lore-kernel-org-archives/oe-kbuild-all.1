Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216DF70821
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945481; cv=none; b=JciKraZhZVpiHKm6CYgvUMKLm+FUpLWga78bKix00J5JFTXj6Wkve0Nf8AHzikIxrL48VWqFAi8ADYnbgs0pBphgSmdlPZUpaK5e2KRbPEJ/Mvu+9Y/YfpvXSETAGFZYPElJfaN8PZnlUP9dnVkUr9TBEQ0sj7mx1JBRHVSSsVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945481; c=relaxed/simple;
	bh=zWmi+xiFHgJk3Ox7zb6rPn+GDRq/Gt4dMmuLDT3MyAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sc/DmyV5HHGD0BHsfDFiXuAyVnV3QaKng+/eeQcszFHPSGdyluB59QwjgJ5ppUzYXZVKIB+3LhugdC/4PRXsLsZwtffETQx0lI1WadqBRm4nEHUOX1ByV55TJKdM2cePtqcGuDN3Vnr7m2l2wJHiTkySgt6I4dSIgRUTgIeaMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSeGd0qO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSeGd0qO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740945480; x=1772481480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWmi+xiFHgJk3Ox7zb6rPn+GDRq/Gt4dMmuLDT3MyAU=;
  b=NSeGd0qObaIK9BbOZJ7RVMN1rNOdVje5SXyt72O8JX9HO+uazJJj856m
   YRfvLZxuRxQcUfo+7FtoslHwTG+Yunk5DL81SoUp80NvusZMooIahj1bA
   onEqmrGoy9y3mZyHuCZRJ0C0T00DRAPK72V11HzyV0s1PhlON1bIeJbP/
   GnxzJNmIKzHlIG9w/hDiObQPOr3gQ7+w1gsKw1VgeRFlC3P8ttiLO5Ir7
   ze1EgCKvhLLvlC2189rAASWyHcQkolD+GbIuvPehhb+/ORDaGHp9q3RDL
   zc+10SX4AWBTAk2i2fp3V92m5mLDmfnM63Gz4VBnWtqX23954FaBl5Kxo
   Q==;
X-CSE-ConnectionGUID: zyQ0RtFoRImYSXP+NcdlFQ==
X-CSE-MsgGUID: du4AJqi5Q9uoU8dqp1/ckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53223983"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53223983"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 11:58:00 -0800
X-CSE-ConnectionGUID: qnJ2duouSaO7aTKyfi5d9Q==
X-CSE-MsgGUID: i316KBqzRaSRadT9qsdZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="117819216"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Mar 2025 11:57:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1topR7-000HYw-0m;
	Sun, 02 Mar 2025 19:57:35 +0000
Date: Mon, 3 Mar 2025 03:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 4892/7423]
 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb:
 switch@1b000000: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503030330.IXgD2w5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 92575a2182376e1244fe0c45e85158f5ebbd7b51 [4892/7423] dt-bindings: net: Add switch ports and interrupts to RTL9300
config: mips-randconfig-051-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030330.IXgD2w5L-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030330.IXgD2w5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030330.IXgD2w5L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/realtek/rtl83xx.dtsi:19.11-58.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mips,mips34Kc']
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'oneOf' conditional failed, one must be fixed:
   	'ports' is a required property
   	'ethernet-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#
>> arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dtb: switch@1b000000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl9301-switch.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
