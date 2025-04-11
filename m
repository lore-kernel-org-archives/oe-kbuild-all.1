Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FE1E835B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 05:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350035; cv=none; b=igqN2tfd3bkSl9sDF8lVcVTLLuWmyYbI7LoJgJSgsSiEpvhfhGU7INOg/8SXGBm7qwdMVCnRzRq90MyVhkoSYrsSyiUxBo018p744RMDK/DTg7SIIPfwZ9rLGVxmTvcSFFr9+YAHtUeMw4WXqYSdZR9nT3fxPtwhc4O8k4gJz6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350035; c=relaxed/simple;
	bh=Lg9eTPP61y8CyWXrKoOkYk0Pid3eB4rq+9EVIdqI3/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaUN6G6wHgTACcRCVjdcouHdImWa4J1Jh7p94R5VI/ZJJoKVb6rqOQJFCC6lirM+3+QT2+lzMI84uUJ0yiUkNWB7NZexnQlLuCDAU8klGFi6x0RDid7710ckPXaBPNuLvWj0D9Oc5/bitrHD0wQv/pzGsHDtD3bJ0rd4zkE/cc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PW42HoVE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PW42HoVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744350033; x=1775886033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lg9eTPP61y8CyWXrKoOkYk0Pid3eB4rq+9EVIdqI3/o=;
  b=PW42HoVEoCOvuHTfC7CVoXUBGc7ojVVaiUFNKSuQ0I1wSS8OAHab9Pxu
   2AQiLmuuWxT9fQ4bf20cu1UFqIo+sOTAuJ4Lf+8quOT9tIl8M0zR06pAq
   u9uyDABa4sJpV2QOznjm2+vwnYh8odby5vYFbUjfyklK+WcwjrlAQHp9R
   jAKvY+OVecCeFOb7OucXHHrJ+NpuLG9aNLNkXyZiyWyw6/RTi6stR/Dxr
   FSXxWvB8y06QbRWSSVVWmNefQw4mF0Hdsl8jcffLUhUCWQa6Ffqt/jowK
   rq8B8+JbzssoOPr2K041OUCFqEqT//TxcisOR8snP/NRib4yIYwxyqptE
   w==;
X-CSE-ConnectionGUID: IYKXj3X1R9i3OXZVCIKp3Q==
X-CSE-MsgGUID: WBTCkTJkTx6hBUZmMtiUuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45983024"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45983024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 22:40:32 -0700
X-CSE-ConnectionGUID: NDDqidmhQnCVUxEjBtpR9g==
X-CSE-MsgGUID: DG52skMASE6LTrbnGdcjnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="160077026"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2025 22:40:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u377t-000Ari-12;
	Fri, 11 Apr 2025 05:40:29 +0000
Date: Fri, 11 Apr 2025 13:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/arm64/kvm/hyp/nvhe/clock.c:39: undefined reference to
 `__kvm_nvhe___lshrti3'
Message-ID: <202504111334.Ft4xcbb3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6bd3b482a8f12750b4297426b502b735e140d8c8
commit: 022b2198fc73b7b95231730eb944d74c7f1b253c [1/1] ANDROID: KVM: arm64: Add clock support in the nVHE hyp
config: arm64-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111334.Ft4xcbb3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111334.Ft4xcbb3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111334.Ft4xcbb3-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_trace_clock':
>> arch/arm64/kvm/hyp/nvhe/clock.c:39: undefined reference to `__kvm_nvhe___lshrti3'


vim +39 arch/arm64/kvm/hyp/nvhe/clock.c

    21	
    22	/*
    23	 * This clock is relying on host provided slope and epoch values to return
    24	 * something synchronized with the host. The downside is we can't trust the
    25	 * output which must not be used for anything else than debugging.
    26	 */
    27	u64 trace_clock(void)
    28	{
    29		u64 cyc = __arch_counter_get_cntpct() - trace_clock_data.epoch_cyc;
    30		__uint128_t ns;
    31	
    32		/*
    33		 * The host kernel can avoid the 64-bits overflow of the multiplication
    34		 * by updating the epoch value with a timer (see
    35		 * kernel/time/clocksource.c). The hypervisor doesn't have that option,
    36		 * so let's do a more costly 128-bits mult here.
    37		 */
    38		ns = (__uint128_t)cyc * trace_clock_data.mult;
  > 39		ns >>= trace_clock_data.shift;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
