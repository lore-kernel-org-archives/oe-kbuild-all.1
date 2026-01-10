Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2D23370F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768032583; cv=none; b=EkfYXeMcclS36fj7Z/EkJaYIbOPv27Su5hAqa4j1lIkcDnfXAEFtuKd3KoQBQcP/11qvv8x314FTh0DuzuHTWHK3Xw5ObUxiCBEVM1VF7cd9GfbC95vdy3aWIppBbIPJ0Y6RG0cNHK/CWpzmcmsOiD/JgTZOeYLxzAda5oxyOiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768032583; c=relaxed/simple;
	bh=yQ4gtDeZt/h8wzhB0rseWJnpIvT7tG/KEwgprYc6AlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mjjgBhy6LGdGz/iganZDNNVE93i0Gt45dzQPP1tg/rJLbqbrvfYYiiDnPHEa6TAHor0yS3FGhLNo7v+wPY5Vh5Z5+9Q84EVUATtnEeselfa8RV6Z0aAjP9Ie5s8c3gJ4Zq0inUL530jip4/0PP7VRvOjebjb61AWJqEXJE8tokM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9yaOYC0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9yaOYC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768032580; x=1799568580;
  h=date:from:to:cc:subject:message-id;
  bh=yQ4gtDeZt/h8wzhB0rseWJnpIvT7tG/KEwgprYc6AlA=;
  b=n9yaOYC0aG/bJh55wEuc5dFqUk+K80zg1eEFFNc5oAShYcVhYZCUUjby
   TfPx4QH1iLw7b9MGOO4DzSQRU16ldP6P+GDhxFc9i0/xwVRSeccMfyDl5
   qUIWl4O7Pk0+PPgBJV+YH1Snvnx4L8gD+9ilQpmGG98JKX0VAnHVcIVTh
   I2R3QOsrSQC+P8ruVYQIxSCX5JrnT5CvOGl4cSbM67+iN00rvNyf6/FYz
   ISYotlsFumlhuz4ZmN9+T5odWV8Y8kB1RT+c0mtZXf05tpBI6Hx5PrejW
   RTR5tRdj7pcf3X3etUn+MgDfIRzSrb+WqvOf9RBKwwa9vs8qwzpXISPa1
   g==;
X-CSE-ConnectionGUID: g3BzJX86SASVTV/r3eOZlA==
X-CSE-MsgGUID: JKSItHN9T2aifl2EiltZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69328422"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69328422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 00:09:40 -0800
X-CSE-ConnectionGUID: VO7r0p94TfSkHC3b7fPgSQ==
X-CSE-MsgGUID: Tteym5ALQrGfsZVaAW3uyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204080889"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2026 00:09:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veU2S-000000008Rc-2q0b;
	Sat, 10 Jan 2026 08:09:36 +0000
Date: Sat, 10 Jan 2026 16:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 3/3] fs/fuse/passthrough.c:33:17:
 error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202601101642.XLnWjCi5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   7a28048e32eb538d7283b6cea15f99aca351d91f
commit: 7a28048e32eb538d7283b6cea15f99aca351d91f [3/3] backing_file: store user_path_file
config: sparc64-randconfig-001-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101642.XLnWjCi5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101642.XLnWjCi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101642.XLnWjCi5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/passthrough.c:33:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |         size_t count = iov_iter_count(iter);
         |                        ^
   fs/fuse/passthrough.c:60:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |         size_t count = iov_iter_count(iter);
         |                        ^
   2 errors generated.


vim +/iov_iter_count +33 fs/fuse/passthrough.c

57e1176e608667 Amir Goldstein 2023-11-22  27  
57e1176e608667 Amir Goldstein 2023-11-22  28  ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *iter)
57e1176e608667 Amir Goldstein 2023-11-22  29  {
57e1176e608667 Amir Goldstein 2023-11-22  30  	struct file *file = iocb->ki_filp;
57e1176e608667 Amir Goldstein 2023-11-22  31  	struct fuse_file *ff = file->private_data;
57e1176e608667 Amir Goldstein 2023-11-22  32  	struct file *backing_file = fuse_file_passthrough(ff);
57e1176e608667 Amir Goldstein 2023-11-22 @33  	size_t count = iov_iter_count(iter);
57e1176e608667 Amir Goldstein 2023-11-22  34  	ssize_t ret;
57e1176e608667 Amir Goldstein 2023-11-22  35  	struct backing_file_ctx ctx = {
57e1176e608667 Amir Goldstein 2023-11-22  36  		.cred = ff->cred,
57e1176e608667 Amir Goldstein 2023-11-22  37  		.accessed = fuse_file_accessed,
57e1176e608667 Amir Goldstein 2023-11-22  38  	};
57e1176e608667 Amir Goldstein 2023-11-22  39  
57e1176e608667 Amir Goldstein 2023-11-22  40  
57e1176e608667 Amir Goldstein 2023-11-22  41  	pr_debug("%s: backing_file=0x%p, pos=%lld, len=%zu\n", __func__,
57e1176e608667 Amir Goldstein 2023-11-22  42  		 backing_file, iocb->ki_pos, count);
57e1176e608667 Amir Goldstein 2023-11-22  43  
57e1176e608667 Amir Goldstein 2023-11-22  44  	if (!count)
57e1176e608667 Amir Goldstein 2023-11-22  45  		return 0;
57e1176e608667 Amir Goldstein 2023-11-22  46  
57e1176e608667 Amir Goldstein 2023-11-22  47  	ret = backing_file_read_iter(backing_file, iter, iocb, iocb->ki_flags,
57e1176e608667 Amir Goldstein 2023-11-22  48  				     &ctx);
57e1176e608667 Amir Goldstein 2023-11-22  49  
57e1176e608667 Amir Goldstein 2023-11-22  50  	return ret;
57e1176e608667 Amir Goldstein 2023-11-22  51  }
57e1176e608667 Amir Goldstein 2023-11-22  52  

:::::: The code at line 33 was first introduced by commit
:::::: 57e1176e6086673d31bf0a0dc58e144c8e65e589 fuse: implement read/write passthrough

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
