Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4B011713
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 01:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728522040; cv=none; b=FR6LpOXWlMoVz/I0Kt1BmGqfIpJkrVkyP0F6V+PpFKjw4U3wfUd9127Is8U6z9YGiU6z4kI9GTA4QHkttNqdZOGtd7rT/aHyHu9WbEVoOzqL/2Gk6JCqFD2PeSk8ffRKE5CJFOPyygLcUE0uFl5AkN86W+RneYm883+/FZr+Ct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728522040; c=relaxed/simple;
	bh=yz/JtdMECZxkOYrv2pkKqBUj4FBR2aneNp7uN5wH5PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wit73rJbX/LfGlrzZYREdTmmGi170EDQbhSQrNlgyMMbiaQQryC73Fm/pOc5RbtpDY7sqlMcw/xY/QoSHbbTBppoeOnr42pjxbFiqW4G3ElPY6EEOAcE7oAUgM0hlrd8s/aX6gUfPAaU74GePSgjgwgia0OM6vAX1UNnC2qBM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eg4oOA3J; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eg4oOA3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728522039; x=1760058039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yz/JtdMECZxkOYrv2pkKqBUj4FBR2aneNp7uN5wH5PQ=;
  b=Eg4oOA3JBdggHUV76Y7z+mowQhXoJVawa54eFV00PsUO7N00mTuwgtpA
   35O8YORbU7KQe9wa4orycAdQ7ArJtFu3QgZpMOOjo9YfJVQVKjk8gFs0L
   NPOTn9pztUiNqAbyUGofOYkJAmSKC1rnLBMdAwDMFvX5fNXuuhBmbSRuH
   eN0WPl91jk7n8XyY6fttOCd7+7NapOsL3+nphp4dO4NRsjBNaqf3y4fh6
   agBlD6fnC5a6c0LiLuTL0pIEqjPFMBDwtKdLIfoxPqeWk2yOfZjBap2qe
   /9zsaMMiPWVmnOJMQsKqJg79hZ+KPAI6xOudFSmpM6mYbX5/564V4aTVQ
   g==;
X-CSE-ConnectionGUID: n2z2eF3qQ1C+vZu18PUG0A==
X-CSE-MsgGUID: sPB/JBKAQ/+gygi2G5kzNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38439871"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="38439871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 18:00:38 -0700
X-CSE-ConnectionGUID: ulRQSuX1R/+xDm1fZ9vkcw==
X-CSE-MsgGUID: gnMkfwaCTd+ghZOUT6wW9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="76087160"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Oct 2024 18:00:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syhXe-0009zm-2y;
	Thu, 10 Oct 2024 01:00:34 +0000
Date: Thu, 10 Oct 2024 08:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4855/30000] fs/ntfs3/frecord.o: warning:
 objtool: .text.unlikely: unexpected end of section
Message-ID: <202410100857.PsMQ97VM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c9c7afae6802fd2282529d80c0f808360f7b654a
commit: c213d417e466b7a7d9e02939bb67fcf5d82a3f2f [4855/30000] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
config: x86_64-buildonly-randconfig-004-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100857.PsMQ97VM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100857.PsMQ97VM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100857.PsMQ97VM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/frecord.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
