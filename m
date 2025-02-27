Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE541AA1E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 23:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740700772; cv=none; b=VOV2WUxX+2bjxhPtgQVINjuPtGp78CQwg01DjM9x6EywG4hIRk/gbextDlO4F3RShJwQniOlqhEstp4Cxp4oERxd6DQjrKLD4dPBngYNDnc8NPv9ItXJLpcTwFaXtGHHd1UUX02AnS6P/a4P97wx9LTplGRSuoZDMG4A62J0juw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740700772; c=relaxed/simple;
	bh=OG/rUVfr5uqFWscE5apZTGJfSKiVeL+Lq6nA+9ON9Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ue5RrpezRqwommoULhowo5wUXudeCXaQ+z+7cNefJG+IouQho62ivOkaBCJgs28ALHeE9OiXy4jNW5lEM5VmyNDKeVaFhocOd9dOP4uEtPqa1vvWnS5RFMuwBZb5S/qw2+NDH8mUHVN3WEPuTxkll+5awdhNKFkNVxwzZYkE/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kn0VjqUn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kn0VjqUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740700771; x=1772236771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OG/rUVfr5uqFWscE5apZTGJfSKiVeL+Lq6nA+9ON9Ls=;
  b=kn0VjqUndDWy1GF4//dxXq3sfYpxQXPAPh8BZWR/sSLcPzwzo1BCIQ9w
   hW0MoGwcc7CAVvUwyGwSxiSsBcJjKYi5v6ydwFLFV/XO1CmjwE5QN+VMh
   3XeL5XHzjnvGlfEcKJQGSIvVVWRbYGAHnBs6Ce2S9Cm0WK4zHFp0oeDau
   qt89a/JmWKkHehL1H7KuXkv3XCo1R71zQtXxjto4AJymOyFJPr4MKGFDD
   HfUlsoHC5uq5bmxm28u80lKxAthtYi7nqAz2iw15sr8LsAyKoa2nyFmHY
   BWT3XCJAkxlw1lyDo3D57D2alSjvJB+K+ls6NUGpPJz4hdmq9P52B86FR
   w==;
X-CSE-ConnectionGUID: 9VAa93i6RtiOFJM4oklpLg==
X-CSE-MsgGUID: 2HbsQ7ykTrq3JMakI4iUBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="51822778"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="51822778"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 15:59:31 -0800
X-CSE-ConnectionGUID: 6C57uOMEQoiaCcrzOqFgtQ==
X-CSE-MsgGUID: 7SRxnnyURLemN3UMo796Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148099554"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2025 15:59:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnnmp-000ECw-02;
	Thu, 27 Feb 2025 23:59:27 +0000
Date: Fri, 28 Feb 2025 07:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 38/44] ERROR: modpost: "nfsd_handle_dir_event"
 [fs/nfsd/nfsd.ko] undefined!
Message-ID: <202502280714.CfLTRWPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   26e709733842cb3740ca8425ff551325a9b63312
commit: b6bcd4f57e6628282e98d49ef2161e3faee53451 [38/44] nfsd: add notification handlers for dir events
config: x86_64-buildonly-randconfig-003-20250228 (https://download.01.org/0day-ci/archive/20250228/202502280714.CfLTRWPJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280714.CfLTRWPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280714.CfLTRWPJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "nfsd_handle_dir_event" [fs/nfsd/nfsd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
