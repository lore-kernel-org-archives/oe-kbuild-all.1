Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4025EFBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 23:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770939636; cv=none; b=Kp0t9KApukVDiibPMQZaq6XzCwq6BScUxLpi3yigAlY8dHeAPe2AFqmApNXhJQ/cmN4yhJ0y+4z6r9CCGJQadSHCO0VBSsPlxuY3G4y7mT9sMrnvT/iewB8nzMs1Eab36uQFgaYqHnFqEYwROdmgJ4oPd4kVw7VdMEtu1475EXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770939636; c=relaxed/simple;
	bh=cz0B+91GOLRgs6pgDGDZJMo0DyI04gTnna+vWwcV1IU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUaQO/3B6mABicUOr93W57w+9lXbohyOf3jXk3mLZpYg5Q7XS2/O5bGyr2dD0tuRbmo+Cl10YIOfje4izDRkjacA103Khwy7EhKKnClusfbZsZLIePT31PlO8g/UVgLetoq4dIVbWokAQSOaDx5rtfGWMrsKPTZqJsaWVaylnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnjZD9TP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnjZD9TP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770939635; x=1802475635;
  h=date:from:to:cc:subject:message-id;
  bh=cz0B+91GOLRgs6pgDGDZJMo0DyI04gTnna+vWwcV1IU=;
  b=HnjZD9TPymr3PnzY0iwRY7bilnYCjQUyi4T/RGxnLC3vCDlOUpnPFXB7
   6oVvt6ncllunFw57GLSB4dqbt9QkuKaVDhjACJFgVLAOa85ejc1Z7z5Ia
   5L8Q0xplgoW6Q8uhq4qu50P6xq1McCRRG23MFMxKnSEx5JudItgb8OPRH
   6Q6sT0neavTlMBO26tJrcRjMltoFJn17TssuehhXUIodfpR6Pt5wc24Ul
   pXfMWcws5opfY8kO+3r0XYFoGqVPluOKMTuMW+0PXSh5hUPpr4aQjU2IR
   MY08br9Il7xIqQ1Spgq2zOavdQN63rtp4nfagmxV/2nPkVyNDRsQ4iaX1
   g==;
X-CSE-ConnectionGUID: MFYWydJeQ2yuo1Kcl4YuDQ==
X-CSE-MsgGUID: izOOk8l5T/imJqoU8/mb5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74728100"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="74728100"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 15:40:35 -0800
X-CSE-ConnectionGUID: h+nI2SV5RxyXBu1KtYirWw==
X-CSE-MsgGUID: kUxKIzABRPSKKek87Vi1iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="216936950"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2026 15:40:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqgIR-00000000u5c-1sFC;
	Thu, 12 Feb 2026 23:40:31 +0000
Date: Fri, 13 Feb 2026 07:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:or1k-de0nano-smp-reproduce 3/4] traps.c:undefined
 reference to `dump_ipistats'
Message-ID: <202602130714.q6UEr62j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/stffrdhrn/linux.git or1k-de0nano-smp-reproduce
head:   d2533084299085b9b602b8b78d6827a2411ef05b
commit: ccce72b641253ed4e9e240d1e6486ab99efb6a82 [3/4] openrisc: Add PICMR to show_registers dump
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602130714.q6UEr62j-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130714.q6UEr62j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130714.q6UEr62j-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: arch/openrisc/kernel/traps.o: in function `show_registers':
>> traps.c:(.text+0x26c): undefined reference to `dump_ipistats'
>> traps.c:(.text+0x26c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `dump_ipistats'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
