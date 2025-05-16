Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B48488
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437520; cv=none; b=VdcC94SOwkddpjDh6+9cdcECwN1sv91s0XrP7N+XS878tVGSGVgFCpqlgiyLHpBwsayN/re16pgjHnoaYt8F23X+qFegNXshKwg/bynA75kxjUVas0rVP8qva+Vb53TAiTu48GengLNDYdJxnvpXZtzBwWz502WTzDHBFltNXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437520; c=relaxed/simple;
	bh=vQs0I7E0AhUj7Shcq3tv8vtHW2yMUDT5cGe/cgnuBhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVqDi75oU/HmWjTrz3Clcwf7WR+XRoKoG6Tdhp4xd4W8OGRyQkRS61YktbTcmpwOp2Ud6sgx82mhheTajVJb9+W9JZ1sGWjBZ2cLw7Zm8m0bzX8IQ7RrlvUVnCuxYhxXvrYXh3Fb6+ESRqiutkCQc63N4XUkyLltmQ3h6+azZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlX4nM7E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlX4nM7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747437518; x=1778973518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vQs0I7E0AhUj7Shcq3tv8vtHW2yMUDT5cGe/cgnuBhw=;
  b=YlX4nM7Ea7q6dqnHcyHteTI32aXRhHtdw/2Ags7sGsoSTUA62QNulh51
   WSnoBcoV24F6An8fHJ48++JJ/vZ37dl30lXqT5mnammlXaIGykIxHwbM9
   1YW7UAYVe0oBPyu+97RFj2qKkYsKrw7SwI2QMby3nILyFZ/5kdONi1uG5
   qYx8RJo8rZCC3ga3eVr1F40tXjJhb1z9jsA+HtfQblnG01qIlIkg43Uxg
   x9gAoQsQTZeDad6PInTCl1NcAgRjSvOSpb8mmoL9DPQH9DfkGlkY3+uMz
   pwoNxX2/fuEspbx2yWfl+nMlqN45NW6dqijh06n5w7wC0IAs0HcfDxHH0
   g==;
X-CSE-ConnectionGUID: 9B+ET2FqSOaVUOHKyIu4Yw==
X-CSE-MsgGUID: PlvoOOE8QgC6mziAJibhVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49489826"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49489826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 16:18:37 -0700
X-CSE-ConnectionGUID: qItsb2m2QxqiGTLZoYZRZw==
X-CSE-MsgGUID: NJlacvfFRVemy49bVgwzmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143942929"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 May 2025 16:18:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG4K2-000JmZ-2O;
	Fri, 16 May 2025 23:18:34 +0000
Date: Sat, 17 May 2025 07:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 141/141] include/linux/dma-buf.h:
 linux/android_kabi.h is included more than once.
Message-ID: <202505170747.AFQJFOpn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5e97c36004c597634c5242f2d21ce921d0259cfa
commit: 9e96103d839c2fa2686a8c95707a2647151cea6f [141/141] ANDROID: GKI: Add dmabuf ABI padding
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170747.AFQJFOpn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/dma-buf.h: linux/android_kabi.h is included more than once.

vim +16 include/linux/dma-buf.h

    15	
  > 16	#include <linux/android_kabi.h>
    17	#include <linux/iosys-map.h>
    18	#include <linux/file.h>
    19	#include <linux/err.h>
    20	#include <linux/scatterlist.h>
    21	#include <linux/list.h>
    22	#include <linux/dma-mapping.h>
    23	#include <linux/fs.h>
    24	#include <linux/dma-fence.h>
    25	#include <linux/wait.h>
    26	#include <linux/workqueue.h>
  > 27	#include <linux/android_kabi.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
