Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6F28EA52
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752066572; cv=none; b=jaDTWgvmObuN3Yn+a/7CvziZSUL3MeudzNeyoRUAWWBi8DudKB/qdqhNW1JXeslCWauw4Ofud3jInbnET720GVs3kSk4D7pzuE034lEYwAkfV+wlPvtgdGa5A8xK4EqDLvQuggwNX1YKQFlFBK2lfAdcNmUvtRYoCl4l/CCFIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752066572; c=relaxed/simple;
	bh=faerV1UgPOMjsKWM/oRS7TI+aRKZiiZI/ZASoX11/ss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZE/Jwu7/ytUSJKbPB27GPMIVRDAa/9bIHpjLN3mPqnuRrhyHbJSwo1jp5dJxAuZ8U6t2fzQjBw06Gm/50WK9WmCfApmSTlZWwIozeF3sVZp/txXrUAHNacHW+AmB/2r8sQXasfCplQN7CqJwW6z9LdUELoZ9WokvL09tt+Mp5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wkm/54w4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkm/54w4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752066570; x=1783602570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faerV1UgPOMjsKWM/oRS7TI+aRKZiiZI/ZASoX11/ss=;
  b=Wkm/54w4BpG4Ho2018G/HenFIEdt6G7WcT9koq7rwG2fuzazVHQ98H29
   UkYJjRQ5N3/C7MtHqoVw5O+z7fqR13DoZGnc6jgM/KreUPznDClufaaFc
   yh6UuoXU4Z2hGPYI3D6sbobBqQfYvXfcJ9q8/r3EUEs6dyCA3/fEVhy/A
   u8z6zgAQ/rpOSrdWVHcQzDXVjtS9UILB51ZPV6wQ1HKKaIiPJcbyqBycG
   EvV1YYelM2XoB2+xbSz0NWvBewV7FDUeP3Ee6X74pWOuJ74J1eUEyuksB
   JXMaUM+hlsEpXhGWRE1jKQWSMcYLdYJDP+owhe4pTTOC8X5TFKTn+sbeT
   w==;
X-CSE-ConnectionGUID: IXVvhkUCSxq4oMOC+sLLlQ==
X-CSE-MsgGUID: 0dyFPzE4R5abnSkHUWemGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54453338"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54453338"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 06:09:30 -0700
X-CSE-ConnectionGUID: vl0H7/L7SyC157o5rwurpw==
X-CSE-MsgGUID: sdooYbFdSQCjDSxer5Dylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161324693"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2025 06:09:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZUYA-0003Xv-2H;
	Wed, 09 Jul 2025 13:09:26 +0000
Date: Wed, 9 Jul 2025 21:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 27/27] net/core/scm.c:96:20:
 error: 'struct scm_fp_list' has no member named 'dead'
Message-ID: <202507092039.ZiRUh21w-lkp@intel.com>
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
commit: 8f0aa725509f3616cb721a810f93594b6d1f10f8 [27/27] UPSTREAM: af_unix: Add dead flag to struct scm_fp_list.
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250709/202507092039.ZiRUh21w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507092039.ZiRUh21w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507092039.ZiRUh21w-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/scm.c: In function 'scm_fp_copy':
   net/core/scm.c:95:20: error: 'struct scm_fp_list' has no member named 'inflight'
      95 |                 fpl->inflight = false;
         |                    ^~
>> net/core/scm.c:96:20: error: 'struct scm_fp_list' has no member named 'dead'
      96 |                 fpl->dead = false;
         |                    ^~
   net/core/scm.c:97:20: error: 'struct scm_fp_list' has no member named 'edges'
      97 |                 fpl->edges = NULL;
         |                    ^~
   net/core/scm.c:98:36: error: 'struct scm_fp_list' has no member named 'vertices'
      98 |                 INIT_LIST_HEAD(&fpl->vertices);
         |                                    ^~
   net/core/scm.c: In function 'scm_fp_dup':
   net/core/scm.c:387:24: error: 'struct scm_fp_list' has no member named 'inflight'
     387 |                 new_fpl->inflight = false;
         |                        ^~
   net/core/scm.c:388:24: error: 'struct scm_fp_list' has no member named 'edges'
     388 |                 new_fpl->edges = NULL;
         |                        ^~
   net/core/scm.c:389:40: error: 'struct scm_fp_list' has no member named 'vertices'
     389 |                 INIT_LIST_HEAD(&new_fpl->vertices);
         |                                        ^~


vim +96 net/core/scm.c

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
    95			fpl->inflight = false;
  > 96			fpl->dead = false;
    97			fpl->edges = NULL;
    98			INIT_LIST_HEAD(&fpl->vertices);
    99	#endif
   100		}
   101		fpp = &fpl->fp[fpl->count];
   102	
   103		if (fpl->count + num > fpl->max)
   104			return -EINVAL;
   105	
   106		/*
   107		 *	Verify the descriptors and increment the usage count.
   108		 */
   109	
   110		for (i=0; i< num; i++)
   111		{
   112			int fd = fdp[i];
   113			struct file *file;
   114	
   115			if (fd < 0 || !(file = fget_raw(fd)))
   116				return -EBADF;
   117			/* don't allow io_uring files */
   118			if (io_is_uring_fops(file)) {
   119				fput(file);
   120				return -EINVAL;
   121			}
   122			if (unix_get_socket(file))
   123				fpl->count_unix++;
   124	
   125			*fpp++ = file;
   126			fpl->count++;
   127		}
   128	
   129		if (!fpl->user)
   130			fpl->user = get_uid(current_user());
   131	
   132		return num;
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
