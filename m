Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94923D297
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327375; cv=none; b=hko4KifpxcoVmyq4NhIPt2OwUmta0weygx74EqgHBFmaFCkr2MXazd7C+uvfA3nmOUtImZn0np3r+KZ0qvhyaccfwXg+XchE6qXfXuFOeGyL4I7oC+vw/sILebMMO92rUj3F0UO69Qa8BA6Ort+bHtKmSx1YiwRhnshiAperPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327375; c=relaxed/simple;
	bh=bQ6ieUKMvIBlFiiWwQwrrv7+/LP9eejiZHbzJTy14YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LRQAzuBBSZ44cHksKRjYdTnYwbQwNC5N+SY3vGRVZ81PMyTCirRQtsaQ6NaLwttlQqZp8XbNRjSEOrO0GSUh3SchxJdZ5BClsflFeX75aYod5rjiLO81SK6WRoYRJQ77ifT2LGQHafOszUJ79VUQjd2T9ULcc1lRAkjwoz3kDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjX8743b; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjX8743b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779327372; x=1810863372;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bQ6ieUKMvIBlFiiWwQwrrv7+/LP9eejiZHbzJTy14YE=;
  b=AjX8743bR0YFywf78CBS1hq3RFdG1V/ooe0R/o7TvD4sIuxYlUTDw4Nz
   rMZYm7TcJBtbTG6WsBkGnB2TJpebLD/wUeRUDpNPKDjtVlhc28srj0KvC
   9kf3oKhadMqXgt9qLygPPEE0qPXqvMQkKIVZVy1JuH1Ah0d2xQQGhy1ue
   gvB8Yl1Z87Vief0cOeKE5OmTZHULAtius4F0oTs8CO7T8q759HNWlP2Wu
   TmhnmQq2wTd/TVv8a4vjqhOQowmoA1epiAtv5fpw/Ip4ih+xR2u5otx8D
   iauo/2OBxyQx8VKY0vG/6Y68FM42kts1IoG6FyqQAfilP3tlLzz6DNQz7
   A==;
X-CSE-ConnectionGUID: EhxItJZOSfyKIGIGy/RgYw==
X-CSE-MsgGUID: OpozB+r2RUSjC5jZZkVjBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80092028"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80092028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:36:10 -0700
X-CSE-ConnectionGUID: pnJ6m4sTS6+Ja1RO/d+YWw==
X-CSE-MsgGUID: Te4h7BgtR76ftcpAIa12gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244682854"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2026 18:36:10 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPsK1-000000004AD-1CBC;
	Thu, 21 May 2026 01:35:47 +0000
Date: Thu, 21 May 2026 09:35:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uuid_t
 *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from integer
 without a cast
Message-ID: <202605210917.VO1I43z2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f26b61355a1b5a3b8286d5bddc7a3fa5a5191317
commit: eff36ac2fe9748dfe31b22d00b62f6eaf7323732 [2/2] ANDROID: KVM: arm64:=
 Add TRNG handling for protected guests
config: arm64-randconfig-r072-20260521 (https://download.01.org/0day-ci/arc=
hive/20260521/202605210917.VO1I43z2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605210917.VO1I43z2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210917.VO1I43z2-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/pkvm.c:23:
   arch/arm64/kvm/hyp/include/nvhe/modules.h:40:6: warning: no previous pro=
totype for 'module_handle_host_perm_fault' [-Wmissing-prototypes]
    bool module_handle_host_perm_fault(struct user_pt_regs *regs, u64 esr, =
u64 addr) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:41:6: warning: no previous pro=
totype for 'module_handle_host_smc' [-Wmissing-prototypes]
    bool module_handle_host_smc(struct user_pt_regs *regs) { return false; }
         ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/include/nvhe/modules.h:42:6: warning: no previous pro=
totype for 'module_handle_guest_smc' [-Wmissing-prototypes]
    bool module_handle_guest_smc(struct arm_smccc_1_2_regs *regs, struct ar=
m_smccc_1_2_regs *res,
         ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng_rn=
g':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1868:8: error: implicit declaration of fu=
nction 'module_get_guest_trng_rng'; did you mean 'module_handle_guest_trng_=
rng'? [-Werror=3Dimplicit-function-declaration]
     ret =3D module_get_guest_trng_rng(entropy, nbits);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
           module_handle_guest_trng_rng
   arch/arm64/kvm/hyp/nvhe/pkvm.c: In function 'module_handle_guest_trng':
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:9: error: implicit declaration of fu=
nction 'module_get_guest_trng_uuid'; did you mean 'module_handle_guest_trng=
_rng'? [-Werror=3Dimplicit-function-declaration]
     uuid =3D module_get_guest_trng_uuid();
            ^~~~~~~~~~~~~~~~~~~~~~~~~~
            module_handle_guest_trng_rng
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1887:7: warning: assignment to 'const uui=
d_t *' {aka 'const struct <anonymous> *'} from 'int' makes pointer from int=
eger without a cast [-Wint-conversion]
     uuid =3D module_get_guest_trng_uuid();
          ^
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
