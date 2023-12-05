Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFD10961
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nY1M9VcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701758230; x=1733294230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqvAkwNMScC8HI8XbCdEX2rgOR/mZYQHPqzhl7WBsng=;
  b=nY1M9VcNczt0CZzMWvVHJK5kPveijnv4wsyKvg+HBifw7KW2rO36rEYh
   8vo3hF1TGGIyLbFGODDUzol2Xs5ZWxs3yFvlqe+i8EmkINyUFfocbTiq4
   IpHN0FpRwsW7p1OI+Cdcdyr+NsxPcVcHRwmqvmAcRXf07zrvMFned3XW0
   dXDj9B42fadBXvWGiyZhgYAk71JBAZt/TnRIM9Ifs5UD35WE7B5m3Zvz+
   XhaQXMyJpWyLnkU0FWUghtN6kQtcbj/eU3+TaD1XpYXEgey36CkgC7gpg
   OXHxsEQiBt+oUjOUr9e4ukfQgK4Mema8s2EFbeXSvVp28l90DmCenw4vj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374035373"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="374035373"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764224102"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764224102"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 22:37:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAP3F-0008Rc-1f;
	Tue, 05 Dec 2023 06:37:01 +0000
Date: Tue, 5 Dec 2023 14:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 2/2] nfsd: Don't leave work of closing files to a work
 queue.
Message-ID: <202312051443.02Ddb5pd-lkp@intel.com>
References: <20231204014042.6754-3-neilb@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204014042.6754-3-neilb@suse.de>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.7-rc4]
[cannot apply to brauner-vfs/vfs.all next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/Allow-a-kthread-to-declare-that-it-calls-task_work_run/20231204-094248
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231204014042.6754-3-neilb%40suse.de
patch subject: [PATCH 2/2] nfsd: Don't leave work of closing files to a work queue.
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051443.02Ddb5pd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051443.02Ddb5pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051443.02Ddb5pd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/filecache.c:431: warning: Function parameter or member 'nn' not described in 'nfsd_file_dispose_some'


vim +431 fs/nfsd/filecache.c

   425	
   426	/**
   427	 * nfsd_file_dispose_some
   428	 *
   429	 */
   430	void nfsd_file_dispose_some(struct nfsd_net *nn)
 > 431	{
   432		struct nfsd_fcache_disposal *l = nn->fcache_disposal;
   433		LIST_HEAD(dispose);
   434		int i;
   435	
   436		if (list_empty(&l->freeme))
   437			return;
   438		spin_lock(&l->lock);
   439		for (i = 0; i < 8 && !list_empty(&l->freeme); i++)
   440			list_move(l->freeme.next, &dispose);
   441		spin_unlock(&l->lock);
   442		if (!list_empty(&l->freeme))
   443			svc_wake_up(nn->nfsd_serv);
   444		nfsd_file_dispose_list(&dispose);
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
