Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64186FD5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733042918; cv=none; b=bWFKTyk9/j7U7VZqwOUrESk/Yj3uPDCozbws3iRI0W+FljpmyXOWneafDAL8iN/9yii1KRtemdrH+MU4COxg+JUL1+XwoVByctIfFzSRE2weUaFqHwS2TJ4YJ2TyYkLv24ZCQ83zp/ZeC1nzKf+llhbgpbooJIx3klUrrlLMgS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733042918; c=relaxed/simple;
	bh=vKLBJNH6VxMfcpWpu4PcpQSA1V/QtZdldi27Kb1BM0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjQDXZc4hnYKu3Vqalom28E+5UHJKCnEMglB5fqSur5KRne7A4n/zxtQe/CMzY2p/qxD83qCDuXmjWCTs92wO5zCPdlMPJMnsYw0lwjE7+3W7gsfjWt0klvXKh744gBPhMxwe+aiYH37W0OOnA5zAYb9hkcV/nGTKKRE9YdEvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpVC0WPg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpVC0WPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733042916; x=1764578916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKLBJNH6VxMfcpWpu4PcpQSA1V/QtZdldi27Kb1BM0o=;
  b=lpVC0WPg9AUf3X3uH3jxIkiKDvbmcNJupPcs7LLBLDCzr6TP8P6KjOdx
   GlC9KV4nIJ4iEqkqm/5bAUN23+Ol3ddXLwMOk5ydDwmSdOd+NHavE9eMT
   tnKhz8+dAiboeQalr8GtHEsMXFiGhcWaVgTh9H2fuvPrwy7oE3XUii2+R
   mxotQHT0v9Z4la+iDGaJ5BGD6+0UZhsvjoYfDxpY+OgJyYY6w4JFRXq4x
   D827KBm4KKFv9wPObNQrYTzUkBZKmpyEXGPrnh2gIDmT2tj/rrJQOXAzp
   V8y6o2g1lWswBLPXtMLvU5VfFVdfatAMQHx8wZPElI0QlUGg/wFbrKNTK
   Q==;
X-CSE-ConnectionGUID: Lca0fYxwRjKxwMjKUWSzHw==
X-CSE-MsgGUID: V1/Cs/pWTOy9t6LAySA+kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="37153638"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="37153638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:48:35 -0800
X-CSE-ConnectionGUID: VaZvRBfBTwCMgE9cT9gpug==
X-CSE-MsgGUID: 6F8JvbgcSpur7FCzMN0ebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="93153115"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2024 00:48:34 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHfcj-0001Ob-2l;
	Sun, 01 Dec 2024 08:48:19 +0000
Date: Sun, 1 Dec 2024 16:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2441/2441] mm/swapfile.o: warning: objtool:
 free_swap_and_cache()+0xfc: unreachable instruction
Message-ID: <202412011634.AmMCv17V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: 1d94cc3410041f99602b68b4d1d79e57fbebf6ca [2441/2441] mm: swap: fix race between free_swap_and_cache() and swapoff()
config: x86_64-buildonly-randconfig-001-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011634.AmMCv17V-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011634.AmMCv17V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011634.AmMCv17V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.o: warning: objtool: free_swap_and_cache()+0xfc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
