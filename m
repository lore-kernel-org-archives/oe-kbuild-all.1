Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82AA1D8A0D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021101; cv=none; b=mzh5kFZn28gcsSybxFWAi174SGleuCADAU02ooF5fiPl9A/o4RsOs04U2rs9FJtCzA7oHfl/7YXn4eyaWR7fz2X0yp+GjUkp/i0X10WRBS46O4si/IZDnDSd9bRG6ukPEBaPsx3lTXSYNiew2fEZIzsz2HUyK5oLG5s7NoizALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021101; c=relaxed/simple;
	bh=cLAo8WkS3aTAn3XJ9an1nVbSOk7avK9FVrqdzfeoaKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGajYLrQnprqUUGZosG2JSRv00uraLABVgNTliTirXo0bCdN2NAsTgUGynjbu9ja66kZPuTVQssMVBF33wYrz+Q+Jomj9neFqCaSNIViGCzUkmSusYFm82VtyVSzwPvDcYHC7qyv4VyiI7dzzAJQpSx8X363FeC5POuyUGb2okM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiWecrFB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiWecrFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739021098; x=1770557098;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cLAo8WkS3aTAn3XJ9an1nVbSOk7avK9FVrqdzfeoaKw=;
  b=hiWecrFBmsko4DqgWbl20Qc1BzBhOko8EbltCPMcuBn/27BIfgrRG1eM
   XRHqmwhHow5c/Gy3N/2WrLj7LS+iZtWJlPGuld7VH5XngMTXEoH0ZHBUx
   Kkj+hJh5jMZo8A6/cJ4vqMIqgtPhJnJ7/ZNNmEYI53+D5Jlm0+qfg8nfu
   9P+4+np4S8QUS8EqeskslPC5ZGT5QqrrQqPdyEXFDIMAX8vtKx4e79cRw
   wr7WdaG3rGIi5CI7rDf/LAWNDVNP2JJM63L3eunafi/YlcjjMZ2qv63Tz
   Gls3Z/POq0kEKXd3wnJ+npPAiVXJGuydo4ErFDbkB7rJDvPYyyHKWIf6G
   g==;
X-CSE-ConnectionGUID: OC79NNuFSyOKqzkvv+fe4g==
X-CSE-MsgGUID: Eb9hKPckSp+lLkZMXRjyLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39561448"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39561448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 05:24:58 -0800
X-CSE-ConnectionGUID: jJ+5ds50Q4qebXJkbIguPA==
X-CSE-MsgGUID: GTfFbeiCRw24TQNMi5nP8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116714428"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 05:24:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgkpK-000zzf-1a;
	Sat, 08 Feb 2025 13:24:54 +0000
Date: Sat, 8 Feb 2025 21:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_misc_fixes_v1 64/68] include/linux/riscv_sse.h:40:16:
 error: implicit declaration of function 'ERR_PTR'
Message-ID: <202502082117.O9sEOyQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_misc_fixes_v1
head:   f0b453b30038af57df379934d55e6b73af29f50f
commit: cd9c923a931cd68bb0ca73ccfca94d88d51b35e6 [64/68] riscv: Introduce HEST SSE notification handlers
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20250208/202502082117.O9sEOyQe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082117.O9sEOyQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082117.O9sEOyQe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
   include/linux/riscv_sse.h: In function 'sse_event_register':
>> include/linux/riscv_sse.h:40:16: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
>> include/linux/riscv_sse.h:40:25: error: 'EOPNOTSUPP' undeclared (first use in this function)
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^~~~~~~~~~
   include/linux/riscv_sse.h:40:25: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/riscv_sse.h: In function 'sse_event_set_target_cpu':
   include/linux/riscv_sse.h:48:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      48 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_event_enable':
   include/linux/riscv_sse.h:53:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      53 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_register_ghes':
   include/linux/riscv_sse.h:61:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      61 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/riscv_sse.h: In function 'sse_unregister_ghes':
   include/linux/riscv_sse.h:66:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      66 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   In file included from arch/x86/include/asm/processor.h:36,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from drivers/acpi/apei/ghes.c:21:
   include/linux/err.h: At top level:
>> include/linux/err.h:39:35: error: conflicting types for 'ERR_PTR'; have 'void *(long int)'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^~~~~~~
   include/linux/riscv_sse.h:40:16: note: previous implicit declaration of 'ERR_PTR' with type 'int()'
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^~~~~~~
   cc1: some warnings being treated as errors


vim +/ERR_PTR +40 include/linux/riscv_sse.h

d32a860341afc8f Clément Léger    2024-12-06  31  
27dc1f134b36124 Himanshu Chauhan 2023-10-26  32  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
27dc1f134b36124 Himanshu Chauhan 2023-10-26  33  		      sse_event_handler *hi_cb);
27dc1f134b36124 Himanshu Chauhan 2023-10-26  34  int sse_unregister_ghes(struct ghes *ghes);
d32a860341afc8f Clément Léger    2024-12-06  35  #else
d32a860341afc8f Clément Léger    2024-12-06  36  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
d32a860341afc8f Clément Léger    2024-12-06  37  						   sse_event_handler *handler,
d32a860341afc8f Clément Léger    2024-12-06  38  						   void *arg)
d32a860341afc8f Clément Léger    2024-12-06  39  {
d32a860341afc8f Clément Léger    2024-12-06 @40  	return ERR_PTR(-EOPNOTSUPP);
d32a860341afc8f Clément Léger    2024-12-06  41  }
d32a860341afc8f Clément Léger    2024-12-06  42  

:::::: The code at line 40 was first introduced by commit
:::::: d32a860341afc8f2002e3df3c3135d6a337b28b8 drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
