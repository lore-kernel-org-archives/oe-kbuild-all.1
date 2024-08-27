Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2717BEA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744707; cv=none; b=V/AY806Bshk/VwMWRU0fv5giWyfMgW56UD8+M6ABZm27wEL0KzGoG+MkipqvabGfAgqFNUHfEP1mTRp802mRoLK/DHh31S2nyOjM/6bd+wYvdSpQQdMlHD2cS4rBcRC8fLGLSchk8T1uRGlhT+cwLpuB0XR17ruceEcviFuR3fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744707; c=relaxed/simple;
	bh=MDU/96oRT+l32bSf/jk34uxuCawvJib6q3srLkuEFwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDhXn8FIedMi++TBcrvroeuh6djyzQUQn2P/GqZJAqkTgE3grjGimVH1CMcYR0MfTWCgDQ1SJVDaC/okzY8+0PHnwLKXwua8IEuIKxXFuxDKVzU5ozqYfMvQCGXmeSl6lE8JI80+ZDP3Oz6S1onwenLsV6BIPmF7hxXycFw6/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAOZ/rJc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAOZ/rJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724744705; x=1756280705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDU/96oRT+l32bSf/jk34uxuCawvJib6q3srLkuEFwA=;
  b=EAOZ/rJcBdThQoGygMP3F//8MY2ekwJnCV0Fp5dC4ePUrV+ycjw9eqbu
   +9kJBe413vWkL8t+pBB80G9LLBpOu+f+fUrliQwjOoESl2egCCbXGvhPs
   l/vKFgi3q9phWvz/lG6ywTh0Um0JRsorszecaf/1uq2n5grGsGs1lfNOr
   +6cJKXEkbPHOFUSecr1XNGwhCZg6D4BPRyJTLsgjteTEGK9Z0wZZwWgbr
   xxWuOLB0N/3r2A3ubKkto/cameVHiqHB6CKMhYA4YptJQcVdhOd/hfo/Z
   m/MazP6yTKWWQcfdYn1jFCE2A9sk+DxJQ7sdpeXreFXHYaRtBiiM8cDj9
   A==;
X-CSE-ConnectionGUID: 93tKt0tSRRenA1W0BRdjvw==
X-CSE-MsgGUID: YnpPEDp8SoyXU4vEKaJQXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22796223"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22796223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:45:04 -0700
X-CSE-ConnectionGUID: +GJSpEgPQ/q/VYzDcLGCxg==
X-CSE-MsgGUID: aoloTQgCSoespUeCLk+mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="62453891"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2024 00:45:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siqsv-000IGZ-1G;
	Tue, 27 Aug 2024 07:45:01 +0000
Date: Tue, 27 Aug 2024 15:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 12062/23560]
 drivers/tty/serial/.tmp_qcom_geni_serial.o: warning: objtool:
 qcom_geni_serial_isr()+0x6c8: unreachable instruction
Message-ID: <202408271554.zPOb5Yqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4ac8b0d82ef645e01323a31304f6455504295672
commit: c33757a1508dbe0d07881dbe5d82c59dcc6f28ac [12062/23560] tty: serial: qcom_geni_serial: Fix softlock
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240827/202408271554.zPOb5Yqp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271554.zPOb5Yqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271554.zPOb5Yqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/.tmp_qcom_geni_serial.o: warning: objtool: qcom_geni_serial_isr()+0x6c8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
