Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4662718A6D9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728248804; cv=none; b=k4O879oVGaJDNOS3FsqFjPJR4w2yj8sLIIfJYYLfhX6KbzCLs5yS8xKplJUi+14XRkDyOgATqAeotj64XHuxv31nbTTghmcnohx/pAPIJZvhuL/LQW452bfTtftyh7IF8ys0wRedhntiyZfiWiUms4E9V2VEwHuFd0eD1r380cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728248804; c=relaxed/simple;
	bh=Bi1LT2Bd+3MWrF1VRoXCsIedCgB/+52tGRBUX9aK8FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bit25LjSBK46cndtVpmMr63ibwrm3mW7IfKloz5hKPhIaiDqyfun11mXuTzlh4mx34IwBLoZJ462ASdSFKsgc83gXT5CZ1/H8b4hNAD481LqMiQE1ChjAOsoo6x/qzYPfi3kOfO8iTtVbz/q/8Kq8WbC28Flno6FzUXhJAMIpzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGz20mg3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGz20mg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728248802; x=1759784802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bi1LT2Bd+3MWrF1VRoXCsIedCgB/+52tGRBUX9aK8FY=;
  b=aGz20mg38CP20cXYzFEfmTiK1udEwj2AR7OPxGCDSnkwAdd33oRd5o1A
   9gPpq8WRzSJG++hWY0WYpMftyWEHTbuvugGviSXdzowNHa+qkahET1agj
   mtP3xga/2Py8MmQ8dUV+dOrfQjzHYjDwP3SodmtvAXOg6uzkOAh8BDhsM
   aeqHge+/CDcuOLOgjMJW8UYTH1CsIJ8KqhIGrbHBfBdbEAyXT40IeygCU
   KCIg0pw7232YtbB+6ZbRZ/Lrm9qrk+4Db1rzDXDYNQEnijAGj4BKnxO6z
   /kyUexgFGeiJwsHCIEabIwa2Ih/SP1TTEiMP2/t/htknmzVL14UNiNIzl
   w==;
X-CSE-ConnectionGUID: De1tUVFDRJOatdF0tetSqw==
X-CSE-MsgGUID: Ahyi4YZ6Spq2Ssq2abtCCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="44921797"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="44921797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 14:06:41 -0700
X-CSE-ConnectionGUID: i6bgvwZHTaul6B2+LqdXUw==
X-CSE-MsgGUID: cqQpGv0qQgSQVLrO9ZnqcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="76117844"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Oct 2024 14:06:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxYSc-0004LA-0p;
	Sun, 06 Oct 2024 21:06:38 +0000
Date: Mon, 7 Oct 2024 05:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8452/23811] kernel/ktask.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202410070443.gzxmSrdz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: c48676ef6b6f9cb8497d6264ae9ff71b87630337 [8452/23811] ktask: multithread CPU-intensive kernel work
config: x86_64-buildonly-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20241007/202410070443.gzxmSrdz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410070443.gzxmSrdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410070443.gzxmSrdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/ktask.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
