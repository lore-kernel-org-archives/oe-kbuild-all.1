Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33E71FC7CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344523; cv=none; b=OJcpSLnz6Swq3PPwq0Js0Fdpy6XYgEPx+WOwEQBWfkz55To0NPuiICvFIIZ0UjnRbd/dUWp5IPoOmRIM0SKG7fRs0CEKJPqF7V6M4vnjO0/b3u+MwwmyuPz/jzyuGdH13Ki3DbUlFuVsF+6NesPX0RmMAmKL5xaqXFjNHJkNFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344523; c=relaxed/simple;
	bh=v1MSXcoNFIUJBVl62fWo64sdGLnau+nQ3iNG8nRAGGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZPrfZ/HYKtD3/CXyTum6KZHBO/B4ojMORIph61Z9pc7qtnWFgyTE57GqDVEfgNzcTKhJhoH9JPB2dkoiDnn0R2XHCWnIcWSkUzrOMfjIjxf88A3UbE3cuF80BYRVMy1OG0bmN0jMzyqvwuFwz17EkTkN3ax1PiwyCauracvjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0WK2sqW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0WK2sqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344521; x=1767880521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v1MSXcoNFIUJBVl62fWo64sdGLnau+nQ3iNG8nRAGGw=;
  b=A0WK2sqWTQUBPHsC7pPL94sMl1zqluwwhzOji5raJLA96OiwY1eE2h+c
   9LeLDgbc2LdmOgxY9u77Oq9eVUjkNg0/gKPoVf+ZeYVPiU2C/8T7zS4rg
   DcFrrQ7xh6s+vMCfffFL1xPV91KNbRrqj9eiobvorI4lqgRybFa8SKW4F
   hQ0lMgKDzhrMrKviotVr5ieVdmcUK01sLXr1yyk80T3lIiM4yuCPQ8cXG
   Wyp8+zf36XR0gdWfDRA3RY4QCQElYVi/yq/7+fRoigPQipzKhzwi7vDq+
   lvpR28Q0ag4VhHa4ZQD54fwTQAamZitp/uQX3sxJNeYoRIdXYP6Mwwzd8
   w==;
X-CSE-ConnectionGUID: ByeemM4gRDeW5pc/2shkxw==
X-CSE-MsgGUID: +HOnq6ndS5Oq2K7ShQ6Z6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47561632"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47561632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:55:21 -0800
X-CSE-ConnectionGUID: 9z8iYGAbRvmaN4Dwoex1bg==
X-CSE-MsgGUID: gFp1SZRSTL2sL1UutRpzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="133952854"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2025 05:55:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVWWj-000G9r-2I;
	Wed, 08 Jan 2025 13:55:17 +0000
Date: Wed, 8 Jan 2025 21:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 383/1347] block/blk-mq.c:
 linux/sched/sysctl.h is included more than once.
Message-ID: <202501082136.25VmHd1t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 54c492f8d2da8d8ea3740dfbeb233e3649331605 [383/1347] block: remove blk-exec.c
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082136.25VmHd1t-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> block/blk-mq.c: linux/sched/sysctl.h is included more than once.

vim +25 block/blk-mq.c

  > 25	#include <linux/sched/sysctl.h>
    26	#include <linux/sched/topology.h>
    27	#include <linux/sched/signal.h>
    28	#include <linux/delay.h>
    29	#include <linux/crash_dump.h>
    30	#include <linux/prefetch.h>
    31	#include <linux/blk-crypto.h>
  > 32	#include <linux/sched/sysctl.h>
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
