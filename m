Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977E271A9D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757869004; cv=none; b=AJtiMrs7kVLNd1ebDGhWl9922D9jSZQOF9ksMeAltjYVfr6ykpqj/ldQ/EuU2l/8LkXyp95XL/SAAgWEPjhP8vukkwVSu0NCx375DMzJ9taioPQu2dLRXSYd0D0kNHC0PGAM6EG2Gl6IXENHrApEZ1NZworwCyE3hNrL6BEMtp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757869004; c=relaxed/simple;
	bh=V9Z8eWtMCA7pR/TCmnCAfrD3ofoZiYa+/C+cA9Rf+ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MP03THxzd05LlYRe8wXdjmhEqLtCFoYlAah94BcY9Lr4bzqfbe8fytYIYiwjF9ie35cQi17kWD4BF7rS+hEzUesuatzDpYGSLDnH1PNAOYtEvssab3QW4zBvNNWCwnesoanQW5+R50Rl2dlJUmpgFWBByvbeMWgl4KSxKAXQyqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8Cm2P1K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8Cm2P1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757869003; x=1789405003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9Z8eWtMCA7pR/TCmnCAfrD3ofoZiYa+/C+cA9Rf+ZM=;
  b=D8Cm2P1K2XzMu2dMNKfO0sU+eMnaWOq3uDbl0TVklZINI+gf2hikpEjV
   x/fysCwKNt0gt0pmOKE6qI+dkwmYYQFaCHwOl7NbBRba31jje+H2Y2r2W
   ud0PkDB0F7nmILcF8UShzo/7Wylz3Sqk7JNW7mC0oTDXXBq1DCasvqQbF
   jg4Ys3O4y8dSdGlglCpgjugF0Yj1TnqTG7IwOu/T3FIjI7jKSeaTjRhRj
   H/q9N1g5HFbBbsh12HG6/MUGVVo+65rTIh5rL09Cg9cK8Pf+ILlNqAXA2
   lv8S2RWg9FzLUjTgJ9/6hiWuh1Bn5nIFzw3Hi0/Q4zk1EwQcPG0rCOYFy
   g==;
X-CSE-ConnectionGUID: cU37g0R6Ssy3OrfLMd6j7Q==
X-CSE-MsgGUID: KM/VA3KvSJmXQp0GSKe0gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="62765490"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="62765490"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 09:56:42 -0700
X-CSE-ConnectionGUID: dDEMLGHwRyq4etqT06DseQ==
X-CSE-MsgGUID: jmDV8IxjQ2KGf2lJ0cS2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174354956"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 14 Sep 2025 09:56:41 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxq1n-000000001rt-0YSh;
	Sun, 14 Sep 2025 16:56:39 +0000
Date: Sun, 14 Sep 2025 18:55:52 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb:
 scm-conf@100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
Message-ID: <202509141834.6dl5Dup0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8e86454f068ad3187350cd9fb81aca87249d02c1
commit: dba27d026fc841d28a0ed373f617cc84ec0e4504 [1/1] arm64: dts: ti: iot2050: Add overlays for M.2 used by firmware
config: arm64-randconfig-2051-20250906 (https://download.01.org/0day-ci/archive/20250914/202509141834.6dl5Dup0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ffbd6162103041697ce7387029f321d3a466ca34)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141834.6dl5Dup0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141834.6dl5Dup0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtb: scm-conf@100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtb: scm-conf@100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
