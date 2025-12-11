Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9918285418
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422455; cv=none; b=saZaV5ACLPthZUrSd7vM9Fr5Q7J/HLLoOKa/wZOOXpW+AfNsW5HLosoLgxjjp8OXHutW7dUIbm9qI+F/ZtbvdfLUUoLGP/Ij9zoFheIP0MOsxdEu1rnXuNFOtNVUkCzsn96qxXsFqyiFiNvoyJmlDWrTF5DTdRDswbQpoTQCX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422455; c=relaxed/simple;
	bh=0P3gVT526+8T2tKiXyJyzJD6shgjdPkzfie2ZfE+6ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1ACbiLNVQB1y/4CCKT6E13vgTiyoAIvCZrH52lXKmLhCJKOp/Jyh/AmWFtj3y4zYmwXH4AtjoiZ98zQL1AsUBY7Iowd0KVhZGBtHykMM8/DAXg097fCmdGmqFp4EAx99FvGrPwvzniAXCiU2wWBn1vaOVxo2WG1aJ9dFRbUT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdKjam4M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdKjam4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765422454; x=1796958454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0P3gVT526+8T2tKiXyJyzJD6shgjdPkzfie2ZfE+6ck=;
  b=WdKjam4MPS7IS8zr+9wpwGS+ghkq2Qo1LD1gD3SJc12We3R6Xe3BPvD2
   KtHxZeN3mvFWkO4e93OluogShm4MvzpCFE1tBTHxEIhEvoyb+Us5h1By5
   XLR+rl8UGQPQnAkQvZd8YlFT/J9JzRomM26Zlynpc3YMgjgPAasPWbHWU
   yfNpCVyhBywvzfN9/O700e6yU1AOahQ6kdtSKxObfyYCnw79sqSaWfrMM
   xyxNv9Bk7sM8RxkSptN2Uza4EpiUMWzgStdwWOpkhCgkaIS69CP8MoF17
   3M7E4J+QJ5WdUcpSuVQO9gI1YQu2Dxit3QWiOM6a9yxynnZrqE2uifRuD
   g==;
X-CSE-ConnectionGUID: HzsJm6R/RNO8CQQnm4WxDg==
X-CSE-MsgGUID: FJ0RAcHwTpigMYa6wwWlCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67337975"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67337975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:07:31 -0800
X-CSE-ConnectionGUID: +M1NDxF3SlmjDn8+zWrVGw==
X-CSE-MsgGUID: d74zju66TyynALVC5U5FBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201605499"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 19:07:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTX1b-0000000045Z-23cW;
	Thu, 11 Dec 2025 03:07:27 +0000
Date: Thu, 11 Dec 2025 11:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>
Subject: net/sunrpc/debugfs.c:78:21: sparse: sparse: cast removes address
 space '__rcu' of expression
Message-ID: <202512111156.M7LoiNpq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: bb504321b96550f9a351920e169de141a3f4c6a1 SUNRPC: display total RPC tasks for RPC client
date:   11 months ago
config: i386-randconfig-r112-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111156.M7LoiNpq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111156.M7LoiNpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111156.M7LoiNpq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/debugfs.c:78:21: sparse: sparse: cast removes address space '__rcu' of expression

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
