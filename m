Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564B30DECE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778019248; cv=none; b=EmCaj/OhKk4kC3ssxspXD6ul7R+XQHgyTSB6fVCaIDgTZCSy0s0HIU2SjRZWAPgM9c6jvbsIPewkJOMmTc2VsWxYMz5BYr8g9oEi9WR4hFKTwOseZIAGq6M5WR7Lsr+5kfUNiKOC2d51BFWxCgEm18bF1gBHXp3BsxOWEBQ5beY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778019248; c=relaxed/simple;
	bh=+fN0bm6xit/CduQs2BnB59Dl5RjZ8NragIZT8XnJlzI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EwfZVilr5IO/xCLCIQ0vYCCaNX+6SayCew8089fbCM+bFKR+qoYeuQB1RMma6gpvaOBFDt3Ql2pl8ZJhcSDnxhzGjBhF1U4cZJsWKTh4Gs0kSymb2C/EwChUTS1uwKBRSkLVUwiv50LdJ8uZ4NFeKgHxJXbo/O1IfleE+sJZWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkJphh5L; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkJphh5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778019246; x=1809555246;
  h=date:from:to:cc:subject:message-id;
  bh=+fN0bm6xit/CduQs2BnB59Dl5RjZ8NragIZT8XnJlzI=;
  b=FkJphh5LT2o6mFTHPxhgsXRx2nCKWsPkZ0JrWp/ZODbUt0tjoZNsTtDM
   xEO94+Uv2/AB5Or3SLs3yTDb0FDukXz1Gf1NZC1X5f7Vs4Bdj0gURrlPc
   H+iJr2tntVgnIj3Cz4F5xrDYhEynMtGgvxu7safrxPVDFQe28vT1RS44+
   dvWAdVO5/ohD5zr3GMlr2Cd0XKp/nnrWrofBxnEQt3XGupNns52x7T5mV
   ZXBHSQxmgthCQTZ2nJBGFlexSAdl/reAcl4sPKHOFVQ42TVTtwJdXbwkR
   3yD6H3rjUcopUT3nVkydq+MxXz7Qp6bm9C6TwnmMBgih4izzoDWQcwKGt
   g==;
X-CSE-ConnectionGUID: FilvgytzT86xr5r+MVS3Xg==
X-CSE-MsgGUID: 70PWlRcGQAOE9vqQj+PG/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66432412"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="66432412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 15:14:05 -0700
X-CSE-ConnectionGUID: wx/UlzNmTh+6glyeatLopQ==
X-CSE-MsgGUID: Acn4a4VTTwSWGEqG1mJRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="236184179"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 15:14:05 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKO1h-000000000UZ-3Sf0;
	Tue, 05 May 2026 22:14:01 +0000
Date: Wed, 06 May 2026 06:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring-7.0 6/11] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x40088): cannot reach
 00005d2c_trace_event_buffer_reserve+0, recompile with -ffunction-sections
Message-ID: <202605060601.QNwcT5sx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring-7.0
head:   b8accfd65d31f25b9df15ec2419179b6fa0b21d5
commit: 74c4795e50f816dbf5cf094691fc4f95bbc729ad [6/11] xfs: convey filesystem shutdown events to the health monitor
config: parisc-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260506/202605060601.QNwcT5sx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060601.QNwcT5sx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060601.QNwcT5sx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x40088): cannot reach 00005d2c_trace_event_buffer_reserve+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x40088): cannot handle R_PARISC_PCREL17F for trace_event_buffer_reserve
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
