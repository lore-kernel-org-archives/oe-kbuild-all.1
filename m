Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019F1DE4FB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779483699; cv=none; b=grw0QeiRvTGFKYHUttNbT7uyzNO8Yi9DcZxjnlqc8J4nzXMtixEpsea+6vPri+gEDjdMF5K6LHUsqEhkrUvlxsQ1lIMm6JCSxRhTFFzXCawwSPU92PModkHF2S5QZ8gAsKU3cVaA1J82d4qrj4tEebAuzzQxds85SND1+Pec3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779483699; c=relaxed/simple;
	bh=W5nNDmGLm8lcyeaHZyqUsWlIc0XL6Rg/rnlYAIjduSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nXdkuQC7Llg0ODm97qB/0C0lKu0/R+p0Fdfv2sztbPio1Xfmb9PmMAfLuQuA10PZeLHKREVoaF0MjCD6tr9VoTaEHVo+zIXMJPnP/Q1hh+vqk7+w5IojDWzMYmGloVsXu0z9EzGhVgXIaEI7yYDNxEZ1ujD8diyhzVhsb4aZZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDtqDURS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDtqDURS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779483697; x=1811019697;
  h=date:from:to:cc:subject:message-id;
  bh=W5nNDmGLm8lcyeaHZyqUsWlIc0XL6Rg/rnlYAIjduSA=;
  b=HDtqDURSJA9cZeucAtca3iWdFT0CVo8NoDV5R0+YGwhUM4Z5WSgjeoNS
   OeHTEjfrV6rtR4WJAdhWTfEBko10wy1tc82irJCw9eDa/tOFvC231i1F4
   9PK8qS6FtWSV3sNGzlHkcECqrw5HQRTA7uHJyb9G0YE0aHzMiYD5s6LdK
   j4nywO7o1zccZoCoRUAUz3qz3Oqiqvff81LSzi8qNePSO60JuHDFuBSZ2
   yiXdg8+fCP2i+qF3gzk1S6jnNPeCHsgf+F2g7rG0l6hZUClEh275wRB75
   fAURzu/Ueqzw4up4+4ed/DVrAXUxAtfjYpC9tIrJbo455R3QO0530kjZT
   A==;
X-CSE-ConnectionGUID: az4jybIUQhS/qLcjEmikxw==
X-CSE-MsgGUID: j3J2FrjKQKmMe+BkADM8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80146597"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="80146597"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:01:36 -0700
X-CSE-ConnectionGUID: EBJMiT50SKurVhYn2tGXkw==
X-CSE-MsgGUID: qY83PadGT+yeyFYKhq+auw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="240176266"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2026 14:01:36 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQWzt-000000002yl-0tnP;
	Fri, 22 May 2026 21:01:33 +0000
Date: Sat, 23 May 2026 05:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-amp 2/23]
 include/linux/dma-buf.h:684:52: warning: omitting the parameter name in a
 function definition is a C23 extension
Message-ID: <202605230423.mB1EN3XD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-amp
head:   3c6990352dc1d05ac5650d3f9d2232968eb0123b
commit: a7123fbdd8fd4b221a823380ece329f285a7de4a [2/23] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260523/202605230423.mB1EN3XD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230423.mB1EN3XD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230423.mB1EN3XD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:89:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:684:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     684 |                                struct vm_area_struct *vma, unsigned long)
         |                                                                         ^
   1 warning generated.


vim +684 include/linux/dma-buf.h

   677	
   678	static inline void
   679	dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
   680					  struct sg_table *sg_table,
   681					  enum dma_data_direction direction) { }
   682	
   683	static inline int dma_buf_mmap(struct dma_buf *dmabuf,
 > 684				       struct vm_area_struct *vma, unsigned long)
   685	{
   686		return -EOPNOTSUPP;
   687	}
   688	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
