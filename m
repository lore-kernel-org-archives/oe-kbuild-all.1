Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440374A0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 05:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023864; cv=none; b=pUs3yT1XAvW6qYzWIn2iKcVsoGPAju67JhU1Uyzh1mwvK/VV8nEUb7szQEbFSAm3HD9DivFF8xLD1g1bhRptzWgVjFpmtG4vTkAQOeoiNl0Z0nTDSfE9puH2LHRKijuQy3N6E2cLgWkUl8PcnW+w4ea6zOgj3Dh0QI7PYwQf8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023864; c=relaxed/simple;
	bh=rTnoVftZAE7F6YEzgB9eN5PQGKccfDW3wV8VelBOiA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MXDC7XuS0mThOnQH6hI8GOAyWAHxNa6vUtgmThlEcc3U2+dvy62L93fhYpmnXHHoBn/dfi1wERynZAPbqZ/YEcI7/ucvaCDzvlFa0hkaRTSqEgu5d8ESk71PKQC0NjrNHxKVxR6XB47D7FdyyLbjLDzee2HFnGjuxDH967iNwFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGxjVwCJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGxjVwCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768023862; x=1799559862;
  h=date:from:to:cc:subject:message-id;
  bh=rTnoVftZAE7F6YEzgB9eN5PQGKccfDW3wV8VelBOiA8=;
  b=RGxjVwCJJGufLWLyoHSqwVEYWuR8KmUuHsjLGtBvaUw8OSCjsjzd233i
   YDq/poOIexlca3ai+3tSG8XLBZ7JAhRL5lqowxfp1afPxV+9PU5F3Rylw
   AvQXKTOPrvzqQZvfK0en0d2+E/rKXyJGUFl2jiwSUcEjqlVFEYXwW1cXK
   jwKBlbYCYe3l58w42asuF2A2FfQSDlHMAzGz5Lqb0q8wOcElDTSH8aW+I
   aWFWSooLZ0b64TmSC10D2dAPPQuB+deU+3LEAW3OcEox5rXXY921j29V+
   aJfjl76Fel3qL3ZWVCAmM0tqDz9xrApBVo+jloV3EX3SjFY6wBoia1lB6
   g==;
X-CSE-ConnectionGUID: Ynuxb0aVTkuLi8i8yDS9CA==
X-CSE-MsgGUID: krR49oE5TvCXfg8qBB3xpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="86979183"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="86979183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 21:44:22 -0800
X-CSE-ConnectionGUID: or+DkJpGTRyaU79e+61jdg==
X-CSE-MsgGUID: LgIGZPaSSxSuqhlOI5N13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="204404300"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2026 21:44:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veRlq-000000008CA-2KUP;
	Sat, 10 Jan 2026 05:44:18 +0000
Date: Sat, 10 Jan 2026 13:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:user_path_file 3/3] fs/fuse/passthrough.c:33:17:
 error: implicit declaration of function 'iov_iter_count'
Message-ID: <202601101306.G1jsLzjL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux user_path_file
head:   7a28048e32eb538d7283b6cea15f99aca351d91f
commit: 7a28048e32eb538d7283b6cea15f99aca351d91f [3/3] backing_file: store user_path_file
config: sh-randconfig-r071-20260110 (https://download.01.org/0day-ci/archive/20260110/202601101306.G1jsLzjL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601101306.G1jsLzjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601101306.G1jsLzjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/passthrough.c: In function 'fuse_passthrough_read_iter':
>> fs/fuse/passthrough.c:33:17: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
      33 |  size_t count = iov_iter_count(iter);
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
