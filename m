Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD917C211
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204415; cv=none; b=QXHFrijDMvLFmyhYRkpeYUEoMGGHj8fAfMVVrevhXbrmY5VkxsMtWrf5HldPahYycD0pI3hJU7H3mPT2+OkHxxsJOMLXNK5thk7CpGl56itcp3+AMhWS63FSui67lSVBzn//u9fTvUx+9oAQhEZ1s9XWosdoA3e5NN+uJsd1IwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204415; c=relaxed/simple;
	bh=AZFKxaJqdsS+AmWYNs0qiUGTF9HMXs9RKO6/CH4bxYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ju1wh+47l9rr7TYdZMhqtb38+ZcrINg01C4AX0n1illULRws3CMisxsAq1/+OEkVDrI7CD2NH/BJHor6cPpZOCP6Jmv3KcOwWzlQH7LUhvL9m856w4ljje1/ZF4zg4teLQO0CJPyZMo2+dsRMQePBcLEjcShuYv87Nd0zfT6uzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S52UmCPx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S52UmCPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777204413; x=1808740413;
  h=date:from:to:cc:subject:message-id;
  bh=AZFKxaJqdsS+AmWYNs0qiUGTF9HMXs9RKO6/CH4bxYY=;
  b=S52UmCPxY/bi3m2fr5bXzcQFENtjLDucZlgM1/SAH2elEFHqcjvrdUVo
   3E+LSZfUVV31Ohr5FhPCYd0ZuePJMVAWhnfK+E5GwKdneCuD/DkW8xguO
   kj1Mylm3f6NrzIB268FgdPFuPSxTuMEpoEhh56cyJ5a4xZdSVDzGlrf5r
   pgF3O0si7jOpHJm4YpwpHYbOyX+4Mzh3WQQ4tnhNwQLxK02fHd6u8uGu0
   ZE4L2XRC35bapYxhxnndKIxUK7V0F0k3ZF2cDFeD22nMrUemdmO/ipSCC
   kKjleh3MxIcD2A+OoJz7G7xt8D43sAH7enpcrtm2pFLW2uEOFfEtGujTF
   w==;
X-CSE-ConnectionGUID: a1GU1WAMTb6lCbexkLy6PQ==
X-CSE-MsgGUID: R30wv7iASu2XQt5akuwwug==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="80695485"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="80695485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 04:53:32 -0700
X-CSE-ConnectionGUID: 69ipU6raRK2ydbSRZVV/Wg==
X-CSE-MsgGUID: gaeUvAV3SZC89VLIHtibSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="271515861"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2026 04:53:31 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGy3E-000000007qv-1hzq;
	Sun, 26 Apr 2026 11:53:28 +0000
Date: Sun, 26 Apr 2026 19:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] vmlinux.o: warning:
 objtool: x32_sys_call+0x19cd: __x64_sys_exit_group() is missing a __noreturn
 annotation
Message-ID: <202604261908.IKGgwPkD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   27ed6947ea3491af6f95acb920bac1d1d7dcf8e6
commit: 7de61eceed0333ff197dd5dbda2e9648c62b6556 [1/1] BACKPORT: mseal: wire up mseal syscall
config: x86_64-randconfig-161-20260426 (https://download.01.org/0day-ci/archive/20260426/202604261908.IKGgwPkD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261908.IKGgwPkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261908.IKGgwPkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: x64_sys_call+0xb3a: __x64_sys_exit_group() is missing a __noreturn annotation
   vmlinux.o: warning: objtool: ia32_sys_call+0x15c8: __ia32_sys_exit_group() is missing a __noreturn annotation
>> vmlinux.o: warning: objtool: x32_sys_call+0x19cd: __x64_sys_exit_group() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
