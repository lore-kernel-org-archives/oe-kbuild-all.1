Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B0A18E20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736731329; cv=none; b=KteF3GXMJ7NImMdniIMOzM9EmgYiak4mvUQn9QRPHIrcH61g0+0pg9Lyfgsz0xj5jKHFURIMTPE70BAjfRc5UHtpnO3dJL+90uOJ+bDELlIYSGiPorimzB6aMREsQuS8EFUaxt+8nfx/qSLdTJBkXLCj7kwze2YyTs5lebSN1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736731329; c=relaxed/simple;
	bh=P+DqSZ4y3qMvR5GaGBJYnKhNpb5oFyiTf6seggEe6s0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZSkLBpiaoFm2u9vEwhX+Yr0yyXtnXk8e2z/Lnkx/M7BjFmvhpc+opASN/BTaKYAKCyWybTC7kx8EQpXCCowG+vU5kFzeH9pbVCDsO2kcB/QLvSiIfG7YScG1S4gwpSVwlJusGhl6FTq7IJD7ptAcOXnecPI3MYdp+VPiSu5hx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVxosxj3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVxosxj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736731327; x=1768267327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+DqSZ4y3qMvR5GaGBJYnKhNpb5oFyiTf6seggEe6s0=;
  b=LVxosxj3zQL7nbBvU5/hAjXte7w/WzOHG6BuIw8mgjs4xeidWzMXKwtH
   tyohtkxH2klV7k01DMfSSZ5iNr5nDtv49JrtLXia+v6oQLy8FsYU4TuJo
   0y4fYwR6RLkZiHFK8pbarehz3bk4fSo4Bpyae5+Gw9DSo5jQhozAntzqf
   mi6bi2tJGBOhLT0F9P4pVtelw2oclCjXGjvmn5QQrSXsBAHwWnVQjgZmX
   JdbIHM0ff6iPDTf3vYZiFfmfy2fGEwC39BzK8N4PDsbelsMc2U3BYjQQQ
   yc+7LZycPVDeOpZeQDGHC6rlUUCqHRL5r5/0xtWGjzIHq/c8yNsPDhIrB
   w==;
X-CSE-ConnectionGUID: fkynVhTqTCyyFQnUD7sj+A==
X-CSE-MsgGUID: O5WQfVWkQMWx67lUBwU3Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="37134891"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37134891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 17:22:06 -0800
X-CSE-ConnectionGUID: BNFbgP4bQBSMO1siJz4vPg==
X-CSE-MsgGUID: bbQqTUb6Tr+dWT3ZBBu2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105170542"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2025 17:22:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX99X-000Mb0-0W;
	Mon, 13 Jan 2025 01:22:03 +0000
Date: Mon, 13 Jan 2025 09:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [linux-next:master 5495/7860]
 drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202501130921.ktqwsMLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 3c8cfec3fcc4fe53f2bd87ec91ef31df4fa6dc0d [5495/7860] accel/amdxdna: Declare mailbox register base as __iomem pointer
