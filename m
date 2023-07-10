Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C534154B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689032855; x=1720568855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OB+cuwlZpe/M57pV1+IoYQaDzYKJtREaISvZWYGdfnw=;
  b=ip/o5rMvnQLoD2A1LBTxVQEcrBP59ponb1e/j78pvvZpD/ug4VF5phRD
   BgB4WIt+8072iheDurf+GVQXnelH7efsj5n13msQ5rbMG0QotGZ2zwCSZ
   0bKb70zwz/8i4DAbhUPFDmSRFUXkOU4L4ozm1H6dfSA6432rirWN3hHfi
   ZyJeeZs9qzEMHmGSkwVBUaSc2npxwF4T9sWSA2B0W1U+X3XAzPI/obKbH
   l9II5WSInctaUZC7ADcJ/HQdPVtlcrsTXUher2dg0hv+TeR0gNNfhWOYR
   C4zJaz8A1pvQvEBe3VHkRq5cYSsqBydSCBUBCh5Zr4ijwLzdJDpu86x9T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363351081"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="363351081"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 16:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="714976783"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="714976783"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Jul 2023 16:47:32 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ0bL-000476-2k;
	Mon, 10 Jul 2023 23:47:31 +0000
Date: Tue, 11 Jul 2023 07:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexey Gladkov <legion@kernel.org>
Subject: [legion:patchset/fchmodat4/v3.1 3/5] <stdin>:1567:2: warning:
 #warning syscall fchmodat4 not implemented
Message-ID: <202307110718.V229teq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/fchmodat4/v3.1
head:   7f50cfa2f66534d890b240c06e8d258ae42ce315
commit: 5d40ef1386ebba816bb7a4fe1cb9b4834aa02a84 [3/5] arch: Register fchmodat4, usually as syscall 451
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230711/202307110718.V229teq0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110718.V229teq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307110718.V229teq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1567:2: warning: #warning syscall fchmodat4 not implemented [-Wcpp]
--
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1567:2: warning: #warning syscall fchmodat4 not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/alpha/kernel/asm-offsets.c:15:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      15 | void foo(void)
         |      ^~~
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>> <stdin>:1567:2: warning: #warning syscall fchmodat4 not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
