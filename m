Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09143289810
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056597; cv=none; b=coRoEJTTOVam2x1KL5nkc5J5gbVUxs/M/dPXaSfK3tyaTSVtTdgB1z++KUht5Iybp4GRtBJKXOBmp6aDxBWHnO/nBPiFtlnZLixpObeMkbY+7qqiUzPECf4y00ygoRCJpYE0U7M7WP/5/GhjWCk5rrez6zdoZS6bbboN7v5U/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056597; c=relaxed/simple;
	bh=y/0uwJCUHlsRepJ9QV3jbainpSIFb7CYgJUAt7ATMbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1QeEfCstDawkFbh4L0RUw/Mnl1SvUyQmS/8Tc1k5V+ohXhSAM3PiW4xtE3SZmTWN+jDXB9lEH4DaBRlszkbX5nXUS7HscWbibr1n0prhSVktvzLB6bURCPNrExVGwtp0LOuBnMWiPxUBVAdvLXTxwHmFElje03LlZMaWKowmXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sqkr7wzZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sqkr7wzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752056596; x=1783592596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/0uwJCUHlsRepJ9QV3jbainpSIFb7CYgJUAt7ATMbo=;
  b=Sqkr7wzZdRBD3bqtZ56y0HYxUlJHozUGp+q6v0EAhpxN1KtQmyNqiW6V
   sOqjdrS+t9NBbHp473dQSiCsNHXy1aJtjIj/SWDU5LXckT54U6Gum3zK0
   jqmQyASl4s4eBAV/fmNVQPy+tE6Ftk3DVgWPAs4Av0ZR67Q5Ygn1vLRBK
   Yv5BCPNAo9F/UDPvmNUY1Qhx5BCXc37GTp5ejOcfwLlOqrhVP4eKXdIat
   Lzpldcty8fy+IAlSDqOxsnNL3zZRbdgd49R26MG42S0BrLSlTLhdAXpmF
   evMVhpWSNL6hl7Yk9+Q6d6VGBUQobbsVcJSwreYTDiy6iR8bwFNzX9mlO
   g==;
X-CSE-ConnectionGUID: C5JU/wCtQ0G+csMq2F3dRQ==
X-CSE-MsgGUID: LAdunlJhT2iuGMwokecZPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="76860264"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="76860264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 03:23:14 -0700
X-CSE-ConnectionGUID: 7GGRFKBkQNKwzcfVLSODgQ==
X-CSE-MsgGUID: c3IoCdaCRjqrHTTO+hCbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156221517"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2025 03:23:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZRxG-0003OV-0b;
	Wed, 09 Jul 2025 10:23:10 +0000
Date: Wed, 9 Jul 2025 18:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 27/27] net/core/scm.c:95:20:
 error: 'struct scm_fp_list' has no member named 'inflight'
Message-ID: <202507091845.kYEqoHSm-lkp@intel.com>
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
commit: 2663590d8805dbed9b35fa7e187e1308c8847301 [27/27] UPSTREAM: af_unix: Link struct unix_edge when queuing skb.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507091845.kYEqoHSm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091845.kYEqoHSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091845.kYEqoHSm-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c: In function 'scm_fp_copy':
>> net/core/scm.c:95:20: error: 'struct scm_fp_list' has no member named 'inflight'
      95 |                 fpl->inflight = false;
         |                    ^~
   net/core/scm.c:96:20: error: 'struct scm_fp_list' has no member named 'edges'
      96 |                 fpl->edges = NULL;
         |                    ^~
   net/core/scm.c:97:36: error: 'struct scm_fp_list' has no member named 'vertices'
      97 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                    ^~
   net/core/scm.c: In function 'scm_fp_dup':
   net/core/scm.c:386:24: error: 'struct scm_fp_list' has no member named 'inflight'
     386 |                 new_fpl->inflight = false;
         |                        ^~
   net/core/scm.c:387:24: error: 'struct scm_fp_list' has no member named 'edges'
     387 |                 new_fpl->edges = NULL;
         |                        ^~
   net/core/scm.c:388:40: error: 'struct scm_fp_list' has no member named 'vertices'
     388 |                 INIT_LIST_HEAD(&new_fpl->vertices);
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
  > 95			fpl->inflight = false;
    96			fpl->edges = NULL;
    97			INIT_LIST_HEAD(&fpl->vertices);
    98	#endif
    99		}
   100		fpp = &fpl->fp[fpl->count];
   101	
   102		if (fpl->count + num > fpl->max)
   103			return -EINVAL;
   104	
   105		/*
   106		 *	Verify the descriptors and increment the usage count.
   107		 */
   108	
   109		for (i=0; i< num; i++)
   110		{
   111			int fd = fdp[i];
   112			struct file *file;
   113	
   114			if (fd < 0 || !(file = fget_raw(fd)))
   115				return -EBADF;
   116			/* don't allow io_uring files */
   117			if (io_is_uring_fops(file)) {
   118				fput(file);
   119				return -EINVAL;
   120			}
   121			if (unix_get_socket(file))
   122				fpl->count_unix++;
   123	
   124			*fpp++ = file;
   125			fpl->count++;
   126		}
   127	
   128		if (!fpl->user)
   129			fpl->user = get_uid(current_user());
   130	
   131		return num;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
