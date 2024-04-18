Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EFD17BB31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472158; cv=none; b=YqQkURhUYs7elucPIOoenM3ssHPEGfzeDHTeHT4MzmkggJROh+URqF7Yu51xvjLAWGMtscrx9SB9W42CoUMDXFqCRe5oIshAopmdXE1DZ9mNiGua9c6JBdYRmsfHPYnKFRu31AetLfVlpIDqeqdoXFA6b664qKvVaodA+/dfthw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472158; c=relaxed/simple;
	bh=35UaapfjG69MIPVS+Iqh/dHQ/gy8dW2k70FWNC0jzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DdFF6UaicZyOJWwyT2glGJVkavnPZW7dLNRLVSF8WS1sFCiklaM8Mfen8lNJcd/uMq1oT9EY7DzfXyTPXxSG5ahyrW0EnIDT2rS8WcxiFTCQS8fZLJVE+2XcTThH1t1va9DUmq3OFx6MjFud+JXwpgeqEQCn31EzzjFABV5/9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=is4TppwX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="is4TppwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713472157; x=1745008157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35UaapfjG69MIPVS+Iqh/dHQ/gy8dW2k70FWNC0jzmE=;
  b=is4TppwXyanUuLrn0Suwhjx/lEaviixCH6t1XTfyMKU1iteoPLnryP7j
   A3/4AzIlbmvjdB3KBbmBd9zUgFOvYEkO8pePR9qnzqFl/d8H4X9BKH0+q
   kmh5nKBZhzpv7uHan+oaeIl0slELNdEQ6gsAmb5nM82BArl9klDg61Zi2
   sIRwUQc1RD0X44+94/ldVkDWOKrYpFd162hPoEPaL9WKJeQiDxN9VQHR9
   qRxUYpvmFZw4tFUjF+oaTJaJP9Nd2MKp0g9u16f+T8KaBWb+Hlot981DE
   qXk84brviJFcxaagkjTZlSUq3N3N8zwnDWXadfsFiuGCHYCt0KwvcEiHj
   A==;
X-CSE-ConnectionGUID: qn9M4BM9SWa2BJzsLRAv/g==
X-CSE-MsgGUID: /THysc/hSpCSW8lwkYWGAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8909909"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8909909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 13:29:16 -0700
X-CSE-ConnectionGUID: d4wzRfwxTZWgg7HF4J7vcg==
X-CSE-MsgGUID: /VCmeLD1TjyqFabd/l99Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="22967712"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2024 13:29:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxYNc-0009CS-2c;
	Thu, 18 Apr 2024 20:29:12 +0000
Date: Fri, 19 Apr 2024 04:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/dlserver.update_h_nr 1/1] kernel/sched/fair.c:5830:13:
 warning: conflicting types for 'update_h_nr_running'; have 'void(struct
 cfs_rq *, int)'
Message-ID: <202404190428.SuQhraKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.update_h_nr
head:   4e843586ff1b3b77e5244d0128facac6330490a4
commit: 4e843586ff1b3b77e5244d0128facac6330490a4 [1/1] Prototype: Update h_nr_running from single place to stop/start dl server
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240419/202404190428.SuQhraKV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404190428.SuQhraKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190428.SuQhraKV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:633:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     633 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'throttle_cfs_rq':
   kernel/sched/fair.c:5119:17: error: implicit declaration of function 'update_h_nr_running' [-Werror=implicit-function-declaration]
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:5830:13: warning: conflicting types for 'update_h_nr_running'; have 'void(struct cfs_rq *, int)'
    5830 | static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5830:13: error: static declaration of 'update_h_nr_running' follows non-static declaration
   kernel/sched/fair.c:5119:17: note: previous implicit declaration of 'update_h_nr_running' with type 'void(struct cfs_rq *, int)'
    5119 |                 update_h_nr_running(qcfs_rq, -1 * task_delta);
         |                 ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +5830 kernel/sched/fair.c

  5829	
> 5830	static void update_h_nr_running(struct cfs_rq *cfs_rq, int delta)
  5831	{
  5832		int old_h_nr_running, new_h_nr_running;
  5833		bool root = (&rq_of(cfs_rq)->cfs == cfs_rq);
  5834		
  5835		if (root) {
  5836			old_h_nr_running = cfs_rq->h_nr_running;
  5837		}
  5838	
  5839		new_h_nr_running = cfs_rq->h_nr_running + delta;
  5840		cfs_rq->h_nr_running = new_h_nr_running;
  5841		
  5842		if (root && !!old_h_nr_running != !!new_h_nr_running) {
  5843			if (new_h_nr_running) {
  5844				dl_server_start(&rq_of(cfs_rq)->fair_server);
  5845			} else {
  5846				dl_server_stop(&rq_of(cfs_rq)->fair_server);
  5847			}
  5848		}
  5849	}
  5850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
