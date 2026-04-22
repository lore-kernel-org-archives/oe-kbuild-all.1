Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BCE2E62B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Apr 2026 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776878346; cv=none; b=jkmi0KMRtCLv6E8uW0rkVSHhPpiDmpKyYU1GJZZQqh0iitfrmT7iEa3lO9Tfhk6cjREFWi8MNjERw7b1b3z/C0JaA5zZMAldlNiB4VeTnf7DuRx3+f48jS1h/ZPq/fNulDfIgFgvIT6qCSgWfeZwep5J14W99En+nZbaR6CUpAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776878346; c=relaxed/simple;
	bh=Q3ezSSwyx6lhm8AfNaygnl25LKOjzsfoXpqFkpmYdCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lX2RdreuNNR/X21Ex/uJg0WP59UvEZKf0zOuYTOI7yjjS+R5TBhJfnoCUQFo+9j5jKTa74s8BwT0IArzV8IiM60kIDl0DGU20DXkeV5Ts0vhnSr9PDtjSVjItL+l4kzMQQlxwmOWkprsrRwXwRT3rCC7dSqDv4oanyMPU6Wx0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXOXsAXN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXOXsAXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776878344; x=1808414344;
  h=date:from:to:cc:subject:message-id;
  bh=Q3ezSSwyx6lhm8AfNaygnl25LKOjzsfoXpqFkpmYdCE=;
  b=FXOXsAXNYTC4mxBam4qRpygYcyMJ421YxUEPPjC4BRQ+n0xG23IosbR0
   kCPl58/H3xgVhksdI7n3AvChKzUB/JDHgQ2vkcUxgkZjbY3fcc8uamOTf
   Vw3NSB2Y6/unXSXTtzpK1wUJoXFpKZvg/GTXhcPTUqOehRw2KQnRY6/gf
   XMuTCGFUHE/hZnB3vgkZ3Tj2bncjJ1a0rDGRIB0QCen23euG5pRjmm9+p
   t+1dI/egpJsZqRdJ+wxNcynywh2ZdLhHKxLcc9qw3lmLUFbNMtsNe/fqO
   +FMfodSSQ4cco1rOeBT1nOWEVXEpE8heg55KlKdiXwHVqiYzxHKPW5hg6
   w==;
X-CSE-ConnectionGUID: Sr9xkYoGT1m29QDicu9McA==
X-CSE-MsgGUID: uZvQAylYT26zzRGZWd6I+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81701849"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81701849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 10:19:03 -0700
X-CSE-ConnectionGUID: 7hwOLTwISC6+z8MK1BWajg==
X-CSE-MsgGUID: d1nHjWkqRMCqDrQN1W8j/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231518748"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Apr 2026 10:19:03 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFbE3-000000000rD-2zCF;
	Wed, 22 Apr 2026 17:18:59 +0000
Date: Thu, 23 Apr 2026 01:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1] WARNING: modpost: EXPORT
 symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed,
 symbol will not be versioned.
Message-ID: <202604230140.jIhvc64Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiangxinpei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d847e03df243cdbc643c9f57cb5b0712286d5a39
commit: 5ce1842cd12dbf6fb8c0373e4b727073ef0d2e3b [0/1] ANDROID: GKI: net: add vendor hook for network quality estimation
config: x86_64-randconfig-072-20260422 (https://download.01.org/0day-ci/archive/20260423/202604230140.jIhvc64Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230140.jIhvc64Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230140.jIhvc64Y-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol will not be versioned.
Is "cpufreq_frequency_table_verify" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_rcv_saddr_equal" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_rcv_saddr_equal" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_sk_get_local_port_range" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_sk_get_local_port_range" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "inet_csk_get_port" [vmlinux] version generation failed, symbol will not be versioned.
Is "inet_csk_get_port" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
