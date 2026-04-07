Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1B39DBD2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 15:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575339; cv=none; b=kPUMT9523igaoFDYPXAKNqxBI8m/rkMqrVfwJ/5b8cu/YkPZ0qfxWLJjPHDoxPl4ygv4UDveXmgOpbZ537MUX0spfeCC7l1LD62Y7rumWhDRDJb+7mrHZBVGBZ+5z56/tY9KWO2RfPF+em6oOB82utzwRAsx/ClFB4/dhaDJByc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575339; c=relaxed/simple;
	bh=9C1+LUQy9dpuvTp3b1jt2fS3v3wrgDoO9M8kXd5QNrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=feJsc7wzJVkMLVK9PK/RqwnAd124kdzskTVCCJL/qVZJuNPpu/csYLibFgn5MsxOn5iOo5BWnwQKxmfKDgBFycCZxG8/jcOOGnkEt9qM6aEWLKyfWAYEpzibknR/a9FR3JoMKDOBZWJy5+qhAEW05LxoooUGLGdsmSxWJA7FRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAGAlE/a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAGAlE/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775575332; x=1807111332;
  h=date:from:to:cc:subject:message-id;
  bh=9C1+LUQy9dpuvTp3b1jt2fS3v3wrgDoO9M8kXd5QNrk=;
  b=ZAGAlE/a+UC9O9TjsZ8Qdum4knhXIAqVOvkAnXSjjCjpaL1NX96Vtlzr
   vBz3PLwJREOWDAnqqVIZmLODJaauVnz4DD0JDDyv+xVtCNEhTceo+Ii82
   PmfITzHJBO3fe4c5DoIYyuLnUTxeTJ6GpRIzXuzF0v3frn7zuPE5AK0+X
   WrY1WF6XRjFoKzjjaWmI/fsdkSMOBUESFbL+CagbrgeYJvgdV3fPZh/eA
   3InqQf9Rq0JxUZnZcbXlcmDSj2NOfYBJn2zLOqakDv2z6s6yHb5Ry5bAz
   jmTfIPHFMIli9QQ1Eki9UxnGlGnyXJsec4z5XN6yeQs2cul0/c7S5Kp7N
   w==;
X-CSE-ConnectionGUID: Lhg953tMRc6wr0xVfYbB0A==
X-CSE-MsgGUID: dhLHuyxQSDKJH40S7QwTYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80399175"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80399175"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:22:09 -0700
X-CSE-ConnectionGUID: gbNcxi9ERZ22YMBlizdq/A==
X-CSE-MsgGUID: hjzt19cLSEyPfsccSukE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228124586"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Apr 2026 08:22:08 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA8Fh-000000000jX-3oLz;
	Tue, 07 Apr 2026 15:22:05 +0000
Date: Tue, 07 Apr 2026 23:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Marshall <hubcap@omnibond.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hubcap:for-next 6/6] fs/orangefs/orangefs-bufmap.c:665:58:
 warning: format specifies type 'long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202604072330.P6qMVFm4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git for-next
head:   fb0898b77656046fd25c5f08cf89cd6e3899e6db
commit: fb0898b77656046fd25c5f08cf89cd6e3899e6db [6/6]    bufmap: manage as folios.
config: hexagon-randconfig-r071-20260407 (https://download.01.org/0day-ci/archive/20260407/202604072330.P6qMVFm4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604072330.P6qMVFm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604072330.P6qMVFm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/orangefs/orangefs-bufmap.c:665:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     665 |         if (size > 4194304) pr_info("%s: size:%ld\n", __func__, size);
         |                                               ~~~               ^~~~
         |                                               %zu
   include/linux/printk.h:584:34: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/orangefs/orangefs-bufmap.c:759:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     759 |         if (size > 4194304) pr_info("%s: size:%ld\n", __func__, size);
         |                                               ~~~               ^~~~
         |                                               %zu
   include/linux/printk.h:584:34: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                 ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +665 fs/orangefs/orangefs-bufmap.c

   640	
   641	/*
   642	 * we've been handed an iovec, we need to copy it to
   643	 * the shared memory descriptor at "buffer_index".
   644	 */
   645	int orangefs_bufmap_copy_from_iovec(struct iov_iter *iter,
   646					int buffer_index,
   647					size_t size)
   648	{
   649		struct orangefs_bufmap_desc *to;
   650		size_t remaining = size;
   651		int folio_index = 0;
   652		struct folio *folio;
   653		size_t folio_offset;
   654		size_t folio_avail;
   655		size_t copy_amount;
   656		size_t copied;
   657		void *kaddr;
   658		size_t half;
   659		size_t first;
   660		size_t second;
   661	
   662		to = &__orangefs_bufmap->desc_array[buffer_index];
   663	
   664		/* shouldn't happen... */
 > 665		if (size > 4194304) pr_info("%s: size:%ld\n", __func__, size);
   666	
   667		gossip_debug(GOSSIP_BUFMAP_DEBUG,
   668			"%s: buffer_index:%d size:%zu folio_count:%d\n",
   669			__func__,
   670			buffer_index,
   671			size,
   672			to->folio_count);
   673	
   674		/* Fast path: exactly two 2 MiB folios */
   675		if (to->is_two_2mib_chunks && size <= 4194304) {
   676			gossip_debug(GOSSIP_BUFMAP_DEBUG,
   677				"%s: fastpath hit.\n", __func__);
   678			half = 2097152;		/* 2 MiB */
   679			first = min(size, half);
   680			second = (size > half) ? size - half : 0;
   681	
   682			/* First 2 MiB chunk */
   683			kaddr = kmap_local_folio(to->folio_array[0], 0);
   684			copied = copy_from_iter(kaddr, first, iter);
   685			kunmap_local(kaddr);
   686			if (copied != first)
   687				return -EFAULT;
   688	
   689			if (second == 0)
   690				return 0;
   691	
   692			/* Second 2 MiB chunk */
   693			kaddr = kmap_local_folio(to->folio_array[1], 0);
   694			copied = copy_from_iter(kaddr, second, iter);
   695			kunmap_local(kaddr);
   696			if (copied != second)
   697				return -EFAULT;
   698	
   699			return 0;
   700		}
   701	
   702		while (remaining > 0) {
   703	
   704			if (unlikely(folio_index >= to->folio_count ||
   705				to->folio_array[folio_index] == NULL)) {
   706					gossip_err("%s: "
   707					   "folio_index:%d: >= folio_count:%d: "
   708			                   "(size %zu, buffer %d)\n",
   709						__func__,
   710						folio_index,
   711						to->folio_count,
   712						size,
   713						buffer_index);
   714					return -EFAULT;
   715			}
   716	
   717			folio = to->folio_array[folio_index];
   718			folio_offset = to->folio_offsets[folio_index];
   719			folio_avail = folio_nr_pages(folio) * PAGE_SIZE - folio_offset;
   720			copy_amount = min(remaining, folio_avail);
   721			kaddr = kmap_local_folio(folio, folio_offset);
   722			copied = copy_from_iter(kaddr, copy_amount, iter);
   723			kunmap_local(kaddr);
   724	
   725			if (copied != copy_amount)
   726				return -EFAULT;
   727	
   728			remaining -= copied;
   729			folio_index++;
   730		}
   731	
   732		return 0;
   733	}
   734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
