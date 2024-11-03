Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1413635E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730659241; cv=none; b=r2+lN68aUgUwu5wHw/N9M1ku4i3j2eviNeRGQou0r0qiVCGyx019VLBPV5DVd6tCZqGM8N1Y2+CvICVGAiV+yoxmWyVqnNpG3hkot8z2wO9/J4Wa18qrcfTIY1SmT8NRTtN5qf3z++Fs4qA1eiL0AXin349cbj8anjpTlnYNCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730659241; c=relaxed/simple;
	bh=qdgkAMyN8mbJktKvTmrGC7VyrIzcMisIX5Nuwjdg/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNgdIbP9jYS8NCIwXAoe4nDfWEwfyrBUa+XZQxCopV6B3e34b+Z0mLUlwkEFESSbeoJVvXT2+GKEfbG5CYAHdn+OZirf/rktMh7a0JMJJ6Y++Go1uCfJH0bQKCSTgUkU5G0lPNvxsmU73x/6Wh6LE9x9K7RR+Rz970qP27UlKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd7lRx3+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd7lRx3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730659239; x=1762195239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qdgkAMyN8mbJktKvTmrGC7VyrIzcMisIX5Nuwjdg/aQ=;
  b=Rd7lRx3+LgvrlAHCe3JRIyUWQw4S/O10NwUMiumN1daHh4gv1Pfy6tZk
   ItzyJFjhFONzqWc4dNKsnXuFeRyJ6QOJy8i9G1g2BbFZryqsfREE1e0zX
   jsSGAQGNdOCWdULKrYWbzqGvNlL1NvyhicIETZJIj+sNrbK3qRfE9+RfU
   kNfImH+3To1IcB9n9VUt3V4fOrH7qA4nA+93v44ifYNz4RBYAOvkfvdps
   YsChzaQhrvMtGeQ6zFRgL9tq6Ib906ihQd/4gzrOUCewjaJk5tmezfCCi
   jOHJpXgStUYpbXHDg71RLGd3VomS6qXKPzy2LWMgOZ7vmwlBb/DIaVSu5
   A==;
X-CSE-ConnectionGUID: G7QIH/84R9SAe5qz02Y1KQ==
X-CSE-MsgGUID: HFtagWdoSkSmT/ELChnySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="47856712"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="47856712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 10:40:39 -0800
X-CSE-ConnectionGUID: tmHzUu8pT2yx++8dKh0A4w==
X-CSE-MsgGUID: aK+4ZuRDRGSkLllalK7EQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="88042612"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2024 10:40:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7fWd-000k8L-0g;
	Sun, 03 Nov 2024 18:40:35 +0000
Date: Mon, 4 Nov 2024 02:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 trace/for-next 3/3] bpf: ensure RCU Tasks Trace GP for
 sleepable raw tracepoint BPF links
Message-ID: <202411040234.Ktm6NHq7-lkp@intel.com>
References: <20241101181754.782341-3-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101181754.782341-3-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-decouple-BPF-link-attach-hook-and-BPF-program-sleepable-semantics/20241102-022026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20241101181754.782341-3-andrii%40kernel.org
patch subject: [PATCH v2 trace/for-next 3/3] bpf: ensure RCU Tasks Trace GP for sleepable raw tracepoint BPF links
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040234.Ktm6NHq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040234.Ktm6NHq7-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
