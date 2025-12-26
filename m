Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B018024
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766717636; cv=none; b=Dit/fuCf4fTdVGjgYREDKtKqBm9Ao5jdAKFp2ckH/zNcwX3XLtSDqgHc1lpIPgfF59JmTQ+Z4l3GKsz9sNq65mIpBgXNNp3J0irhUl4yAIMtS3xRUDF6D/bxO4vVIZAspszcTLAr6xon0rOj7c557nYqQrGFkOE2BcEpiXxK2pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766717636; c=relaxed/simple;
	bh=OHjl3JQxL/6xfLqlXiRj90uFkadQP6C1PA3i60+bZ1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlKwsKZ0RarWa7IhBSbx+1njonyY52mJjswDqTdJ8sP15X1+LuUWt1BTNuAdRHrJ1g2oRc0FT6OHjTmGs+/ii+AI1z0thpgyaneo2CeWDxtDhONkYOvZkDa+MSTH7iF/3IkX9MlQpNrAxqCj570O9sfsGv9oQ8Nffs03eu3cWwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNZj3DN5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNZj3DN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766717635; x=1798253635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OHjl3JQxL/6xfLqlXiRj90uFkadQP6C1PA3i60+bZ1g=;
  b=CNZj3DN5JB5YwB+7X58YMZwAZs0Ca0+nsJzdc4TKDRGvx2o+ec/097nf
   TgXWfklxL0fmI9HPh52IwheXNspu4PPJ2q+qpgx/P0DGsyGFajfLBkuIG
   o+rMnvJAwG1l0gDS6PQUTTq+BlHUhXyEnp++V7LLEOzsq80ZyRBE+i6zc
   CjU6fKNFm0GieUrcYrLuONHOhzRNDDlOJFHsTBpP1ELpt8J4CN1yLZ9y1
   +bDCyGf3xeInw3hoix5ddLnjfmeZiMui8UQA9qr4RF32LI3E8uLfXpUWa
   3HPkjAGpCP5Ntg3itXjbjTwWLVvtD/k1uKT+BzBrZ7AqMM6iBUqMw3sMY
   g==;
X-CSE-ConnectionGUID: iQQszfMfTtOIbI6SioAZZA==
X-CSE-MsgGUID: m+K9QHl/RYyz+oMXmkBg+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71072527"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="71072527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 18:53:55 -0800
X-CSE-ConnectionGUID: mhY8JzCbR66budecBOyQaQ==
X-CSE-MsgGUID: 1bSeLnFiR/61fphAl5AtKQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Dec 2025 18:53:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYxxd-000000004dV-3Rmn;
	Fri, 26 Dec 2025 02:53:49 +0000
Date: Fri, 26 Dec 2025 10:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, rostedt@goodmis.org,
	mhiramat@kernel.org, mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, sean@ashe.io,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [v2 PATCH 1/1] tracing: Add bitmask-list option for
 human-readable bitmask display
Message-ID: <202512261011.nLEYLg1y-lkp@intel.com>
References: <20251225080216.2196411-2-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225080216.2196411-2-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/tracing-Add-bitmask-list-option-for-human-readable-bitmask-display/20251225-160415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251225080216.2196411-2-atomlin%40atomlin.com
patch subject: [v2 PATCH 1/1] tracing: Add bitmask-list option for human-readable bitmask display
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251226/202512261011.nLEYLg1y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261011.nLEYLg1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261011.nLEYLg1y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:7,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/trace_seq.h:145:1: error: redefinition of 'trace_seq_bitmask'
     145 | trace_seq_bitmask(struct trace_seq *s, const unsigned long *maskp,
         | ^~~~~~~~~~~~~~~~~
   include/linux/trace_seq.h:139:1: note: previous definition of 'trace_seq_bitmask' with type 'void(struct trace_seq *, const long unsigned int *, int)'
     139 | trace_seq_bitmask(struct trace_seq *s, const unsigned long *maskp,
         | ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1299: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/trace_seq_bitmask +145 include/linux/trace_seq.h

   143	
   144	static inline void
 > 145	trace_seq_bitmask(struct trace_seq *s, const unsigned long *maskp,
   146			  int nmaskbits)
   147	{
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
