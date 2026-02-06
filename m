Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98393033F0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770413180; cv=none; b=pDu2AhBzjvH5iGNpjnYKpcNqmAACb/sxEIUrLQ52Q/LnQcmLMfzmwJ9jfWfPB5FNKR8oB5STQfZUPg/HTGvUPWwTs829DYGLX3Ys0kZa6pRm2mGNVop0M4my6reWRnLiRnFfkGL6Yz+2VH70biVEb+aWQ4LWJL2OXodMRZS7U10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770413180; c=relaxed/simple;
	bh=sLbeD1kyI/ryGunEo8JEo86ikYQPWeG4WKiDQEZF0h0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdcoPhKCkRNlLZ/p5NErg7sKyYtfcXyHBqniGgwcd+3UUdB+V8GLC/peFVzgAirzxf3J1+wZeVRxi0GCVKklS9Kro1OdvYNZsMksUSUliAPTthrfZMXIhbnvpr4fAZpdB88dKXm4YFUDIOBejV9UwJ391t3kCrekZXPdxi5Pcsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YisZ9O2R; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YisZ9O2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770413180; x=1801949180;
  h=date:from:to:cc:subject:message-id;
  bh=sLbeD1kyI/ryGunEo8JEo86ikYQPWeG4WKiDQEZF0h0=;
  b=YisZ9O2Rusw1j99s8iHhJnZqV9juJNXH45IKDaUuBfUSC8pqgDYreX00
   fJmmtNZjVeS1W5TQw32c5VY0MwMac3jiuGwbCkgZTodWlYmbvcClGC8VU
   2UtizAaLZ8Ahx5Q6hed7KAp8YJHpdRLY0yp3XGw/OPW/+KJgixMVV3nci
   niasYAqy6mNIgCWLmEEv8BW0aufsqPjR1ZnNJsffGPrLpEvtU7RRKBe3Q
   aCRZxvuUX3itg1E2Vm9779jFMY9HctwErKvsxkxe1qbSbCO1IP01EmHuH
   ZvS6QjpPwWZhCYwEpN5Az7T46Os/ZJsz6+c4iIbTfXYiWQhwN0PIO0om7
   Q==;
X-CSE-ConnectionGUID: XuAqzblfS8exf7CcoxMBBg==
X-CSE-MsgGUID: JDXmzMcdQgSS3FILKQcnAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71690736"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71690736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:26:19 -0800
X-CSE-ConnectionGUID: 7xWP51OfTzSrLBenAEBbEA==
X-CSE-MsgGUID: x/IB6uPgSPWdGJr4sbf4Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215470975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 13:26:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTLE-00000000lAk-0AoD;
	Fri, 06 Feb 2026 21:26:16 +0000
Date: Sat, 07 Feb 2026 05:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:scrub-syzbot-fixes 28/33] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x3ffb8): cannot reach
 0000baa1_trace_event_printf+0, recompile with -ffunction-sections
Message-ID: <202602070513.2cDLHGd2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes
head:   718505fe1299a76dc1ea54ac1e6acd5a379c5829
commit: eac8fb2c929c7c71fc5f2f21e42de40e266bfacc [28/33] xfs: add a method to replace shortform attrs
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602070513.2cDLHGd2-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070513.2cDLHGd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070513.2cDLHGd2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffb8): cannot reach 0000baa1_trace_event_printf+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x3ffb8): cannot handle R_PARISC_PCREL17F for trace_event_printf
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
