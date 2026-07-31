Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC6A446846
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518267; cv=none; b=O6JSwMltkPVD2bgeoxVeZ4RwktQT9WEZBk2Brn2RjNO2MixyseiIgC6f3rJmuZSr+yePCoWBKMcC5t+MCl9BJ68+61vlYdk7ThdrVb2PPcpWC/EpMasEn6p+WcsEMsTrYEEQaratS8lJ+I9odY2hzCiKTr3shh3Z/fY1kf0ZpcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518267; c=relaxed/simple;
	bh=lYQHCVlz53kWr9s6R9lSQeQBDQp2nCFdzLwpvKcpsCc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SDOtAkVWefKem3mRSmnAgn/i0RQBfJ3xMBddwby5+5t6O6upEFHsSrV+DgDGorYdwe0dgENNibO2zjVADNPNIy1dwT299/3tdDM+CWBrL4CZr5REZai3w7Ba9s983KqmmT5lasd379hHEcU2qUis9bg5A0DwtRc5DlFIBbeEMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS3g5bix; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS3g5bix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785518266; x=1817054266;
  h=date:from:to:cc:subject:message-id;
  bh=lYQHCVlz53kWr9s6R9lSQeQBDQp2nCFdzLwpvKcpsCc=;
  b=SS3g5bixSUKzsmkqHssWgw5URNRU2voBq6neLPdyau6xM54MShvn/svC
   tghCM8Ca0khnv5TgtYEuQvQ3c3gyw9Xu0zmLgrtE75npwRHr6/qpCYKM1
   AFpD3zqOxOPjkcsjXCGt5ZC0BufWYom7rnFcU/yAsvKkVHAiPyCZMaOQ/
   HVnwaa1OIIuXrY5OoS5RDZ1+co1jtW+I8GGe5/UAS9U9TWayowjX/kPrq
   vAS2iWGuuC/19w3yDaaW4VlFpdbpQ4EMzzLqkzGsTNfKyzFeVQo1fBCqT
   uajbEoEuFT2koago07HJCJ73O58hh9bhAWMs0GNCAOjxeROnMWdilVZm9
   w==;
X-CSE-ConnectionGUID: ZiEAkOL0QvC1GLNW1RP0JA==
X-CSE-MsgGUID: mJNY+8BvRgmaF0Q6piSDng==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="73685144"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="73685144"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:17:44 -0700
X-CSE-ConnectionGUID: Dajb7Te1T4ya84xj9+xhTw==
X-CSE-MsgGUID: ZAxxPh5tS2Gl/Df/6Y+KbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285233384"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 10:17:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpqrc-000000001ke-0pzS;
	Fri, 31 Jul 2026 17:17:40 +0000
Date: Sat, 01 Aug 2026 01:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [trace:trace/core 2/16] ld.lld: error: duplicate symbol:
 __bpf_trace_btf_ids_dev_reg_evt
Message-ID: <202608010048.GkZYD4c8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
commit: 576dcb9014ef62dbf031d5038de059ff53474d87 [2/16] tracing: Expose tracepoint BTF ids via tracefs
config: i386-randconfig-061-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010048.GkZYD4c8-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010048.GkZYD4c8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010048.GkZYD4c8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __bpf_trace_btf_ids_dev_reg_evt
   >>> defined at trace.h:32 (drivers/net/wireless/mediatek/mt76/trace.h:32)
   >>>            drivers/net/wireless/mediatek/mt76/trace.o:(__bpf_trace_btf_ids_dev_reg_evt) in archive vmlinux.a
   >>> defined at usb_trace.h:27 (drivers/net/wireless/mediatek/mt76/usb_trace.h:27)
   >>>            drivers/net/wireless/mediatek/mt76/usb_trace.o:(.bss+0x0) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
