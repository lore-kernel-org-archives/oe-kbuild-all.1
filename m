Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6A8F6C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681232485; x=1712768485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=djm8bQ+Qt9WvMFf87Ox1tbM+gNLQTqi3MwetRSRW8Fk=;
  b=EL+IzrnLSXQOBWMzelkuSHmYvQKKlTYK/qG5fTeuAJgqgdNtXjRhr1T1
   Ogw9v1Y/94ywpvezvb+SwpTS+uGIHmRp29OGfic30rA3X2KK6Un9Z0OB2
   NFyaydnOZl4MWpABjbenx8LMLsakeYHtZFokwH9rX1FoWQkI0WXPu1wqT
   CHd7hlWzwAVMrJ9pd2Cwa6HNPIi4wKbSrG4DnKGZ1OGmPm13t0g9p2sS8
   on9niai/xAAQB5QLfsTK03Y67DDwuvqbbYgYeaqO522BT71zEn8wdxCnj
   1KrJn8NWb9ecK28WyTnTbDXmVKgu/q+cxqUwF8Pnazk98/F2t6OcG/4VX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323305934"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323305934"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 10:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="638898583"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="638898583"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Apr 2023 10:01:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmHMt-000WVv-0s;
	Tue, 11 Apr 2023 17:01:19 +0000
Date: Wed, 12 Apr 2023 01:01:16 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-ide@vger.kernel.org, linux-um@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] UML: pata_cs5536: fix build for X86_32 UML with
 TRACEPOINTS
Message-ID: <202304120048.v4uqUq9Q-lkp@intel.com>
References: <20230410011325.26850-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410011325.26850-1-rdunlap@infradead.org>

Hi Randy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on uml/fixes wireless-next/main wireless/main linus/master v6.3-rc6 next-20230411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randy-Dunlap/UML-pata_cs5536-fix-build-for-X86_32-UML-with-TRACEPOINTS/20230410-091733
base:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20230410011325.26850-1-rdunlap%40infradead.org
patch subject: [PATCH v3] UML: pata_cs5536: fix build for X86_32 UML with TRACEPOINTS
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230412/202304120048.v4uqUq9Q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/2782ce24954318f1698ec910691250f4d287d817
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Randy-Dunlap/UML-pata_cs5536-fix-build-for-X86_32-UML-with-TRACEPOINTS/20230410-091733
        git checkout 2782ce24954318f1698ec910691250f4d287d817
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120048.v4uqUq9Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/um/../lib/msr.c:30: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Read an MSR with error handling
   arch/x86/um/../lib/msr.c:52: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write an MSR with error handling
   arch/x86/um/../lib/msr.c:91: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set @bit in a MSR @msr.
   arch/x86/um/../lib/msr.c:104: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Clear @bit in a MSR @msr.


vim +30 arch/x86/um/../lib/msr.c

22085a66c2fab6 Borislav Petkov 2014-03-09  28  
22085a66c2fab6 Borislav Petkov 2014-03-09  29  /**
22085a66c2fab6 Borislav Petkov 2014-03-09 @30   * Read an MSR with error handling
22085a66c2fab6 Borislav Petkov 2014-03-09  31   *
22085a66c2fab6 Borislav Petkov 2014-03-09  32   * @msr: MSR to read
22085a66c2fab6 Borislav Petkov 2014-03-09  33   * @m: value to read into
22085a66c2fab6 Borislav Petkov 2014-03-09  34   *
22085a66c2fab6 Borislav Petkov 2014-03-09  35   * It returns read data only on success, otherwise it doesn't change the output
22085a66c2fab6 Borislav Petkov 2014-03-09  36   * argument @m.
22085a66c2fab6 Borislav Petkov 2014-03-09  37   *
22085a66c2fab6 Borislav Petkov 2014-03-09  38   */
3e7bbe15ed84e3 Zhao Xuehui     2021-04-08  39  static int msr_read(u32 msr, struct msr *m)
22085a66c2fab6 Borislav Petkov 2014-03-09  40  {
22085a66c2fab6 Borislav Petkov 2014-03-09  41  	int err;
22085a66c2fab6 Borislav Petkov 2014-03-09  42  	u64 val;
22085a66c2fab6 Borislav Petkov 2014-03-09  43  
22085a66c2fab6 Borislav Petkov 2014-03-09  44  	err = rdmsrl_safe(msr, &val);
22085a66c2fab6 Borislav Petkov 2014-03-09  45  	if (!err)
22085a66c2fab6 Borislav Petkov 2014-03-09  46  		m->q = val;
22085a66c2fab6 Borislav Petkov 2014-03-09  47  
22085a66c2fab6 Borislav Petkov 2014-03-09  48  	return err;
22085a66c2fab6 Borislav Petkov 2014-03-09  49  }
22085a66c2fab6 Borislav Petkov 2014-03-09  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
