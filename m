Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB81DD525
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 22:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739918713; cv=none; b=bHy2bi9JhmN+6NNwSsDkERcTalTrNEblX6LJX40mL0pPFGnWxGC3moxDbyuJDv0gP2nQt3vTx5N/ofoYFyFYQCY+wjIf+CrSqk/VhMe96cE2Rw3ws2IOquT56jZ87r3h1dUJ6ItfgYrOrZyQo6QkfJHJBjXFVyFK9BrmlBGgr/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739918713; c=relaxed/simple;
	bh=6efEO2nrQ2MOqNM5oOyJMCMJgjOmJd+nlgsubRlMWA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BgtTOhgawS8tBU3EzvhF1itKvvXwzYwWU75UtJtTx2Bk44s8ehGwnR1SYdSxxivFqIs2TsDlITLOHC1gGnHU12/AMeAIsOB9lgJ5w5hEZOOAI3+8hoNXcSMRdOPgquhdJpTgSL9IHLcNsdMFSF5X9I10wZWbNnYFXbtNbPt7rlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/EBKLZY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/EBKLZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739918711; x=1771454711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6efEO2nrQ2MOqNM5oOyJMCMJgjOmJd+nlgsubRlMWA0=;
  b=J/EBKLZYoN4J7wb+av6ESnM0yNBS7e2RU+W38TJdMLtZVz/LaWQxwoR1
   qE0GNywDTLRbiSCKCi7U7IEoxKXPlXnYije8dT/bo3+YYyCXgo0ON0M/c
   JvvkGpvxeRSiZYLjVtsU9TPJyVXLeNTFpiDmX9UHzHtFRmjDSeNsak91d
   LfMUqwEw+8pEg8pgE8a4hu0dJyVrvB6+3uH7kdj9PdDpTXvTQsOFZ4vDR
   4D8KTw0nmaHbVRvDiZR2ETgI3NsED275ViRT6jXy7la2mdpTZXIBguMYZ
   MbL3afPtmkAlRPU2kHahoGe88KEqr/wqYumA0pnGn0rKUdb+okDzanrEI
   Q==;
X-CSE-ConnectionGUID: tJB87ZW2Sj2Tozk7isWDrQ==
X-CSE-MsgGUID: W4us4uMsQM6SY5LYiXDAFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40892562"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40892562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 14:45:10 -0800
X-CSE-ConnectionGUID: hVKyw9FfQJSsRCyuZXHKXg==
X-CSE-MsgGUID: C0PpOovLSK2drzTkfZ+d7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115429476"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Feb 2025 14:45:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkWKx-0000vw-1J;
	Tue, 18 Feb 2025 22:45:07 +0000
Date: Wed, 19 Feb 2025 06:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1425/1425] mm/.tmp_vmacache.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202502190616.pLUznc1D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   57a701dd279b97835292712939caf0cde8ad3dda
commit: ddbf369c0a33924f76d092985bd20d9310f43d7f [1425/1425] mm, vmacache: hash addresses based on pmd
config: x86_64-buildonly-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190616.pLUznc1D-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190616.pLUznc1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190616.pLUznc1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/.tmp_vmacache.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
