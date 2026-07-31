Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C58449B35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518082; cv=none; b=BysAgjmEuw/6ECTs6Hiv9wY0fMPiw8VfIjd8itUDzajrSz3p45wCZcF8niiW9ysO1pQ99PZLkY0yqIE5iWTPQ8a7ZLzJqoQgYyUuluJ4ob1O7GUmtyZqGnBrDQgDQObwVFz9kH07ib/2hd3VTBIZe5DcUuuJf0D0pbZHot6MbIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518082; c=relaxed/simple;
	bh=e9Xgj3cdwRMG9ypOhNM4u0cxWlCW5Wdp1zvt9iVAbeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=koMl0PwziAE9bfIlcjWJztqMy8Sf+aJwal+9Gu+Xr2kKcNg2a9sAbFJ+3dFHA+yhMr4Oxe7hf5ndGiOq1h/fsrz9MnE7i+lEtG2MgDlrMpBbJT53qphCB9UBNqR9UxK7IaC4HFr3XRjEidDE2kJAmRANxlCuTF2VzFTA1r02eCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iy1O//+t; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iy1O//+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785518080; x=1817054080;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e9Xgj3cdwRMG9ypOhNM4u0cxWlCW5Wdp1zvt9iVAbeg=;
  b=iy1O//+t3JyCbJAjpbhCOn/rROJU4ftFZxLPh3mtnKfcRBdaOsUKY6JN
   cM9xbr/p51uktAuFAnKv3geXAFDFk8k1jagTb87gW/Fc0KAqtyID9slad
   gPMO/AO7VpUx/2AB+cd8gX4XvtlX+qU28PwseBDZWix14RnvVejkiTsUk
   rGoFlgdW5NkJNNlT+XU5JNNKCpETENqUfeqnAzqbxZ9D1DdQs6YNuE7UN
   QIVdFdjQgUnon/gmTW82CLutrttZ4ZHXzCsJR/spOJG2Nyb97GmyS+V7d
   ThOZIE6i9wMrEkIpQ7V6PxcPhdBXReGwueBderrk/zyhTJ48AqLgw2fP6
   g==;
X-CSE-ConnectionGUID: F5wPNyMSRCiiKkXHCKA+Iw==
X-CSE-MsgGUID: J8srVvM4TJuYL9F7vmM7pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="108944948"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="108944948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:14:40 -0700
X-CSE-ConnectionGUID: MZnQz+mZSaGBFzLqPWnlxQ==
X-CSE-MsgGUID: 7xGcBV0ERhi0tgIw1X25/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="258835451"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 10:14:38 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpqoe-000000001jx-1UPs;
	Fri, 31 Jul 2026 17:14:36 +0000
Date: Sat, 01 Aug 2026 01:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-kminext 2/2]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uuid_t
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202608010034.YXjcWdUW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bart=C5=82omiej,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kmine=
xt
head:   5f0eb26cb7246c8412f464078342992f756b7b74
commit: eff36ac2fe9748dfe31b22d00b62f6eaf7323732 [2/2] ANDROID: KVM: arm64:=
 Add TRNG handling for protected guests
config: arm64-randconfig-003-20260731 (https://download.01.org/0day-ci/arch=
ive/20260801/202608010034.YXjcWdUW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260801/202608010034.YXjcWdUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010034.YXjcWdUW-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      40 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      41 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
      42 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, st=
ruct arm_smccc_1_2_regs *res,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: error: implicit declaration of fu=
nction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_=
rng'? [-Werror=3Dimplicit-function-declaration]
    1868 |  ret =3D module_get_guest_trng_rng(entropy, nbits);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
         |        module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:9: error: implicit declaration of fu=
nction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng=
_rng'? [-Werror=3Dimplicit-function-declaration]
    1887 |  uuid =3D module_get_guest_trng_uuid();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uui=
d_t *' from 'int' makes pointer from integer without a cast [-Wint-conversi=
on]
    1887 |  uuid =3D module_get_guest_trng_uuid();
         |       ^
   cc1: some warnings being treated as errors


vim +1887 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1879=09
  1880	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1881	{
  1882		u32 fn;
  1883		u64 ret =3D SMCCC_RET_NOT_SUPPORTED;
  1884		const uuid_t *uuid;
  1885=09
  1886		fn =3D smccc_get_function(vcpu);
> 1887		uuid =3D module_get_guest_trng_uuid();
  1888		if (!uuid)
  1889			return false;
  1890=09
  1891		switch (fn) {
  1892		case ARM_SMCCC_TRNG_VERSION:
  1893			ret =3D ARM_SMCCC_TRNG_VER_1_0;
  1894			break;
  1895		case ARM_SMCCC_TRNG_FEATURES:
  1896			switch (smccc_get_arg1(vcpu)) {
  1897			case ARM_SMCCC_TRNG_VERSION:
  1898			case ARM_SMCCC_TRNG_FEATURES:
  1899			case ARM_SMCCC_TRNG_GET_UUID:
  1900			case ARM_SMCCC_TRNG_RND64:
  1901				ret =3D SMCCC_RET_SUCCESS;
  1902				break;
  1903			}
  1904			break;
  1905		case ARM_SMCCC_TRNG_GET_UUID:
  1906			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
  1907					 le32_to_cpu(((u32 *)uuid->b)[1]),
  1908					 le32_to_cpu(((u32 *)uuid->b)[2]),
  1909					 le32_to_cpu(((u32 *)uuid->b)[3]));
  1910			return true;
  1911		case ARM_SMCCC_TRNG_RND64:
  1912			return module_handle_guest_trng_rng(vcpu);
  1913		default:
  1914			return false;
  1915		}
  1916=09
  1917		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1918		return true;
  1919	}
  1920=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
