Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB1B18A6AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735627505; cv=none; b=lcVIFAw05wXzuI+Ri4bXa/ups4GDxhIe1ViHOctXiGpsicA6IZ3ZGZdvb3mWA88XZRhJHjagrUksImLjfkRd+XH2hJZdvzCAzovIryeeToj0jcpTqaJ7qnnHu8bocmwIWDfFQ0fDIwvv1EdW1So+9MY5QYLlT4vo1BYlF5LIcZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735627505; c=relaxed/simple;
	bh=QxPAR9eIf70JngHqhHjpHheTQtp2NFfx0lEUbNtV/h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuJd0FeXd+Ou2MvN3aRB7PAQZC+VxvEBFAOuOPZSCFAQoZa/OX9kB/WrA9NbzF7rFvm389Fh24ml8uXf+tmMljBHk6WHHXqXQ5JPmsduaa/Kh2SISoQH0P8MYnhACjkE3toHul7SsbPG0ZD1XtkpWUTkvp7Qe8zUVj3wICktzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIMuUe5r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIMuUe5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735627504; x=1767163504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxPAR9eIf70JngHqhHjpHheTQtp2NFfx0lEUbNtV/h8=;
  b=RIMuUe5r8tSWZxUvHs379NBGtbSpS4Xj54YZ6bwsQ25P8oICFSomHHrA
   RISz9R1YzFkRv3ALvekZ3GgDEmCP1ci+3vCiBLQbkArcPayY5c1j/Uu40
   UnIAaOzF3ehwyWZ/oMLdhZ04gwgpG4OM51OjoxmiKAWqgNiViaIiCKyKR
   khraf24gq8RbXPWQ2h/u/MQ4HU/8tupHaq68oLJwG4hdmqECH2tLfC6vo
   hOgbg6W2ZReelRH7CUZSv8aZI5sIRvonmHmB1YGxqT1Z6rYAIxoLTw/t8
   38RVSWqaWjZxIlqdjofLTFQYkDICOscg6eOS4BAB+LO2TPxVRZk7UOe8T
   w==;
X-CSE-ConnectionGUID: 2Z/7XEmBTX28M51QUkjwFQ==
X-CSE-MsgGUID: m0qz0Il7RYGfqGGkVz+e4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35810155"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="35810155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 22:45:03 -0800
X-CSE-ConnectionGUID: cUzJRvquTiOW+XOIiAV7lA==
X-CSE-MsgGUID: rEix4LIIQSaowqSElTu5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="101154771"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 22:45:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSVzw-0006s7-0I;
	Tue, 31 Dec 2024 06:45:00 +0000
Date: Tue, 31 Dec 2024 14:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 7/31] Makefile:47: *** Cannot find a vmlinux for
 VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux
 /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202412311405.9On2kiIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   b610703fefd5a3a992e07a383e2e6f6cbf9a41c8
commit: e209f14d57ffb81880b2f29d8058b331f3bda06d [7/31] x86/vdso: Enable sframe generation in VDSO
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311405.9On2kiIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311405.9On2kiIT-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: Circular tools/testing/selftests/alsa/global-timer <- tools/testing/selftests/alsa/global-timer dependency dropped.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d527 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d527 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d527 Masahiro Yamada 2019-02-22  50  
3812b8c5c5d527 Masahiro Yamada 2019-02-22  51  # Avoid funny character set dependencies
3812b8c5c5d527 Masahiro Yamada 2019-02-22  52  unexport LC_ALL
3812b8c5c5d527 Masahiro Yamada 2019-02-22  53  LC_COLLATE=C
3812b8c5c5d527 Masahiro Yamada 2019-02-22  54  LC_NUMERIC=C
3812b8c5c5d527 Masahiro Yamada 2019-02-22  55  export LC_COLLATE LC_NUMERIC
3812b8c5c5d527 Masahiro Yamada 2019-02-22  56  
3812b8c5c5d527 Masahiro Yamada 2019-02-22  57  # Avoid interference with shell env settings
3812b8c5c5d527 Masahiro Yamada 2019-02-22  58  unexport GREP_OPTIONS
3812b8c5c5d527 Masahiro Yamada 2019-02-22  59  
066b7ed9558087 Michal Marek    2014-07-04 @60  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  61  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  62  #
8962b6b475bddc Masahiro Yamada 2022-12-23  63  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  64  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  65  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04  66  #
8962b6b475bddc Masahiro Yamada 2022-12-23  67  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  68  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  69  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  70  #
066b7ed9558087 Michal Marek    2014-07-04  71  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  72  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  75  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  76  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  77  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  78  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  81  

:::::: The code at line 47 was first introduced by commit
:::::: 3812b8c5c5d527239ac015f1f2c7654da7fcfbba kbuild: make -r/-R effective in top Makefile for old Make versions

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
