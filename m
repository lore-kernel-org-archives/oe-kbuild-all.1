Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7441A2DECBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662215; cv=none; b=UOSnBnaH9UxdOMUCe9hQCxwf/jBjmwo788eBVedsXosuzSYQdjZ4cJJ/rRS2lQBSiUP17U5sHGHHfhUP1xvVL19Hc/updvX31wy7n8LJ/tOSSIR1Up2n/FO6qx/oGMmX5M+GnyOWggVDWxuC7jbRY4cCVCUgblsDo7wtBtri2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662215; c=relaxed/simple;
	bh=tPzvnVvTqLcaA0nX6ACZI/fb4wr4cawU2Qmm4t+yl2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uthb1jdKlCh2c2B9jigbi5ZyFI0LBcQAKHuLW9UQgWMhg8egIaFgkiCI4vuASTPFMKiR5OjXit6c9z7hxOC8KLr8PkDjn96hj/Lue5CbAXg0+AJUPMFOwTseuUXt2LkPaGAbA1tkrczJf0HiQNvgbR3l4h7Q9wxOtdkUxLhPTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lg9pRCAU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lg9pRCAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758662213; x=1790198213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tPzvnVvTqLcaA0nX6ACZI/fb4wr4cawU2Qmm4t+yl2A=;
  b=Lg9pRCAUfW1gS06b2oauMTmb/9shuvYYC1NU8hNcwp40zb85B6fqkrCZ
   qpPhTZfRXad3L9WaG+uMyyoJqlA1vM4BOfCK8SUXHpH70V1AJy0TZSSOW
   Qvzq+b4Nbjz0+ajC5l8EyCsQZu6lOCA8w0egdTESAMUdjVSfi6g9SL+Q4
   AkHaNwjNif3JdaBZHa3KnvEPJ32o5fR2q0F6khMMVo+13eNk9pTigPdce
   Tp/lz/pK63bSpt1F7a5nsh43OPt8+f+tbuMN2WkF6TLwGp0teG672Y4Hc
   yS/pnkz9XGS2m6Ezw0akYV4KY6f91jnVnbemhe4jd/t+/B1ACX59SGeQO
   A==;
X-CSE-ConnectionGUID: tGGfvkoxRmOgYVE4PlTlXg==
X-CSE-MsgGUID: nEPxNd/kRpm8JNFqvPISMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71197718"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="71197718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 14:16:53 -0700
X-CSE-ConnectionGUID: 3Hv+FYIpSgeVN4Q7aJteqQ==
X-CSE-MsgGUID: M6ZFcTw4RL6FZMAu7zApMg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2025 14:16:52 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ANW-0003Yb-07;
	Tue, 23 Sep 2025 21:16:50 +0000
Date: Wed, 24 Sep 2025 05:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] ld.lld: error:
 arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x1c): program
 property is too short
Message-ID: <202509240500.dMArWrVM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: cbf2b29dce6b67e63fe3426481c0a83d6136f20b [1/1] kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250924/202509240500.dMArWrVM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240500.dMArWrVM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240500.dMArWrVM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x1c): program property is too short
>> ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x1c): program property is too short
>> ld.lld: error: arch/x86/entry/vdso/vdso-note-x32.o:(.note.gnu.property+0x1c): program property is too short
>> llvm-objdump: error: 'arch/x86/entry/vdso/vdsox32.so.dbg': No such file or directory
--
>> llvm-objcopy: error: 'arch/x86/entry/vdso/vdsox32.so.dbg': No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
