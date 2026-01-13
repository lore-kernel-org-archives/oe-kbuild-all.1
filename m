Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D1538171D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298036; cv=none; b=Iy3ycijAwKRYBUBaesDrlJ3T0QllGMx2eRvTmsWNGopJ9rKmImaDaRWMRB6qcHz7BU9N0tkLaeO3ONnQ/RLiBYezsa9PfA/oB3xX732xVW6VgQqcB3x+bDOH56nBdWiYpKAz474mi/7WU7uJgXjMaXlRnIH0mJT6P8/uwrdRgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298036; c=relaxed/simple;
	bh=GAvETwY/9S+imh6b4Kr7SAL+TKBQKVBIGI0BMg05qVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ut+Us4BgwooNxq+hwB+U2K26Nz42Bz2mMroEuCMFpI/qDVZ/gE+E+AE57zYBVUANUZNhWe8+2lfLvw+CeUiJhrJArTF+Je3BSnTlFa1pHhyFhaHiu0KluYBh8QZiKDfmbjfwHJMssraJYZMSl8wWc3ZNjX9y+agaK17GwwGL0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ul/C2NGZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul/C2NGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768298034; x=1799834034;
  h=date:from:to:cc:subject:message-id;
  bh=GAvETwY/9S+imh6b4Kr7SAL+TKBQKVBIGI0BMg05qVE=;
  b=Ul/C2NGZfdyJb2069XWp1FH0hoFcSXoHhFA8DfFm7IeOqDYGlQsMw5Gm
   Hr46rkDEpBa8jSTXXGj5s1TW8qGDSRaAvDQ00MBfYwYj+roV8cD3kZh2Y
   cMd77N0EP9KnnnSgz+Moo2geb8aNBqr/RHhTTNXDZBprD5P1kWHYAsTC8
   1MIeTD6khJMSJrqPP0QHsI9IOfPXtRkg5anzsJhebp3Wc6wFlXb+8mDLm
   Hrg871WmxH1P1LrH8J+56d5KPAD1ZQWzgibDiufaGcMrbNOgHi/ggA3vk
   WiWI2Y5fTVO7o/hHAc0+qm7efi1zr0nrqUuJ1tC3OShcAd3WyrNx7twYh
   Q==;
X-CSE-ConnectionGUID: g9kRDahoSSWREybcvNcO1A==
X-CSE-MsgGUID: y3U0390MQpicvbjKhCxTPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72161430"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72161430"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:53:53 -0800
X-CSE-ConnectionGUID: ahcmKdjrQs26QY3lnCQsXQ==
X-CSE-MsgGUID: nrI01fVqTHWjQT/R5oIn0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="241858669"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2026 01:53:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfb5x-00000000EZO-0LuB;
	Tue, 13 Jan 2026 09:53:49 +0000
Date: Tue, 13 Jan 2026 17:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@oracle.com>
Subject: net/sunrpc/debugfs.c:78:21: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202601131739.ArXIUTF9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: bb504321b96550f9a351920e169de141a3f4c6a1 SUNRPC: display total RPC tasks for RPC client
date:   1 year ago
config: m68k-randconfig-r111-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131739.ArXIUTF9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131739.ArXIUTF9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131739.ArXIUTF9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/debugfs.c:78:21: sparse: sparse: cast removes address space '__rcu' of expression
--
>> net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +78 net/sunrpc/debugfs.c

    70	
    71	static void
    72	tasks_stop(struct seq_file *f, void *v)
    73		__releases(&clnt->cl_lock)
    74	{
    75		struct rpc_clnt *clnt = f->private;
    76		spin_unlock(&clnt->cl_lock);
    77		seq_printf(f, "clnt[%pISpc] RPC tasks[%d]\n",
  > 78			   (struct sockaddr *)&clnt->cl_xprt->addr,
    79			   atomic_read(&clnt->cl_task_count));
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
