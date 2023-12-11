Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B71168C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 03:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz6mxbfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702267130; x=1733803130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9bYxsjkRfsfzsk0ZmO4aAhp85+v88UE44sJd2ZLsHo=;
  b=Lz6mxbfxIvQFpwqfhu2PlLrp4fruTRPvK0awCaFHlyn3l7cMO35A/Ijh
   uWKTpzphcvs5+Ee6D4dYGcpHG9iFyVMD9XHS3PKwGL0zqyxh52wIThsFg
   wtkH5G7ovH49GntXJpne4rwSQUqS847TH8sjVoetxPyDDbva824MpM369
   cpyAJYc6WGrKrpijTxzZM5hxj6I6QS9zffgDSIueUeYGlrq8N3Yb7JBHA
   09D6wNCL/UXntJx9WPaktq42iwFdYC0WrKrGbv/7SEAKEzQOtKF50N1E3
   +jsAVwx15rQ9YexRfSfjTaAOtYWOtL/9Axno6NWt+m8SdDZN9xPH/yrDO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="458900857"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="458900857"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 19:58:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843341028"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="843341028"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2023 19:58:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCXRO-000HcL-1x;
	Mon, 11 Dec 2023 03:58:46 +0000
Date: Mon, 11 Dec 2023 11:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:start-write-safe 4/8] fs/splice.c:1283:9: error:
 conflicting types for 'splice_file_to_pipe'; have 'ssize_t(struct file *,
 struct pipe_inode_info *, loff_t *, size_t,  unsigned int)' {aka 'int(struct
 file *, struct pipe_inode_info *, long long int *, unsigned int,  unsigned
 in...
Message-ID: <202312111144.rzUfUWhZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux start-write-safe
head:   510ead444588b4eb211d3c6670c897b83ed90d8b
commit: 38e5b41d49a9b3c33ff60348fcd3b908852c96d7 [4/8] splice: return type ssize_t from all helpers
config: i386-randconfig-011-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111144.rzUfUWhZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111144.rzUfUWhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111144.rzUfUWhZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/splice.c:1283:9: error: conflicting types for 'splice_file_to_pipe'; have 'ssize_t(struct file *, struct pipe_inode_info *, loff_t *, size_t,  unsigned int)' {aka 'int(struct file *, struct pipe_inode_info *, long long int *, unsigned int,  unsigned int)'}
    1283 | ssize_t splice_file_to_pipe(struct file *in,
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from fs/splice.c:40:
   fs/internal.h:244:6: note: previous declaration of 'splice_file_to_pipe' with type 'long int(struct file *, struct pipe_inode_info *, loff_t *, size_t,  unsigned int)' {aka 'long int(struct file *, struct pipe_inode_info *, long long int *, unsigned int,  unsigned int)'}
     244 | long splice_file_to_pipe(struct file *in,
         |      ^~~~~~~~~~~~~~~~~~~


vim +1283 fs/splice.c

  1278	
  1279	static int splice_pipe_to_pipe(struct pipe_inode_info *ipipe,
  1280				       struct pipe_inode_info *opipe,
  1281				       size_t len, unsigned int flags);
  1282	
> 1283	ssize_t splice_file_to_pipe(struct file *in,
  1284				    struct pipe_inode_info *opipe,
  1285				    loff_t *offset,
  1286				    size_t len, unsigned int flags)
  1287	{
  1288		ssize_t ret;
  1289	
  1290		pipe_lock(opipe);
  1291		ret = wait_for_space(opipe, flags);
  1292		if (!ret)
  1293			ret = do_splice_read(in, offset, opipe, len, flags);
  1294		pipe_unlock(opipe);
  1295		if (ret > 0)
  1296			wakeup_pipe_readers(opipe);
  1297		return ret;
  1298	}
  1299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
