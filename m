Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1B1188926
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 01:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854802; cv=none; b=k4TG1Vk1YRcEVH4p4gB/wV7Cv4O+IJTbIuK0Ig7HoIZ3xq0lRtYMZkprT3Qe+HVKpWT9tCHHFeorDCy2ERaNl6z5XzsETz91j5aQkea2Fr7ytb5XSKpA8PoSMDfgBhk9lECQHGSzbhAQ8sc6oBeoAc8xBL2RBRFWmqG6ts9Q66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854802; c=relaxed/simple;
	bh=2V5bpeF+cuh4G456lk5bOMx/+OzW4e2N7TF91nm03ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIhPBjW1D7AKZi4qTnjDAFwbRxHiT/5My1zhV8Ak1gRmwRzSor2ABgys8whN3TP/Sj5QP/ipO17LjB8sJAw9qYeHqMh9aCiT2MrXu9sejyL+k9X516FGGLJBxAn09dExZbu/E4JmnleUp9ETodHJhpmGTs7l4An3htiCGj9jUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0vNgOWK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0vNgOWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730854801; x=1762390801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2V5bpeF+cuh4G456lk5bOMx/+OzW4e2N7TF91nm03ZI=;
  b=K0vNgOWKu/EJcWKpSPpv0IDSnJMdjwVO5nSbzq7xYYIi3ZLSUcEyO02I
   Y9IjAdE15GXLnCx3OCjSw8/CfEyxIfxOdcW67ym4qC8j8vHpuTVuLfUOo
   MwGN1PX9n1t4HBpm1xjZXS+KoyyGLTkmn0F0tDwucg/SK+7y7iieUlxTJ
   W4A6KEAE1f286eLge6D+fJNe4mT/zBClUkztNfSuVk3APQkDWYCFU+i1d
   mPB0xqn+/kZjSYTS7LuKhKepEQYnpKnLJWj2fhIJUaHbk8YRTST52oOr7
   nie0otIOA17Ss9XoDBFqY46Bb/JL/fSukdFi/rJo3i1OfSQsjdYr+2vqC
   w==;
X-CSE-ConnectionGUID: dhz4LMCeQSOGpQ89s4OQbA==
X-CSE-MsgGUID: EFFNF3IIStm0bQ4NU1XllQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30061065"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30061065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:59:58 -0800
X-CSE-ConnectionGUID: rwgJCLIsThqEOq3qP5ZK7w==
X-CSE-MsgGUID: FYNrPxjxSl2KYyqKX3uIsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88803326"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 16:59:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8UOm-000mfn-27;
	Wed, 06 Nov 2024 00:59:52 +0000
Date: Wed, 6 Nov 2024 08:59:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225]
 drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411060820.ye1y82tJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 4d516770f81434cde260d33430626e3880b9902e [1225/1225] intel_th: msu-sink: An example msu buffer "sink"
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241106/202411060820.ye1y82tJ-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060820.ye1y82tJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060820.ye1y82tJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/intel_th/msu-sink.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
