Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C61A23A5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752033941; cv=none; b=e0eUMrzlp4Wf2kno2OPH+ZhM9NPHDmbGfcY6/L55vewjkqKq254234FtfxjTaCv2KqWTqLV0SjGr+aRQJMFlZO1fLIO4zZI7xDdmfVrDkGPraQp5kTQSn4kIM5+Vfe+cAmeCtfLyvHCwcOIRBSR2w6vLMn4OCJHIZzr4rpTp/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752033941; c=relaxed/simple;
	bh=4k2qByuNt3tUphKGbrIHY7JfkQMB+cw0U4oTkqn6AVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=meFINCOXiMSh4p62Y/kgjOaQ4QGeFP5ayenEIqpddgaqLFQI0j2FI4x+uX0WB5nlRfK9zTHsy9D7m16PtZ2yt8H7e8oVNaarHZRPJKDaZhfloG+/zS0xRGU1vYig3wrSrEJSZFZPQSCFlh+7XExhHfIctCxbyMJYQmwoMTrT7Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKQTsA95; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKQTsA95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752033940; x=1783569940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4k2qByuNt3tUphKGbrIHY7JfkQMB+cw0U4oTkqn6AVA=;
  b=AKQTsA95b2tBx3KR3EqZcF44SuFO0JWIHdlxd6yGd86kTRJSd3HkjnVz
   epVpCHKGzFXjU5lsHYawKdYQe0LqhquleRC6nEKDQoiqsmtFf4MIPsg4G
   q1WG8282xQwhhwh20EDAx9CI6RspDO9ZlOgZcLnI/8j0YX5aRr92Eray8
   jYzEYMLogNMf1QwBDK/eY1zwd5FScc3/TbEJF0BK8O91EjgC1QGYabYRE
   2R2QLjYNAVIQ+uof4jna7CEIGGeii3Jl5Lz/wewXmYgBeJ4eFIOyg6Nrk
   ipGvtT2eHM6cGqQOiMDn9l/U+zuXXulQdraJvUlHiSbSDBW94hKAh8ztr
   g==;
X-CSE-ConnectionGUID: BcGUfF6ZS6KFxg1jlzl6Rg==
X-CSE-MsgGUID: 5otHMHVRR12/9rUXjAYdmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79723365"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79723365"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 21:05:37 -0700
X-CSE-ConnectionGUID: EyM2H/cXS7qcQLu4wOnpcw==
X-CSE-MsgGUID: rkH6Irl6TuqwsiK5LW+tEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161317551"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2025 21:05:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZM3p-00034Z-2V;
	Wed, 09 Jul 2025 04:05:33 +0000
Date: Wed, 9 Jul 2025 12:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 27/27] net/core/scm.c:95:36:
 error: 'struct scm_fp_list' has no member named 'vertices'
Message-ID: <202507091101.5fVht1mu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   66e758f7d0c01a696c3a9db8929417e7403a1571
commit: 24f186b6215a84672d5bb05746085098c32c4995 [27/27] UPSTREAM: af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091101.5fVht1mu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091101.5fVht1mu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091101.5fVht1mu-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c: In function 'scm_fp_copy':
>> net/core/scm.c:95:36: error: 'struct scm_fp_list' has no member named 'vertices'
      95 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                    ^~
   net/core/scm.c: In function 'scm_fp_dup':
   net/core/scm.c:384:40: error: 'struct scm_fp_list' has no member named 'vertices'
     384 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                        ^~


vim +95 net/core/scm.c

    68	
    69	static int scm_fp_copy(struct cmsghdr *cmsg, struct scm_fp_list **fplp)
    70	{
    71		int *fdp = (int*)CMSG_DATA(cmsg);
    72		struct scm_fp_list *fpl = *fplp;
    73		struct file **fpp;
    74		int i, num;
    75	
    76		num = (cmsg->cmsg_len - sizeof(struct cmsghdr))/sizeof(int);
    77	
    78		if (num <= 0)
    79			return 0;
    80	
    81		if (num > SCM_MAX_FD)
    82			return -EINVAL;
    83	
    84		if (!fpl)
    85		{
    86			fpl = kmalloc(sizeof(struct scm_fp_list), GFP_KERNEL_ACCOUNT);
    87			if (!fpl)
    88				return -ENOMEM;
    89			*fplp = fpl;
    90			fpl->count = 0;
    91			fpl->count_unix = 0;
    92			fpl->max = SCM_MAX_FD;
    93			fpl->user = NULL;
    94	#if IS_ENABLED(CONFIG_UNIX)
  > 95			INIT_LIST_HEAD(&fpl->vertices);
    96	#endif
    97		}
    98		fpp = &fpl->fp[fpl->count];
    99	
   100		if (fpl->count + num > fpl->max)
   101			return -EINVAL;
   102	
   103		/*
   104		 *	Verify the descriptors and increment the usage count.
   105		 */
   106	
   107		for (i=0; i< num; i++)
   108		{
   109			int fd = fdp[i];
   110			struct file *file;
   111	
   112			if (fd < 0 || !(file = fget_raw(fd)))
   113				return -EBADF;
   114			/* don't allow io_uring files */
   115			if (io_is_uring_fops(file)) {
   116				fput(file);
   117				return -EINVAL;
   118			}
   119			if (unix_get_socket(file))
   120				fpl->count_unix++;
   121	
   122			*fpp++ = file;
   123			fpl->count++;
   124		}
   125	
   126		if (!fpl->user)
   127			fpl->user = get_uid(current_user());
   128	
   129		return num;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
