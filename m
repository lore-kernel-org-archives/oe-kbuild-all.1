Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B16132693A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953569; cv=none; b=fVSqKhn4DRj2jo/9knxpdlWHvJ0a/w8reFskBojo4w2mQBTOZE/c26Urzl15G5vseSjioBerTEmf8gRswjPxOHXqleahSe5ROR9dVBGbVBAVbivaHpB91XReHLz5olyW4nEhr4XADfX0kQyOiNZXbC6RfXWdzjvakJlqQBjI3Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953569; c=relaxed/simple;
	bh=aHfJPzh5NUaxzjbNBbEVuHRhh+XkTi93tebLxPk5tA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W035CnhVaDOM5JX2LG0JtBwNdv95/Hql4FRn2khsMmGA8DuoGtWqff4kkz8eRviifb8WVUaW2RzitQw4ioZULsP7uzspnq08uvbYWEer2V86FTLkxGAO3BpU7Yr+178rx5oIA3wqYFTdujcBF99IUk426gPn1atjGbrXgEmQjFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C20HDggA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C20HDggA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765953563; x=1797489563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aHfJPzh5NUaxzjbNBbEVuHRhh+XkTi93tebLxPk5tA8=;
  b=C20HDggAJtFGt6Ma1x8cKUcrfs1uKNSeapUs4qgTaa7yaylAQDo3cwlR
   j3apMZ5oFUmRvl5KNSAtMqPA6SJp3ClCsYxrOFIRdhLZurIEKRjb/1XL4
   XQJKNSuGXj559jZPDTXHK/21aCD0fRyWLb0I1uNma1omZdwkppzswq+pp
   icl7Jb75vclVsHaHpvfKKZl+G/7WTRDO6opXcXX4+nIw4BrTk5cIBD3e2
   xomb2chIB61S4MNJC6BMqh8iJ1pBI7gwEU3a5j5yL0w5uZTLKCGvQCrFH
   nXaIEHcdW/ogydQ6DtY3ekyZMUW7+4XWx0tc4iP0HCpUcGuPKWPtvyvMh
   Q==;
X-CSE-ConnectionGUID: la1oeHZaSUijKKix5Aizsw==
X-CSE-MsgGUID: 6PvH8CLkTdqZNZHEy2SDnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79002378"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="79002378"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 22:39:16 -0800
X-CSE-ConnectionGUID: JWuqZuTEQpyQREqfT0k8Yw==
X-CSE-MsgGUID: 2Lau3RjxTgSvfoIi1qvK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198481007"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 22:39:14 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVlBn-0000000006h-3RPU;
	Wed, 17 Dec 2025 06:39:11 +0000
Date: Wed, 17 Dec 2025 14:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/14] Warning:
 drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in
 'dma_buf_set_name'
Message-ID: <202512171455.NcfH2jBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c1b795b01b38942c4db4e3b8946b693e85dc785c
commit: 341d2ddc74eb2989062a712d7853ed359232f47d [0/14] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251217/202512171455.NcfH2jBr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171455.NcfH2jBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171455.NcfH2jBr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:405 function parameter 'name' not described in 'dma_buf_set_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
