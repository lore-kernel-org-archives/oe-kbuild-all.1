Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6B1862A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756564690; cv=none; b=j+nEgNJvhIoJTGlkhmjzPELNlyqnKbAXsJNA9Nk0qcquiffWQ8SjXQ8HoTcjLJB9oIsILZwOakmf0UnYtjhakZAUcX0bLIdoCWmKBGz8rxZQNHxrCxslUjohfeuHQH2rTn5IAB1YTNABO4zDNFWDPzxdV2wRW3tyXh4VXu5kBZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756564690; c=relaxed/simple;
	bh=DfBP7x4zBAUf8TLsqYzokBmwn0VYfE8WM3X8h8Snkc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaP5pk0YlVcnhGiw1FK/ZDf7DH8LeYulfypu93YTbLkLtg1KUhV17XXm6+lrzWufmffXVDijP8MShYye2To5oT6Ub/nJlUlN4yHorAAX5ZveSfKk482KO2ws108x9mWS1plTfGp2PcqNq96r2fZoSi1+yqA6Xj1Lv1HU+z4LJKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqO8vwar; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqO8vwar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756564688; x=1788100688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DfBP7x4zBAUf8TLsqYzokBmwn0VYfE8WM3X8h8Snkc8=;
  b=YqO8vwarrqdpB/b54AGi8S8+51Iigvnj/cZwFrfdFCBf+pBiy659kgW3
   fmdpsDwoMhL9tXXLr1hw4moqOaCiFwmE65yEJ/NPzDXHW5hRWyX+klfel
   VKAmgM6h1kP3akDBqD+dbmIrFApGI//kX4+f+9djGZ5xKzqV0PVHv+e9A
   U7A6FvKttmwES2HrE+6Hn4XYjK2H+91LOzp56o29SE42p9vl3VVG1GAsZ
   36t5esuBY4WBI90WDQUupafZ8uFIo1PWObmPOdd1JKJqKQdmdfLS9g48S
   1D6uJDsjjXmX/ugGRleCV2Ek2XDNjXvqO9ZcBVFwMJVBdFXQARKHViyw5
   Q==;
X-CSE-ConnectionGUID: TAOSyTGVTK+HUGOipc9Lyg==
X-CSE-MsgGUID: EasVATOeQL29+o5+t8DHzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58762415"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58762415"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 07:38:08 -0700
X-CSE-ConnectionGUID: FYd/6qquSwa80/IT5v5Gxg==
X-CSE-MsgGUID: ook83+C+SHSUsmzlhVWefQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201504175"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Aug 2025 07:38:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usMi3-000VRD-04;
	Sat, 30 Aug 2025 14:37:58 +0000
Date: Sat, 30 Aug 2025 22:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/sframe-test 1/14] vmlinux.o: warning: objtool:
 fred_int80_emulation+0x242: call to __kcsan_check_access() leaves
 .noinstr.text section
Message-ID: <202508302221.f36mV1Wv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/sframe-test
head:   d6d0be1c9daa56454204449f43054df8337cc7fe
commit: 9ac3dc495a43f5fe6c0c4557d80ecd11d6cf3351 [1/14] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-072-20250830 (https://download.01.org/0day-ci/archive/20250830/202508302221.f36mV1Wv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508302221.f36mV1Wv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508302221.f36mV1Wv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64+0x27a: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32+0x1c3: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x2b8: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: fred_int80_emulation+0x242: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0x160: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
