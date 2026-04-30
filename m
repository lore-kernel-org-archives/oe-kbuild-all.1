Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11DE34F259
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777524285; cv=none; b=AYQboL65uMBMTYXNsRZD4ommL5nYU+C/bgXYSJasHwVKzmD1EToVRtGLrPJKSF45s7P6b5FQpWbwoWwoUOnKqM+lN+8K7zs3e9h9NzxrMG/lkGZz2kDB7PfhBe9yZomqeEw4blXmGSNIUx5ZuHSOi9iLrO+AjePhE/mBMS3cH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777524285; c=relaxed/simple;
	bh=nOe8cO+KJzBllSwfYEKQ2rCUcYWshhV6xccBp1OWynY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=paKlkPwwzP9WaUvdbBLxcgUvb2W1HnhKy8fDPYmiXqQ1FALUJZ76IFLebQd/lLSWR6X40MMzcfDwZ+i6EGi3GpOU/N9aXmeLB2dZUxC5lW+n9EAPjkgxEcmfeJdv8W0YXbyNcTDWEZCPRTKEkGAnxf/0kdg442scn50LZ+dIpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSDHNF2u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSDHNF2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777524284; x=1809060284;
  h=date:from:to:cc:subject:message-id;
  bh=nOe8cO+KJzBllSwfYEKQ2rCUcYWshhV6xccBp1OWynY=;
  b=bSDHNF2uqVFwssTewN+I0+ywxZaETkBoheFxZUTfWzeVT5LunHKfR9fC
   Mj0GaalaF5450QpLGjAgkmUOWye5TiDHMiRh+mSsYFB1s8i7Ou1KBiRH/
   RmcdIoZAPt873NaUKvL/Wb9E+VTT5Jx3dzlPNsWte3spYCSeq2aHmnR6v
   QShM9zpckkexMlZNdZQOiHjAOeyhMi/3K0v8DEoJ9jxetKnrsPmYaEVMO
   Cz9zzUL5e1CKaOmwUBmXSjhUD7gyMTdqip3uoGM00M3wsBnGPbg8sR/ct
   IPnRoFyMYhpZvDQw0tbs33WLX+Gp6/8+l1r3WHbSrZD9WfyHegS6iGYO/
   Q==;
X-CSE-ConnectionGUID: pYco3seMSNmc82zqtvO9WA==
X-CSE-MsgGUID: sGbIBgUmSTWN1DWk8Sro1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81039695"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="81039695"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 21:44:44 -0700
X-CSE-ConnectionGUID: 2twl1YKdRg6jaFxRH2fnEQ==
X-CSE-MsgGUID: VANumwZEQZKMCJYZCDcmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="239493707"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2026 21:44:42 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJGR-00000000Bx6-2Qk2;
	Thu, 30 Apr 2026 04:44:39 +0000
Date: Thu, 30 Apr 2026 12:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.1 17/22]
 drivers/mfd/ezx-pcap.c:197:18: error: implicit declaration of function
 'gpio_get_value'; did you mean 'gpiod_get_value'?
Message-ID: <202604301209.f1YXTsIr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: d15f0e388aff512456d50b5c3009cc43fe10931e [17/22] gpiolib: turn off legacy interface by default
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260430/202604301209.f1YXTsIr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301209.f1YXTsIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301209.f1YXTsIr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/ezx-pcap.c: In function 'pcap_isr_work':
>> drivers/mfd/ezx-pcap.c:197:18: error: implicit declaration of function 'gpio_get_value'; did you mean 'gpiod_get_value'? [-Wimplicit-function-declaration]
     197 |         } while (gpio_get_value(pdata->gpio));
         |                  ^~~~~~~~~~~~~~
         |                  gpiod_get_value


vim +197 drivers/mfd/ezx-pcap.c

13a09f93d2bf3a Daniel Ribeiro            2009-05-28  170  
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  171  static void pcap_isr_work(struct work_struct *work)
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  172  {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  173  	struct pcap_chip *pcap = container_of(work, struct pcap_chip, isr_work);
334a41ce9b753e Jingoo Han                2013-07-30  174  	struct pcap_platform_data *pdata = dev_get_platdata(&pcap->spi->dev);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  175  	u32 msr, isr, int_sel, service;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  176  	int irq;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  177  
b1148fd46c248c Daniel Ribeiro            2009-06-23  178  	do {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  179  		ezx_pcap_read(pcap, PCAP_REG_MSR, &msr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  180  		ezx_pcap_read(pcap, PCAP_REG_ISR, &isr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  181  
25985edcedea63 Lucas De Marchi           2011-03-30  182  		/* We can't service/ack irqs that are assigned to port 2 */
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  183  		if (!(pdata->config & PCAP_SECOND_PORT)) {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  184  			ezx_pcap_read(pcap, PCAP_REG_INT_SEL, &int_sel);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  185  			isr &= ~int_sel;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  186  		}
b1148fd46c248c Daniel Ribeiro            2009-06-23  187  
b1148fd46c248c Daniel Ribeiro            2009-06-23  188  		ezx_pcap_write(pcap, PCAP_REG_MSR, isr | msr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  189  		ezx_pcap_write(pcap, PCAP_REG_ISR, isr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  190  
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  191  		service = isr & ~msr;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  192  		for (irq = pcap->irq_base; service; service >>= 1, irq++) {
73a6839fdb7f3f Thomas Gleixner           2011-03-25  193  			if (service & 1)
83d9b7e3955d32 Sebastian Andrzej Siewior 2022-02-11  194  				generic_handle_irq_safe(irq);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  195  		}
b1148fd46c248c Daniel Ribeiro            2009-06-23  196  		ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
59ee93a528b94e Arnd Bergmann             2012-08-05 @197  	} while (gpio_get_value(pdata->gpio));
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  198  }
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  199  

:::::: The code at line 197 was first introduced by commit
:::::: 59ee93a528b94ef4e81a08db252b0326feff171f ARM: pxa: remove irq_to_gpio from ezx-pcap driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
