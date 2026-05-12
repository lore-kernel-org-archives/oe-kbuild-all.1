Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEA61FC8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555242; cv=none; b=bojvDYNBjjKGLrDBEpQa2IoZ9v4fjlJqRwFY2kRptNdns+bnNu8y56bNL/NsZB2qEhWnMnAYkkqOImr3C75EN5FoTpz4bwMW9Vv49asrZeXaPTMAOc/CjjzicziNY7s126YrbjBeeO+k745ixl3hlHACPGzuhQTmrQMY5uFhCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555242; c=relaxed/simple;
	bh=LRWx2JQVql+AX+f6W8dWjEqtWQ2V3U4UdaHr69UtEs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qQOqDaJjQAvIeMhv3KHJ0X2A4G9UCGRjrnhU/ire6IgfD0ltl2K5NklDCLQoAVnsgF45GI988f5xoRLiZaH7MoM5MlG9UEyute7i+oL7yF93NKYUThPQsZK8ejk8uqgUv6jH42wPALjvWaen+DFSgE78a0q39BfcdVdPF4KsCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5Ls7/vl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5Ls7/vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778555241; x=1810091241;
  h=date:from:to:cc:subject:message-id;
  bh=LRWx2JQVql+AX+f6W8dWjEqtWQ2V3U4UdaHr69UtEs8=;
  b=K5Ls7/vlXcKbGG2gztjsEiB23jbpYtTIA2Dg7O9t9zhQLGy+VKalbJgZ
   g6xyPs4d9NyZjk/AswFgacba+w60eOLV7V3PsqtsPy0MNDsuGHvGcEkEh
   usBLPRyoX+Uxc57BO+x5r9ZVqBT++BR3oGoPKOHEgerCvSJfvH1+PKpu0
   CrMOiba6u2GICJ4SYfWqnBOf4MBBTXTVNX04SjrSQsvWXqVtUQkaP+4E3
   ubkbSQVFkXBllDsPBXriTmA1dwHJX0LJVIMiLwk3fllrm5anX/IMwMtWd
   jzYx8eiSk8/mC8o9/YcqGKL9Ksy5MqXoq/N6maH3NGIrEicFa121KwaGr
   A==;
X-CSE-ConnectionGUID: sf+9yQrrRTGI2rnrPmhFNQ==
X-CSE-MsgGUID: O17Ygqv8Rk+ib8KhZkcK1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79173131"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="79173131"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 20:07:20 -0700
X-CSE-ConnectionGUID: i6rSdgJCTeazaJ+vuX0xSw==
X-CSE-MsgGUID: ypPCDMBoR+2S/kRDBPbE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234969868"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 20:07:19 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMdSn-0000000088p-0UjZ;
	Tue, 12 May 2026 03:07:17 +0000
Date: Tue, 12 May 2026 05:06:30 +0200
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [kees:for-next/hardening 1/1] htmldocs:
 Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING:
 Definition list ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202605120507.9iQRMgKR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   3c74955937520e6aabc0ec921b1bfe01734c6abc
commit: 3c74955937520e6aabc0ec921b1bfe01734c6abc [1/1] stddef: Document designated initializer semantics for __TRAILING_OVERLAP()
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605120507.9iQRMgKR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120507.9iQRMgKR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   --------------------------------------------------------------------------------------------^
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
>> Documentation/driver-api/basics:127: ./include/linux/stddef.h:110: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:115: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/basics:127: ./include/linux/stddef.h:116: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:117: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:122: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:124: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:139: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:127: ./include/linux/stddef.h:140: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
