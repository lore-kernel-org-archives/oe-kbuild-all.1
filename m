Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8139D358367
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237790; cv=none; b=P0L9KdPZKCCXjK76P6nTbVlkbgX/096keMT5OlzspFzTsHL013xkM1VJmmx5O/MlGeforkvmPwZHTyriJJDi7MyXTbWsa896B1G8EdlNwVQm54YgKlS4+KDCFDxDyrkNhDVRSzh72hx+D9X9rxX9LUzn3wDZ96jabsApNm4YIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237790; c=relaxed/simple;
	bh=6LIjJtN39iqnvlM8uOpS906TeLFtaC94PWR9ENp3ycg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bg0Dh+1gYtQiET4tcMVTXXUxOfYrJzgu3+5MXlpeFJ9Wt1EBg35ZsaLRnl+nLk4NlsIz1Bv8DNbebFGzyt9kv8Ii6Zn7KJrhgbJffvmVonjPm9oOQtSpt1vAuWcP5g7vw/DReNBUqGbFQLu84IhGpzzEtMDwcXuwRK1Rv8r5N+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhlPOIpy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhlPOIpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792237787; x=1823773787;
  h=date:from:to:cc:subject:message-id;
  bh=6LIjJtN39iqnvlM8uOpS906TeLFtaC94PWR9ENp3ycg=;
  b=jhlPOIpysr111LlFt94xUNR6U0qnlzQE3U3+tsf5+NxyFDLmiSuS1FuM
   0Y8lu93BOINyC/VYc/wwg12moYI+RwKqymQ3+Pct1ZikP3ghtaFebzY1Z
   zhyOpYbrE56nEcO2DinVVx74WmY9L53mib7/aHxFKVNgyBJvT6ufAXTQt
   xQ1cYGrep1vj1N+auJPF0JCjaMjkFJi7aqAD6BI8bAZQx46bq1DD+nT9W
   YsbL+b4D3Zm37VEzLsQjsgM9XM16rCo6c+RfwKmPqmBDj8yrGd3Kc/Byk
   eebWfkw14x+ssxe8k5QU7aImkHSGfPNwpfOLJEdeudLPGMpCEq/kypaYA
   A==;
X-CSE-ConnectionGUID: PsbOVZiuTKSdLiWRoF9r0A==
X-CSE-MsgGUID: Tl/x1iyUR8CAewj0gPBTYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="882113"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="882113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 04:49:47 -0700
X-CSE-ConnectionGUID: p5CVfPKuQhWXuZMXeKTZEg==
X-CSE-MsgGUID: F+bSeLCJRzWPHLLBMq+w1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2032301"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Oct 2026 04:49:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI2v0-00000000JL8-3AFJ;
	Sat, 17 Oct 2026 11:49:42 +0000
Date: Sat, 17 Oct 2026 19:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: {standard input}:2398: Error: Insn jl has an instruction
 mpyuw with limm in its delay slot.
Message-ID: <202610171948.RUPBcdLs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vivek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90201351a862182bdabfc1ad1c97b1e1b6ed5931
commit: 6c2fd7a71e7ab490a0a9d591486d923712012f59 firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
date:   10 months ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20261017/202610171948.RUPBcdLs-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171948.RUPBcdLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6c2fd7a71e7a ("firmware: arm_scmi: Increase performance MAX_OPPS limit to 64")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171948.RUPBcdLs-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:2398: Error: Insn jl has an instruction mpyuw with limm in its delay slot.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
