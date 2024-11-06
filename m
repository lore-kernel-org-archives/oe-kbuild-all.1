Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C62F44
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730870293; cv=none; b=PvkqX0GZ/Yl7oYS20kdziwDtnwBoa4TVp97vFBC9chSUkFt2KqFAHGVMCdqQlWGFGa0lWP+42WDKFogBbQa+VYgrT6T1lqB1Rv6x+pI0FUyr+ygnHznhhEkxcw/SR6Xoa0AhPN3App7SntkEzaqUJfnTJ9iMTsaPPuC+yNBOhJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730870293; c=relaxed/simple;
	bh=v1cydzowsjdeKKU/tP7PLz9dt0uKkqCgJJ8oXFoSW9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcX6tKaospS1XtsyAOtXAg1YuZ4d2iAqym7GYbCCsjHi0/dPoz9zgqTKeECkaiSW35lwQSUZQCWiQRwaMv6sZCUNCWtmWde8/EbNJNr3vmit5CC8qn6y6b6+M5FnLVdDL3UTgSjr32joBJzETGEfeuP5YXw+dFXNMrhLnpT4Yc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRVbwMdg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRVbwMdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730870291; x=1762406291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1cydzowsjdeKKU/tP7PLz9dt0uKkqCgJJ8oXFoSW9U=;
  b=GRVbwMdgecOQ3kuy0geJ7/5TxkaQk1y5ogfWIQ/AX57XkbnZCbi2JdUm
   QgfUGL2eLth3oHlJRXEZrIUwvXWv0s65KsrEPkZXvO8hpgX65Mnox8one
   xJ7W+RPo/lZEFbXLOpZ/JDC7Y5T5rRsPPEjQFKqdbarkS/vHxyvLrm8t4
   edtMOPeETkDiVXnfYPhHllm0wLoemcggscJSvrVwJ9kUCk7b1rPv6sHLc
   UcUWq4v2vJXjE3s0XXUWd/0dfE5U5jbWWhTIDX+EX2KHgDCHnBnw0lBcU
   3iyGKCn0Cay5o+JIDL1TQyLJxrwlij2gqQhjeYm+a26i3IHrUJ++LvLk8
   A==;
X-CSE-ConnectionGUID: mdr56WhWTHyVh/KbZfLLNg==
X-CSE-MsgGUID: eb3jyMOwRZG6OthzLX/Eog==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30079590"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30079590"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 21:18:10 -0800
X-CSE-ConnectionGUID: pVa5ifMLQ4WUmKMlSsmDrg==
X-CSE-MsgGUID: dJ8eu3IiQN2scm2ytYOAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89467667"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Nov 2024 21:18:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8YQg-000mxI-0g;
	Wed, 06 Nov 2024 05:18:06 +0000
Date: Wed, 6 Nov 2024 13:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 9/9] security.c:undefined reference to
 `__tracepoint_cros_security_socket_post_create_enter'
Message-ID: <202411061316.Uy82T25k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   a47abc59e9bca0bf07b465aa42be61338759c90b
commit: a47abc59e9bca0bf07b465aa42be61338759c90b [9/9] CHROMIUM: add cros_security_post_create_exit tp
config: arm64-randconfig-001-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061316.Uy82T25k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061316.Uy82T25k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061316.Uy82T25k-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: security/security.o: in function `security_socket_post_create':
>> security.c:(.text+0x9620): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
   aarch64-linux-ld: security/security.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__tracepoint_cros_security_socket_post_create_enter' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> security.c:(.text+0x9620): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: security.c:(.text+0x9624): undefined reference to `__tracepoint_cros_security_socket_post_create_enter'
>> aarch64-linux-ld: security.c:(.text+0x96e8): undefined reference to `__traceiter_cros_security_socket_post_create_enter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
