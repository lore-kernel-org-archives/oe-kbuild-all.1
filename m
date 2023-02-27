Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B039374
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 01:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677463037; x=1708999037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd+gFfopr7QGrIa4wcLCMEYkgKSKe/NTbh9WdgekyKs=;
  b=d7VNFqUhk/xkQnjGxTvbDfE8CHGVwVDeKIWVQ3rC6WzzxEJjHkdsLQeP
   N8nYxSBmSZB//9FTGCiyN87PL+o0FDJmZ0MgnwSRw6CF5RTcgL3ynTepi
   HO4AwAob6cDUMebT/ObbLjl57ua1glZ2xzVg5O74V9M+Wq99YgsWaw3Ao
   YKk0i5BgOJShRukRHiasB7G6wn8BptJH55EFCc9u6aaMpCtCFq4fcy4Fl
   pPWYQhQGLKpvz8GtfHvO4D392XU+teTgqjpNOszd34a3UO5AdtgQP4AjH
   iDgBHgiNmAA+CK3AydLFmjZsskjJlJp9E/5SJMplQiD456sCB+kBYgUgZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361316066"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="361316066"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 17:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847615081"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="847615081"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Feb 2023 17:57:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWSlP-00040X-0X;
	Mon, 27 Feb 2023 01:57:15 +0000
Date: Mon, 27 Feb 2023 09:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [palmer:riscv-no_attributes-v2 33/34] lib/test_string.c:237
 strncmp_selftest() warn: unsigned 'res' is never less than zero.
Message-ID: <202302270931.S9Ju89sL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git riscv-no_attributes-v2
head:   858affb61bd0d79d702fe73d9316fd32693aacc4
commit: 51e24314e0a1f193799351c06af8727ab92fd4d2 [33/34] lib/test_string.c: Add strncmp() tests
config: m68k-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230227/202302270931.S9Ju89sL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270931.S9Ju89sL-lkp@intel.com/

New smatch warnings:
lib/test_string.c:237 strncmp_selftest() warn: unsigned 'res' is never less than zero.
lib/test_string.c:237 strncmp_selftest() warn: always true condition '(s->retval >= 0) => (0-u32max >= 0)'

Old smatch warnings:
lib/test_string.c:14 memset16_selftest() warn: returning -1 instead of -ENOMEM is sloppy
lib/test_string.c:50 memset32_selftest() warn: returning -1 instead of -ENOMEM is sloppy
lib/test_string.c:86 memset64_selftest() warn: returning -1 instead of -ENOMEM is sloppy

vim +/res +237 lib/test_string.c

   209	
   210	static __init int strncmp_selftest(void)
   211	{
   212		static const struct strncmp_test {
   213			const char *str_a;
   214			const char *str_b;
   215			unsigned long count;
   216			unsigned long max_off;
   217			size_t retval;
   218		} tests[] __initconst = {
   219			{ "/dev/vda", "/dev/",    5, 4, 0 },
   220			{ "/dev/vda", "/dev/vdb", 5, 4, 0 },
   221		};
   222		size_t i;
   223	
   224		for (i = 0; i < ARRAY_SIZE(tests); ++i) {
   225			const struct strncmp_test *s = tests + i;
   226			size_t off;
   227	
   228			for (off = 0; off <= s->max_off; ++off) {
   229				size_t res = strncmp(s->str_a + off,
   230						     s->str_b + off,
   231						     s->count - off);
   232	
   233				if (res == 0 && s->retval != 0)
   234					return 0x1000 + 0x100*off + 0x10*i + 0x0;
   235				if (res > 0 && s->retval <= 0)
   236					return 0x1000 + 0x100*off + 0x10*i + 0x1;
 > 237				if (res < 0 && s->retval >= 0)
   238					return 0x1000 + 0x100*off + 0x10*i + 0x2;
   239			}
   240		}
   241		return 0;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
