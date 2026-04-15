Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DF1361DD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232721; cv=none; b=Kh283yTh+p89rrDphsV73sIjg2rFCJNtf3Otlj7iCXlPytCZIaXpEcIeg9y9jrgEABwnXZH0E95JoKu93JUpz/GrWb37zyzXEfZfeORQuHeWbQKJuGw0Rw/F8OVYlecXYIZ0kQBEW2yiDuoJTb7tv05qeZe4ISZn7YFSImqgNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232721; c=relaxed/simple;
	bh=5Xfkv410mO2U1sxteVfr4Ay99qT3H6ijB7GRszf2Oxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kf13udUXPduR+0ueei6KSHoy/gXM58KgTdg4WO1TgSrbk0JxYWJEPFSNBbxheFoDgABF1gAiETz+uCsHGvSMFqyC34x2PB8haM5Gf8EWp3ZO6k9DHc2m0qgnrQUBXvm2nYD9/7RNK6O6Z6yB37L6L2qq0haAkj8/2Z0KLPbNYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmNof2GN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmNof2GN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776232720; x=1807768720;
  h=date:from:to:cc:subject:message-id;
  bh=5Xfkv410mO2U1sxteVfr4Ay99qT3H6ijB7GRszf2Oxg=;
  b=nmNof2GNJFpenUnL0fbsfaL/f1uBg+dHqKoCq175RRQ3CGUqfhAMVIaq
   JvzY3i0avBdTBSLSHu7Z6vPeqc34jrZjsIcugSR5DI9DO3mrUzxa9h96u
   mUmqHmuINDGpFnBa1hDqxjMramJG1Z+k1YrfPG8fyPYwOkFnv9rDLksBD
   QhzJt/6WiuadZVvTvPSRGkrp0XcWFLNmzz1+hhXs1mxLn12tFPU1lhhnR
   htL3voMt7BdGq4bZcimbVBsI3XAzDQW6Adg+FrKXbteIiN7Nc7Ok8EtH/
   /rih+J5GjjFSeFQAcUyxKSHKv8CeR3N8QMpaPQX2OmAV5jJH1llC8Z0L3
   Q==;
X-CSE-ConnectionGUID: wRO7DrPaRIq/Q++Tiwil1A==
X-CSE-MsgGUID: 3YNrS3OVRi6gBCHZrBmi2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94601745"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94601745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 22:58:39 -0700
X-CSE-ConnectionGUID: d/gGnz/bQQSO16ssvuWG+A==
X-CSE-MsgGUID: oJODoDaTRuOdNynSzcBvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234341703"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Apr 2026 22:58:38 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCtGm-000000000Bd-0DUY;
	Wed, 15 Apr 2026 05:58:36 +0000
Date: Wed, 15 Apr 2026 13:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 72/73] /tmp/ccfdZtpx.s:25: Error:
 invalid operands (*ABS* and *UND* sections) for `|'
Message-ID: <202604151333.dhGwGGCx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   7815cf2d85bdc74581749a4c7b2ef1a639ba07fe
commit: e452086291368868913da98b03d32bbe2b4c872f [72/73] fuse: add kfuncs for iomap bpf programs to manage the cache
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260415/202604151333.dhGwGGCx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151333.dhGwGGCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151333.dhGwGGCx-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccfdZtpx.s: Assembler messages:
>> /tmp/ccfdZtpx.s:25: Error: invalid operands (*ABS* and *UND* sections) for `|'
   /tmp/ccfdZtpx.s:34: Error: invalid operands (*ABS* and *UND* sections) for `|'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
