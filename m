Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADFE545
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 06:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732084342; cv=none; b=Qh8PVSi5LXAFtgTnqWeliOxSbHtOFi1+CWX2mAGYdijws2vQsq/7yJEGaKfEa+zl0Mg77KwsKh1moKelAKCmx8I+xoMeh5G44vLvdFc2fHj9xl6hJ/c7LuTh/6FMk85vOv4ndyRryFtC6q6crWTknGclS+0jB1dVCWs8nVq5yCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732084342; c=relaxed/simple;
	bh=wDl17yNGQxxSRKh/gRh8BF4F8PZwqxFMuY1adJQUul4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VSwRhQSXv9QWiEFckCYfWC2oFVElVmyNptjrnMzN67aT34zQUyfukLENmVOyv2yrfIFSymqdQKjYhtR6kCFVqiSRbZZ/M2md9WIYiYly7JKUmLK017RzxzHRasBVPeDzYYcCoyiBcqqqrFqQfGQm+gMkbQYknDBs3G1sYpJIsOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRqxtRkL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRqxtRkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732084340; x=1763620340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wDl17yNGQxxSRKh/gRh8BF4F8PZwqxFMuY1adJQUul4=;
  b=GRqxtRkL1Ng7XRMiRT8Q1RJ6ReUgErbWyzxKeaXUGCdygOTyHylPQ5hL
   9KiqvWLnIrlEsCqwTBcIM1iifMn+8576xMhl/3skx3uQMY56zB9gcnGuH
   XZ2Ot3vBdg9fGVgIXyjN5+UKXS2KO41j3+2CEPj8EIIfzc7pPOn9rDA7K
   QeoAX8AVGg3BWRwm63anCrKUyHy9tm/3vUnb+J+I7Q+2cw0ifQtlCCM8O
   +FqFtVnBTEJWiedjbxbc2lMNx1dL32jair6nlyhShFb2hSECsWlh70NiU
   EQ5lJJdcotH00u03Kvfdv2q6AkDzOOfj2sE6lBK0+t/qVl7SPwxDL32dq
   w==;
X-CSE-ConnectionGUID: FHg238nyTxmRAre9V9f/Lw==
X-CSE-MsgGUID: 5oknESaRQf+L74sU7IK9sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31523855"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31523855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 22:32:19 -0800
X-CSE-ConnectionGUID: Odqsl6UdQACpph05Zw4mHA==
X-CSE-MsgGUID: mh3Wb16TReiMpJYXBr5OzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="94274193"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2024 22:31:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDeFn-0000Wf-2N;
	Wed, 20 Nov 2024 06:31:55 +0000
Date: Wed, 20 Nov 2024 14:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1487/1487] vmlinux.o: warning: objtool:
 exc_nmi+0x7: call to sev_es_nmi_complete() leaves .noinstr.text section
Message-ID: <202411201407.qu7Hs8Ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cce003012298a00277187319a2527882a18278c1
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [1487/1487] Compiler: Add clang's PGO support for kernel.
config: x86_64-randconfig-013-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201407.qu7Hs8Ch-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201407.qu7Hs8Ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201407.qu7Hs8Ch-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: handle_bug+0x5: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: exc_nmi+0x7: call to sev_es_nmi_complete() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
