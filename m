Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49837C8C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klWub2qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697639521; x=1729175521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cI0tmLdbuWQGwpEV+BxG1jpYJoRLxe62keccvXhW5kI=;
  b=klWub2qzyxYWNDdJznI/xJn1cgVrSaaUtYdv8TG+PBY9m4sxk/dIQe8L
   nfoq9qem4OwLgscvNlPHjzis2EKF0spn+IFjbrG94vCwQOeDKgW74Iv7t
   4kBR6IYODRLHgjvJxjdg5QP763ob9jIdyOhmwn2xvUQPJSfjwv0aRmNd7
   mXHKagUft31tK74yI9dqMxfWj3y67Hejg1WoKV6ku6+UIWlN/A+hrhj4W
   BIUoWq2QGsN1cAUkf16EOn8NnLdiqWjMywQayeotQ2IyxKRFcvwrANVRR
   Q+YQvrH9qOJ4aOd5TyhSPMrtRAzti5pDhuDWgnIr2xs5L6hg5HpMk/5/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417136849"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="417136849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900366693"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="900366693"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2023 07:29:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt7aX-0000Vl-1W;
	Wed, 18 Oct 2023 14:31:57 +0000
Date: Wed, 18 Oct 2023 22:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/ata/pata_it821x.c:635:41: warning: 'snprintf' output may be
 truncated before the last format character
Message-ID: <202310182207.cEZtAkiP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: 6ef55060a1cc29dd54ff390f22cb3de266dab2b0 s390: make use of CONFIG_FUNCTION_ALIGNMENT
date:   7 months ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231018/202310182207.cEZtAkiP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182207.cEZtAkiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182207.cEZtAkiP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ata/pata_it821x.c: In function 'it821x_probe_firmware':
>> drivers/ata/pata_it821x.c:635:41: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     635 |                 snprintf(mbuf, 8, "%5s%d", mtype, mode - 1);
         |                                         ^
   In function 'it821x_display_disk',
       inlined from 'it821x_probe_firmware' at drivers/ata/pata_it821x.c:721:4:
   drivers/ata/pata_it821x.c:635:17: note: 'snprintf' output between 7 and 9 bytes into a destination of size 8
     635 |                 snprintf(mbuf, 8, "%5s%d", mtype, mode - 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +635 drivers/ata/pata_it821x.c

669a5db411d85a Jeff Garzik     2006-08-29  595  
963e4975c6f93c Alan Cox        2008-07-24  596  /**
963e4975c6f93c Alan Cox        2008-07-24  597   *	it821x_display_disk	-	display disk setup
3697aaafc368b6 Hannes Reinecke 2021-12-21  598   *	@ap: ATA port
963e4975c6f93c Alan Cox        2008-07-24  599   *	@n: Device number
963e4975c6f93c Alan Cox        2008-07-24  600   *	@buf: Buffer block from firmware
963e4975c6f93c Alan Cox        2008-07-24  601   *
963e4975c6f93c Alan Cox        2008-07-24  602   *	Produce a nice informative display of the device setup as provided
963e4975c6f93c Alan Cox        2008-07-24  603   *	by the firmware.
963e4975c6f93c Alan Cox        2008-07-24  604   */
963e4975c6f93c Alan Cox        2008-07-24  605  
3697aaafc368b6 Hannes Reinecke 2021-12-21  606  static void it821x_display_disk(struct ata_port *ap, int n, u8 *buf)
963e4975c6f93c Alan Cox        2008-07-24  607  {
963e4975c6f93c Alan Cox        2008-07-24  608  	unsigned char id[41];
963e4975c6f93c Alan Cox        2008-07-24  609  	int mode = 0;
3a53b3bcc7af2f LABBE Corentin  2015-10-14  610  	const char *mtype = "";
963e4975c6f93c Alan Cox        2008-07-24  611  	char mbuf[8];
3a53b3bcc7af2f LABBE Corentin  2015-10-14  612  	const char *cbl = "(40 wire cable)";
963e4975c6f93c Alan Cox        2008-07-24  613  
963e4975c6f93c Alan Cox        2008-07-24  614  	static const char *types[5] = {
1c30c02757027e Jean Delvare    2011-07-04  615  		"RAID0", "RAID1", "RAID 0+1", "JBOD", "DISK"
963e4975c6f93c Alan Cox        2008-07-24  616  	};
963e4975c6f93c Alan Cox        2008-07-24  617  
963e4975c6f93c Alan Cox        2008-07-24  618  	if (buf[52] > 4)	/* No Disk */
963e4975c6f93c Alan Cox        2008-07-24  619  		return;
963e4975c6f93c Alan Cox        2008-07-24  620  
963e4975c6f93c Alan Cox        2008-07-24  621  	ata_id_c_string((u16 *)buf, id, 0, 41);
963e4975c6f93c Alan Cox        2008-07-24  622  
963e4975c6f93c Alan Cox        2008-07-24  623  	if (buf[51]) {
963e4975c6f93c Alan Cox        2008-07-24  624  		mode = ffs(buf[51]);
963e4975c6f93c Alan Cox        2008-07-24  625  		mtype = "UDMA";
963e4975c6f93c Alan Cox        2008-07-24  626  	} else if (buf[49]) {
963e4975c6f93c Alan Cox        2008-07-24  627  		mode = ffs(buf[49]);
963e4975c6f93c Alan Cox        2008-07-24  628  		mtype = "MWDMA";
963e4975c6f93c Alan Cox        2008-07-24  629  	}
963e4975c6f93c Alan Cox        2008-07-24  630  
963e4975c6f93c Alan Cox        2008-07-24  631  	if (buf[76])
963e4975c6f93c Alan Cox        2008-07-24  632  		cbl = "";
963e4975c6f93c Alan Cox        2008-07-24  633  
963e4975c6f93c Alan Cox        2008-07-24  634  	if (mode)
963e4975c6f93c Alan Cox        2008-07-24 @635  		snprintf(mbuf, 8, "%5s%d", mtype, mode - 1);
963e4975c6f93c Alan Cox        2008-07-24  636  	else
963e4975c6f93c Alan Cox        2008-07-24  637  		strcpy(mbuf, "PIO");
963e4975c6f93c Alan Cox        2008-07-24  638  	if (buf[52] == 4)
3697aaafc368b6 Hannes Reinecke 2021-12-21  639  		ata_port_info(ap, "%d: %-6s %-8s          %s %s\n",
963e4975c6f93c Alan Cox        2008-07-24  640  				n, mbuf, types[buf[52]], id, cbl);
963e4975c6f93c Alan Cox        2008-07-24  641  	else
3697aaafc368b6 Hannes Reinecke 2021-12-21  642  		ata_port_info(ap, "%d: %-6s %-8s Volume: %1d %s %s\n",
963e4975c6f93c Alan Cox        2008-07-24  643  				n, mbuf, types[buf[52]], buf[53], id, cbl);
963e4975c6f93c Alan Cox        2008-07-24  644  	if (buf[125] < 100)
3697aaafc368b6 Hannes Reinecke 2021-12-21  645  		ata_port_info(ap, "%d: Rebuilding: %d%%\n", n, buf[125]);
963e4975c6f93c Alan Cox        2008-07-24  646  }
963e4975c6f93c Alan Cox        2008-07-24  647  

:::::: The code at line 635 was first introduced by commit
:::::: 963e4975c6f93c148ca809d986d412201df9af89 pata_it821x: Driver updates and reworking

:::::: TO: Alan Cox <alan@lxorguk.ukuu.org.uk>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
