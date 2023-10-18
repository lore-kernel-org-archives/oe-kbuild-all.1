Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03571A593
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmODrlYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697655499; x=1729191499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOmvCJgcXxkQ7QQrzNPjmAOh7yprOoZm/bIJhUOAzOM=;
  b=CmODrlYVA7vi9xXi5+Q7VfF41c7c6plC0RnnQS6HzVys4Hr1s7F+VnKb
   0RPM9lZFo9EmIg4lYZZrlGtIOkUHy5/IpSBl+b2fZoweX77LvKCe+zUtk
   NbjiICPzYpL9o81bz/xjx6OHVq6ORjd59hcFkwOxRUYDsdNtL07HgKf4P
   /j+sxvURvOCpcpupQeNnGysIJgEo2nP6PomTxE/LC53ptEAiHlbrYCJDC
   kSraBH4VjQQrOCiaufHoORzjc0NTT8vWHppBCkotAYyVyaM8uZ5X3DjaC
   ZCZttg9LiB9r7f4bgAjWpNpn7f9yyIhp11FFHcul/jU9hZIcJmCSB6bch
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="383306579"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="383306579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 11:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880338099"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="880338099"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Oct 2023 11:58:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtBkE-0000rA-1f;
	Wed, 18 Oct 2023 18:58:14 +0000
Date: Thu, 19 Oct 2023 02:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:master 4318/13299] arch/powerpc/kvm/powerpc.c:1732:52:
 error: implicit declaration of function 'kvmppc_get_vrsave'; did you mean
 'kvmppc_get_sr'?
Message-ID: <202310190201.4wyYJ6j5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: 7028ac8d174f28220f0e2de0cb3346cd3c31976d [4318/13299] KVM: PPC: Use accessors for VCPU registers
config: powerpc64-randconfig-r011-20211214 (https://download.01.org/0day-ci/archive/20231019/202310190201.4wyYJ6j5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190201.4wyYJ6j5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190201.4wyYJ6j5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvmppc_set_vmx_dword':
   arch/powerpc/kvm/powerpc.c:1061:9: error: implicit declaration of function 'kvmppc_get_vsx_vr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1061 |         kvmppc_get_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_get_sr
   arch/powerpc/kvm/powerpc.c:1063:9: error: implicit declaration of function 'kvmppc_set_vsx_vr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1063 |         kvmppc_set_vsx_vr(vcpu, index, &val.vval);
         |         ^~~~~~~~~~~~~~~~~
         |         kvmppc_set_sr
   In file included from arch/powerpc/kvm/powerpc.c:25:
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_get_one_reg':
   arch/powerpc/kvm/powerpc.c:1729:52: error: implicit declaration of function 'kvmppc_get_vscr'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1729 |                         val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
         |                                                    ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:412:29: note: in definition of macro 'get_reg_val'
     412 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
>> arch/powerpc/kvm/powerpc.c:1732:52: error: implicit declaration of function 'kvmppc_get_vrsave'; did you mean 'kvmppc_get_sr'? [-Werror=implicit-function-declaration]
    1732 |                         val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
         |                                                    ^~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:412:29: note: in definition of macro 'get_reg_val'
     412 |         case 4: __u.wval = (reg); break;        \
         |                             ^~~
   arch/powerpc/kvm/powerpc.c: In function 'kvm_vcpu_ioctl_set_one_reg':
   arch/powerpc/kvm/powerpc.c:1780:25: error: implicit declaration of function 'kvmppc_set_vscr'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1780 |                         kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~
         |                         kvmppc_set_sr
>> arch/powerpc/kvm/powerpc.c:1787:25: error: implicit declaration of function 'kvmppc_set_vrsave'; did you mean 'kvmppc_set_sr'? [-Werror=implicit-function-declaration]
    1787 |                         kvmppc_set_vrsave(vcpu, set_reg_val(reg->id, val));
         |                         ^~~~~~~~~~~~~~~~~
         |                         kvmppc_set_sr
   cc1: all warnings being treated as errors


vim +1732 arch/powerpc/kvm/powerpc.c

  1701	
  1702	int kvm_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
  1703	{
  1704		int r = 0;
  1705		union kvmppc_one_reg val;
  1706		int size;
  1707	
  1708		size = one_reg_size(reg->id);
  1709		if (size > sizeof(val))
  1710			return -EINVAL;
  1711	
  1712		r = kvmppc_get_one_reg(vcpu, reg->id, &val);
  1713		if (r == -EINVAL) {
  1714			r = 0;
  1715			switch (reg->id) {
  1716	#ifdef CONFIG_ALTIVEC
  1717			case KVM_REG_PPC_VR0 ... KVM_REG_PPC_VR31:
  1718				if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
  1719					r = -ENXIO;
  1720					break;
  1721				}
  1722				kvmppc_get_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0, &val.vval);
  1723				break;
  1724			case KVM_REG_PPC_VSCR:
  1725				if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
  1726					r = -ENXIO;
  1727					break;
  1728				}
  1729				val = get_reg_val(reg->id, kvmppc_get_vscr(vcpu));
  1730				break;
  1731			case KVM_REG_PPC_VRSAVE:
> 1732				val = get_reg_val(reg->id, kvmppc_get_vrsave(vcpu));
  1733				break;
  1734	#endif /* CONFIG_ALTIVEC */
  1735			default:
  1736				r = -EINVAL;
  1737				break;
  1738			}
  1739		}
  1740	
  1741		if (r)
  1742			return r;
  1743	
  1744		if (copy_to_user((char __user *)(unsigned long)reg->addr, &val, size))
  1745			r = -EFAULT;
  1746	
  1747		return r;
  1748	}
  1749	
  1750	int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
  1751	{
  1752		int r;
  1753		union kvmppc_one_reg val;
  1754		int size;
  1755	
  1756		size = one_reg_size(reg->id);
  1757		if (size > sizeof(val))
  1758			return -EINVAL;
  1759	
  1760		if (copy_from_user(&val, (char __user *)(unsigned long)reg->addr, size))
  1761			return -EFAULT;
  1762	
  1763		r = kvmppc_set_one_reg(vcpu, reg->id, &val);
  1764		if (r == -EINVAL) {
  1765			r = 0;
  1766			switch (reg->id) {
  1767	#ifdef CONFIG_ALTIVEC
  1768			case KVM_REG_PPC_VR0 ... KVM_REG_PPC_VR31:
  1769				if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
  1770					r = -ENXIO;
  1771					break;
  1772				}
  1773				kvmppc_set_vsx_vr(vcpu, reg->id - KVM_REG_PPC_VR0, &val.vval);
  1774				break;
  1775			case KVM_REG_PPC_VSCR:
  1776				if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
  1777					r = -ENXIO;
  1778					break;
  1779				}
  1780				kvmppc_set_vscr(vcpu, set_reg_val(reg->id, val));
  1781				break;
  1782			case KVM_REG_PPC_VRSAVE:
  1783				if (!cpu_has_feature(CPU_FTR_ALTIVEC)) {
  1784					r = -ENXIO;
  1785					break;
  1786				}
> 1787				kvmppc_set_vrsave(vcpu, set_reg_val(reg->id, val));
  1788				break;
  1789	#endif /* CONFIG_ALTIVEC */
  1790			default:
  1791				r = -EINVAL;
  1792				break;
  1793			}
  1794		}
  1795	
  1796		return r;
  1797	}
  1798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
