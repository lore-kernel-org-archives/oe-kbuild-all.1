Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D01DD554
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728322030; cv=none; b=lxUdpKM+hJt5vSu/R8Rf4QS7eoyowAnVh7EDYNKwK+qfkIOkeHtWl2cWm1RnZpXhrpQWkhsk57X3yPwHzenLW+39HQTP+mx6tv1Ruv/91ce+LxIdBkYqrt6pS/xvzGY301buXM+Xriy2M6Odomx7yx3u1TJJlLdmCQ6gYJ3NwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728322030; c=relaxed/simple;
	bh=+WvRnY25Cj8+gbBEBC9pYiqv8JwwvpUMOyujug7nfGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jHztd64owYLRzv0O8rWF5eppL0QjbwpOx/MCtvgOcBYEOd0Qsn4wNIRdjLgjNiIQM7YlEdvb4jyMWg8ucP5PkGDkBYrN5B8sLLgrCJRYKhrgUBnLuiQ1fZKiDc7+y0FZUX9mHBM1peTPaxbi6Ra4aszikzA7FCjDLhDeYYoBXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LESILC8L; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LESILC8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728322028; x=1759858028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+WvRnY25Cj8+gbBEBC9pYiqv8JwwvpUMOyujug7nfGs=;
  b=LESILC8L/vsoa6f20jUbzjCUcMFFJnhXEEB56mIXUfKb9vG+VjyunX6T
   zuCniM1jKTPkmPQMtHlOZxNnw7cDOGY331STFa6mrDyRjTUPNLtO5EUTM
   sA8mRiEuTRnlSman4LJCt8Kxe3z38cmBC+fraSmQ4eEqY9I6WBhb6iq0a
   Ny8rcgyDdsl0582ySZ282HBiaonWcOlTXJlM0+67imCSvpt0uW+bBx6l0
   mPPefeFFvCdjN2szD/aguYfnOuUU4xKyPVw8Xb1dvOB0xlNMcCkJ8cf3F
   3c0KGEY4VO1foleEqfAQuxhK+t8eEvp6CPZusneV/vR/+35M4m2OL7+2m
   A==;
X-CSE-ConnectionGUID: iJdvnQKNR7a9jcQNV8xFKQ==
X-CSE-MsgGUID: XFcLUjZjSwimxmIbIiTxcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="52886209"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="52886209"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 10:27:07 -0700
X-CSE-ConnectionGUID: Dk0BXzrlRMy+U81cgciVCw==
X-CSE-MsgGUID: CJukmSEcRdSZ4E9vsUetsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="80335789"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2024 10:27:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxrVf-0005Jo-39;
	Mon, 07 Oct 2024 17:27:03 +0000
Date: Tue, 8 Oct 2024 01:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9625/23811]
 drivers/soundwire/bus_type.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202410080128.3Ornv3xR-lkp@intel.com>
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
commit: fe38a6fef0e5f4ba9c21d3e26381987519b7edc7 [9625/23811] soundwire: fix regmap dependencies and align with other serial links
config: x86_64-buildonly-randconfig-003-20240925 (https://download.01.org/0day-ci/archive/20241008/202410080128.3Ornv3xR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080128.3Ornv3xR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080128.3Ornv3xR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/bus_type.o: warning: objtool: missing symbol for section .init.text
--
>> drivers/soundwire/intel.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
