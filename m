Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9512B7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707891258; cv=none; b=h9EMXbnn/h1jYmFQU8GTYpvcTrxPnZIdymCuo6z6eduZgnysu/7RG+omoi1RBqvMJKRZWyV/cQekTTKXIryf+EZBJCDO9DlbR2S1Xw24XZA9aUwaJZujUURYVt7QVySrZwKZwL6mQqrNQk5i4p9qGQF9bTFDaTB69qd1nFRGnHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707891258; c=relaxed/simple;
	bh=t4p5UZt1/jich/9yrao1TZB0NFwBK8dpeiRr1RaelKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HymxZbzZUr3DZnC2ixTWaL/oNihEADtr3PlisEdXsE4TznRnxgBSnZlnpibQvSN7nCCPiU/4niKvv9rM7AlvMvXO4EOFann2vxDz1Nv8R0dgCNyfAH4aHIQGVGjQPpxUVhezxgOUAHZNx/i2Y6HfSH/mvZiPxO2q5BJms/UWdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktDXnHGk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktDXnHGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707891257; x=1739427257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4p5UZt1/jich/9yrao1TZB0NFwBK8dpeiRr1RaelKs=;
  b=ktDXnHGkcaQteA+scWPn4EcqoKuxUTUzARwUJeCM1nJRinc1dGZo/iF3
   pgS/+fR+Ii0AEMqplHg1a+i+kJRq17j/ch9vngdWSB1Yfn9a6lsvTEYwo
   ibBHraFVNbU3L6Qdz8Y/r2XW6rs/Z0zgEer2svgdcZ51RYPKPVc4EcsM1
   toVDk6ir9D41hf8bgwg1ySkQXof//xZaLE2LD7LWLtA9xfITmw3m7UtSX
   O32cAUNKIj/TDLJzrrlg+p5nsehRPeaqzt0lBq1ibFGmyt4zn0R5e1t+l
   cns+lasKCx8M550BAgYT50RnyOQPyvTJzQSXge5E3wSp+exS9Z6EQOfM5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5757426"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5757426"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 22:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3146140"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2024 22:14:15 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra8X7-0008Wa-0Y;
	Wed, 14 Feb 2024 06:14:13 +0000
Date: Wed, 14 Feb 2024 14:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:dlserver-feb-fixes 1/9] kernel/sched/fair.c:8535:16: error:
 implicit declaration of function 'pick_task_fair'; did you mean
 'pick_next_task_fair'?
Message-ID: <202402141433.P42lhOGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git dlserver-feb-fixes
head:   a81d7e41130fa46e91bde4dd820f673250934286
commit: 60503246d2cf0d7b91d18325cb21c24c13f1d40d [1/9] sched/core: Add clearing of ->dl_server in put_prev_task_balance()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240214/202402141433.P42lhOGp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141433.P42lhOGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141433.P42lhOGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'fair_server_pick_task':
>> kernel/sched/fair.c:8535:16: error: implicit declaration of function 'pick_task_fair'; did you mean 'pick_next_task_fair'? [-Werror=implicit-function-declaration]
    8535 |         return pick_task_fair(dl_se->rq);
         |                ^~~~~~~~~~~~~~
         |                pick_next_task_fair
   kernel/sched/fair.c:8535:16: warning: returning 'int' from a function with return type 'struct task_struct *' makes pointer from integer without a cast [-Wint-conversion]
    8535 |         return pick_task_fair(dl_se->rq);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +8535 kernel/sched/fair.c

  8532	
  8533	static struct task_struct *fair_server_pick_task(struct sched_dl_entity *dl_se)
  8534	{
> 8535		return pick_task_fair(dl_se->rq);
  8536	}
  8537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
