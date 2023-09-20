Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720701172A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695201649; x=1726737649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P88p6W3Bv5VE3poEISOjhVWe/WEOzfrFfUCniIQm+mw=;
  b=kBjgH04ZhbY4L8TI5l2RDpukG7hhvHTvqmTMVSUdfzE2RvQ2wB+VLqfu
   diGGxUM3DuAzVrMnaiEAOdkIKhB6ResQZs3iHI8qi3tyn8Ti2FTKqnkW5
   /ZPosuvuIO+lGwUmBgqrDVu+dQZJ+inRVnKLBtehTJSbYL3vCKspBFoy4
   OzoV70KddYtqtQq25nGj5nghL8j0K2hQL17oxwgOUq3pB0TNXLhfMy7Sr
   yGmiYwGDTglz4iZK+84J5KNIJxZMz49A7kj2djCTT5YLZGe/0dVh+7g3r
   g//XzSwX9PkWIm0K11RDE6jg954kN9Qng+LNsoSpjmV2O5LgyrQmTkjPD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446643863"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="446643863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="740123077"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="740123077"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Sep 2023 02:20:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitO1-0008Z4-2Z;
	Wed, 20 Sep 2023 09:20:45 +0000
Date: Wed, 20 Sep 2023 17:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/11] arch/x86/kvm/emulate.c:252:27:
 warning: array subscript 32 is above array bounds of 'long unsigned int[17]'
Message-ID: <202309201718.BaJiQSMD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e22810eb27096fd0c640d0c30a102b102f1ac42a
commit: c108d79a122aa94d1c5fe6305be8c4fec4b64ec5 [4/11] UPSTREAM: ubsan: disable object-size sanitizer under GCC
config: x86_64-randconfig-161-20230919 (https://download.01.org/0day-ci/archive/20230920/202309201718.BaJiQSMD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201718.BaJiQSMD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201718.BaJiQSMD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'reg_read',
       inlined from 'reg_rmw' at arch/x86/kvm/emulate.c:264:2:
>> arch/x86/kvm/emulate.c:252:27: warning: array subscript 32 is above array bounds of 'long unsigned int[17]' [-Warray-bounds]
     252 |         return ctxt->_regs[nr];
         |                ~~~~~~~~~~~^~~~
   In file included from arch/x86/kvm/emulate.c:23:
   arch/x86/kvm/kvm_emulate.h: In function 'reg_rmw':
   arch/x86/kvm/kvm_emulate.h:370:23: note: while referencing '_regs'
     370 |         unsigned long _regs[NR_VCPU_REGS];
         |                       ^~~~~


vim +252 arch/x86/kvm/emulate.c

3dc4bc4f6b9265b Nadav Amit 2014-12-25  245  
dd856efafe6097a Avi Kivity 2012-08-27  246  static ulong reg_read(struct x86_emulate_ctxt *ctxt, unsigned nr)
dd856efafe6097a Avi Kivity 2012-08-27  247  {
dd856efafe6097a Avi Kivity 2012-08-27  248  	if (!(ctxt->regs_valid & (1 << nr))) {
dd856efafe6097a Avi Kivity 2012-08-27  249  		ctxt->regs_valid |= 1 << nr;
dd856efafe6097a Avi Kivity 2012-08-27  250  		ctxt->_regs[nr] = ctxt->ops->read_gpr(ctxt, nr);
dd856efafe6097a Avi Kivity 2012-08-27  251  	}
dd856efafe6097a Avi Kivity 2012-08-27 @252  	return ctxt->_regs[nr];
dd856efafe6097a Avi Kivity 2012-08-27  253  }
dd856efafe6097a Avi Kivity 2012-08-27  254  

:::::: The code at line 252 was first introduced by commit
:::::: dd856efafe6097a5c9104725c2bca74430423db8 KVM: x86 emulator: access GPRs on demand

:::::: TO: Avi Kivity <avi@redhat.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
