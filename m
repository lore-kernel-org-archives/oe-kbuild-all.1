Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229F1F582F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452251; cv=none; b=T/HD6qM5PTXi0Mao1EDEaGLAW0l/kVZkn6gCP3dA/geRDbzqmCICKr/d7TG5D4WlkhwXpGspvtKWIYXSKGw2A65lRefQUh0Fg+SYMwlFPeDtdsGTkpBGDudjojxWcuSzwrvnvQq7oIYzj14STcxZHZrZRUtdWlam+UHXNpt8wc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452251; c=relaxed/simple;
	bh=kA2ugXrqcOXA0Ak7ovQhHc87RLzsS7+AmRF98WOjxEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yr24WnOuy8GUfcpQtkQTpkalIzaPvREQY9PhEZLuRurtbBOdO7b3SLxzLeqVZ1sBzDtat5k0fa6eF8KvKqW3j7LvTZBbiPnXjrsxwz16h2wLrlXaCtB2aWG86UOlhK0tSXCanydmCPxoF3NAvV/mmy/CnfMIUEznFEMDnvnRcns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpNS3IcF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpNS3IcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751452250; x=1782988250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kA2ugXrqcOXA0Ak7ovQhHc87RLzsS7+AmRF98WOjxEk=;
  b=fpNS3IcF+O0stqhwUtMedrirJhRVZ9/SF0OEmGyGr2rQ3XM8xKSTNqeU
   H4gq1j1+RH2yjEaN9o8x6sz3Xa1FVxQlImkxVjZv5shtRbS/aqety8Lsj
   Bz4sU8vfp3p+c5QA88DnkNm25tETVIhDuS+jQJkgOdk6bvOgQ1LxPuHnC
   4VKX+syrF0AvVg/m98PPqqVsYnaIylMuVVzF4kpu8TdZT3lExOF1RhidL
   CfPsIUnRsxNGwoguJfa1d8LXzFLKy5bMl+a3ay8L0Mp7cVdxQw00mNh5c
   UZ2Dnx4FnMdQPX/e8sU30IK1SajXBNE3Aw5E4IrpSIHDRu27X/6Eui8Hg
   Q==;
X-CSE-ConnectionGUID: 9CskLIZfRNmH5lU+TkAp9Q==
X-CSE-MsgGUID: XJ4ZBmSWQK2BH7SwiOlxyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57416869"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="57416869"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 03:30:48 -0700
X-CSE-ConnectionGUID: /r7vbRRxToWpj4xRZ5j0zA==
X-CSE-MsgGUID: oWxEo5uAQUCXQ5vwJSLOKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154367792"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 03:30:46 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWujk-0000Vz-0F;
	Wed, 02 Jul 2025 10:30:44 +0000
Date: Wed, 2 Jul 2025 18:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/sframe 13/26] vmlinux.o: error: objtool:
 do_syscall_64+0x232: call to __kcsan_check_access() leaves .noinstr.text
 section
Message-ID: <202507021854.zS2MMqSn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/sframe
head:   5d24854c7069f833449e8310bd3253624213c08d
commit: ca9f90f1a871d6778fad8958e2e2bda27c3b29d5 [13/26] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-006-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021854.zS2MMqSn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021854.zS2MMqSn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021854.zS2MMqSn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: do_syscall_64+0x232: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: error: objtool: __do_fast_syscall_32+0x1c0: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: error: objtool: do_int80_emulation+0x242: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: error: objtool: irqentry_exit_to_user_mode+0x11d: call to __kcsan_check_access() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
