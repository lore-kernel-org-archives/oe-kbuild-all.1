Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34BF38AC88
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469939; cv=none; b=sOU54UA9QXgrBCz+ancKq0iARZtQHySpYAVuGcAHrE4VKSJQCo8lu5PalKhASFMfIVcZkZ00CUioS8Pb3l1IwsW0MBLu1OczCzjBQhCSKgQcHCcUvwCXr9sEvCcpgc25cHnNTOMqAChjHQAleJzSws6n0zChHR6LrUbwUzkDb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469939; c=relaxed/simple;
	bh=Dh5dBFNjyOyErGlGfkIozaKtjQohikC0Yzb3C7myCX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jRY4xTA7qLCQSX/tNYbNcKSshXVWDD7prorEJp/gWXF64suvdEoXAfNkyFD7tv3gthcswKWiMDvoQX5FIVkI3xLsjnsi/SSIs5zahSOo7gFFl+FaQjNGx25lAmm8h1ZjrxCoJUzTNTQhyNx0wBG7ZUAsV3NoTJHb6kEqxnEI/EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZmihfG5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZmihfG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780469938; x=1812005938;
  h=date:from:to:cc:subject:message-id;
  bh=Dh5dBFNjyOyErGlGfkIozaKtjQohikC0Yzb3C7myCX4=;
  b=TZmihfG5R72x9Qffk7PlJrdFBMQ2cZ3XPn2ITnJ2xeQ1oSmCQQz2ER0W
   ph6oi/oK1PvtwUJ9xLXnXPDIBQpRpBgOwrd8p3CU9HxzAP2yAD0r3W5gt
   iWE4f7FUozQ1ALNjCWzJSXD2Nli2KQrPqfUY5zFrXnkwMutRzdst68uDf
   OSVQZgraF/eOMuJ8FMovQTOVtpsy3cyR54hL0VDAHL83Kky0OAsj6vQ4V
   Is76JFrQcW1rOxEe90l1rewP4BDgYylEdCE+rYwnJMCua9a+y9SFef5Ml
   DOa8O9VG9/NwJqFYiQm4E3OBMDBojbgqnXhABtfnj3H9zJPfSsbsyc5wA
   Q==;
X-CSE-ConnectionGUID: sxL0nv4LRuGFDeZawMtDIA==
X-CSE-MsgGUID: BeDD3VRSRl2SIQEq8y4kgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81244887"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81244887"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 23:58:58 -0700
X-CSE-ConnectionGUID: 8x+IR0A4QtyXl3KARYUb3Q==
X-CSE-MsgGUID: 7/EDnbWpRl6/KCGpR6dlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="243279578"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jun 2026 23:58:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUfYz-00000000D30-0A0R;
	Wed, 03 Jun 2026 06:58:53 +0000
Date: Wed, 03 Jun 2026 14:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <joerg.roedel@amd.com>
Subject: [joro:kvm-planes-v7.1 38/60]
 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4949:1: warning: label 'out'
 defined but not used
