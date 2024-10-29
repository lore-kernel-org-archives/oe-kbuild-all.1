Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F0194AD6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 22:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730241217; cv=none; b=sQYJA+VzCM7ev1Me4KAlqndTjjpRm7drN7vzLztq07EDDzgB0bYjo5VGzBQCGfz6DVdsa9W9aYlW7eGKqICw/6tVh34AbgS+7N+3Cxa/E9D2aHKP0SVUulBnBfkzKxNUvXbyzyGpQ/OOjsKCEeDCMu+XcxNGlPKrzudbsrCtixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730241217; c=relaxed/simple;
	bh=nr3Wg3wV6DY8zd48SKLJ7xUoXC8V+O5EhppjNTs9lVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3EWH9pEJy2PpxojK0HxUeYO0W6SsDr3QPw8Nu9DC4ctqI7SFeN9qa0Yl6PNykTlyJ2e2bYaQcKtISdxLMRZLiJ2kB2GftVItTPOVLIIUNNRG05LK93EKgGQqUX3Ctq4oKvz5EEeyLQ/iePIPpHW0UoTg2HcGCgMF5G7hsj+XD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlb8nvv5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlb8nvv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730241215; x=1761777215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nr3Wg3wV6DY8zd48SKLJ7xUoXC8V+O5EhppjNTs9lVA=;
  b=nlb8nvv5N7HQki6M9OTjAnhmfyK6ZXQGRGrEP1rCy7pDV26CFzwyqoV4
   dm5jqtUkW9is2RpyBhWVyaqUQWkdO7fheKRsCRqVEnE+YtclQPlRGgcGR
   TKGp/osDX1evFASvLe/G4NUbyd3ejiF9rq3w1DDoIBIFR2Y2+fh7Okp90
   j0skuNUy9w6fdgldxylsz30cqd0QwN3yOUYQP6ECL3FeZPAiVfZT+jSLx
   +rHm5n40pTeBC7bgsUQQEbiLyJXjGXsxkBvxWqNqLtD3u+WD9uZrVViA3
   HiwbIeGlwDQA03wipdEFcT3hwiHbZ8ayB6Z/DiB0bSZnMIoU5f1vCPm2+
   A==;
X-CSE-ConnectionGUID: ceCjc798SwWh5U5Tz6VlLA==
X-CSE-MsgGUID: 9JvyEiSYRimo22h618wdLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="32762579"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="32762579"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 15:33:34 -0700
X-CSE-ConnectionGUID: mf1huEvwQt+H1NouTiveMQ==
X-CSE-MsgGUID: T18sEFXYRlmMaQ3bR2mQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="112911871"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2024 15:33:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5umI-000eEO-36;
	Tue, 29 Oct 2024 22:33:30 +0000
Date: Wed, 30 Oct 2024 06:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 15347/15883]
 arch/loongarch/include/asm/irq.h:47:23: error: 'NR_VECTORS' undeclared
Message-ID: <202410300643.xefa3uuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5b8789bdf0036a2c7127f6a0d942b4c2b6f8e42d
commit: 375d7f74f7099abf22f2c7e7235ce45a33f78110 [15347/15883] acpi: mcfg quirk: Increased multi-chip support for the 3C6000
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241030/202410300643.xefa3uuI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300643.xefa3uuI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300643.xefa3uuI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irq.h:24,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/serial_core.h:13,
                    from drivers/tty/serial/lantiq.c:23:
   drivers/tty/serial/lantiq.c: In function 'lqasc_verify_port':
>> arch/loongarch/include/asm/irq.h:47:23: error: 'NR_VECTORS' undeclared (first use in this function)
      47 | #define NR_IRQS (64 + NR_VECTORS * (NR_CPUS + MAX_IO_PICS))
         |                       ^~~~~~~~~~
   drivers/tty/serial/lantiq.c:554:41: note: in expansion of macro 'NR_IRQS'
     554 |         if (ser->irq < 0 || ser->irq >= NR_IRQS)
         |                                         ^~~~~~~
   arch/loongarch/include/asm/irq.h:47:23: note: each undeclared identifier is reported only once for each function it appears in
      47 | #define NR_IRQS (64 + NR_VECTORS * (NR_CPUS + MAX_IO_PICS))
         |                       ^~~~~~~~~~
   drivers/tty/serial/lantiq.c:554:41: note: in expansion of macro 'NR_IRQS'
     554 |         if (ser->irq < 0 || ser->irq >= NR_IRQS)
         |                                         ^~~~~~~
--
   In file included from include/linux/irq.h:24,
                    from kernel/irq/irqdesc.c:10:
>> arch/loongarch/include/asm/irq.h:47:23: error: 'NR_VECTORS' undeclared here (not in a function)
      47 | #define NR_IRQS (64 + NR_VECTORS * (NR_CPUS + MAX_IO_PICS))
         |                       ^~~~~~~~~~
   kernel/irq/irqdesc.c:129:15: note: in expansion of macro 'NR_IRQS'
     129 | int nr_irqs = NR_IRQS;
         |               ^~~~~~~


vim +/NR_VECTORS +47 arch/loongarch/include/asm/irq.h

    41	
    42	#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
    43	extern bool arch_trigger_cpumask_backtrace(const cpumask_t *mask,
    44						   int exclude_cpu);
    45	
    46	#define MAX_IO_PICS  16
  > 47	#define NR_IRQS	(64 + NR_VECTORS * (NR_CPUS + MAX_IO_PICS))
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
