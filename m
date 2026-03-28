Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44C30C637
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664633; cv=none; b=FC8Ik3rCnFQOn8vXL6lKJFEHt18jgiHmMtJXn0vTzK8Ztf3hh5VJFz/BeBSVxCDY9cXPtI6hWsmkpIS7qlXkDPHQhcm7T1grDuC4oDtwwiAtLolNe3eNyNtppdEalRqYh2UA8VF4w9TZQZWumtG/IB9QP27cuhmwpdBSj2ZBPDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664633; c=relaxed/simple;
	bh=1UsZt6yo3F/JzkPXKquHb4Dy5hl7cv2ZziAY/Yg0TgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yj3E6m9ZmETgSNKHCY7DoekP+CXWICjuTmMBF3g9ueiRwGfwjZj9HLFRotN3D5LEFb0hkdESAx2BEsl4dskmZYaqbUkRXcGQJCDasY5aIQ82QmsM1BJoecIDv8PZwVSr4R8XQU4VH0DrZUu/TBzZXsnf0XNfhimAZm28h5F6b5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVmg0Z1j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVmg0Z1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774664632; x=1806200632;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1UsZt6yo3F/JzkPXKquHb4Dy5hl7cv2ZziAY/Yg0TgA=;
  b=UVmg0Z1jYz43GilQn7EQKPgzLb2Wc8NP5CaaID2xEy90gG2Qrbxa9ypO
   1J1+Y1/kZ/i3YCEsr8OtrFoiKu3/YWT9T/oSwEU44xWZKOch5zQ9nBPq6
   rO3oeqpOmQYyxkUJpoMSNigNy9eNUKCtl2YPTu8AVJExEJNgvRzjTVo9b
   EIaq71lwzQGw/X+ZHw4vnimfR2M4KrFrn03y5jTa6+67mtE5c3T2oesSm
   0D4XgKEkgBkq1XoHyHsQe8OdKRuAuhuXrFVMTZW2F6LrfRfv8YyMVrC/E
   Q6khBt8mkBRbWdz4Qgcv3SIM3o16lfGipc6dqntG17pACGi0jXEIwAfmv
   A==;
X-CSE-ConnectionGUID: UZkTq0ytTWWFGdz+jZr0Ng==
X-CSE-MsgGUID: LDLiO/ACQCygAuz6gpp5bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79349190"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79349190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 19:23:48 -0700
X-CSE-ConnectionGUID: YTIXsR96RGKIBUFOtDQo9g==
X-CSE-MsgGUID: pJ41rqVrQxSNDwoNYFrD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230262100"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 19:23:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6JKw-00000000B0V-3QDm;
	Sat, 28 Mar 2026 02:23:42 +0000
Date: Sat, 28 Mar 2026 10:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 3/3]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment makes pointer from
 integer without a cast
Message-ID: <202603281048.Pcz44CHl-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pix=
el-malibu-staging
head:   a737e30cb819fb4568ef569a28b3f168f5b4759a
commit: c0fe83ef01767a3af8396356e2f82aaab869d2f8 [3/3] ANDROID: KVM: arm64:=
 Add TRNG handling for protected guests
config: arm64-randconfig-004-20260328 (https://download.01.org/0day-ci/arch=
ive/20260328/202603281048.Pcz44CHl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260328/202603281048.Pcz44CHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281048.Pcz44CHl-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:19:0:
   arch/arm64/kvm/hyp/include/nvhe/mem_protect.h:49:42: warning: 'struct pk=
vm_sglist_page' declared inside parameter list will not be visible outside =
of this definition or declaration
    int __pkvm_host_donate_sglist_hyp(struct pkvm_sglist_page *sglist, size=
_t nr_pages);
                                             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1747:8: error: implicit declaration of fu=
nction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_=
rng'? [-Werror=3Dimplicit-function-declaration]
     ret =3D module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:9: error: implicit declaration of fu=
nction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng=
_rng'? [-Werror=3Dimplicit-function-declaration]
     uuid =3D module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1766:7: warning: assignment makes pointer=
 from integer without a cast [-Wint-conversion]
     uuid =3D module_get_guest_trng_uuid();
          ^
   cc1: some warnings being treated as errors


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