Message-ID: <202606031446.SlDTG8c3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.1
head:   02b786614480597a489766ec45b0ec286a3301a0
commit: 0632cdf35e64ba6986335eef32556bdea08cc690 [38/60] kvm: Make KVM_SIGNAL_MSI per plane
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606031446.SlDTG8c3-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031446.SlDTG8c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031446.SlDTG8c3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/asm-generic/ioctl.h:86:69: note: in expansion of macro '_IOC_TYPECHECK'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                     ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1647:35: note: in expansion of macro '_IOR'
    1647 | #define KVM_GET_XSAVE2            _IOR(KVMIO,  0xcf, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4616:14: note: in expansion of macro 'KVM_GET_XSAVE2'
    4616 |         case KVM_GET_XSAVE2:
         |              ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1647:54: error: invalid application of 'sizeof' to incomplete type 'struct kvm_xsave'
    1647 | #define KVM_GET_XSAVE2            _IOR(KVMIO,  0xcf, struct kvm_xsave)
         |                                                      ^~~~~~
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:86:69: note: in expansion of macro '_IOC_TYPECHECK'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                     ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1647:35: note: in expansion of macro '_IOR'
    1647 | #define KVM_GET_XSAVE2            _IOR(KVMIO,  0xcf, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4616:14: note: in expansion of macro 'KVM_GET_XSAVE2'
    4616 |         case KVM_GET_XSAVE2:
         |              ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1647:54: error: invalid application of 'sizeof' to incomplete type 'struct kvm_xsave'
    1647 | #define KVM_GET_XSAVE2            _IOR(KVMIO,  0xcf, struct kvm_xsave)
         |                                                      ^~~~~~
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:86:69: note: in expansion of macro '_IOC_TYPECHECK'
      86 | #define _IOR(type,nr,argtype)           _IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                     ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1647:35: note: in expansion of macro '_IOR'
    1647 | #define KVM_GET_XSAVE2            _IOR(KVMIO,  0xcf, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4616:14: note: in expansion of macro 'KVM_GET_XSAVE2'
    4616 |         case KVM_GET_XSAVE2:
         |              ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:54: error: invalid application of 'sizeof' to incomplete type 'struct kvm_xsave'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                                      ^~~~~~
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:87:70: note: in expansion of macro '_IOC_TYPECHECK'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:35: note: in expansion of macro '_IOW'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4617:14: note: in expansion of macro 'KVM_SET_XSAVE'
    4617 |         case KVM_SET_XSAVE:
         |              ^~~~~~~~~~~~~
   include/asm-generic/ioctl.h:13:32: error: array type has incomplete element type 'struct kvm_xsave'
      13 |         ((sizeof(t) == sizeof(t[1]) && \
         |                                ^
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:87:70: note: in expansion of macro '_IOC_TYPECHECK'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:35: note: in expansion of macro '_IOW'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4617:14: note: in expansion of macro 'KVM_SET_XSAVE'
    4617 |         case KVM_SET_XSAVE:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:54: error: invalid application of 'sizeof' to incomplete type 'struct kvm_xsave'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                                      ^~~~~~
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:87:70: note: in expansion of macro '_IOC_TYPECHECK'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:35: note: in expansion of macro '_IOW'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4617:14: note: in expansion of macro 'KVM_SET_XSAVE'
    4617 |         case KVM_SET_XSAVE:
         |              ^~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:54: error: invalid application of 'sizeof' to incomplete type 'struct kvm_xsave'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                                      ^~~~~~
   include/uapi/asm-generic/ioctl.h:73:12: note: in definition of macro '_IOC'
      73 |          ((size) << _IOC_SIZESHIFT))
         |            ^~~~
   include/uapi/asm-generic/ioctl.h:87:70: note: in expansion of macro '_IOC_TYPECHECK'
      87 | #define _IOW(type,nr,argtype)           _IOC(_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(argtype)))
         |                                                                      ^~~~~~~~~~~~~~
   include/uapi/linux/kvm.h:1427:35: note: in expansion of macro '_IOW'
    1427 | #define KVM_SET_XSAVE             _IOW(KVMIO,  0xa5, struct kvm_xsave)
         |                                   ^~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4617:14: note: in expansion of macro 'KVM_SET_XSAVE'
    4617 |         case KVM_SET_XSAVE:
         |              ^~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function '__kvm_plane_ioctl':
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4949:1: warning: label 'out' defined but not used [-Wunused-label]
    4949 | out:
         | ^~~
>> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:4927:22: warning: unused variable 'argp' [-Wunused-variable]
    4927 |         void __user *argp = (void __user *)arg;
         |                      ^~~~


vim +/out +4949 arch/powerpc/kvm/../../../virt/kvm/kvm_main.c

  4924	
  4925	static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsigned long arg)
  4926	{
> 4927		void __user *argp = (void __user *)arg;
  4928		long r;
  4929	
  4930		switch (ioctl) {
  4931		case KVM_CREATE_VCPU:
  4932			r = kvm_plane_ioctl_create_vcpu(plane, arg);
  4933			break;
  4934	#ifdef CONFIG_HAVE_KVM_MSI
  4935		case KVM_SIGNAL_MSI: {
  4936			struct kvm_msi msi;
  4937	
  4938			r = -EFAULT;
  4939			if (copy_from_user(&msi, argp, sizeof(msi)))
  4940				goto out;
  4941			r = kvm_send_userspace_msi(plane->kvm, &msi, plane->level);
  4942			break;
  4943		}
  4944	#endif
  4945		default:
  4946			r = -ENOTTY;
  4947		}
  4948	
> 4949	out:
  4950		return r;
  4951	}
  4952	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
