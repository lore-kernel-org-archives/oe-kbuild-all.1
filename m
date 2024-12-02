Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D681D86F1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733159902; cv=none; b=Ar7WUSc7UUVd9ByP9bSmX8ORLH7k9K8OnqeoRYKmCqjVzsQbTtQSW7EAzA2hWZNY4c5RzE7VOwzlgRkTgcHQGX1b14644BwZAtLdhmdXx8KsIdBSXMFBldtOTFtx7WIlzfBsrX2qcZrDlYCA2XapxOTVnLxemGeR3HykNg8mOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733159902; c=relaxed/simple;
	bh=/gJk0k1k127WSgyEmhSbJKvVtzWbpGaQFJowLWpKDCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DaFmfzeKxL4qWCaYSGys808WSXR5a+iXXZRPXgOi1Kjj6iuNWADHujuf129D8dUIrshMop4siwau1ygGswIdpVyQEyFP0QySWX0le4JZe4vhE9WmTZjt4JC++a957oZAJOqQxbZTPCrWL5Cg6Z7dqGN53RmE07VGGNI0nRX/nnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KskAbcoS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KskAbcoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733159900; x=1764695900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gJk0k1k127WSgyEmhSbJKvVtzWbpGaQFJowLWpKDCY=;
  b=KskAbcoSX0YuiGxB7IlY+7dTionBugPncgts5doNQ2Fc22kBm4f8PWNI
   IIv1824u3blgEpAddHV9bRbhvjWOP7ikC2voSMHqWKQgTu0cp5XmntoYK
   XgqDdUoyvYLHYsIzqhPYYOeprJlMjm8mX3TurAzXSAfH/UkF2hqoLhlws
   mfHlclJg4pq5C+YbSNe1HHDVShpzxQBTm8C9tAjVOFPu+Qcli83M4dSoK
   YpwawAsJCCvfYGOl8OpVNOPGkPWXmAYbek17jOy5B8qyTh3GWaBAX3IYy
   T4MfmMejnrAZUEh3itE1VZYmVVexQ9NPOaUtt9cK4FQTGDUQX6AE9s1fY
   w==;
X-CSE-ConnectionGUID: UAT0mzpJRGGSLZ2EPBs+VQ==
X-CSE-MsgGUID: ROo3bh7kTXe6zRZzhcmPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32701248"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="32701248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:18:15 -0800
X-CSE-ConnectionGUID: qwUgr/KESjeJXj0eydiWbg==
X-CSE-MsgGUID: L2BFIbCAR3adqUtihId4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="124103560"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2024 09:18:14 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIA3g-0002ep-1o;
	Mon, 02 Dec 2024 17:18:06 +0000
Date: Tue, 3 Dec 2024 01:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1268/1268]
 drivers/net/bonding/.tmp_bond_sysctl.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202412030109.jfpX4hN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   312efa97a54edf7e64f108312c4d8c6961a1abaf
commit: 0397c33121652647d544d4bcdceb9f2d868146af [1268/1268] anolis: bond: broadcast ARP or ND messages to all slaves
config: x86_64-buildonly-randconfig-004-20241103 (https://download.01.org/0day-ci/archive/20241203/202412030109.jfpX4hN8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030109.jfpX4hN8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030109.jfpX4hN8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/bonding/.tmp_bond_sysctl.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
