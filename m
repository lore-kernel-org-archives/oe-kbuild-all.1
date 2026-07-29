Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA1E3806B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 05:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785302094; cv=none; b=q0v9CFTUZWEs0FHAWoelSQftgQNSP41yLlrvp+OxJt51sOQaJLiqPi2oqhl5xaso8KPBnrTK8hYRCe67mJWtlQiAWNL1ZYi6qrg9Bfd1OKrAQEcD0skYwaY1U+FAPdNVECzCk93rcN62iYysWp75+mgkJIRbLznX/XoqvJ3wtmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785302094; c=relaxed/simple;
	bh=irgZ6NBdaHo1JirrIcXu5HDq/sXnNkXJNmg4veQFqQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qwrZKW7kVU1Zwe3qgKIAFT5GKNYwE2P2r8Dviem7uaEjCnm6IUSL3/tZ+45Sa5rxzd2emij+eXl861Z+4bMxCb8dwv6HwJQVb7dTnTWrfBf4xEMTwKKAP8uxdLBNpicyP8Eeg6cm6fVm7pWhn93T9lhWDAUG1Qg/WdZ6I/puu3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMadJsoR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMadJsoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785302092; x=1816838092;
  h=date:from:to:cc:subject:message-id;
  bh=irgZ6NBdaHo1JirrIcXu5HDq/sXnNkXJNmg4veQFqQo=;
  b=EMadJsoRIQu4RVzi+SHD4qs3mq+Zc9J3jZO0fyI2FuHO5OSSRnI/dJOR
   fNHitWC4DuYS7QIHtqv4dzgSd+OtKUCzpPjQwU+wq8UKrIBSYMKbwKKfp
   CVHqynJTitR7K7iER5jD83Wy94jB5XINaWA6dOgb1X1l8sLMZ2lD6JB+9
   mkeLqg7Ld5BHteKMK2a7MkVV+Typ9omQIpQfmVjc4doE+USCr/56rZVyR
   mOkvPjMM2rzKlDK66fc5SDVVaK4nE53zkCfZue5EvHMTj2i1QnvPvrYzx
   V1U6Jz6Pr1RKm8v5VhY3OlotAdmalLDX1QXD4khnCyFgDtHpc0ftTZgCv
   Q==;
X-CSE-ConnectionGUID: eMmMILjIToeh9iQ/rze2dg==
X-CSE-MsgGUID: YvegSHBFT4e0zm+tEW+x8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85914142"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85914142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 22:14:51 -0700
X-CSE-ConnectionGUID: vMMuAYRMRReDkQHyQanuqQ==
X-CSE-MsgGUID: WPPm3W97TdWML+XmzsFARA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="283241010"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 22:14:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wowcx-00000000f3Z-3PMk;
	Wed, 29 Jul 2026 05:14:47 +0000
Date: Wed, 29 Jul 2026 13:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <202607291326.Dr0maCyu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
commit: c33330b2ec170dd38b3284a72bc6a07a49cc9a65 [16/16] tracing: Use seq_buf for string concatenation
config: xtensa-randconfig-001-20260729 (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291326.Dr0maCyu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291326.Dr0maCyu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_printk_init_buffers.part.0+0xc8 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
