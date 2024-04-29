Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0ED335DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714431487; cv=none; b=T6tDNpkOhQ4GE0vVKgA3EryOpnqfXmtsbVuR4lyn8epqR1OPqqCDnVAB921ApUCroa8lPUclnLLIsLOUCq0AoAen6cqGWu2WDxBwCk/F8CV3eCpa3Ql+QtJRDsDqn66/cYXpp/3wmu1hT+VHzOFuGTcm2sEBFmyBOwtxCdCeWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714431487; c=relaxed/simple;
	bh=C2fhwAUmK+pmBV+RrP0pzk3vLUs4aj1AeMUYNkaapss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJXImf9G8xLCuT6iFOfoVwCNhlmbWz/gdN8qBqv6wupzzMGwjHr9LXvwXFxd6kid4sMpks4SJWC+/FAp6+FKokruav3+NKrewR9f73YevdFj1KU96JjcwTmYDRVLcpVw+2nmECCqcVMs5HroXkJN37dUB+gC5gkL5CyyNv9tc1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIpMuFnL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIpMuFnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714431486; x=1745967486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2fhwAUmK+pmBV+RrP0pzk3vLUs4aj1AeMUYNkaapss=;
  b=bIpMuFnLkunie7GfT+PII8k2+OwCq4b60ollvNv8Eg5B/zjl5rOe0JIu
   LN62tgoOiPpngDBKLl3OAGT3aUIauE6mVy4TsI4MmJHAYJclNI5Vw/HcK
   S5E4L279umQXcV0PwWNfmWa6Vl5meJMu3dHV3hYBGMq4ys0F32aZtG4vK
   n+YW8Ro6B186hEulABRGnxV+gFhR4Lln2wB1MoIPLruUgHmqbcTsVD5Ta
   vgH76XGwGuqA32JVfq7W6VvsJAZ+ibrM44N6GicuOtLeOu3JH2ZRe1Is5
   dHbrPkyw09oMS9wT7nG0HwsyVX6+6T8sftP9hiWJnf+scwN62h7b6EyS5
   w==;
X-CSE-ConnectionGUID: wZe+ATZySmWdqVrIa7KNtw==
X-CSE-MsgGUID: sFAMyYloQHCOQJDKBO6vCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20733118"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20733118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 15:58:03 -0700
X-CSE-ConnectionGUID: 5YG4ZHgmTqOlHYHtRpFdnw==
X-CSE-MsgGUID: DtUur0inStisT3ykqkO6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30707938"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 15:58:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Zwe-0007V4-03;
	Mon, 29 Apr 2024 22:58:00 +0000
Date: Tue, 30 Apr 2024 06:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3680/11728]
 drivers/ata/libata-pmp.c:381:17: error: too few arguments to function
 'kernel_thread'
Message-ID: <202404300601.s7978v1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 98e404ea2707414a2890234862238b42cb05bb88 [3680/11728] LF-5606: libata: pmp: workaround for ERR051238 for imx sata
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404300601.s7978v1b-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300601.s7978v1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300601.s7978v1b-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/sched.h:10,
                    from include/linux/delay.h:23,
                    from include/linux/libata.h:13,
                    from drivers/ata/libata-pmp.c:11:
   drivers/ata/libata-pmp.c: In function 'sata_pmp_configure':
