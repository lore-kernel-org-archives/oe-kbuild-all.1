Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C0C4315F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 01:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783386979; cv=none; b=H7kXeEMSJ5CuiyGj9MO+nlJnP5IjnBDYl4IfWGFEyVvVoYvhvqEsOBhTjo867dJKWStlKUmZ0Rj+RM9AtP56PoBBY6Epl+2QQBVTYOoFRzjS7pW0gwIfPEAakX8PC9Nl1FaHP1aZ3uDCLCrJ4dRfQkVIMRslVuAsgo8BG2xURDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783386979; c=relaxed/simple;
	bh=AZ58EK4Fu35uAvo3RKDJN7hOViwlwat0Ye+UEIR4CNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EdBJiuiKR1zD8hgc2mC71e4N3M7DcSWzMyPjKFQbRi5OsBmL48t4h8+NdbRQ62ju+O/rzl+XLGBVWOwAjWxwlcnCI47ClN6BHZHyscsccnrOASM+1Z548knJcPZxSwshRm+fRAmmBt3cRSHQ7qv72EITZkD2ZamytLObGVpxPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJ9+Az+v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJ9+Az+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783386977; x=1814922977;
  h=date:from:to:cc:subject:message-id;
  bh=AZ58EK4Fu35uAvo3RKDJN7hOViwlwat0Ye+UEIR4CNU=;
  b=YJ9+Az+vulp/kA1JiuuA0rq7xejkcEInh3peKXbIqO+tFIdC+pjBKTpk
   MvYERPMyAFXA2wjLehLZwXtMk9z4ZAzSLS48LNSrug/0GryUQfslXq1RE
   NH69MjnRh9ciAP85Zq6sV/Z+SmXG8CPl8RWs5BgugW9HZP/K0hm5c+reC
   mCCQNbk0F5LcSIchI4IEa0dpPKSZWXBtbTlatgx20lOWGPwK5nDyTEpVN
   Xgaf0m8HPfuruIeyeSfsdgxdoqt32Pe3P9JaGCAxjeMwMTk6zVsn56jOf
   ZEpWiXmgptKVAm1xImM2Jas/7/I0YNdSPHXzXPIjXowCyKsSTLjCXHnIy
   Q==;
X-CSE-ConnectionGUID: KQ0c0D1qSnmnksydotz2Pw==
X-CSE-MsgGUID: m93P0YZwThWtwHwMHOwQUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95545395"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="95545395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 18:16:15 -0700
X-CSE-ConnectionGUID: 4uar+RLNSmO+JwDhVCKhmg==
X-CSE-MsgGUID: maDucKtASteTH+pm6J896g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jul 2026 18:16:13 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wguPx-000000002Qv-3vFK;
	Tue, 07 Jul 2026 01:16:09 +0000
Date: Tue, 07 Jul 2026 03:15:39 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:kvm-arm64-sme 26/30]
 ./arch/arm64/include/asm/fpsimd.h:790:59: error: 'SME_VQ_INVALID' undeclared
Message-ID: <202607070358.jjRKMyLh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kvm-arm64-sme
head:   489202b3db0a02f59477f8ec63009dc3d998341f
commit: e698ce954a7916331bb640d94f345a0a23f99d18 [26/30] KVM: arm64: Provide interface for configuring and enabling SME for guests
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607070358.jjRKMyLh-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607070358.jjRKMyLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607070358.jjRKMyLh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/processor.h:419,
                    from ./include/asm-generic/qrwlock.h:18,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from ./arch/arm64/include/asm/spinlock.h:9,
                    from ./include/linux/spinlock.h:95,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/slab.h:17,
                    from ./include/linux/resource_ext.h:11,
                    from ./include/linux/acpi.h:14,
                    from ./include/acpi/apei.h:9,
                    from ./include/acpi/ghes.h:5,
                    from ./include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   ./arch/arm64/include/asm/fpsimd.h: In function 'sme_max_virtualisable_vl':
>> ./arch/arm64/include/asm/fpsimd.h:790:59: error: 'SME_VQ_INVALID' undeclared (first use in this function)
     790 | static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
         |                                                           ^~~~~~~~~~~~~~
   ./arch/arm64/include/asm/fpsimd.h:790:59: note: each undeclared identifier is reported only once for each function it appears in


vim +/SME_VQ_INVALID +790 ./arch/arm64/include/asm/fpsimd.h

   785	
   786	static inline void sme_alloc(struct task_struct *task, bool flush) { }
   787	static inline void sme_setup(void) { }
   788	static inline unsigned int sme_get_vl(void) { return 0; }
   789	static inline int sme_max_vl(void) { return 0; }
 > 790	static inline int sme_max_virtualisable_vl(void) { return SME_VQ_INVALID; }
   791	static inline int sme_set_current_vl(unsigned long arg) { return -EINVAL; }
   792	static inline int sme_get_current_vl(void) { return -EINVAL; }
   793	static inline void sme_suspend_exit(void) { }
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
