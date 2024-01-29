Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544E156967
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706564179; cv=none; b=okY3yW+HTEnagS1im9f4mt8+2jcir96cut3fW2+lKEaDUtobo5uT5AAIEX1HicvqMKzEM9oKbGJukxkbkQnBtdEq/yTK9ig5EN8jRiPmP6z3CZcgGqPNhZ4v2e/gFC2apkXq6FY3AU4D2CLvNII7E5DL4HPSuIbR9EccrZep4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706564179; c=relaxed/simple;
	bh=Rwm4829oiO1fm+Bcux4/wG2go5hStDsDFYbpzw+3wmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfkaf6miMsSami3JqP4eJ9vN/yWC6zS3k/8N8HWxlGqVQc8nLpsKVDXk2keinNxnPnCZbB2Dc9bry3rwum/kkcOMiCaiO05X716kpQtxRmrjVjrRO4w5IUNzBVUGRpeDdZC4NPDoj+q0Kgs7uFVvvuZ3/qzcP5eLsM+d0Cpiesg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky1ri5/s; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky1ri5/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706564177; x=1738100177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rwm4829oiO1fm+Bcux4/wG2go5hStDsDFYbpzw+3wmo=;
  b=ky1ri5/sGRCmD1X/4+NRiTYanGUIL+wzo/TvFep5w6eZKEbcGQB43exg
   ZIeIBAmUgnVklvgpVEwDJeaLMEiUwuKXg+Rodf60Y0b3o/v4Ye5wcRw2Q
   XDhl2dW4QNNfYd+NmCmsS8/gtbMKF3k+IhltiKxpwHqeB6hCWJSCC9J9l
   2c/LKA9byKkX2FSpA+HiXrYcKSdHMrVlfzbQAUzpNIUC+ax0ByytiO2KV
   ntMXYdkYKkYxHcTVbau7ao8CFei3HvcGyaYPqRscKAj23B7HyHqmJAsDa
   qFJ/oukRPFeYo3ZCX8S31GI+x8p2tDs925992kwcdcuJAzTwbWtTgbluS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467350702"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="467350702"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 13:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="1119045838"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="1119045838"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jan 2024 13:36:15 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUZIb-0004eC-1E;
	Mon, 29 Jan 2024 21:36:13 +0000
Date: Tue, 30 Jan 2024 05:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kui-Feng Lee <thinker.li@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 1465/2825]
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:557:13: warning:
 variable 'r' set but not used
Message-ID: <202401300557.z5vzn8FM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   596764183be8ebb13352b281a442a1f1151c9b06
commit: 0253e0590e2dc46996534371d56b5297099aed4e [1465/2825] selftests/bpf: test case for register_bpf_struct_ops().
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300557.z5vzn8FM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300557.z5vzn8FM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c: In function 'bpf_dummy_reg':
>> tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c:557:13: warning: variable 'r' set but not used [-Wunused-but-set-variable]
     557 |         int r;
         |             ^


vim +/r +557 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c

   553	
   554	static int bpf_dummy_reg(void *kdata)
   555	{
   556		struct bpf_testmod_ops *ops = kdata;
 > 557		int r;
   558	
   559		r = ops->test_2(4, 3);
   560	
   561		return 0;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
