Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387AD225416
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936696; cv=none; b=QdAVw8ek+HnyGnm98wrEbOuBa7PsVVfgSDW4mIsVjZeDAcaiEkHJoFYyBUf/8P42ChpXoLRqnowskD3ymPcwnn6TETj2BSvM2sMDxICSykPvb9zTWc4eaVFukbeq68Tp+gGZ7UnbLvDZ+lV98fTpISIG1uqRSgtv1aeswG+Orko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936696; c=relaxed/simple;
	bh=lhDydcLPTARkkGqIsYDvuzjD7mlQa6auKC/0IG8mEj4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=FRzrNpZwATYR4GasBEPYUn95xc4zLV8AtFX+ltuhRmBmo8Tog78oO+wvWnWjU9x2Rgjyw0gozQDUK/av8567w2O1cXkJgxBB8MjSZjwuZCYVX410zJqHG5sE1+4SC0qtM1KM57DG4zTz5Oiheq+RbyzLWm9AfRyuJRbk85MfvUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=elgpqyT7; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="elgpqyT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6BKqrZfNFOVD/wluPvAkeV7xyDKdnes/XQNM+54OUs=;
  b=elgpqyT76cB5BdWZtipoiZOxJlMVqCGVEQtWnJ9/SvumPS/yxnbt74OV
   /BvPqCn0fsog3LFy1tAuyOeIQxiFJUlOnSju3KiD7SAn3dhY28yPsXVCy
   ZXgRVQBAfRbPrtupmx9Cxfmm5IEThvJIY2jUG5a8eQlOqzlqlVyZZ7fVg
   M=;
X-CSE-ConnectionGUID: FcSXyMzoR9ishM3vKG8PcQ==
X-CSE-MsgGUID: wXDhByiVTDSggpcG1tP11g==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,308,1763420400"; 
   d="scan'208";a="264921593"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 13:38:06 +0100
Date: Tue, 24 Feb 2026 13:38:06 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
    Anup Patel <anup@brainfault.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_trace_support_v3 30/49] drivers/firmware/riscv/riscv_sbi_sse.c:720:6-8:
 ERROR: iterator variable bound on line 719 cannot be NULL (fwd)
Message-ID: <2d409351-777f-8c95-42a4-254a0a22648@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Tue, 24 Feb 2026 20:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v3 30/49]
    drivers/firmware/riscv/riscv_sbi_sse.c:720:6-8: ERROR: iterator variable
    bound on line 719 cannot be NULL

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v3
head:   cb6e52a5cb2529ad7d25344f6c6eaea3b3b9a13a
commit: ab09840bca500d501650d79239ebbbbfbe1a553f [30/49] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: riscv-randconfig-r064-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242019.lkBcb1eW-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602242019.lkBcb1eW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/riscv/riscv_sbi_sse.c:720:6-8: ERROR: iterator variable bound on line 719 cannot be NULL

vim +720 drivers/firmware/riscv/riscv_sbi_sse.c

ab09840bca500d Himanshu Chauhan 2026-01-02  713
ab09840bca500d Himanshu Chauhan 2026-01-02  714  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
ab09840bca500d Himanshu Chauhan 2026-01-02  715  {
ab09840bca500d Himanshu Chauhan 2026-01-02  716  	struct sse_ghes_event_data *ev_data = arg;
ab09840bca500d Himanshu Chauhan 2026-01-02  717  	struct sse_ghes_callback *cb = NULL;
ab09840bca500d Himanshu Chauhan 2026-01-02  718
ab09840bca500d Himanshu Chauhan 2026-01-02 @719  	list_for_each_entry(cb, &ev_data->callback_list, head) {
ab09840bca500d Himanshu Chauhan 2026-01-02 @720  		if (cb && cb->ghes && cb->callback) {
ab09840bca500d Himanshu Chauhan 2026-01-02  721  			cb->callback(ev_data->event_num, cb->ghes, regs);
ab09840bca500d Himanshu Chauhan 2026-01-02  722  		}
ab09840bca500d Himanshu Chauhan 2026-01-02  723  	}
ab09840bca500d Himanshu Chauhan 2026-01-02  724
ab09840bca500d Himanshu Chauhan 2026-01-02  725  	return 0;
ab09840bca500d Himanshu Chauhan 2026-01-02  726  }
ab09840bca500d Himanshu Chauhan 2026-01-02  727

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
