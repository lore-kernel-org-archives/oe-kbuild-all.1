Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73603D2F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685528131; x=1717064131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d2nNJ9ngVdD3OQctKhL960mad1h6ICsZ0WUez7KiNrA=;
  b=IEb5xtuvWbLroDO6nzPT2PjYV9FbqBCNLzF7ooKqMzqzud4rCAHilAtz
   Sk0gHsDgj1ZyKa6SdU2ZBFeKJyotW+YVqv/W+89XdEOMIAP78ZIwdPszJ
   wQ166Zr66SOYMXHpID+uTRzrj9zu77bm9WbflDLh2/rui2IE6KPFEtXdZ
   N4TlAZv2HrHREIYkO1I3kjnhLpLsLr4YUOwPMNB9HxSnqikwsNGn6xKWw
   t90Ag6Sv4QbuFwTgERZk3bubw69Tuta5a5nASQsXe0JgTeAqyGMbyTccz
   hoU/N6BITsk5vc1qpaiNN/9TueOdojF7PTEC8sxVHFKrg6cBqL6FNUkjv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="335540676"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="335540676"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 03:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="706821589"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="706821589"
Received: from yfu5-mobl1.ccr.corp.intel.com (HELO localhost) ([10.255.31.7])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 03:15:27 -0700
Date: Wed, 31 May 2023 18:15:30 +0800
From: yu.c.zhang@linux.intel.com
To: Sean Christopherson <seanjc@google.com>
Cc: kernel test robot <lkp@intel.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [kvm-x86:selftests 1/3] make[1]: *** No rule to make target
 'kselftest/kvm/x86_64/cpuid_test.c', needed by
 'kselftest/kvm/x86_64/cpuid_test.o'.
Message-ID: <20230531101530.zxtjvhjy5d6n5nfw@linux.intel.com>
References: <202305302015.D8PglEU7-lkp@intel.com>
 <ZHZyUxsezAz083lO@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHZyUxsezAz083lO@google.com>
User-Agent: NeoMutt/20171215

On Tue, May 30, 2023 at 03:01:55PM -0700, Sean Christopherson wrote:
> On Tue, May 30, 2023, kernel test robot wrote:
> > Hi Yu,
> > 
> > First bad commit (maybe != root cause):
> 
> Confirmed that reverting 954c9c3f96698f3af0c22f93a68e3905bc185458 makes the problem
> go away.
> 
> > tree:   https://github.com/kvm-x86/linux selftests
> 
> In case it wasn't obvious, I applied and pushed this to kvm-x86/selftests but
> hadn't yet merged it to kvm-x86/next.
> 
> > head:   a985a858acff64afaa5cf60e058357034cb14476
> > commit: 954c9c3f96698f3af0c22f93a68e3905bc185458 [1/3] KVM: selftests: Add new CFLAGS to generate dependency files
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce:
> >         # https://github.com/kvm-x86/linux/commit/954c9c3f96698f3af0c22f93a68e3905bc185458
> >         git remote add kvm-x86 https://github.com/kvm-x86/linux
> >         git fetch --no-tags kvm-x86 selftests
> >         git checkout 954c9c3f96698f3af0c22f93a68e3905bc185458
> >         make O=/tmp/kselftest headers
> >         make O=/tmp/kselftest -C tools/testing/selftests
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305302015.D8PglEU7-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    Makefile:89: *** Cannot find a vmlinux for VMLINUX_BTF at any of "vmlinux vmlinux ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
> > >> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/cpuid_test.c', needed by 'kselftest/kvm/x86_64/cpuid_test.o'.
> 
> Yu, 
> 
> Can you take a look and send v3?  I unfortunately don't have bandwidth to dig
> into this.  I'll drop commit 954c9c3f96698f3af0c22f93a68e3905bc185458.

Sure. Will try to figure out the root cause.

Thanks
Yu
