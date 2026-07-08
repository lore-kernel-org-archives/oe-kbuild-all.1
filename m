Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03B3C7E16
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542933; cv=none; b=kknXhX9w2bgq/c46msynu0qRtltDmDxXeO0qV2DTmtC3EYdaP9DOS/zdkgO4upQ3LqNKZvE3n60E6JZX90TGuqNOO4i7Kathch09a0eFRHTCTeaNOvCq1dUEfpIOiFnd4nptugJG79AQ5RznkWPu5Wys6tm0PvbqwfCAQABwz8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542933; c=relaxed/simple;
	bh=9ELjpxVoUiqj0QzwkaA9ZJ2nHLiqsG2068N5g1fxSlo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D9PUsOvJ/n6D3o6qtgf/3GR2UmpAFVgiYW5AXDX1V+nw1r/umlaU4+QLonihHcM8puvZyDo1wOSx/2tyj8R/wZ+5Nqm0y2yAGxVHFtuTQiQWLV8QbNIiSiI8MDABAyAOQd5z4VfOB/0eLIhC2kTuDn3PauzCMLoKHOthPJW/1/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAl7pnWt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAl7pnWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783542931; x=1815078931;
  h=date:from:to:cc:subject:message-id;
  bh=9ELjpxVoUiqj0QzwkaA9ZJ2nHLiqsG2068N5g1fxSlo=;
  b=HAl7pnWt+tA/ezSJ0KBsEOplhqN7sIJ+vYoHS4mnnTjN4vJ+DviiGzaP
   +9S8u+2AwzCsLmlLuaGd29OYi1J4g/lpqpLrp94/I8gpjLBjtnGfsUIyK
   E3Gxhe2l1ovPJE1BT27dw3ki/LiUPeF5LQpC+r45gOeEu/T5TIM0owbM8
   z4KVdR8PM6VeR357/W/E1CS8Pt4K2n9gaI4bGJ2FIt6fawBIonT6n7OOo
   IqbWJVZA4AQNP/PQXPinIu1Vha8mIjFeK2/82+GKwg/Z2dWoV30Y/VeAE
   rq8DiIAhkcn+gsXbmmSvKgIeAx1yNp6FYeW9j5YBSDClwfAIOJbfKYF6o
   A==;
X-CSE-ConnectionGUID: U2VHNy++QkqTCsvVJl6LnA==
X-CSE-MsgGUID: 4RDp9lnMS1GkXkpEt+jdHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101762725"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101762725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 13:35:30 -0700
X-CSE-ConnectionGUID: N+VsWbAOSoa7z3XZAEaEQA==
X-CSE-MsgGUID: PLDAdZWgT+iF9EGx23qYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="248022201"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2026 13:35:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whYzO-00000000GqN-38R6;
	Wed, 08 Jul 2026 20:35:26 +0000
Date: Thu, 09 Jul 2026 04:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:pr/192 6/6]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202607090440.G7yPrkn9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 pr/192
head:   442be472436b2a1112b636884afd0423584c868a
commit: 1d9dbb2eecb17ba3314f51ae6d776495161d6db7 [6/6] firmware: add aeonsemi firmware
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607090440.G7yPrkn9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090440.G7yPrkn9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090440.G7yPrkn9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
