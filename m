Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9F20690
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687464590; x=1719000590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMYEm8dbaQOauXtEW2aM8kbljQdU8H0asFUgdMQJAw4=;
  b=dVLts4sZmrlhGynS+qXujvlPd33Zdr173k/mipGzo8ZQomdeamwOjpVa
   /Xr/w8HfXIgLPpZgWqTJIuRuvydKTsPVwPKYol8g8W9pY8z8M15Hvua5e
   p6/Z1s0Oe3Sa07jLwCVPx+cMkViMU/Y0IPDZ87m3zJCabhq5QrOI61HcN
   TtqCk7B9yl8tBCBdM1+0vOmlb8gC9q3utrepwTgg/Zc4xzW+9VgNi6SK2
   /a0wjCWwaSMd6uxqv4cgnr1MThvn60HkiSNO6rOcZ9bl829Ew1AALWbS9
   lp3FFDaTERgzKZGBQ2qE0+LJIRGe1sFmLmrJ1SZeAYe50XL+/k31VUREN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350359342"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="350359342"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 13:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780372167"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="780372167"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2023 13:08:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCQbm-0007lR-0Q;
	Thu, 22 Jun 2023 20:08:46 +0000
Date: Fri, 23 Jun 2023 04:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
Message-ID: <202306230351.SpwvWyz3-lkp@intel.com>
References: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.4-rc7]
[cannot apply to next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-kuap-Avoid-unnecessary-reads-of-MD_AP/20230622-185950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/be282f27ad808418c7475b51a00b4cb035f89a95.1687430631.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v2 14/14] powerpc: Implement UACCESS validation on PPC32
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230351.SpwvWyz3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230351.SpwvWyz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230351.SpwvWyz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/powermac/smp.c:416:13: warning: no previous prototype for 'smp_psurge_take_timebase' [-Wmissing-prototypes]
     416 | void __init smp_psurge_take_timebase(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/powermac/smp.c:432:13: warning: no previous prototype for 'smp_psurge_give_timebase' [-Wmissing-prototypes]
     432 | void __init smp_psurge_give_timebase(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/powermac/smp.o: warning: objtool: .text.pmac_cpu_offline_self: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
