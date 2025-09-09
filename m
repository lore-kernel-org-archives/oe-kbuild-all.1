Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272D288525
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410303; cv=none; b=FbXjj4d3DZKkPiDxKlJzCL8cQb+jJ4ZCd7S3zysM4Fa0MIUIGBkdIKtXQdxsWjtKezvLy62fXCMyJdTKadF4USOATMleuHR3GUPUzXmciaWRzLf61LRk4DzzEjkt2WqA1ZDMxULtfBnnK/SVumV0ZEkuvJxtakTTMwlusKn9LCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410303; c=relaxed/simple;
	bh=/9ZAnz6aUxALo+IRnMNCQfSI3xw1Dm67WyWwQmaBIqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DD4MtJUDby/IYjtTJcRtdCQ96iZbf/7KrbIjVgRP+A1NVfdu8n8Te2t1kIh3nNFBgfvnq4X/uf4MrxbmwbtVq7khg/Vjw4KPb4/zhx3Ju0x43M/iBu7aFD88qQx/snacgqwwqcBY5UG1GYI+/HtKuGFXYrTjjBYqCjzk77tq4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwiI3h9l; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwiI3h9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757410301; x=1788946301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9ZAnz6aUxALo+IRnMNCQfSI3xw1Dm67WyWwQmaBIqc=;
  b=TwiI3h9lUjozkvBByfgilmkOtvAxzXWVDlFImqzzvvEQLPkkq+DKUv1F
   Z0bILnV4RI24SqoC4WJj3psy/I90MoX6YVF2olTWxK8Sh4Orj6BH+P3vR
   mvHDBnEDEji7jV7t45uYQwt+alLa+Z3TOg9tVjyjOU1q0aqA4srv6SEf0
   GKoPvwbxmPIu/c5P77EQvy1nM8ENzl9VwpWhbK1EobTYgxSRy2FoN9ggI
   EMice+73E9Yxk5er/fvXQwvfyv9rbx9VCImdnHXYdekeJqv59INhPa+C6
   N9Iy8YFubY6BxXQ8US3gqIuL1EdcVk1NoIrOz7E0nOy3orZjE9Cdrmcf1
   Q==;
X-CSE-ConnectionGUID: 5MvZzp2mR/WcPPBGeTULXA==
X-CSE-MsgGUID: Fhb8NK2kT7C4ZZFEPZQEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="62314339"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="62314339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:31:40 -0700
X-CSE-ConnectionGUID: Z0kNYrfSQ82aEjg+/f9jkg==
X-CSE-MsgGUID: htf0Tor/TOO41ARtt/MGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="210189192"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Sep 2025 02:31:40 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvuhM-0004hf-2M;
	Tue, 09 Sep 2025 09:31:36 +0000
Date: Tue, 9 Sep 2025 17:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [linux-next:master 6034/7427]
 arch/sh/include/asm/atomic-irq.h:69:undefined reference to
 `page_range_contiguous'
Message-ID: <202509100708.5mJZ2cLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   65dd046ef55861190ecde44c6d9fcde54b9fb77d
commit: 73f5c4c5c6a36a130ccba6809337e42ccf8350fa [6034/7427] mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
config: sh-randconfig-r121-20250908 (https://download.01.org/0day-ci/archive/20250910/202509100708.5mJZ2cLm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250910/202509100708.5mJZ2cLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100708.5mJZ2cLm-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: crypto/testmgr.o: in function `sg_set_buf':
   testmgr.c:(.text+0x8fc): undefined reference to `page_range_contiguous'
   sh4-linux-ld: drivers/usb/core/devio.o: in function `sg_set_buf':
   devio.c:(.text+0xd54): undefined reference to `page_range_contiguous'
   sh4-linux-ld: drivers/media/common/videobuf2/videobuf2-dma-contig.o: in function `vb2_dc_dmabuf_ops_attach':
   videobuf2-dma-contig.c:(.text+0x920): undefined reference to `page_range_contiguous'
   sh4-linux-ld: net/core/skbuff.o: in function `__skb_to_sgvec':
   skbuff.c:(.text+0x2180): undefined reference to `page_range_contiguous'
   sh4-linux-ld: mm/gup.o: in function `unpin_user_page_range_dirty_lock':
>> arch/sh/include/asm/atomic-irq.h:69:(.text+0xe34): undefined reference to `page_range_contiguous'
   sh4-linux-ld: fs/ecryptfs/crypto.o:crypto.c:(.text+0x954): more undefined references to `page_range_contiguous' follow


vim +69 arch/sh/include/asm/atomic-irq.h

770345adc38485 Mark Rutland   2023-06-05  62  
c6470150dff9af Peter Zijlstra 2014-03-26  63  #undef ATOMIC_OPS
7d9794e7523798 Peter Zijlstra 2016-04-18  64  #define ATOMIC_OPS(op, c_op)						\
7d9794e7523798 Peter Zijlstra 2016-04-18  65  	ATOMIC_OP(op, c_op)						\
7d9794e7523798 Peter Zijlstra 2016-04-18  66  	ATOMIC_FETCH_OP(op, c_op)
7d9794e7523798 Peter Zijlstra 2016-04-18  67  
7d9794e7523798 Peter Zijlstra 2016-04-18  68  ATOMIC_OPS(and, &=)
7d9794e7523798 Peter Zijlstra 2016-04-18 @69  ATOMIC_OPS(or, |=)
7d9794e7523798 Peter Zijlstra 2016-04-18  70  ATOMIC_OPS(xor, ^=)
7d9794e7523798 Peter Zijlstra 2016-04-18  71  

:::::: The code at line 69 was first introduced by commit
:::::: 7d9794e7523798e1b9422ad9f4e4d808ae5d5932 locking/atomic, arch/sh: Implement atomic_fetch_{add,sub,and,or,xor}()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
