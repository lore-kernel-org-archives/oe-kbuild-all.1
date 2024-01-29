Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AFA51C4A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706569761; cv=none; b=GXQnCg3UBHGxKpmGHPzpG1HP5AyTnm5EY1y/3+jRSttemlObo4CdWy0Lkkndqxj64CBU6aDjEuyCQkdF3y5TLVrj1zurwYhYRB2S+PG/BIcQAjyUsxAyVMdjvwUpB/NLQ462u/Xpx+euYvi7eMk3lnq/WyeuGNa7ryr9LI7oFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706569761; c=relaxed/simple;
	bh=nPj/ro0ksn1VLOPxa48xPDwL3GLvdDIgEllRbUXnzJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CTc+e5hX8LCDlCsFPrp2d/kDu+eXTj9nUmlt9dVVYY3T9xScDia+pRQ5CJJPdSUUnU2y/ttE4Dt5aH9YZopZ5D2ScVzngOt17FvZJ4/PERLz/BENBMAuLKVOiIwFMlaWJVSU42jAzkGwff9Cau+4yIki99tXWEpmWvfRNWxmcIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czCGbONH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czCGbONH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706569760; x=1738105760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPj/ro0ksn1VLOPxa48xPDwL3GLvdDIgEllRbUXnzJ4=;
  b=czCGbONHk+9DvmutEd3PjWs88JsKOSZFYHuA6qZ1DIsCWmGVPBtg2stK
   C+I2HFdWI4rkTqgYXx6WhdKIhz0WrXB0ye7zGNusoSHzcZw/x2qJXioFB
   0EGaelwle7W9Lp2EQWJqNSpMMeTMNLMb/doU84gEFzEUr60uL8sGB7jUu
   YiFuN0BVI+yzW6BR49LKWr3chm8gBcAv3GejHe8VuwN38ssB4nKA06YiF
   x6huzdo40VMnIqVguSFtQVpVwQGmy/laMuYZlXQIdIVmbrOCRBRWQCrB+
   imTBgaXDWjyqu7G3+eNo+F9AGjJdginvv4NP4Mwe9E4FL6Xp4txH/JET1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10501758"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="10501758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 15:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907279868"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="907279868"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 15:09:17 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUakd-0004hW-0d;
	Mon, 29 Jan 2024 23:09:15 +0000
Date: Tue, 30 Jan 2024 07:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 1016/2825] make[2]: ***
 kselftest/livepatch/test_modules: No such file or directory.  Stop.
Message-ID: <202401300736.GkSZoSrA-lkp@intel.com>
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
commit: c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7 [1016/2825] livepatch: Move tests from lib/livepatch to selftests/livepatch
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300736.GkSZoSrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300736.GkSZoSrA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** kselftest/livepatch/test_modules: No such file or directory.  Stop.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
