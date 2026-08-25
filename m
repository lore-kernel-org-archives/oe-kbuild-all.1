Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E153B42C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787686570; cv=none; b=WPySQzkHHAt4atpHemOI6c+gHLZTfvuknlJ+duzeCDNpqtihBPRPK3siWbi+XyaosXhxIrMs8sr4ezR+Kc62a9rFxmsatqg1ZiOF1heTeswvf0tKBa3DCch3v3dUE64VCcDQFXBcbXSK2UZa1A16WJbGVQ1stisy84pWxp+ortk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787686570; c=relaxed/simple;
	bh=71VXExIsXk740RHMxuBUvS8QebKzmRSk6kAv2CYPzXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tx7ssMUim6c0ZY8J245GhhtHwxLJ9ZCx+aRRceL+A3V/9ZQ6q0vYPGq4k2JZ1bFqofskBxBM2fDa8e4wwzJVCOtK2NDMqsr/rclZ3Kz8EoqgWsBnXLMLt+XMigUJ/pxLGDsAlJlqz6c5yIIWlUAQSJYJZSVhkQDiKixoj9zR7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gzc7q7Nf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gzc7q7Nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787686568; x=1819222568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71VXExIsXk740RHMxuBUvS8QebKzmRSk6kAv2CYPzXg=;
  b=Gzc7q7NfBVXjEDjn6lB0mDB9dq+No7GmAZLcmG/p4LiuQGQehucl0Rb7
   0pqEQCA+hNX9IHIvwNwRkMXVDHK9zfnMzQKJk29Mq07yvZjiTLvGBTXzG
   rQuyxUpcpowrbEQ6MhdVxaWU85sVbvJiFGDocZBPFLgAi1mN+GP+HXfZg
   QiB18yW1iPZmO1hL0ST3fB17ttr7AmBn6BhwSdL16HQxR+ckEC3UAzQaE
   vPnaqSa6rgML/d6SLBu9FvbCfBQPLujyuHsBemsd1X2jnUsYPyNhK4BeO
   rE2MSFwCX14F3hRekASTdEq2MSAywlOaxrG4un14zzX/0C+wNcpgAK1rv
   A==;
X-CSE-ConnectionGUID: DhQAcCyyQAOkOtWVzvfxQg==
X-CSE-MsgGUID: HmkkwzxtQ22YVFGLo1O59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="90676125"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="90676125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 12:36:07 -0700
X-CSE-ConnectionGUID: 3Ckz72f3QySZv6Ul1ZG7Ig==
X-CSE-MsgGUID: DFhvNT/VTeavvD9P0seT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="266073606"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2026 12:36:07 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wywwG-000000000BF-0eyD;
	Tue, 25 Aug 2026 19:36:04 +0000
Date: Tue, 25 Aug 2026 21:35:33 +0200
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Himanshu-Chauhan/riscv-Add-breakpoint-and-w?=
 =?us-ascii?Q?atchpoint-test-for-riscv/20260811-110610?= 3/5] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202608252120.bPpuU0tm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Himanshu-Chauhan/riscv-Add-breakpoint-and-watchpoint-test-for-riscv/20260811-110610
head:   575d0121c61fe28be5c9c7481961939d2ea32f43
commit: c8108faba5ff559573014eab2665149b122f2b8b [3/5] riscv: ptrace support for hardware break/watchpoints
reproduce: (https://download.01.org/0day-ci/archive/20260825/202608252120.bPpuU0tm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#161: FILE: arch/riscv/include/uapi/asm/ptrace.h:178:
+ * bit[XLEN-1:17]  Reserved
+*/

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
