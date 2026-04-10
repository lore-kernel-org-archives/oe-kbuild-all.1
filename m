Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7853BED43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827725; cv=none; b=TrY7JJkp76R6zf8f1RJre4CL2+1hTAevJlnd0ztZQ58Huki17DoqO4XjX8zFNCSdrXSTpJelPiHP0qfwdJ/+Fd8uf/kU2+lWF+GShqP77WqouLfSObICTpu8kV4U5n2xOvawPIhmKkD9QA8p3IY+kk81sw0qodfq8qQYh+yHKyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827725; c=relaxed/simple;
	bh=EMGWFCO28h5VptUUGOcyLBPuamsKxWXiw0+82983Iig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ck7446oDVvSkthtYHXP2zZ7pQ3NP6pFhpOvkx1G9veF4mr7AJTVbLwfcZ109JBmIXdCOTPtPE2UslbfabTEFytjlkZmmvA7T7wjKZahvipWNZTPFnBATG4o7zoqz+6apawpb/Y3ivDQLNN+ZhoX+J+9W4fxrcOCV3A2qkYH5LVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXqZL5/R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXqZL5/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775827724; x=1807363724;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EMGWFCO28h5VptUUGOcyLBPuamsKxWXiw0+82983Iig=;
  b=XXqZL5/RBB20na8mxsjcEAR5wzBuhKj41C2unNnVWZPAsnJE0avs4XQ0
   V0SSiIlDJxE2UmgZFXFPCXUCOaxdNPK9Xo7ynMxoWCIXlLnSXOVh0mNsO
   wMk+ReCdD3DpQJ8sLqoHKNCaKsMcHe/F3uAH+PMS1UsjZexsMn3PVnNK0
   Kb6xerOjb5K4pREXrnPFhsYXewMbE3LZ0XEEIhswqa8cCVBqlgrbbPBNI
   WVWcATyd2g8PdKNhsiEo1lSoxE9EcU7rvYSrXtQxLmhTLd6D+nUUx6qB1
   gccpPgzZRjL/+sha99qnWhfZ/0mg3B+be31RnX8l0rxRcE3lwYL+kJLi9
   A==;
X-CSE-ConnectionGUID: CjCEQ+OUTYKSFcqAL6k+4g==
X-CSE-MsgGUID: qC/ASgsgTayqFgc7MWmlOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76724182"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76724182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 06:28:44 -0700
X-CSE-ConnectionGUID: 1veQS1z9QrORTl4QDXdWBQ==
X-CSE-MsgGUID: Ii7CsbLzQfSD44aEJc0uRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="230809251"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 06:28:41 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBBuZ-000000003m1-1PWn;
	Fri, 10 Apr 2026 13:28:39 +0000
Date: Fri, 10 Apr 2026 21:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:14: warning: assignment to 'const uuid_t
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202604102138.ohkHitbO-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   91e49117396d06326d151f97f382c6d93a267bea
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [1/1] ANDROID: KVM: arm64:=
 Add TRNG handling for protected guests
config: arm64-randconfig-r061-20260409 (https://download.01.org/0day-ci/arc=
hive/20260410/202604102138.ohkHitbO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260410/202604102138.ohkHitbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102138.ohkHitbO-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
      49 | int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglis=
t, size_t nr_pages);
         |                                          ^~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:21:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:38:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
      38 | bool module_handle_host_perm_fault(struct user_pt_regs *regs, u6=
4 esr, u64 addr) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:39:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
      39 | bool module_handle_host_smc(struct user_pt_regs *regs) { return =
false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
      40 | bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, st=
ruct arm_smccc_1_2_regs *res,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:15: error: implicit declaration of f=
unction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng=
_rng'? [-Werror=3Dimplicit-function-declaration]
    1747 |         ret =3D module_get_guest_trng_rng(entropy, nbits);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:16: error: implicit declaration of f=
unction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trn=
g_rng'? [-Werror=3Dimplicit-function-declaration]
    1766 |         uuid =3D module_get_guest_trng_uuid();
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:14: warning: assignment to 'const uu=
id_t *' from 'int' makes pointer from integer without a cast [-Wint-convers=
ion]
    1766 |         uuid =3D module_get_guest_trng_uuid();
         |              ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=3Dy] && VIDEO_DEV [=3Dn] && MEDIA_CONTRO=
