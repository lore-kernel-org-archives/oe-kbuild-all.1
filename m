Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B23CF21A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 07:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641969; cv=none; b=hd9ZHFLr+Hqv/fEUvACz3H8BCeCCieyL4vSQ01XocUjlgIml0zmLu5xSArunt7yKAyLdtLMKSMB/GPiJ4E4ISr8agM93qRJvHJ8nhDa61mE97B6HXxELV182lawDpkp1oUqIelDO6JMWNO+7/K1ZdVM4q1/qdl+IlXgvAG2OuFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641969; c=relaxed/simple;
	bh=XUMKaoAixFHW5jHCw8x8AisFnRComfKLLGsa8P1kuMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f7hhNNuqQ1XnRTCdIV+NPT8xEIX7AASlBi85KppBRbMyzrpX207LVvzT7IwMLu/r0SE38GLwnAEopyGU7yx8U7vdmogG58ZGkISSzseYUZvZXCxXkzRjNFTqtbAyRBbGYGleuMpyphJdv5qIm4Yz1pCkyIrw67ZMfSwM05iI98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5K4mXx3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5K4mXx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787641965; x=1819177965;
  h=date:from:to:cc:subject:message-id;
  bh=XUMKaoAixFHW5jHCw8x8AisFnRComfKLLGsa8P1kuMM=;
  b=L5K4mXx3MtYI22EaoncXIN6krYgliL2i9A0dJ0Dbis4EurtXvOBF+uSx
   gjZMxzz92xl6M+TjUXysE0BLy6RYWe2VKtdH8vwVntqH94kfmZxuErT6e
   DmEoy1jIaCTByhOBSO95sJIcdCSULTvvIunkNmlzeAaUO5taD+txiG0OY
   n1r+9D61x+NRlVz5N38Br3QxnA0QoGdXbalhH27K4krWg21es7HLWkGJW
   zK7YHXHGblnk1KKa7sQ80jo964dGkvXVUuZPmHDQl3HhDRVUzoz60ioRS
   SRnEYZxEf1Nn2Ri7tSvT+3oS22HtycVA/pkOqGprpi4sTr4LmsE8d94Uv
   g==;
X-CSE-ConnectionGUID: mQSN8f+sSwaU7gx1SuPSdQ==
X-CSE-MsgGUID: lhhoGb2EQ56xL4VvvQBZdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98437655"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98437655"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 00:12:44 -0700
X-CSE-ConnectionGUID: obtsVvkIQ1+3Y2WEFhJIag==
X-CSE-MsgGUID: felLBLw/RXGDrCy7DizDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265892770"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2026 00:12:43 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wylKq-000000005Cb-3G0x;
	Tue, 25 Aug 2026 07:12:40 +0000
Date: Tue, 25 Aug 2026 15:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jinjie Ruan <ruanjinjie@huawei.com>
Subject: undefined reference to `syscall_enter_audit'
Message-ID: <202608251555.ORwrH1Le-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: 6f25517010ddd3f8080d7e06b9b1cb1b64b73772 entry: Rework syscall_audit_enter()
date:   5 weeks ago
config: x86_64-buildonly-randconfig-001-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251555.ORwrH1Le-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251555.ORwrH1Le-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251555.ORwrH1Le-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `do_syscall_64':
>> (.noinstr.text+0x4c8): undefined reference to `syscall_enter_audit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
