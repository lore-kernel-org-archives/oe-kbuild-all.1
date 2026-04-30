Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9537C114
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541532; cv=none; b=my93TXfRHFRAIkOoLblITSva8fwDNrRS6wqZnz1ciPx+1TqxaJ7CDVMw2uTzGuXNOALJaaodbTARLCVdWb5G5cFbvlSquaoVwitpLZnMP3NCUOt7PrEGUNjSZLC/ozzuSeuv/UJFD9SoN+SGkMataopXwQBnf7BI+kj3OcFzDMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541532; c=relaxed/simple;
	bh=Edo/4VDDbG9q5Dk8xBeS+8/1y/yklRmcBRiqKklnoLY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cLpzJgjIXDUOWBiJ5qVvK5Dbf0CYpygkYtCOfwrkU5Y9laNujU0TSBInMYyK35hLqNGXTogX+QhJ6G18ABpGDo2pujtRfoJgXsQTYNf0ti3Nl4DNwLrUbIAUF9BPQ6YhHnj28ITJEj2752K2TfsZATKMZ03qlSp7bHzRvH9m4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSoymuJa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSoymuJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777541532; x=1809077532;
  h=date:from:to:cc:subject:message-id;
  bh=Edo/4VDDbG9q5Dk8xBeS+8/1y/yklRmcBRiqKklnoLY=;
  b=CSoymuJaWMSGi6qsKBjqN8a3zETQkfEkCcYxFbM4yJtUJ6yvoc+tqWGw
   Z0Wh8mo52r8E4j3qRufXBIBt77JT+t4AQ2XeKUCaRGhVleub2ct83k7kx
   Lh6yCceJ1gMH53X0EJTR1o+qsBAViU9w9Pg8S/kFDeLq43+94eWDsVjTk
   YA9gb7441Kl/EV1pwujFY8TrxSKvlXi4Yh0Fu7KdXPyEmNHFp3uPouqfi
   L1N4sbd2lpDqky9CekRxXzdeLYUfWWaAunaxdbrGpPzcdy9a3WGWilg4P
   okJksrtClJkdefRfcbDIUadGtyA7AhcBP0syBPkjQo9Ez7IYG5U8ZXQxq
   w==;
X-CSE-ConnectionGUID: Gnw/w7b6TX6ol/8OMr69Ew==
X-CSE-MsgGUID: R8TqFIguSRWgTyeGuiDF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78380908"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78380908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 02:32:11 -0700
X-CSE-ConnectionGUID: h/VRlDBuQbuHZhAXzyXejA==
X-CSE-MsgGUID: jRLOFIWBSoGWdLboYF28Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="230184693"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2026 02:32:09 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wINkd-00000000CEM-1aEO;
	Thu, 30 Apr 2026 09:32:07 +0000
Date: Thu, 30 Apr 2026 17:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14050/14863] drivers/block/loop.c:119:17:
 error: implicit declaration of function 'stack_trace_print'
Message-ID: <202604301730.9XIcVfrK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0787c45ea08a13b5482e701fabc741877cf681f6
commit: 7454b88731fd320e7dbfbf1ea72f25705c3befc0 [14050/14863] loop: check lo->lo_backing_file in lo_rw_aio
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260430/202604301730.9XIcVfrK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301730.9XIcVfrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301730.9XIcVfrK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/loop.c: In function 'check_file_not_null':
>> drivers/block/loop.c:119:17: error: implicit declaration of function 'stack_trace_print' [-Wimplicit-function-declaration]
     119 |                 stack_trace_print(lo->clear_entries, lo->clear_nr_entries, 4);
         |                 ^~~~~~~~~~~~~~~~~
   drivers/block/loop.c: In function '__loop_clr_fd':
>> drivers/block/loop.c:1153:32: error: implicit declaration of function 'stack_trace_save' [-Wimplicit-function-declaration]
    1153 |         lo->clear_nr_entries = stack_trace_save(lo->clear_entries,
         |                                ^~~~~~~~~~~~~~~~


vim +/stack_trace_print +119 drivers/block/loop.c

   104	
   105	static struct file *check_file_not_null(struct loop_device *lo)
   106	{
   107		struct file *file = READ_ONCE(lo->lo_backing_file);
   108	
   109	#ifdef CONFIG_DEBUG_AID_FOR_SYZBOT
   110		if (!file)
   111			pr_err("file == NULL\n");
   112		else if (IS_ERR(file))
   113			pr_err("IS_ERR(file)\n");
   114		else
   115			return file;
   116		if (lo->clear_nr_entries) {
   117			pr_err("Last __loop_clr_fd() call was %lu jiffies ago by %s (%d)\n",
   118			       jiffies - lo->clear_jiffies, lo->clear_comm, lo->clear_pid);
 > 119			stack_trace_print(lo->clear_entries, lo->clear_nr_entries, 4);
   120		}
   121	#endif
   122		return file;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