LLER [=3Dy]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && (CFG80211_WEXT [=3Dn] |=
| WIRELESS_EXT [=3Dy])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=3Dn] && CAN_DEV [=3Dn] && CAN_NETLINK [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=3Dy]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=3Dn] && WIRELESS [=3Dn] && PROC_FS [=3Dy] && WEXT_=
CORE [=3Dy]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=3Dy]


vim +1766 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1732=09
  1733	static bool module_handle_guest_trng_rng(struct kvm_vcpu *vcpu)
  1734	{
  1735		u64 ret;
  1736		u64 entropy[DIV_ROUND_UP(ARM_SMCCC_TRNG_SMC64_BITS, 64)];
  1737		u64 nbits;
  1738=09
  1739		nbits =3D smccc_get_arg1(vcpu);
  1740		if (nbits =3D=3D 0 || nbits > ARM_SMCCC_TRNG_SMC64_BITS) {
  1741			ret =3D ARM_SMCCC_TRNG_INVALID_PARAMETERS;
  1742			goto err;
  1743		}
  1744=09
  1745		memset(entropy, 0, sizeof(entropy));
  1746=09
> 1747		ret =3D module_get_guest_trng_rng(entropy, nbits);
  1748		if (ret =3D=3D SMCCC_RET_SUCCESS) {
  1749			smccc_set_retval(vcpu, SMCCC_RET_SUCCESS, entropy[2],
  1750					 entropy[1], entropy[0]);
  1751			return true;
  1752		}
  1753=09
  1754	err:
  1755		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1756		return true;
  1757	}
  1758=09
  1759	static bool module_handle_guest_trng(struct kvm_vcpu *vcpu)
  1760	{
  1761		u32 fn;
  1762		u64 ret =3D SMCCC_RET_NOT_SUPPORTED;
  1763		const uuid_t *uuid;
  1764=09
  1765		fn =3D smccc_get_function(vcpu);
> 1766		uuid =3D module_get_guest_trng_uuid();
  1767		if (!uuid)
  1768			return false;
  1769=09
  1770		switch (fn) {
  1771		case ARM_SMCCC_TRNG_VERSION:
  1772			ret =3D ARM_SMCCC_TRNG_VER_1_0;
  1773			break;
  1774		case ARM_SMCCC_TRNG_FEATURES:
  1775			switch (smccc_get_arg1(vcpu)) {
  1776			case ARM_SMCCC_TRNG_VERSION:
  1777			case ARM_SMCCC_TRNG_FEATURES:
  1778			case ARM_SMCCC_TRNG_GET_UUID:
  1779			case ARM_SMCCC_TRNG_RND64:
  1780				ret =3D SMCCC_RET_SUCCESS;
  1781				break;
  1782			}
  1783			break;
  1784		case ARM_SMCCC_TRNG_GET_UUID:
  1785			smccc_set_retval(vcpu, le32_to_cpu(((u32 *)uuid->b)[0]),
  1786					 le32_to_cpu(((u32 *)uuid->b)[1]),
  1787					 le32_to_cpu(((u32 *)uuid->b)[2]),
  1788					 le32_to_cpu(((u32 *)uuid->b)[3]));
  1789			return true;
  1790		case ARM_SMCCC_TRNG_RND64:
  1791			return module_handle_guest_trng_rng(vcpu);
  1792		default:
  1793			return false;
  1794		}
  1795=09
  1796		smccc_set_retval(vcpu, ret, 0, 0, 0);
  1797		return true;
  1798	}
  1799=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
