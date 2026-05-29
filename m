Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125817D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041443; cv=none; b=rTlX6nGXdiq1//icgy2Iz1SGom1DHLnn1W5fxyBmf5GtVLlrEFNXsntaPZVSzqhXQ17Pwqj0dlfEXhC7F4TV1TQgkz5CLezz3D/rtU5AnmN7tELgg2NDCqpTO146lzpUksTD3N7Un0y0dqiNidbWtnvePLFyLQh/4fl2GvJcpyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041443; c=relaxed/simple;
	bh=XI27exKKtLxSq98QP2IOcIObzYEoWxza4aZzDZiiZ20=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ooj23sn+lbjqKJZnEbKBqlhZDyE4TeJmArbbT4WVOIJdCQbeeRHaH8kxb7JvUQEqJ2vqfC7u3XUfi/1ZNgCCIhmH4yVxsLckOdgsLowAYsj2GsdF2gHPNPA6jr8QfTy3E0BMkjCDg8Ae2KCu2eHwuY7oEcCk3MFOnOtfrFi3Vn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=LviDVAnm; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="LviDVAnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P++cmG8apfc+r3tlP24eryuwxrnssx3/i8tcMIAoAn4=;
  b=LviDVAnmswyeOLFcbXvUTFHLZtuT6FVzDt89bJHn7/x5qz5hjR/50WiE
   1yD3qWiUCPQMYCS6dioH3yT9fEYJyA4aTE9vWO/1bXD+8DxFyXhwJt8Z1
   dov9AVpgxCheoKweQwlLjuXDNjiiOuYPim7lY8ADL1swBCRrGV+6lM3rD
   Q=;
X-CSE-ConnectionGUID: 8GRAOWg4QXiEHTI9ZZMxpQ==
X-CSE-MsgGUID: 8CUad6ifS8K3tPqAIAATpw==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.24,175,1774306800"; 
   d="scan'208";a="147901240"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 09:57:11 +0200
Date: Fri, 29 May 2026 09:57:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Anup Patel <anup.patel@oss.qualcomm.com>
cc: oe-kbuild-all@lists.linux.dev, 
    Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 46/61] arch/riscv/kernel/sbi_mpxy.c:103:19-20:
 WARNING opportunity for min() (fwd)
Message-ID: <77cfdff-3490-97c-7ab0-c08dce981e1@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Fri, 29 May 2026 14:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v4 46/61]
    arch/riscv/kernel/sbi_mpxy.c:103:19-20: WARNING opportunity for min()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Anup Patel <anup.patel@oss.qualcomm.com>
CC: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   f532a039b5f6357db1cefa8fba19666b46049341
commit: d715c82481af6e5c6576ae0cb3a17bdb66a9e4ea [46/61] RISC-V: Move common MPXY helper routines to arch/riscv
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r061-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291415.zwBUuMyv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605291415.zwBUuMyv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/sbi_mpxy.c:103:19-20: WARNING opportunity for min()

vim +103 arch/riscv/kernel/sbi_mpxy.c

d715c82481af6e Anup Patel 2026-05-26   79
d715c82481af6e Anup Patel 2026-05-26   80  int sbi_mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
d715c82481af6e Anup Patel 2026-05-26   81  {
d715c82481af6e Anup Patel 2026-05-26   82  	struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
d715c82481af6e Anup Patel 2026-05-26   83  	struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
d715c82481af6e Anup Patel 2026-05-26   84  	u32 remaining, returned, count, start_index = 0;
d715c82481af6e Anup Patel 2026-05-26   85  	struct sbiret sret;
d715c82481af6e Anup Patel 2026-05-26   86
d715c82481af6e Anup Patel 2026-05-26   87  	if (!mpxy->shmem_active)
d715c82481af6e Anup Patel 2026-05-26   88  		return -ENODEV;
d715c82481af6e Anup Patel 2026-05-26   89  	if (!channel_count || !channel_ids)
d715c82481af6e Anup Patel 2026-05-26   90  		return -EINVAL;
d715c82481af6e Anup Patel 2026-05-26   91
d715c82481af6e Anup Patel 2026-05-26   92  	get_cpu();
d715c82481af6e Anup Patel 2026-05-26   93
d715c82481af6e Anup Patel 2026-05-26   94  	do {
d715c82481af6e Anup Patel 2026-05-26   95  		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
d715c82481af6e Anup Patel 2026-05-26   96  				 start_index, 0, 0, 0, 0, 0);
d715c82481af6e Anup Patel 2026-05-26   97  		if (sret.error)
d715c82481af6e Anup Patel 2026-05-26   98  			goto err_put_cpu;
d715c82481af6e Anup Patel 2026-05-26   99
d715c82481af6e Anup Patel 2026-05-26  100  		remaining = le32_to_cpu(sdata->remaining);
d715c82481af6e Anup Patel 2026-05-26  101  		returned = le32_to_cpu(sdata->returned);
d715c82481af6e Anup Patel 2026-05-26  102
d715c82481af6e Anup Patel 2026-05-26 @103  		count = returned < (channel_count - start_index) ?
d715c82481af6e Anup Patel 2026-05-26  104  			returned : (channel_count - start_index);
d715c82481af6e Anup Patel 2026-05-26  105  		memcpy_from_le32(&channel_ids[start_index], sdata->channel_array, count);
d715c82481af6e Anup Patel 2026-05-26  106  		start_index += count;
d715c82481af6e Anup Patel 2026-05-26  107  	} while (remaining && start_index < channel_count);
d715c82481af6e Anup Patel 2026-05-26  108
d715c82481af6e Anup Patel 2026-05-26  109  err_put_cpu:
d715c82481af6e Anup Patel 2026-05-26  110  	put_cpu();
d715c82481af6e Anup Patel 2026-05-26  111  	return sbi_err_map_linux_errno(sret.error);
d715c82481af6e Anup Patel 2026-05-26  112  }
d715c82481af6e Anup Patel 2026-05-26  113  EXPORT_SYMBOL_GPL(sbi_mpxy_get_channel_ids);
d715c82481af6e Anup Patel 2026-05-26  114

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
