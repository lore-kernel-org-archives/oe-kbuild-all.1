Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933F3101C1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689267125; x=1720803125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9eGD4BTCEqOtWSFfJbIiAtrIBTvFg1qB++DytczKV4=;
  b=XbVRD3a/bWgAPf5pLbFBbtZHNn5zkgoTZH8E5dWSqKPHtifO7Odd/HRi
   Rd2AFZwXQ4TZu4zI2LagUk5lGWoryZDiy72+LpYqg4y6ibwIKnFjYM5vU
   RjHo9I4KB3JJLomNIQOv/jjyGrtOgfu1u/QHM18l+GuRnb+9jZdDS9iuM
   uHxRN/i270oiFerpuZLtsPM45ZzNdbxFJb/DVvInHUWpYBBSUZDyUsKMv
   QpDnbJj/UKc0knSlpsV9bQneLKTg3oJAQYsSeIeAhTnGF9J8ukxNm5q1i
   tNUt9eo3zZpOW2UZ3YtUl6cc4S2BliUAEVYuW/RQ3+aE/zVNGfMDYkO7E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="355182971"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="355182971"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 09:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968686649"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="968686649"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 09:52:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJzXu-0006mC-3D;
	Thu, 13 Jul 2023 16:52:02 +0000
Date: Fri, 14 Jul 2023 00:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx6 2/10] kernel/bpf/mprog.c:285:22: error:
 'dtuple' undeclared; did you mean 'tuple'?
Message-ID: <202307140005.MsN96tlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx6
head:   ac45d6a1c8a347f9c6b56123ff245a2f21b0ce2c
commit: acf6b4cd3de8224fca4d205c76f48400cb4ca1f1 [2/10] bpf: Add generic attach/detach/query API for multi-progs
config: um-randconfig-r032-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140005.MsN96tlt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140005.MsN96tlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140005.MsN96tlt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:7,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:26,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from kernel/bpf/mprog.c:4:
   kernel/bpf/mprog.c: In function 'bpf_mprog_fetch':
>> kernel/bpf/mprog.c:285:22: error: 'dtuple' undeclared (first use in this function); did you mean 'tuple'?
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |                      ^~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/bpf/mprog.c:285:9: note: in expansion of macro 'WARN_ON_ONCE'
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |         ^~~~~~~~~~~~
   kernel/bpf/mprog.c:285:22: note: each undeclared identifier is reported only once for each function it appears in
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |                      ^~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/bpf/mprog.c:285:9: note: in expansion of macro 'WARN_ON_ONCE'
     285 |         WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
         |         ^~~~~~~~~~~~


vim +285 kernel/bpf/mprog.c

   260	
   261	static int bpf_mprog_fetch(struct bpf_mprog_entry *entry,
   262				   struct bpf_tuple *tuple, int idx)
   263	{
   264		int total = bpf_mprog_total(entry);
   265		struct bpf_mprog_cp *cp;
   266		struct bpf_mprog_fp *fp;
   267		struct bpf_prog *prog;
   268		struct bpf_link *link;
   269	
   270		if (idx == -1)
   271			idx = 0;
   272		else if (idx == total)
   273			idx = total - 1;
   274		bpf_mprog_read(entry, idx, &fp, &cp);
   275		prog = READ_ONCE(fp->prog);
   276		link = cp->link;
   277		/* If deletion request can either be without filled tuple in which
   278		 * case it gets populated here based on idx, or with filled tuple
   279		 * where the only thing we end up doing is the WARN_ON_ONCE() assert.
   280		 * If we hit a BPF link at the given index, it must not be removed
   281		 * from opts path.
   282		 */
   283		if (link && !tuple->link)
   284			return -EBUSY;
 > 285		WARN_ON_ONCE(dtuple->prog && dtuple->prog != prog);
   286		WARN_ON_ONCE(dtuple->link && dtuple->link != link);
   287		dtuple->prog = prog;
   288		dtuple->link = link;
   289		return 0;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
