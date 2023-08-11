Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915876FDA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691764907; x=1723300907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsbLLFxZfojS6EyDCQE346zJ8wYu88sPvT8/ZLKh/0s=;
  b=UoMWdm6NydVD0tJn6V2PMfnPW7OSK3Uyl2XgjHiiejnFVv4hDAg9Eits
   AK1g6jup86+2t5DvdppsZ43dKzfRKcZLtaYNvK9j28nHQjfo1Ht87PQ3d
   4oR9TGo8msXfSHicrcHySIZWCVQ5uqS1odhU9igrY+bJ8AXpNKccunWRU
   Vqdt75c3GytlY4JIvdH/v10cCNHnctaaqOROSMZu8Y1RrVpbCh2qDCIIj
   jd1Bm5lpTH8xCwceMdsoTOpyA6v0wP6SL4ipPoWUnTqteulIUKCehMG9m
   26hVm+RgM3rSCLiJaI841VOHP6vwtT4FKmY0IuAgJDqUE60VDdwc+VKGJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371695934"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="371695934"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="762216912"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="762216912"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Aug 2023 07:41:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUTKh-0007qS-1Q;
	Fri, 11 Aug 2023 14:41:43 +0000
Date: Fri, 11 Aug 2023 22:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/rts5208/rtsx_scsi.c:526:17: warning: 'strncpy'
 output truncated copying 28 bytes from a string of length 29
