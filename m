Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF17F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 00:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709425147; cv=none; b=ABSCIWF7zRHm9KknSo3UdT8uQgfhoxkmEHKT9npWjlnWeBkeGWjjnZ+VLcBlzMP9mYiThCjDIUuEB5DCr87HnCJwUGuLhrxOuU0ua0ZwMDFSMhvQjAWxuPz3zU3zTzshchN+0Dp9WD37yiq1T0Ui6eJf8GPnqrd6yIndXTOwgwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709425147; c=relaxed/simple;
	bh=2feaPHUNYEnz9qxVDyNrh429et/sj4SiuKVtn8VaMEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=niVPGZgnDD7qR2qMQtIeDmmGoNl9Jh9VnsEMHAf7lFOYZV4htgD42j+bIXzr9eli+pbfaA9yuzIFfBu5rBXG3Fiy/It0Fxk6SoD5kZ+xQqMNi2eNHHZUNUbOjuRi/AStvD7hHGm1DGZvqMbqCU8O2dUHV3wgeMc6kIF00bTxedE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Su0uMtMj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Su0uMtMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709425146; x=1740961146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2feaPHUNYEnz9qxVDyNrh429et/sj4SiuKVtn8VaMEo=;
  b=Su0uMtMjJgmIWZBDm9nxxjCnj4tle6n174O+2cvbx90PDPI3Xie+Pi9l
   ynj1c33xrEDfPtis/SEhuKsIzgHb7pvcArrGx/lNdLDxCov6qLFk79u5e
   yR2RJQrrcBReIv4BavCl/oPaxmL0wdKeIqXE66+K3TwEDs7U6amu55m+y
   oJd1MrakkJgQJLN/gmDLcsRhK4btNQFFm8xKdg5Eue/lzlV3bNUxmoTxm
   qwaPrNV3WEL4fznQ98WuBGSXq0aTRLq32Jm8USMjwJZhQ0JtWaRZvF6D7
   RHP7f2fKZzVA0gOhIa2JmvOQBNYdMRw5h1qK4THzBc+gcu88i2XjAB5Wk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3797580"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3797580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 16:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="31748231"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2024 16:19:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgZZF-0000OG-1y;
	Sun, 03 Mar 2024 00:19:01 +0000
Date: Sun, 3 Mar 2024 08:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/7] block/blk-flush.c:484:65:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202403030804.DH6RiCg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   91714391174041bea724e68eff7ed9b5c1f439df
commit: f76294a6557b6c99c9ca58d89232171cf693eac2 [4/7] ANDROID: add hooks into blk-flush.c for customized I/O scheduler
config: i386-randconfig-061-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030804.DH6RiCg3-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030804.DH6RiCg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030804.DH6RiCg3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-flush.c:484:65: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t [usertype] flags @@
   block/blk-flush.c:484:65: sparse:     expected int flags
   block/blk-flush.c:484:65: sparse:     got restricted gfp_t [usertype] flags

vim +484 block/blk-flush.c

   469	
   470	#include <trace/hooks/block.h>
   471	struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
   472						      gfp_t flags)
   473	{
   474		struct blk_flush_queue *fq;
   475		int rq_sz = sizeof(struct request);
   476		bool skip = false;
   477	
   478		fq = kzalloc_node(sizeof(*fq), flags, node);
   479		if (!fq)
   480			goto fail;
   481	
   482		spin_lock_init(&fq->mq_flush_lock);
   483	
 > 484		trace_android_vh_blk_alloc_flush_queue(&skip, cmd_size, flags, node,
   485						       fq);
   486		if (!skip) {
   487			rq_sz = round_up(rq_sz + cmd_size, cache_line_size());
   488			fq->flush_rq = kzalloc_node(rq_sz, flags, node);
   489		}
   490		if (!fq->flush_rq)
   491			goto fail_rq;
   492	
   493		INIT_LIST_HEAD(&fq->flush_queue[0]);
   494		INIT_LIST_HEAD(&fq->flush_queue[1]);
   495		INIT_LIST_HEAD(&fq->flush_data_in_flight);
   496	
   497		lockdep_register_key(&fq->key);
   498		lockdep_set_class(&fq->mq_flush_lock, &fq->key);
   499	
   500		return fq;
   501	
   502	 fail_rq:
   503		kfree(fq);
   504	 fail:
   505		return NULL;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
