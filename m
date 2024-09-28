Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77054A08
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727509386; cv=none; b=emOCVC+FRXSbAmdHGhvl8FeAeQu6tbF9eElE8ArfHkmPKdrdLMvwKau/XThUBNUuZpBqGOKtCUl+K8pZ5JPHUSIqeIttXnK8kIRVEM8tGbxzYxAVIgG85JdGK4IKzpNG395twuyHBb82qjMwh6KYXO0dDaCjGbX3HiQx4hw1BF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727509386; c=relaxed/simple;
	bh=yCQPAFxQrt9atot3tPw4KbyTtYI9EWkjxbJOFErmEvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZFgyTJmKyG2fbVUTuARKIvw7yAb1peM3q4sRSzsHrhI1uOJ54GF60EhyK2aBI25Djt870uEGBPvcS8Lw4WfghvrdG+CdlEag519zGCVWXFOtljk3pISiplln/EO2yKlNiITLPuO0+c3RW2mUI7J24jXFnj8UXeSdI5t5+ZnJVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo5Q+Db9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo5Q+Db9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727509385; x=1759045385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCQPAFxQrt9atot3tPw4KbyTtYI9EWkjxbJOFErmEvE=;
  b=Qo5Q+Db9QPvls6HBrNjVTOh5DuDxmP8SjqnU96sMdiY9e2jqt8I6TchS
   S6fxWjznJNDP80QeBu05EvbeULufdUZrhBpD1QSEPGdhD4WLWugCOX9YI
   iAwWM4j6DmANJdB4wCM9Tgd6vIFirI13dOViDTgiSU6IZVsJbWwUtH4w3
   wRFUhwYH6lEKz5b0tYOrJGuD+wo1Eq5Qyc/M8+5aZQvflMBOf13Tr59Au
   GeOHbbiDYmLuDs/treiwo9Mkl8s18w7g0uFEckATHWcXe/bzPKQ0NjkaE
   iDBjX7iMLScN/xM0AZnvV7TZLM4aDktPkpTQvZM0t/AWeicXJLLZgHdie
   Q==;
X-CSE-ConnectionGUID: sWZSzxmjQk2mhVTbnpNAvw==
X-CSE-MsgGUID: oH5gVNZ8Qfic5Mwavsjw1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26819255"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26819255"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 00:43:04 -0700
X-CSE-ConnectionGUID: 0rZwnoMqQcORS05Xx7pILA==
X-CSE-MsgGUID: em8WxsQbSn+LZtkhT71aLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73060819"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Sep 2024 00:43:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suS6W-000N0J-2G;
	Sat, 28 Sep 2024 07:43:00 +0000
Date: Sat, 28 Sep 2024 15:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 1/10] vmlinux.o: warning: objtool:
 .export_symbol+0xc8: data relocation to !ENDBR: entry_ibpb+0x0
Message-ID: <202409281546.k7pYPyDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   4e155f6fbba48ed677042026d7732c6256ffa166
commit: a8cfc198458df20142631aa83f9e56deaf92ec9f [1/10] x86/cfi: Wreck things...
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240928/202409281546.k7pYPyDV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281546.k7pYPyDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281546.k7pYPyDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .export_symbol+0xc8: data relocation to !ENDBR: entry_ibpb+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0xe8: data relocation to !ENDBR: asm_load_gs_index+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0xf8: data relocation to !ENDBR: clear_bhb_loop+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x14148: data relocation to !ENDBR: rdmsr_safe_regs+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x14158: data relocation to !ENDBR: wrmsr_safe_regs+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x14168: data relocation to !ENDBR: __sw_hweight32+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x14178: data relocation to !ENDBR: __sw_hweight64+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2fed0: data relocation to !ENDBR: clear_page_rep+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2fee0: data relocation to !ENDBR: clear_page_orig+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2fef0: data relocation to !ENDBR: clear_page_erms+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2ff00: data relocation to !ENDBR: rep_stos_alternative+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2ff20: data relocation to !ENDBR: copy_page+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2ff30: data relocation to !ENDBR: rep_movs_alternative+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x2ff40: data relocation to !ENDBR: __copy_user_nocache+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30000: data relocation to !ENDBR: __get_user_1+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30010: data relocation to !ENDBR: __get_user_2+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30020: data relocation to !ENDBR: __get_user_4+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30030: data relocation to !ENDBR: __get_user_8+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30040: data relocation to !ENDBR: __get_user_nocheck_1+0x0
>> vmlinux.o: warning: objtool: .export_symbol+0x30050: data relocation to !ENDBR: __get_user_nocheck_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30060: data relocation to !ENDBR: __get_user_nocheck_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30070: data relocation to !ENDBR: __get_user_nocheck_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300a0: data relocation to !ENDBR: memmove+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300b0: data relocation to !ENDBR: memmove+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300c0: data relocation to !ENDBR: memset+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300d0: data relocation to !ENDBR: memset+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300e0: data relocation to !ENDBR: __put_user_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x300f0: data relocation to !ENDBR: __put_user_nocheck_1+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30100: data relocation to !ENDBR: __put_user_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30110: data relocation to !ENDBR: __put_user_nocheck_2+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30120: data relocation to !ENDBR: __put_user_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30130: data relocation to !ENDBR: __put_user_nocheck_4+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30140: data relocation to !ENDBR: __put_user_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30150: data relocation to !ENDBR: __put_user_nocheck_8+0x0
   vmlinux.o: warning: objtool: .export_symbol+0x30470: data relocation to !ENDBR: entry_untrain_ret+0x0


objdump-func vmlinux.o .export_symbol:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
