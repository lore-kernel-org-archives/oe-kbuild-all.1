Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE9833D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674486434; x=1706022434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uL0h8wezhGRHJ8EoYAqOQlzRK0snzaGM9Kpd4VRIxNU=;
  b=hx0+EnWqAVcL6r/vBbCGR6T6ftSdhOLAVEqFUY4ouwFFbGjIpNkkk/fe
   1rP7Ofe3uzz0uu8QCC43JC9PWorVinygWCKdFBPR3zJA6SgSe8kqom6fm
   1taD+5j0AbpqnHdHKYOvP4KSCWccG3YnU0u7c5o861pVkkpaUYubCpa6q
   uDsdhcGPQMUIUaaYu47l4Cj153iHw0T4l08a9fmPBlDXEdxpdSaweCkd7
   anH5bYzEOl+9xql66xzqTi4J9tT1F2KWtTX8iFFxXCAdNqmMOaVGgva/m
   bvKdmtEAI5ez3W32hgXxsotqKmxYjlmMN00RVX50zKVhMWCAexJ5/tkPn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="306413939"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="306413939"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 07:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="990481532"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="990481532"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2023 07:07:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJyPf-0005i8-0P;
	Mon, 23 Jan 2023 15:07:11 +0000
Date: Mon, 23 Jan 2023 23:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/include/asm/atomic64_32.h:110:34: sparse: sparse: cast
 truncates bits from constant value (100000001 becomes 1)
Message-ID: <202301232313.i8GVDJuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: 5d7edbc9231ec6b60f9c5b7e7980e9a1cd92e6bb rxrpc: Get rid of the Rx ring
date:   3 months ago
config: i386-randconfig-s003-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232313.i8GVDJuq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d7edbc9231ec6b60f9c5b7e7980e9a1cd92e6bb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5d7edbc9231ec6b60f9c5b7e7980e9a1cd92e6bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   net/rxrpc/call_object.c: note: in included file (through arch/x86/include/asm/atomic.h, include/linux/atomic.h, include/linux/cpumask.h, ...):
>> arch/x86/include/asm/atomic64_32.h:110:34: sparse: sparse: cast truncates bits from constant value (100000001 becomes 1)

vim +110 arch/x86/include/asm/atomic64_32.h

1a3b1d89eded68 Brian Gerst   2010-01-07   99  
1a3b1d89eded68 Brian Gerst   2010-01-07  100  /**
8bf705d130396e Dmitry Vyukov 2018-01-29  101   * arch_atomic64_set - set atomic64 variable
a7e926abc3adfb Luca Barbieri 2010-02-24  102   * @v: pointer to type atomic64_t
1f0459780c2849 Philipp Hahn  2012-05-02  103   * @i: value to assign
1a3b1d89eded68 Brian Gerst   2010-01-07  104   *
a7e926abc3adfb Luca Barbieri 2010-02-24  105   * Atomically sets the value of @v to @n.
1a3b1d89eded68 Brian Gerst   2010-01-07  106   */
79c53a83d7a31a Mark Rutland  2019-05-22  107  static inline void arch_atomic64_set(atomic64_t *v, s64 i)
a7e926abc3adfb Luca Barbieri 2010-02-24  108  {
a7e926abc3adfb Luca Barbieri 2010-02-24  109  	unsigned high = (unsigned)(i >> 32);
a7e926abc3adfb Luca Barbieri 2010-02-24 @110  	unsigned low = (unsigned)i;
819165fb34b977 Jan Beulich   2012-01-20  111  	alternative_atomic64(set, /* no output */,
819165fb34b977 Jan Beulich   2012-01-20  112  			     "S" (v), "b" (low), "c" (high)
819165fb34b977 Jan Beulich   2012-01-20  113  			     : "eax", "edx", "memory");
a7e926abc3adfb Luca Barbieri 2010-02-24  114  }
1a3b1d89eded68 Brian Gerst   2010-01-07  115  

:::::: The code at line 110 was first introduced by commit
:::::: a7e926abc3adfbd2e5e20d2b46177adb4e313915 x86-32: Rewrite 32-bit atomic64 functions in assembly

:::::: TO: Luca Barbieri <luca@luca-barbieri.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