>> include/uapi/linux/sched.h:14:25: warning: passing argument 3 of 'kernel_thread' makes pointer from integer without a cast [-Wint-conversion]
      14 | #define CLONE_SIGHAND   0x00000800      /* set if signal handlers and blocked signals shared */
   drivers/ata/libata-pmp.c:381:50: note: in expansion of macro 'CLONE_SIGHAND'
     381 |                 kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
         |                                                  ^~~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1075,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/libata.h:16:
   include/linux/sched/task.h:99:70: note: expected 'const char *' but argument is of type 'int'
      99 | extern pid_t kernel_thread(int (*fn)(void *), void *arg, const char *name,
         |                                                          ~~~~~~~~~~~~^~~~
>> drivers/ata/libata-pmp.c:381:17: error: too few arguments to function 'kernel_thread'
     381 |                 kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
         |                 ^~~~~~~~~~~~~
   include/linux/sched/task.h:99:14: note: declared here
      99 | extern pid_t kernel_thread(int (*fn)(void *), void *arg, const char *name,
         |              ^~~~~~~~~~~~~


vim +/kernel_thread +381 drivers/ata/libata-pmp.c

   298	
   299	#define PMP_GSCR_SII_POL 129
   300	static int sata_pmp_configure(struct ata_device *dev, int print_info)
   301	{
   302		struct ata_port *ap = dev->link->ap;
   303		u32 *gscr = dev->gscr;
   304		u16 vendor = sata_pmp_gscr_vendor(gscr);
   305		u16 devid = sata_pmp_gscr_devid(gscr);
   306		unsigned int err_mask = 0;
   307		const char *reason;
   308		int nr_ports, rc;
   309	
   310		nr_ports = sata_pmp_gscr_ports(gscr);
   311	
   312		if (nr_ports <= 0 || nr_ports > SATA_PMP_MAX_PORTS) {
   313			rc = -EINVAL;
   314			reason = "invalid nr_ports";
   315			goto fail;
   316		}
   317	
   318		if ((ap->flags & ATA_FLAG_AN) &&
   319		    (gscr[SATA_PMP_GSCR_FEAT] & SATA_PMP_FEAT_NOTIFY))
   320			dev->flags |= ATA_DFLAG_AN;
   321	
   322		/* monitor SERR_PHYRDY_CHG on fan-out ports */
   323		err_mask = sata_pmp_write(dev->link, SATA_PMP_GSCR_ERROR_EN,
   324					  SERR_PHYRDY_CHG);
   325		if (err_mask) {
   326			rc = -EIO;
   327			reason = "failed to write GSCR_ERROR_EN";
   328			goto fail;
   329		}
   330	
   331		/* Disable sending Early R_OK.
   332		 * With "cached read" HDD testing and multiple ports busy on a SATA
   333		 * host controller, 3x26 PMP will very rarely drop a deferred
   334		 * R_OK that was intended for the host. Symptom will be all
   335		 * 5 drives under test will timeout, get reset, and recover.
   336		 */
   337		if (vendor == 0x1095 && (devid == 0x3726 || devid == 0x3826)) {
   338			u32 reg;
   339	
   340			err_mask = sata_pmp_read(&ap->link, PMP_GSCR_SII_POL, &reg);
   341			if (err_mask) {
   342				rc = -EIO;
   343				reason = "failed to read Sil3x26 Private Register";
   344				goto fail;
   345			}
   346			reg &= ~0x1;
   347			err_mask = sata_pmp_write(&ap->link, PMP_GSCR_SII_POL, reg);
   348			if (err_mask) {
   349				rc = -EIO;
   350				reason = "failed to write Sil3x26 Private Register";
   351				goto fail;
   352			}
   353		}
   354	
   355		if (print_info) {
   356			ata_dev_info(dev, "Port Multiplier %s, "
   357				     "0x%04x:0x%04x r%d, %d ports, feat 0x%x/0x%x\n",
   358				     sata_pmp_spec_rev_str(gscr), vendor, devid,
   359				     sata_pmp_gscr_rev(gscr),
   360				     nr_ports, gscr[SATA_PMP_GSCR_FEAT_EN],
   361				     gscr[SATA_PMP_GSCR_FEAT]);
   362	
   363			if (!(dev->flags & ATA_DFLAG_AN))
   364				ata_dev_info(dev,
   365					"Asynchronous notification not supported, "
   366					"hotplug won't work on fan-out ports. Use warm-plug instead.\n");
   367		}
   368	
   369	#ifdef CONFIG_AHCI_IMX_PMP
   370		/* create a polling thread for hotplug */
   371		if (hpriv.poll_thread_created) {
   372			mutex_lock(&(hpriv.mutex));
   373			hpriv.ap = ap;
   374			hpriv.port_mmio = ahci_port_base(ap);
   375			mutex_unlock(&(hpriv.mutex));
   376		} else {
   377			mutex_init(&(hpriv.mutex));
   378			hpriv.ap = ap;
   379			hpriv.port_mmio = ahci_port_base(ap);
   380			ata_port_info(ap, "i.MX8QM PMP SNotification polling thread created.\n");
 > 381			kernel_thread(poll_thread, NULL, CLONE_SIGHAND | SIGCHLD);
   382			hpriv.poll_thread_created = true;
   383		}
   384	#endif
   385	
   386		return 0;
   387	
   388	 fail:
   389		ata_dev_err(dev,
   390			    "failed to configure Port Multiplier (%s, Emask=0x%x)\n",
   391			    reason, err_mask);
   392		return rc;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
