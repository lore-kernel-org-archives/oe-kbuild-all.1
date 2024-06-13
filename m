Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DC140E58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272930; cv=none; b=LGbgF7LLyqcDWvnYg53z+4QR6fnC0Fnvp+v5L8FH2k55NhZtxNqxremqY+5D483hwLy1Gi02hHstNvF9J9DOtNWSw/JCyILuIgOyh/hcEp05zk9DliEG3VubgEJm7uEahipG6QYkXqjHDAA3+o/Fak9JxVqfiG8GHPMKzEUd+g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272930; c=relaxed/simple;
	bh=REHJVPP7PxA+Cxa2RfklbP3ILe0NBi3WD53cSguprnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDTqaUD8JErnOjbxLNK7D8YXJXx+2YOcuPWvZsXZf/8mt+yGGIkjLR9cW3g+C3KZ6LOllMxKIRaNItSme7y8dz2hMCP6d0jFbyo6madKslWGdCSutcKBn2xpuMHhyJ10PCbgs1Zm3BWRk11CJvuCeudeS/j7xTacEUXFEu4+0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5aBaZ+H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5aBaZ+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718272929; x=1749808929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=REHJVPP7PxA+Cxa2RfklbP3ILe0NBi3WD53cSguprnw=;
  b=R5aBaZ+H/SQit8kOSuTq1xboSM3Xbyt8UItjIrm2UBBh+/A+WFibd+K8
   6wfCXf+eoGoPjRB25s+aaxdS0cvKXJZJLQTKsZu2EE3Lqa95IuMJl3ceI
   nzOWTJd42O6JFFZHLKzk+/ZsdT0elpJEAChXchuMuTiJAlA0P6N62v5ke
   lDkZh4dz2y2NosTysJQy/WhYlmu9z0kbB7IT/DzRcEuE+dUox1Cc6C24I
   Ez9KLIASmeamYGhg2fC+ycXS8WPaiwMbdzQO17msk0HVs7mXh+3VVx3Hu
   vjUTLSWJjG9dM53+6eigVnlTccr+Qef6NFkvFQhofPlTDuL9uwVkA58ed
   A==;
X-CSE-ConnectionGUID: zYbcqUzMRi+IazoCXK78Ow==
X-CSE-MsgGUID: ZIX7uiCLQxWYR7vhmscKOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15048233"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15048233"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:02:06 -0700
X-CSE-ConnectionGUID: iBoarGxuTBiSoCf1xBKD6Q==
X-CSE-MsgGUID: UxfSZwtpRpqbJ8eYkWTy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="71300556"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jun 2024 03:01:49 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHhH8-0002T4-37;
	Thu, 13 Jun 2024 10:01:46 +0000
Date: Thu, 13 Jun 2024 18:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] ksmbd: add durable scavenger timer
Message-ID: <202406131718.ee85fdua-lkp@intel.com>
References: <20240610141416.8039-2-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610141416.8039-2-linkinjeon@kernel.org>

Hi Namjae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc3 next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-add-durable-scavenger-timer/20240610-221647
base:   linus/master
patch link:    https://lore.kernel.org/r/20240610141416.8039-2-linkinjeon%40kernel.org
patch subject: [PATCH 2/3] ksmbd: add durable scavenger timer
config: s390-randconfig-r112-20240613 (https://download.01.org/0day-ci/archive/20240613/202406131718.ee85fdua-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240613/202406131718.ee85fdua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131718.ee85fdua-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/server/vfs_cache.c:40:19: sparse: sparse: symbol 'dh_wq' was not declared. Should it be static?
   fs/smb/server/vfs_cache.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/dh_wq +40 fs/smb/server/vfs_cache.c

    36	
    37	static bool durable_scavenger_running;
    38	static DEFINE_MUTEX(durable_scavenger_lock);
    39	struct task_struc *dh_task;
  > 40	wait_queue_head_t dh_wq;
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
