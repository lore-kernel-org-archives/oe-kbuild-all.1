Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8C32186
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 19:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzJGUYwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696967829; x=1728503829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q2XozoQNjgaofvTDqtOPfUOJsrZx9WlFs+ibZjPw5HA=;
  b=lzJGUYwfYlVoOPHsc0XjfkFzSjlPODMVGPVaKt/ziEe93hyphUCcPL9z
   pZyo5Mf/IHnQiow+voWoNas2EIGdTaOfS3A8n4tW4sE4uTCh3SS8/WbuG
   qkVZBBtvf0tHP7D0r42PauSbib70WLq0q2MDpnyLuL5X3NH5HK8xvK2zT
   NRQ3eSgWOwxULWDS4iDpu1SQdouNUvayvnw/Z2p92FLeUhaSC7kofrEjG
   2ERMU1qune3FsoZh7pDqTnrbqI4CbMo1TX0kCfwPWomVM+YDpVZ2yOVY0
   hJvDbLLuHfYTCeYocSEtuUcwFxmV+4baa8ov4nWXnq7HAVkyalyaQNraB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470759178"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="470759178"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 12:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823896409"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="823896409"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 12:57:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqIqn-00010W-0d;
	Tue, 10 Oct 2023 19:57:05 +0000
Date: Wed, 11 Oct 2023 03:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6086/11375] fs/fuse/fuse.o: warning:
 objtool: fuse_rename2+0x18a5: stack state mismatch: reg1[14]=-2-32
 reg2[14]=-2-152
Message-ID: <202310110316.32tddNpJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   368b752997c762727adf7b15720b5c4ffadcb155
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [6086/11375] ANDROID: fuse-bpf v1.1
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231011/202310110316.32tddNpJ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110316.32tddNpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110316.32tddNpJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/fuse.o: warning: objtool: fuse_rename2+0x18a5: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152
>> fs/fuse/fuse.o: warning: objtool: fuse_file_read_iter+0xc3e: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152
>> fs/fuse/fuse.o: warning: objtool: fuse_file_write_iter+0xfc8: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152
>> fs/fuse/fuse.o: warning: objtool: fuse_fsync+0xa29: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152
>> fs/fuse/fuse.o: warning: objtool: fuse_xattr_get+0x8bc: stack state mismatch: reg1[14]=-2-32 reg2[14]=-2-152

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
