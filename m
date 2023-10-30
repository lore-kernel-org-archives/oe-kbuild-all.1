Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F4361
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTam3tO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698626632; x=1730162632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g1ypwRov0tzM3HEybZ/eYo/bLezi/zNSOOpCeGQJlxc=;
  b=lTam3tO2bF+6wY2nxftzYysnTXJLmB9GczPiFIzVkydBvJu6QFsmCt+F
   X21wLFnyWCm7SywpHk2hm7CMKbh2qvKz8BXGUd0sOeqEu+PdBSyr7xil/
   xh9rZEWeSgT8Qko1QfScDStRMjf2O6ClGAalC6VV3uCahng/NE4JvInQX
   pDUDbX1o6svBLWUOALGp11AalLOjfUz+WHlZIfrsanwcHtLlp9vx1aaVB
   +Q73/KYapmIzMjOd18vnznVvAmb2tEekcnvlLvOKVWXmSG8GSs9Li4C4K
   cyJu8hrlj8JpoX4W1+i3KDzFdAzQGrYlL7cI632ibl91vNNby5I2JjGjK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="474225169"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="474225169"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 17:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933627203"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="933627203"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Oct 2023 17:43:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxGNa-000Cwh-1R;
	Mon, 30 Oct 2023 00:43:42 +0000
Date: Mon, 30 Oct 2023 08:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Baoquan He <bhe@redhat.com>, x86@kernel.org,
	Laurent Dufour <laurent.dufour@fr.ibm.com>,
	Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Akhil Raj <lf32.dev@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v12 6/6] powerpc: add crash memory hotplug support
Message-ID: <202310300812.yN6FuPcZ-lkp@intel.com>
References: <20231029124039.6158-7-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029124039.6158-7-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.6-rc7]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/crash-forward-memory_notify-arg-to-arch-crash-hotplug-handler/20231029-213858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231029124039.6158-7-sourabhjain%40linux.ibm.com
patch subject: [PATCH v12 6/6] powerpc: add crash memory hotplug support
config: powerpc64-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300812.yN6FuPcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300812.yN6FuPcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `add_opal_mem_range'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `get_crash_memory_ranges':
   core_64.c:(.text+0x1010): undefined reference to `add_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1064): undefined reference to `sort_memory_ranges'
   powerpc64-linux-ld: core_64.c:(.text+0x1128): undefined reference to `add_rtas_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1140): undefined reference to `add_opal_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1160): undefined reference to `add_mem_range'
   powerpc64-linux-ld: core_64.c:(.text+0x1188): undefined reference to `sort_memory_ranges'
   powerpc64-linux-ld: core_64.c:(.text+0x11e0): undefined reference to `realloc_mem_ranges'
   powerpc64-linux-ld: arch/powerpc/kexec/core_64.o: in function `arch_crash_handle_hotplug_event':
>> core_64.c:(.text+0x1900): undefined reference to `remove_mem_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
