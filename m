Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABA3AB47E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979731; cv=none; b=G27SuOFbwN16YUx+i4JUEfJDZyGnE1EBzLDJrBDZ3rOEitGkrA1PiNixFn4Vq1/u0CN263PLTF/e7rCuzXrZ4aU3kO8bWUefSLPbg4hLnwcQPHyywmluFgBn1aeFDsqPtpG4t1JQoalHzs5M2dJidc1+/a24XcXFY4gixE7h+Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979731; c=relaxed/simple;
	bh=WBdEfUJ4esEXsuaWmVPG2rsgXT27gUUL1Eb6OoSpOgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MjTRgeV8PdvESB9IitObn028xKcS/l+tXLEfL323RUoeb/rG61dQbGUAaLox6Scoylc4T14uiMDIne7Qsnv4aIlZe7MdAEZg/hRvbdhy4eUEkZme/DHcvcFajPNp6c2/x2pc+t+csxHQSxFYePzfb31RHkocfwsZDuekbmUGRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRdMEbjd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRdMEbjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785979724; x=1817515724;
  h=date:from:to:cc:subject:message-id;
  bh=WBdEfUJ4esEXsuaWmVPG2rsgXT27gUUL1Eb6OoSpOgs=;
  b=SRdMEbjdNbS1symkxVuRcbrDWtpPwJxA7QPojNp28lleHmDqO4FtMVZw
   knWZjqUQHh2fGy9OGB5QmaKyLE3p28wCeu4EFCuxmAxpLWSli5JKQryAq
   9EDRjTfkwyjmigxmx6Kt3Dq/Kv1vlJdj3C8daVw4B6dnnElvWj84EFF4j
   2XMChurwenEeSNlD/JGjQeo4/UdrTlfgHzipC25nVj3BQtozk8BS8AOV4
   Ta4JGIjjRN7yxVPKZcX8+u5KFjors/LYkTZKL2lfqpA1yuYD/OfpZqTQc
   dXZM8i0311HMP3hfhothfzOFpcg6IZT6j77Lpli/9c6Ll0rdaO8qHasuH
   w==;
X-CSE-ConnectionGUID: 0m4KvIFoQhS5N6tuBdgTRQ==
X-CSE-MsgGUID: f5rE7g2jR1OkXLHAz8jt7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103968581"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="103968581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 18:28:43 -0700
X-CSE-ConnectionGUID: gv5COxlOTjqecHNdQDTnag==
X-CSE-MsgGUID: eJmBcTzxTpeqvh4NLyk5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="260184104"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 18:28:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrmuV-00000000DtD-368j;
	Thu, 06 Aug 2026 01:28:39 +0000
Date: Thu, 06 Aug 2026 09:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [linux-next:master 11035/13093]
 drivers/soc/fsl/qe/gpio.c:176: undefined reference to `of_irq_parse_raw'
Message-ID: <202608060954.ymFeQSY6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1701fda2f58e345c050f4309971bdc07cd6146ba
commit: e75fcf32f93ef32cd020a63ffc1808303655a43b [11035/13093] soc: fsl: qe: Add support of IRQs in QE GPIO
config: sparc64-randconfig-002-20260806 (https://download.01.org/0day-ci/archive/20260806/202608060954.ymFeQSY6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060954.ymFeQSY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060954.ymFeQSY6-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/soc/fsl/qe/gpio.o: in function `qe_gpio_to_irq':
>> drivers/soc/fsl/qe/gpio.c:176: undefined reference to `of_irq_parse_raw'


vim +176 drivers/soc/fsl/qe/gpio.c

   163	
   164	static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
   165	{
   166		struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
   167		struct of_phandle_args oirq;
   168		struct irq_domain *domain;
   169		int ret;
   170	
   171		oirq.np = qe_gc->np;
   172		oirq.args_count = 2;
   173		oirq.args[0] = gpio;
   174		oirq.args[1] = 0;
   175	
 > 176		ret = of_irq_parse_raw(NULL, &oirq);
   177		if (ret)
   178			return ret;
   179	
   180		domain = irq_find_host(oirq.np);
   181		if (!domain)
   182			return -EPROBE_DEFER;
   183	
   184		return irq_create_of_mapping(&oirq);
   185	}
   186	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
