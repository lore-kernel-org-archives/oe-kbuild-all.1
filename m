Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD62C868
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 01:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705800242; cv=none; b=ORy6iuO5xLEYDTgNjV6rE3E7yF7bvdajpvi7lyEgZf9nAMf14ysf0GtTi7DTVauvKuO/h80Fp5QH2yFIiU/IOt1BYyqFjvomwkLfr3izVztYLYZFt58j94q12KodTcGgfFkKv48NmgYIjWjLJS5HJBjl7ouS4fRWN4swhWGugmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705800242; c=relaxed/simple;
	bh=eB1awdC6TwNkBJDZttqoHeVLA+tmbmISCQnfwydMTfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkNXyMtTVEhwURr83LGQgQEUJmILYvVTS19Jsszb2EaZ3UduWJzSANAiE4hTosd3MHD+zg1pZiNqEPFvPlCJeXMSAJiXbSAN5ccUwaUNPbb5qgtvsQKsUadYBhMf+y+ndKbqWKArXP8qG9G5RXM3nAymqQNkcq0yHCtelkewdZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0j2umzn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0j2umzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705800241; x=1737336241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eB1awdC6TwNkBJDZttqoHeVLA+tmbmISCQnfwydMTfs=;
  b=i0j2umznjP7yRCoS7r7WbqnmV/tomIJgUP4e8HLzTGtnxNzFliXlV3mN
   tdR/w7UIfNKzCuecQwRUgOufj5o+uSIOiSFEjd7sNzgMz2p/tJH5RJrp7
   Lyj+x9jTu+kYTUQASSvBWPVOplKMYBa60+OPyXSUdswUZqIh+k0ybDU6p
   1NdANGPTC7NbVVAop2WmC+tHFwmncfP1JzQyWHZCV27sp9WrEGCNeVB61
   riFBAv8Vd9ZsscuN+0P8HHNCugejxmV7KsPYsH/az4AKVMBZGpgYvrRYk
   qpmPRY4a8jQf+e3qCx3JIAp3zmYhUoBWp+ZXF5gTnJV/49gGLgtfvpnbP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="7746810"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="7746810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 17:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="909552"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2024 17:23:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRMZ1-0005Zo-31;
	Sun, 21 Jan 2024 01:23:55 +0000
Date: Sun, 21 Jan 2024 09:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20947/21561]
 net/netfilter/nf_nat_proto.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202401210935.qhp6ge5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 83abe3a3b85762720192809ac8695ff9255cfd23 [20947/21561] netfilter: nat: remove csum_recalc hook
config: x86_64-buildonly-randconfig-004-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210935.qhp6ge5y-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210935.qhp6ge5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210935.qhp6ge5y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/nf_nat_proto.c:56:6: warning: no previous prototype for function 'nf_nat_csum_recalc' [-Wmissing-prototypes]
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         |      ^
   net/netfilter/nf_nat_proto.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | void nf_nat_csum_recalc(struct sk_buff *skb,
         | ^
         | static 
   1 warning generated.
>> net/netfilter/nf_nat_proto.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
