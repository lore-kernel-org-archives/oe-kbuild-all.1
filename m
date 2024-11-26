Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331641BC9FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732614080; cv=none; b=j6JjmJUEtQvztlsN+NYJ8BgBGiwFEGhu8+HyGhHfhV2c1mn30zWSbpHQb7KdZnObFgYs+cMFfbxYGhhL1vYQF6sPv4yQtT7C7RGB+Epre4SHRk3JAWV67oZ7ypHIN3R1TaHmm/t93GABfOxAazNwhe4go4zPMHa/a/t6pw5CTig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732614080; c=relaxed/simple;
	bh=r9OdyuisfODo21e6dDcPEBT9eEaMBrGCdnaFDAeXrPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dCTFQC01lkpEY7pvAKnNAPCuO2xY2Iv/iHR8W/uZVWql3txevOe/wVeaqUB/lIRtagH7NUaofyqeW4hwAX7ELO3gUlvRoCHFiiKuJrsUyTwLF8EJgVG1YoA78GYNPwfT676mjFifj+/BNjzK5MmRQ2hRIT3l/Pt+AfBVN3tazXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYDgN79r; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYDgN79r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732614079; x=1764150079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9OdyuisfODo21e6dDcPEBT9eEaMBrGCdnaFDAeXrPI=;
  b=mYDgN79rxGPzIBbObhfu4TVLVm61rY0YGHl7KnnEp0d8kFCTj5iAsUfk
   09yXAh29tB1kehis1NFXvXEqz0r265hCBptyl0gkKZ/vyk5JnDZAfHV8x
   DgYzQ9FAMuXsbmklmEXHmmTY/fNRCfxGhy5Zth3gRBXVnDG6dMHdBnLkG
   D+YA1uyI+Ns4ovRiTaYgMactq7Qg1qZm4W9Yb1PULXnC4p16BLpI7uYd4
   gNk8JOi6A1LqepV5qDKIYJVqssrrQqKCLLeQPhmpmAHV/438AFqxhkp2i
   qAUTpxa2pdIXY2CZ0gekqOe/ViWlKNsBU+n+lfYuSZBtE2JsR42Yr+d8F
   Q==;
X-CSE-ConnectionGUID: tBvAybRdTw+hoBXHgoEE2Q==
X-CSE-MsgGUID: /dSgDL9mT2WfYPOY3Omzag==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32135556"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="32135556"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 01:41:15 -0800
X-CSE-ConnectionGUID: iKyZx3eATMqg6BagnRRgaw==
X-CSE-MsgGUID: Ipu79WXaS5K0MVW2bIA3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="96485714"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2024 01:41:14 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFs4F-0007Cp-2L;
	Tue, 26 Nov 2024 09:41:11 +0000
Date: Tue, 26 Nov 2024 17:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>, Kees Cook <keescook@chromium.org>,
	Serge Hallyn <serge@hallyn.com>,
	John Johansen <john.johansen@canonical.com>
Subject: security/lsm_syscalls.c:31:1: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202411261712.iIifCLEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
commit: a04a1198088a1378d0389c250cc684f649bcc91e LSM: syscalls for current process attributes
date:   1 year ago
config: s390-randconfig-r132-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261712.iIifCLEW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241126/202411261712.iIifCLEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261712.iIifCLEW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/lsm_syscalls.c:31:1: sparse: sparse: Using plain integer as NULL pointer
>> security/lsm_syscalls.c:31:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer
   security/lsm_syscalls.c:53:1: sparse: sparse: Using plain integer as NULL pointer

vim +31 security/lsm_syscalls.c

    19	
    20	/**
    21	 * sys_lsm_set_self_attr - Set current task's security module attribute
    22	 * @attr: which attribute to set
    23	 * @ctx: the LSM contexts
    24	 * @size: size of @ctx
    25	 * @flags: reserved for future use
    26	 *
    27	 * Sets the calling task's LSM context. On success this function
    28	 * returns 0. If the attribute specified cannot be set a negative
    29	 * value indicating the reason for the error is returned.
    30	 */
  > 31	SYSCALL_DEFINE4(lsm_set_self_attr, unsigned int, attr, struct lsm_ctx __user *,
    32			ctx, size_t, size, u32, flags)
    33	{
    34		return security_setselfattr(attr, ctx, size, flags);
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