Message-ID: <202308112224.qokvMMnD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stafford,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   1 year ago
config: openrisc-randconfig-r023-20230811 (https://download.01.org/0day-ci/archive/20230811/202308112224.qokvMMnD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308112224.qokvMMnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308112224.qokvMMnD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/rts5208/rtsx_scsi.c: In function 'inquiry':
>> drivers/staging/rts5208/rtsx_scsi.c:526:17: warning: 'strncpy' output truncated copying 28 bytes from a string of length 29 [-Wstringop-truncation]
     526 |                 strncpy(buf + 8, inquiry_string, sendbytes - 8);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/rts5208/rtsx_scsi.c:526:17: warning: 'strncpy' output truncated copying between 1 and 27 bytes from a string of length 29 [-Wstringop-truncation]


vim +/strncpy +526 drivers/staging/rts5208/rtsx_scsi.c

fa590c222fbaa4 Micky Ching     2013-11-12  462  
fa590c222fbaa4 Micky Ching     2013-11-12  463  static int inquiry(struct scsi_cmnd *srb, struct rtsx_chip *chip)
fa590c222fbaa4 Micky Ching     2013-11-12  464  {
fa590c222fbaa4 Micky Ching     2013-11-12  465  	unsigned int lun = SCSI_LUN(srb);
fa590c222fbaa4 Micky Ching     2013-11-12  466  	char *inquiry_default = (char *)"Generic-xD/SD/M.S.      1.00 ";
fa590c222fbaa4 Micky Ching     2013-11-12  467  	char *inquiry_sdms =    (char *)"Generic-SD/MemoryStick  1.00 ";
fa590c222fbaa4 Micky Ching     2013-11-12  468  	char *inquiry_sd =      (char *)"Generic-SD/MMC          1.00 ";
fa590c222fbaa4 Micky Ching     2013-11-12  469  	char *inquiry_ms =      (char *)"Generic-MemoryStick     1.00 ";
fa590c222fbaa4 Micky Ching     2013-11-12  470  	char *inquiry_string;
fa590c222fbaa4 Micky Ching     2013-11-12  471  	unsigned char sendbytes;
fa590c222fbaa4 Micky Ching     2013-11-12  472  	unsigned char *buf;
fa590c222fbaa4 Micky Ching     2013-11-12  473  	u8 card = get_lun_card(chip, lun);
de904bf0e4610a Quentin Lambert 2015-03-04  474  	bool pro_formatter_flag = false;
fa590c222fbaa4 Micky Ching     2013-11-12  475  	unsigned char inquiry_buf[] = {
fa590c222fbaa4 Micky Ching     2013-11-12  476  		QULIFIRE | DRCT_ACCESS_DEV,
fa590c222fbaa4 Micky Ching     2013-11-12  477  		RMB_DISC | 0x0D,
fa590c222fbaa4 Micky Ching     2013-11-12  478  		0x00,
fa590c222fbaa4 Micky Ching     2013-11-12  479  		0x01,
fa590c222fbaa4 Micky Ching     2013-11-12  480  		0x1f,
fa590c222fbaa4 Micky Ching     2013-11-12  481  		0x02,
fa590c222fbaa4 Micky Ching     2013-11-12  482  		0,
fa590c222fbaa4 Micky Ching     2013-11-12  483  		REL_ADR | WBUS_32 | WBUS_16 | SYNC | LINKED | CMD_QUE | SFT_RE,
fa590c222fbaa4 Micky Ching     2013-11-12  484  	};
fa590c222fbaa4 Micky Ching     2013-11-12  485  
fa590c222fbaa4 Micky Ching     2013-11-12  486  	if (CHECK_LUN_MODE(chip, SD_MS_2LUN)) {
fa590c222fbaa4 Micky Ching     2013-11-12  487  		if (chip->lun2card[lun] == SD_CARD)
fa590c222fbaa4 Micky Ching     2013-11-12  488  			inquiry_string = inquiry_sd;
fa590c222fbaa4 Micky Ching     2013-11-12  489  		else
fa590c222fbaa4 Micky Ching     2013-11-12  490  			inquiry_string = inquiry_ms;
fa590c222fbaa4 Micky Ching     2013-11-12  491  
fa590c222fbaa4 Micky Ching     2013-11-12  492  	} else if (CHECK_LUN_MODE(chip, SD_MS_1LUN)) {
fa590c222fbaa4 Micky Ching     2013-11-12  493  		inquiry_string = inquiry_sdms;
fa590c222fbaa4 Micky Ching     2013-11-12  494  	} else {
fa590c222fbaa4 Micky Ching     2013-11-12  495  		inquiry_string = inquiry_default;
fa590c222fbaa4 Micky Ching     2013-11-12  496  	}
fa590c222fbaa4 Micky Ching     2013-11-12  497  
fa590c222fbaa4 Micky Ching     2013-11-12  498  	buf = vmalloc(scsi_bufflen(srb));
9f902b495b537e Aymen Qader     2018-09-20  499  	if (!buf)
031366ea65495f Joe Perches     2015-03-25  500  		return TRANSPORT_ERROR;
fa590c222fbaa4 Micky Ching     2013-11-12  501  
fa590c222fbaa4 Micky Ching     2013-11-12  502  #ifdef SUPPORT_MAGIC_GATE
37c56de8fe9ddb Benjamin Philip 2021-09-21  503  	if (chip->mspro_formatter_enable &&
fa590c222fbaa4 Micky Ching     2013-11-12  504  	    (chip->lun2card[lun] & MS_CARD))
fa590c222fbaa4 Micky Ching     2013-11-12  505  #else
fa590c222fbaa4 Micky Ching     2013-11-12  506  	if (chip->mspro_formatter_enable)
fa590c222fbaa4 Micky Ching     2013-11-12  507  #endif
37c56de8fe9ddb Benjamin Philip 2021-09-21  508  		if (!card || card == MS_CARD)
de904bf0e4610a Quentin Lambert 2015-03-04  509  			pro_formatter_flag = true;
fa590c222fbaa4 Micky Ching     2013-11-12  510  
fa590c222fbaa4 Micky Ching     2013-11-12  511  	if (pro_formatter_flag) {
fa590c222fbaa4 Micky Ching     2013-11-12  512  		if (scsi_bufflen(srb) < 56)
fa590c222fbaa4 Micky Ching     2013-11-12  513  			sendbytes = (unsigned char)(scsi_bufflen(srb));
fa590c222fbaa4 Micky Ching     2013-11-12  514  		else
fa590c222fbaa4 Micky Ching     2013-11-12  515  			sendbytes = 56;
fa590c222fbaa4 Micky Ching     2013-11-12  516  
fa590c222fbaa4 Micky Ching     2013-11-12  517  	} else {
fa590c222fbaa4 Micky Ching     2013-11-12  518  		if (scsi_bufflen(srb) < 36)
fa590c222fbaa4 Micky Ching     2013-11-12  519  			sendbytes = (unsigned char)(scsi_bufflen(srb));
fa590c222fbaa4 Micky Ching     2013-11-12  520  		else
fa590c222fbaa4 Micky Ching     2013-11-12  521  			sendbytes = 36;
fa590c222fbaa4 Micky Ching     2013-11-12  522  	}
fa590c222fbaa4 Micky Ching     2013-11-12  523  
fa590c222fbaa4 Micky Ching     2013-11-12  524  	if (sendbytes > 8) {
fa590c222fbaa4 Micky Ching     2013-11-12  525  		memcpy(buf, inquiry_buf, 8);
88a5b39b69ab18 Daniel Micay    2017-06-05 @526  		strncpy(buf + 8, inquiry_string, sendbytes - 8);
fa590c222fbaa4 Micky Ching     2013-11-12  527  		if (pro_formatter_flag) {
fa590c222fbaa4 Micky Ching     2013-11-12  528  			/* Additional Length */
fa590c222fbaa4 Micky Ching     2013-11-12  529  			buf[4] = 0x33;
fa590c222fbaa4 Micky Ching     2013-11-12  530  		}
fa590c222fbaa4 Micky Ching     2013-11-12  531  	} else {
fa590c222fbaa4 Micky Ching     2013-11-12  532  		memcpy(buf, inquiry_buf, sendbytes);
fa590c222fbaa4 Micky Ching     2013-11-12  533  	}
fa590c222fbaa4 Micky Ching     2013-11-12  534  
fa590c222fbaa4 Micky Ching     2013-11-12  535  	if (pro_formatter_flag) {
fa590c222fbaa4 Micky Ching     2013-11-12  536  		if (sendbytes > 36)
fa590c222fbaa4 Micky Ching     2013-11-12  537  			memcpy(buf + 36, formatter_inquiry_str, sendbytes - 36);
fa590c222fbaa4 Micky Ching     2013-11-12  538  	}
fa590c222fbaa4 Micky Ching     2013-11-12  539  
fa590c222fbaa4 Micky Ching     2013-11-12  540  	scsi_set_resid(srb, 0);
fa590c222fbaa4 Micky Ching     2013-11-12  541  
fa590c222fbaa4 Micky Ching     2013-11-12  542  	rtsx_stor_set_xfer_buf(buf, scsi_bufflen(srb), srb);
fa590c222fbaa4 Micky Ching     2013-11-12  543  	vfree(buf);
fa590c222fbaa4 Micky Ching     2013-11-12  544  
fa590c222fbaa4 Micky Ching     2013-11-12  545  	return TRANSPORT_GOOD;
fa590c222fbaa4 Micky Ching     2013-11-12  546  }
fa590c222fbaa4 Micky Ching     2013-11-12  547  

:::::: The code at line 526 was first introduced by commit
:::::: 88a5b39b69ab1828fd4130e2baadd184109cea69 staging/rts5208: Fix read overflow in memcpy

:::::: TO: Daniel Micay <danielmicay@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
