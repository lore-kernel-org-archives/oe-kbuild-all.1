Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEA712FF70
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854807; cv=none; b=me1FBwQ66Z/KWq71KXtzLI20uR90dbd5nRuJk4zqEIggySRes4h422aQJ2ozq48Mc2u4yrWXWxd4zn3FcGzhT4geeVi9na43lsH2kSyB2oqeKlRQfEZZMy7NbwN2lnJqpHAiVtfs2BfPpG0DsPFhkDgL7bJewkrYRSgOKgLtm9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854807; c=relaxed/simple;
	bh=0mfktKIrdAfRWZwDVQVd/JM71IQMEW217y6Q09c0jlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgT1ldK6/RqllM+XultqNjdiXF5iiBBhCi/2XZ/PskG2ve+SU0nd6bL0UlyGUqXLA0vuGCdcf0POkdFEbhuLZ3gb96FS6s68NseNGP9vxOtpkyMpKeTkvgcLyrYPmU/vpuPZHiFeYzOGAA54S7GU/ye2bwuG6FNCirSQOPbmqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLzMcgSe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLzMcgSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727854805; x=1759390805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mfktKIrdAfRWZwDVQVd/JM71IQMEW217y6Q09c0jlI=;
  b=bLzMcgSetsbgos1g284+jDK0loHkobNj5O+5PPIXgN9D34LKVIEkA/jx
   4Kr1axHdJynbzCNZRzTSoRc6cdkqeWYPfaSQMu0dSfnomsgBL6An9inn4
   gaw3BNr9YGgWYW6YaimlwcLq5bsqt26jlMyiYkAYUlkWoladjrsHI+6oQ
   Mx6Sdlw0fc4aQBSEHHQqKeZgXAXVggPhLCbMrkEjFlVAAM4RcdktYovqz
   3adv+I5V3eHXvf5uX4Br63C1RCKAap1KvXEZa1LRqrh9AffASZbRIrYDw
   4HLVn/Jl4ugyDSnBnF1kC7FEUu03uVBI/ygMqf063rBHbW5mB+SqPhq1I
   A==;
X-CSE-ConnectionGUID: JGFmci0ZRfKqicQ1cekb8g==
X-CSE-MsgGUID: rzq+aZW0Si66OCCWJEx/lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="52416775"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="52416775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 00:40:04 -0700
X-CSE-ConnectionGUID: ayKHo2BoQoiXLU0oRCG1lA==
X-CSE-MsgGUID: lzFfz5CHTjORUh8ZLLodBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73946034"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Oct 2024 00:40:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svtxp-000RlD-1a;
	Wed, 02 Oct 2024 07:40:01 +0000
Date: Wed, 2 Oct 2024 15:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 10/37] fs/smb/client/cifssmb.c:1269:9:
 error: implicit declaration of function 'netfs_read_subreq_terminated'; did
 you mean 'netfs_subreq_terminated'?
Message-ID: <202410021531.0SUjtWXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   c8e953c706efd3d98534690febad481e0f4900f3
commit: 7a5c94c6c57219cee3eaf94eb299436abacf9078 [10/37] Revert "netfs: Speed up buffered reading"
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241002/202410021531.0SUjtWXw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021531.0SUjtWXw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021531.0SUjtWXw-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/cifssmb.c: In function 'cifs_readv_worker':
>> fs/smb/client/cifssmb.c:1269:9: error: implicit declaration of function 'netfs_read_subreq_terminated'; did you mean 'netfs_subreq_terminated'? [-Wimplicit-function-declaration]
    1269 |         netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         netfs_subreq_terminated

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +1269 fs/smb/client/cifssmb.c

^1da177e4c3f41 fs/cifs/cifssmb.c       Linus Torvalds  2005-04-16  1263  
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1264  static void cifs_readv_worker(struct work_struct *work)
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1265  {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1266  	struct cifs_io_subrequest *rdata =
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1267  		container_of(work, struct cifs_io_subrequest, subreq.work);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1268  
e8fae9521d5072 fs/smb/client/cifssmb.c Leon Romanovsky 2024-09-25 @1269  	netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1270  }
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1271  

:::::: The code at line 1269 was first introduced by commit
:::::: e8fae9521d507286f66374a1e1718588ddf0f4c3 Revert "cifs: Fix cifs readv callback merge resolution issue"

:::::: TO: Leon Romanovsky <leon@kernel.org>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
