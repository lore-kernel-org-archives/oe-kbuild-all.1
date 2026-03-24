Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE76370D63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774315174; cv=none; b=pYX5Ud0fN0deg/NsBn/iqpZ5Gbgc9eeIwJFSE+zm9UFcCjt/InXiNESGv6CJoYQ1JHKIrtRTsGi1JPd+ELcMIfGYOLrjVRcgGoxNT3sc/yp//j4deI5BBN6EnK7YyDP5MGhjBpTmAX7PTZT6oq3pgKi8CPOMpT6CZ2GlrIKdoVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774315174; c=relaxed/simple;
	bh=hJ9aD88kSI+0ZdKYTFGJn/yyq5oMoK9HQl2GyemZLg0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mlVBDjTfw1YdjEnbYKLGbtzixQLuYqkuVnrGR20PXT0PP+U7Dfbq6TKJvQKRKbMqTzrUDgikUGlwQMudkrE/EX9FF9LOdUswTzlU7UsPXTIPDE3oIiLeVf3ZfMw6/B+KRx1/X7HVRMrpUCGqzoaM/5WeG5SjD6USjOZaFMZhp2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHJhjWkT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHJhjWkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774315172; x=1805851172;
  h=date:from:to:cc:subject:message-id;
  bh=hJ9aD88kSI+0ZdKYTFGJn/yyq5oMoK9HQl2GyemZLg0=;
  b=MHJhjWkT9J9JCNkH5ybcZ5qMhZkN2dF1fdr2UwEXQ7yiX9vC8f3jrRy1
   9vNDqkEvviQkaspfO2nNvR0BqJOJz4UfoJPq9+1lpTuoXZDw29CJMfMee
   dkeby0ZCuwOM+JX8GBM03hTYPO0LSGn3+S7QZiyjW0m+AqUzcssfwTZGp
   JdqNbXgOYI4rGCeKZe+7k8d5MIlUNB3jH/2xwjJxeq9t2mTOK4TtYPFxY
   owshdy+JEL6cgGROVdc1Syk8Sk7TLHYH6HzbjWzjzP+9qiqaQrpl0ZdJs
   vdTR3w2+0JDUzZ94hNc3fYwbaNZXTIrMsjV4/yTkQzS7dkN/6gW1r22CR
   g==;
X-CSE-ConnectionGUID: oCgC+4QcT42tNhEhw6jj9w==
X-CSE-MsgGUID: ov7kQIpdS463xPhyQvES8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86796928"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86796928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:19:32 -0700
X-CSE-ConnectionGUID: /kKSLdArTIKQcPSVQZEvtw==
X-CSE-MsgGUID: 6NVhQo6tReas5JuL85Q28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224209255"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2026 18:19:31 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qQZ-000000003Uz-43Oe;
	Tue, 24 Mar 2026 01:19:27 +0000
Date: Tue, 24 Mar 2026 09:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for
 'bpf_iter_dmabuf_new'
Message-ID: <202603240958.f6G9t5cn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: 755db8b11c512ff80570c0a57821350f2ba67937 [0/1] BACKPORT: bpf: Add open coded dmabuf iterator
config: i386-buildonly-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240958.f6G9t5cn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240958.f6G9t5cn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240958.f6G9t5cn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/dmabuf_iter.c:117:17: warning: no previous prototype for 'bpf_iter_dmabuf_new' [-Wmissing-prototypes]
     117 | __bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
         |                 ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/dmabuf_iter.c:128:29: warning: no previous prototype for 'bpf_iter_dmabuf_next' [-Wmissing-prototypes]
     128 | __bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
         |                             ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/dmabuf_iter.c:140:18: warning: no previous prototype for 'bpf_iter_dmabuf_destroy' [-Wmissing-prototypes]
     140 | __bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_dmabuf_new +117 kernel/bpf/dmabuf_iter.c

   116	
 > 117	__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
   118	{
   119		struct bpf_iter_dmabuf_kern *kit = (void *)it;
   120	
   121		BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
   122		BUILD_BUG_ON(__alignof__(*kit) != __alignof__(*it));
   123	
   124		kit->dmabuf = NULL;
   125		return 0;
   126	}
   127	
 > 128	__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *it)
   129	{
   130		struct bpf_iter_dmabuf_kern *kit = (void *)it;
   131	
   132		if (kit->dmabuf)
   133			kit->dmabuf = dma_buf_iter_next(kit->dmabuf);
   134		else
   135			kit->dmabuf = dma_buf_iter_begin();
   136	
   137		return kit->dmabuf;
   138	}
   139	
 > 140	__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
