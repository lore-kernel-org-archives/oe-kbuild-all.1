Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5127452
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 05:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726464777; cv=none; b=OZ33Zgkj9tXXZhG9V31fI224inxq1RIf3y4jL4U4GovROhYz4bBzSgAi5/X8RSPzLU950as85B/wm4PThduC5cWyTi4mXtRXDPzoZtjpX5Z0Xeou04E/0HrIyoZ3D44ufy1ZpK+ukUc36peio2DRRTlC3Ub/A6tT8tUOE2TnCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726464777; c=relaxed/simple;
	bh=e4DAq2yLVwGd4I3KM/QWM271WVG60AzYAuaRnhk6S08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6+Hlxe9Wx+FZdMwNZ6FsIJ+K0cG20j0Jwxew76O0lSPm1wqFcFQEw47Wn3Wo/0WGI7d7fygEOyikvCL6ruGaw4qTA64TuG/fDJ7Z63MuE1MkpEGXt9tWVYYkeFVeK8qP7LlH75pS8dF9QtzD3D6mjkm+nSmY20hlgHslsQSSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtPkye45; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtPkye45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726464775; x=1758000775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4DAq2yLVwGd4I3KM/QWM271WVG60AzYAuaRnhk6S08=;
  b=VtPkye45Ld4FlvX8mdeszdnabS8CK08OVpgFbD8njgFib3/VUlH4wvEq
   NGURG6jJxEF5YG1bG/vaZtuBj9e8HqxGK95zG/N0BeUxeTtVMKAOwVIu9
   h9RXbu3QdEfq1895csE/s3Jqn7Z3/eynfVPktr7hQ+wCJzCPWGnNw3grw
   PZ3HGNpA3YPwIcER/8yjrhFRQhLojNYyNpsjgal6pNcMuonB2aRDBdQEt
   C0q/u7nkK0zNGzJ6evvPUoIvbohO4INW+Chd7nGQElIDgAQXvYtUSRAml
   G1v1SxLP0NNPdsUHv83XX9xhq4bplFsxDk5M+3xSdFiT0oDSudF9d+NZT
   w==;
X-CSE-ConnectionGUID: fo5f3rggSeuV883d3jcYXA==
X-CSE-MsgGUID: ik2xPX+jSSmmnhhD8JS0LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24768975"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="24768975"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 22:32:54 -0700
X-CSE-ConnectionGUID: zlY7asZAR+eeljWSLWD74w==
X-CSE-MsgGUID: 5+crAK6YSuKBvzkafjTM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68723801"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2024 22:32:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq4Lz-0009QQ-0J;
	Mon, 16 Sep 2024 05:32:51 +0000
Date: Mon, 16 Sep 2024 13:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 6399/23714]
 drivers/md/bcache/journal.c:320:6: sparse: sparse: symbol
 'is_discard_enabled' was not declared. Should it be static?
Message-ID: <202409161342.bh5SnmU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 70e6748c08ab45df178269e4e3ae6da56c33af54 [6399/23714] bcache: fix failure in journal relplay
config: x86_64-randconfig-123-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161342.bh5SnmU9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161342.bh5SnmU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161342.bh5SnmU9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/bcache/journal.c: note: in included file (through drivers/md/bcache/bcache.h):
   include/uapi/linux/bcache.h:294:38: sparse: sparse: array of flexible structures
>> drivers/md/bcache/journal.c:320:6: sparse: sparse: symbol 'is_discard_enabled' was not declared. Should it be static?
   drivers/md/bcache/journal.c: note: in included file (through drivers/md/bcache/bcache.h):
   drivers/md/bcache/bset.h:231:36: sparse: sparse: array of flexible structures
   drivers/md/bcache/journal.c:627:13: sparse: sparse: context imbalance in 'journal_write_unlocked' - different lock contexts for basic block
   drivers/md/bcache/journal.c:725:9: sparse: sparse: context imbalance in 'journal_try_write' - different lock contexts for basic block
   drivers/md/bcache/journal.c:320:6: warning: no previous prototype for 'is_discard_enabled' [-Wmissing-prototypes]
     320 | bool is_discard_enabled(struct cache_set *s)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/md/bcache/journal.o: warning: objtool: journal_read_bucket()+0x157: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: journal_write_work()+0x6f: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: do_journal_discard()+0x4d: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: journal_reclaim()+0x64d: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: journal_wait_for_write()+0x290: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: bch_journal_mark()+0x6a2: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: is_discard_enabled()+0x13e: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: bch_journal_replay()+0x101: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: journal_write_unlocked()+0xeb: sibling call from callable instruction with modified stack frame
   drivers/md/bcache/journal.o: warning: objtool: bch_journal()+0x28d: sibling call from callable instruction with modified stack frame

vim +/is_discard_enabled +320 drivers/md/bcache/journal.c

   319	
 > 320	bool is_discard_enabled(struct cache_set *s)
   321	{
   322		struct cache *ca;
   323		unsigned int i;
   324	
   325		for_each_cache(ca, s, i)
   326			if (ca->discard)
   327				return true;
   328	
   329		return false;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
