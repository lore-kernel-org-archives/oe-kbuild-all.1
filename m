Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A741E98ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742545337; cv=none; b=L7GXLgUvtnGSfaTnb3GX+Z2HodLfpZ8RdPb4vDON7/hKtl4aoSBf8M3f1lD5UDEfEcVeMVkLpFakqHibNFSCmTDfX4FM0eENISXGg5NhV6KVsEuEaLSeXERJuagMocbQcl8JFWA6onXRYHBur0ABukzUJ3cLUeLBSAPBCEIhVHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742545337; c=relaxed/simple;
	bh=NI4SSaUlP1UDt5cqUAU9n/PBzvJ0LROsQFOhehroFF8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=lKHZs6z520mVL5HQ9dV1X0UHKCdEZBE9Psva96hXKLqscHrfUJYP8qEDQ5m/jQIF4ESgVE/FvUWl8uMPJF0eG86bIhX1F8YGsbn73dwqWB046TPnepIV9ZhJwDRBpi8qvbEXTUaQwg8D9htFSb4bQzAi7/Twkt9fkodmY9NgUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=XNNnZVIa; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="XNNnZVIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBGwdKDA+28388iTMyzeAvqzVtL260Gpw3TDslq5458=;
  b=XNNnZVIaK4oOQgLHFYPeDxXR45FNwjwfdmsj/81nY8k9z2gA04ZG1jmc
   kI1E+2a6lZX3kkv88SCblNdKWb4rRfpksrSRhDIXTATSYljg5NAkzx5Wk
   ajcU0G9NC1L4vZ/OJkUVZaWsLBEXJs2H+75k37QsK/ifm6m8EKk97capm
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,264,1736809200"; 
   d="scan'208";a="112217475"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 09:22:06 +0100
Date: Fri, 21 Mar 2025 09:22:05 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/8] drivers/md/dm-user.c:364:9-12:
 WARNING: Unsigned expression compared with zero: out < 0 (fwd)
Message-ID: <1626c5fb-11a0-ce54-e4d9-fd5cc2ec6c9@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Fri, 21 Mar 2025 16:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline 0/8] drivers/md/dm-user.c:364:9-12:
    WARNING: Unsigned expression compared with zero: out < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   cae6b5eff8e8b7af4f2440cbb4d25fb48a7cb95c
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [0/8] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
:::::: branch date: 28 hours ago
:::::: commit date: 4 years, 3 months ago
config: x86_64-randconfig-101-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211650.krjaQ6IT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503211650.krjaQ6IT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-user.c:364:9-12: WARNING: Unsigned expression compared with zero: out < 0

vim +364 drivers/md/dm-user.c

83bf345abc0bc0 Palmer Dabbelt 2020-09-29  279
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  280  static inline long bio_flags_to_user_flags(struct bio *bio)
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  281  {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  282  	u64 out = 0;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  283  	typeof(bio->bi_opf) opf = bio->bi_opf & ~REQ_OP_MASK;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  284
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  285  	if (opf & REQ_FAILFAST_DEV) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  286  		opf &= ~REQ_FAILFAST_DEV;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  287  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DEV;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  288  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  289
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  290  	if (opf & REQ_FAILFAST_TRANSPORT) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  291  		opf &= ~REQ_FAILFAST_TRANSPORT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  292  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_TRANSPORT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  293  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  294
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  295  	if (opf & REQ_FAILFAST_DRIVER) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  296  		opf &= ~REQ_FAILFAST_DRIVER;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  297  		out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DRIVER;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  298  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  299
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  300  	if (opf & REQ_SYNC) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  301  		opf &= ~REQ_SYNC;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  302  		out |= DM_USER_REQ_MAP_FLAG_SYNC;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  303  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  304
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  305  	if (opf & REQ_META) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  306  		opf &= ~REQ_META;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  307  		out |= DM_USER_REQ_MAP_FLAG_META;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  308  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  309
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  310  	if (opf & REQ_PRIO) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  311  		opf &= ~REQ_PRIO;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  312  		out |= DM_USER_REQ_MAP_FLAG_PRIO;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  313  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  314
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  315  	if (opf & REQ_NOMERGE) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  316  		opf &= ~REQ_NOMERGE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  317  		out |= DM_USER_REQ_MAP_FLAG_NOMERGE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  318  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  319
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  320  	if (opf & REQ_IDLE) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  321  		opf &= ~REQ_IDLE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  322  		out |= DM_USER_REQ_MAP_FLAG_IDLE;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  323  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  324
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  325  	if (opf & REQ_INTEGRITY) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  326  		opf &= ~REQ_INTEGRITY;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  327  		out |= DM_USER_REQ_MAP_FLAG_INTEGRITY;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  328  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  329
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  330  	if (opf & REQ_FUA) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  331  		opf &= ~REQ_FUA;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  332  		out |= DM_USER_REQ_MAP_FLAG_FUA;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  333  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  334
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  335  	if (opf & REQ_PREFLUSH) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  336  		opf &= ~REQ_PREFLUSH;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  337  		out |= DM_USER_REQ_MAP_FLAG_PREFLUSH;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  338  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  339
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  340  	if (opf & REQ_RAHEAD) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  341  		opf &= ~REQ_RAHEAD;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  342  		out |= DM_USER_REQ_MAP_FLAG_RAHEAD;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  343  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  344
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  345  	if (opf & REQ_BACKGROUND) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  346  		opf &= ~REQ_BACKGROUND;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  347  		out |= DM_USER_REQ_MAP_FLAG_BACKGROUND;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  348  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  349
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  350  	if (opf & REQ_NOWAIT) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  351  		opf &= ~REQ_NOWAIT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  352  		out |= DM_USER_REQ_MAP_FLAG_NOWAIT;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  353  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  354
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  355  	if (opf & REQ_NOUNMAP) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  356  		opf &= ~REQ_NOUNMAP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  357  		out |= DM_USER_REQ_MAP_FLAG_NOUNMAP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  358  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  359
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  360  	if (unlikely(opf)) {
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  361  		pr_warn("unsupported BIO type %x\n", opf);
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  362  		return -EOPNOTSUPP;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  363  	}
83bf345abc0bc0 Palmer Dabbelt 2020-09-29 @364  	WARN_ON(out < 0);
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  365  	return out;
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  366  }
83bf345abc0bc0 Palmer Dabbelt 2020-09-29  367

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
