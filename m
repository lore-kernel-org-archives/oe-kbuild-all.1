Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9F22305
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 22:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cheiBWl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698963171; x=1730499171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Gm0uGCQLXrLGtorJZ/tXDdVUHAqLa3KE9DQA+5PIkM=;
  b=cheiBWl0Om18LMEg0dPCquJ3MMr6D8qPl10LeIOwRBSO9ex1sCUDupDx
   3yPuLVAR//iokx3CCZYD7dZKwy4vT9kbCTrbhsOI2p0Wszs+aHvCW69nZ
   i+5zC8scMi8jcD3yMkX9/jyQQv9ya4BRytOMM7RKftrTrr6SufFnMqXWf
   GB3T9DpWun/+5tLi3Q3uZLyA2UMWjYbAZNmlgxi74nkoWKhK+70KbTuUh
   msSlJeJAW3dMYFO7PHSDZam9XS9eOovSTDjKPFaFBAVz2qWrzWviXMw7q
   arRWrSZWiq4i/GJUZEnJH9kN5KgAMFUxn+TCYt2Khr5S/7APCWeebxjXj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369036948"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="369036948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 15:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711317523"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="711317523"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 15:12:40 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyfva-0001uv-0l;
	Thu, 02 Nov 2023 22:12:38 +0000
Date: Fri, 3 Nov 2023 06:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paul Durrant <paul@xen.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH] KVM: x86/xen: improve accuracy of Xen timers
Message-ID: <202311030654.j0vxHNkS-lkp@intel.com>
References: <b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel@infradead.org>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on mst-vhost/linux-next linus/master v6.6]
[cannot apply to kvm/linux-next next-20231102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/KVM-x86-xen-improve-accuracy-of-Xen-timers/20231028-020037
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/b5a974bdc330be91c2356f5bb2cc68ef1cc7ed40.camel%40infradead.org
patch subject: [PATCH] KVM: x86/xen: improve accuracy of Xen timers
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311030654.j0vxHNkS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030654.j0vxHNkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030654.j0vxHNkS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/xen.o: in function `kvm_xen_start_timer':
>> xen.c:(.text+0x132): undefined reference to `kvm_get_monotonic_and_clockread'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