config: x86_64-randconfig-121-20250113 (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130921.ktqwsMLH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +334 drivers/accel/amdxdna/amdxdna_mailbox.c

b87f920b934426 Lizhi Hou 2024-11-18  274  
b87f920b934426 Lizhi Hou 2024-11-18  275  static int mailbox_get_msg(struct mailbox_channel *mb_chann)
b87f920b934426 Lizhi Hou 2024-11-18  276  {
b87f920b934426 Lizhi Hou 2024-11-18  277  	struct xdna_msg_header header;
3c8cfec3fcc4fe Lizhi Hou 2025-01-02  278  	void __iomem *read_addr;
b87f920b934426 Lizhi Hou 2024-11-18  279  	u32 msg_size, rest;
b87f920b934426 Lizhi Hou 2024-11-18  280  	u32 ringbuf_size;
b87f920b934426 Lizhi Hou 2024-11-18  281  	u32 head, tail;
b87f920b934426 Lizhi Hou 2024-11-18  282  	u32 start_addr;
b87f920b934426 Lizhi Hou 2024-11-18  283  	int ret;
b87f920b934426 Lizhi Hou 2024-11-18  284  
b87f920b934426 Lizhi Hou 2024-11-18  285  	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
b87f920b934426 Lizhi Hou 2024-11-18  286  		return -EINVAL;
b87f920b934426 Lizhi Hou 2024-11-18  287  	head = mb_chann->i2x_head;
b87f920b934426 Lizhi Hou 2024-11-18  288  	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
b87f920b934426 Lizhi Hou 2024-11-18  289  	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
b87f920b934426 Lizhi Hou 2024-11-18  290  
b87f920b934426 Lizhi Hou 2024-11-18  291  	if (unlikely(tail > ringbuf_size || !IS_ALIGNED(tail, 4))) {
b87f920b934426 Lizhi Hou 2024-11-18  292  		MB_WARN_ONCE(mb_chann, "Invalid tail 0x%x", tail);
b87f920b934426 Lizhi Hou 2024-11-18  293  		return -EINVAL;
b87f920b934426 Lizhi Hou 2024-11-18  294  	}
b87f920b934426 Lizhi Hou 2024-11-18  295  
b87f920b934426 Lizhi Hou 2024-11-18  296  	/* ringbuf empty */
b87f920b934426 Lizhi Hou 2024-11-18  297  	if (head == tail)
b87f920b934426 Lizhi Hou 2024-11-18  298  		return -ENOENT;
b87f920b934426 Lizhi Hou 2024-11-18  299  
b87f920b934426 Lizhi Hou 2024-11-18  300  	if (head == ringbuf_size)
b87f920b934426 Lizhi Hou 2024-11-18  301  		head = 0;
b87f920b934426 Lizhi Hou 2024-11-18  302  
b87f920b934426 Lizhi Hou 2024-11-18  303  	/* Peek size of the message or TOMBSTONE */
b87f920b934426 Lizhi Hou 2024-11-18  304  	read_addr = mb_chann->mb->res.ringbuf_base + start_addr + head;
3c8cfec3fcc4fe Lizhi Hou 2025-01-02  305  	header.total_size = readl(read_addr);
b87f920b934426 Lizhi Hou 2024-11-18  306  	/* size is TOMBSTONE, set next read from 0 */
b87f920b934426 Lizhi Hou 2024-11-18  307  	if (header.total_size == TOMBSTONE) {
b87f920b934426 Lizhi Hou 2024-11-18  308  		if (head < tail) {
b87f920b934426 Lizhi Hou 2024-11-18  309  			MB_WARN_ONCE(mb_chann, "Tombstone, head 0x%x tail 0x%x",
b87f920b934426 Lizhi Hou 2024-11-18  310  				     head, tail);
b87f920b934426 Lizhi Hou 2024-11-18  311  			return -EINVAL;
b87f920b934426 Lizhi Hou 2024-11-18  312  		}
b87f920b934426 Lizhi Hou 2024-11-18  313  		mailbox_set_headptr(mb_chann, 0);
b87f920b934426 Lizhi Hou 2024-11-18  314  		return 0;
b87f920b934426 Lizhi Hou 2024-11-18  315  	}
b87f920b934426 Lizhi Hou 2024-11-18  316  
b87f920b934426 Lizhi Hou 2024-11-18  317  	if (unlikely(!header.total_size || !IS_ALIGNED(header.total_size, 4))) {
b87f920b934426 Lizhi Hou 2024-11-18  318  		MB_WARN_ONCE(mb_chann, "Invalid total size 0x%x", header.total_size);
b87f920b934426 Lizhi Hou 2024-11-18  319  		return -EINVAL;
b87f920b934426 Lizhi Hou 2024-11-18  320  	}
b87f920b934426 Lizhi Hou 2024-11-18  321  	msg_size = sizeof(header) + header.total_size;
b87f920b934426 Lizhi Hou 2024-11-18  322  
b87f920b934426 Lizhi Hou 2024-11-18  323  	if (msg_size > ringbuf_size - head || msg_size > tail - head) {
b87f920b934426 Lizhi Hou 2024-11-18  324  		MB_WARN_ONCE(mb_chann, "Invalid message size %d, tail %d, head %d",
b87f920b934426 Lizhi Hou 2024-11-18  325  			     msg_size, tail, head);
b87f920b934426 Lizhi Hou 2024-11-18  326  		return -EINVAL;
b87f920b934426 Lizhi Hou 2024-11-18  327  	}
b87f920b934426 Lizhi Hou 2024-11-18  328  
b87f920b934426 Lizhi Hou 2024-11-18  329  	rest = sizeof(header) - sizeof(u32);
b87f920b934426 Lizhi Hou 2024-11-18  330  	read_addr += sizeof(u32);
3c8cfec3fcc4fe Lizhi Hou 2025-01-02  331  	memcpy_fromio((u32 *)&header + 1, read_addr, rest);
b87f920b934426 Lizhi Hou 2024-11-18  332  	read_addr += rest;
b87f920b934426 Lizhi Hou 2024-11-18  333  
b87f920b934426 Lizhi Hou 2024-11-18 @334  	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
b87f920b934426 Lizhi Hou 2024-11-18  335  
b87f920b934426 Lizhi Hou 2024-11-18  336  	mailbox_set_headptr(mb_chann, head + msg_size);
b87f920b934426 Lizhi Hou 2024-11-18  337  	/* After update head, it can equal to ringbuf_size. This is expected. */
b87f920b934426 Lizhi Hou 2024-11-18  338  	trace_mbox_set_head(MAILBOX_NAME, mb_chann->msix_irq,
b87f920b934426 Lizhi Hou 2024-11-18  339  			    header.opcode, header.id);
b87f920b934426 Lizhi Hou 2024-11-18  340  
b87f920b934426 Lizhi Hou 2024-11-18  341  	return ret;
b87f920b934426 Lizhi Hou 2024-11-18  342  }
b87f920b934426 Lizhi Hou 2024-11-18  343  

:::::: The code at line 334 was first introduced by commit
:::::: b87f920b934426a24d54613f12ed67c03ae05024 accel/amdxdna: Support hardware mailbox

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Jeffrey Hugo <quic_jhugo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
