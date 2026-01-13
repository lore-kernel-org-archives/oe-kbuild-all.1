Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF8838FF10
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 15:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317022; cv=none; b=C4Zq0o4iYAvcn0GLeB6V7zO/s/Jpv+URcUBoZQBydaUbdoD5qjTBs00lnXNxHlNM7rEtlwTHEz9YO9CWbghpJhEaK0NniINGHYq0qh44Igsjho8VSuW1CV/O1++Xivi21zUlhqDSWlgqbHPf9jOvMwxW8Ywd/ZwcXYXtT9kOxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317022; c=relaxed/simple;
	bh=NLXcm5I4NjjQi0O/M74+GeG/HNzBOb2v8HFyIPTNuWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PSSMRl5YnCHturIpT5IaRsTJhmMUJSLQVwPZrodFs73E15A2vjm8fX0kh8HIT4usNk7KQO+yFeY2+gPHS9AtcnIlINJ08Suzeu0Peycl37cgCaVsUrIp8x9nxjvyTLKby7id/C2TPGN/3YvydGMdAEURQzAOfEGQCTPFoV1YZnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIu5PRvi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIu5PRvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768317020; x=1799853020;
  h=date:from:to:cc:subject:message-id;
  bh=NLXcm5I4NjjQi0O/M74+GeG/HNzBOb2v8HFyIPTNuWA=;
  b=QIu5PRviJVUpqWJnkcdgxV3DptCOhBP9dN/oBuBDePMj6+2G1cNgMlSb
   MLRDzSyDjLQjprPLn4+L+8nwu/3PfdtuNfcX/Hmq11OXWFcGqnGxKmtOf
   LyqcYjZqfQtE7LyJP++CSqWzF1bsodl99SkxsG0vEG27qN1zAEDQkIB2B
   yq29e4C0pJg03fQCOADOvO+sfnOvRQLs3kIcs0P2sVmO9lC8XvcypAFB4
   RByD+507btKZQVOckPqNej22U7Fs2KlNEQjjnK9ezdth98OUWNdEAjaIo
   77rsI6atpMbB3BGLjAACsPJQe+hsMq67sxOzudFHjIdqBa/CA269PTYzl
   Q==;
X-CSE-ConnectionGUID: kp/Kf8V/QqSVIuQ6tt40DA==
X-CSE-MsgGUID: XYJ7886ZRN6SyYbIsbH+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73445586"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73445586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:10:20 -0800
X-CSE-ConnectionGUID: mKXzRCeGR8a/ipOgaO91eQ==
X-CSE-MsgGUID: BIy2uk6uQmikcsWS8SJuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209243673"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 07:10:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfg2B-00000000Eyg-2wa3;
	Tue, 13 Jan 2026 15:10:15 +0000
Date: Tue, 13 Jan 2026 23:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Subject: hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x403c0): cannot
 reach 00002bd8_ftrace_likely_update+0, recompile with -ffunction-sections
Message-ID: <202601132218.kovhMNap-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 05290bd5c6236b8ad659157edb36bd2d38f46d3e xfs: allow inode-based btrees to reserve space in the data device
date:   1 year, 1 month ago
config: parisc-randconfig-r071-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132218.kovhMNap-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132218.kovhMNap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132218.kovhMNap-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x403c0): cannot reach 00002bd8_ftrace_likely_update+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x403c0): cannot handle R_PARISC_PCREL17F for ftrace_likely_update
   hppa-linux-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
