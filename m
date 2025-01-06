Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD452AF12
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146871; cv=none; b=U5smB4TjdlyrQ+N93YsxR1C8NcCT/LOkTI+9wmpyK04ZL/jkLN1EhMSWsXJLZTfuNrjx3ZmXXGWZCCodiyKMC+hIHikGB3NZTD36WNTmT8hg8iSLJ6i14fryjQEFlSilok4l/9t9+3DLFE4K4BaSse68H9zk/a1GuLGfsdwgygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146871; c=relaxed/simple;
	bh=3DJRRjwhUGbjnWPmYBdGknrdMvMJTKZCv+Hc9KNEmpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eY3wawAEVYsmckpE6lYIib8odZknKAM4jmhgrnunzindc6FmpFO8Jo0Kv6xBQBsTJWkhN0Qj/4brCvB87mUxnN/Mu/iCbM3ZJNb33/toFUUizpjgPZxNYDC+T5iq79fKc6WJdhM2rISyb/Vc1PalFa7UGCdHkmpGJCA//YlLFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G32x2EHF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G32x2EHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736146868; x=1767682868;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3DJRRjwhUGbjnWPmYBdGknrdMvMJTKZCv+Hc9KNEmpk=;
  b=G32x2EHFgOBv4ozEVqSGy7qQ9V11Y5W2hTOPaBCAiAj9t2/38rRByxKX
   /n0WHSqarvnoJOugYbrhAJScAkqoVMqijcSpYKxtodHyNgZCSgiGT/gH7
   TG/CRwu6gH5jxLpDxVzIq8fZrMyqbn78rePGbntatA/JXDZ66KqCB4GgQ
   EMPsndsZasyv6eAvAPRbpUyLUm3VF8kGlbnzGLr5XCngxIVF1YbO+277X
   9qM3EY6cconIY/ezjFBwiq0zI2jZZ9lDgBFQ1W0WXCCzu8TyslqfUyPsE
   jdWcojWNWUBFBO36q3I3mZJrxfviYRyimyzuzSDSou7lcfuXSZCPsrjo6
   g==;
X-CSE-ConnectionGUID: N2P1uMa0SZWpjGJ3aJzJ1Q==
X-CSE-MsgGUID: LfuyVuoRRd6jCL+LgD9VAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53830332"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53830332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 23:01:07 -0800
X-CSE-ConnectionGUID: ejbf5HK8TtC2YVaGwXQfgA==
X-CSE-MsgGUID: co4+M8LvTnCjVEGZi7A2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="107333660"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jan 2025 23:01:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUh6j-000CL1-35;
	Mon, 06 Jan 2025 07:01:01 +0000
Date: Mon, 6 Jan 2025 15:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: drivers/firmware/turris-mox-rwtm.c:249:90: warning: '%08x' directive
 writing 8 bytes into a region of size between 7 and 9
Message-ID: <202501061439.SOt2vO20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: e34e60253d9272311831daed8a2d967cf80ca3dc firmware: turris-mox-rwtm: fix reply status decoding function
date:   3 years, 7 months ago
config: arm-randconfig-r002-20220811 (https://download.01.org/0day-ci/archive/20250106/202501061439.SOt2vO20-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061439.SOt2vO20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061439.SOt2vO20-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/turris-mox-rwtm.c: In function 'mox_get_board_info':
>> drivers/firmware/turris-mox-rwtm.c:249:90: warning: '%08x' directive writing 8 bytes into a region of size between 7 and 9 [-Wformat-overflow=]
     249 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                                                                                          ^~~~
   drivers/firmware/turris-mox-rwtm.c:248:17: note: 'sprintf' output between 135 and 137 bytes into a destination of size 135
     248 |                 sprintf(rwtm->pubkey,
         |                 ^~~~~~~~~~~~~~~~~~~~~
     249 |                         "%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                         ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     251 |                         s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +249 drivers/firmware/turris-mox-rwtm.c

389711b3749399 Marek Behún 2019-08-22  190  
389711b3749399 Marek Behún 2019-08-22  191  static int mox_get_board_info(struct mox_rwtm *rwtm)
389711b3749399 Marek Behún 2019-08-22  192  {
389711b3749399 Marek Behún 2019-08-22  193  	struct armada_37xx_rwtm_tx_msg msg;
389711b3749399 Marek Behún 2019-08-22  194  	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
389711b3749399 Marek Behún 2019-08-22  195  	int ret;
389711b3749399 Marek Behún 2019-08-22  196  
389711b3749399 Marek Behún 2019-08-22  197  	msg.command = MBOX_CMD_BOARD_INFO;
389711b3749399 Marek Behún 2019-08-22  198  	ret = mbox_send_message(rwtm->mbox, &msg);
389711b3749399 Marek Behún 2019-08-22  199  	if (ret < 0)
389711b3749399 Marek Behún 2019-08-22  200  		return ret;
389711b3749399 Marek Behún 2019-08-22  201  
389711b3749399 Marek Behún 2019-08-22  202  	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
389711b3749399 Marek Behún 2019-08-22  203  	if (ret < 0)
389711b3749399 Marek Behún 2019-08-22  204  		return ret;
389711b3749399 Marek Behún 2019-08-22  205  
389711b3749399 Marek Behún 2019-08-22  206  	ret = mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
389711b3749399 Marek Behún 2019-08-22  207  	if (ret < 0 && ret != -ENODATA) {
389711b3749399 Marek Behún 2019-08-22  208  		return ret;
389711b3749399 Marek Behún 2019-08-22  209  	} else if (ret == -ENODATA) {
389711b3749399 Marek Behún 2019-08-22  210  		dev_warn(rwtm->dev,
389711b3749399 Marek Behún 2019-08-22  211  			 "Board does not have manufacturing information burned!\n");
389711b3749399 Marek Behún 2019-08-22  212  	} else {
389711b3749399 Marek Behún 2019-08-22  213  		rwtm->serial_number = reply->status[1];
389711b3749399 Marek Behún 2019-08-22  214  		rwtm->serial_number <<= 32;
389711b3749399 Marek Behún 2019-08-22  215  		rwtm->serial_number |= reply->status[0];
389711b3749399 Marek Behún 2019-08-22  216  		rwtm->board_version = reply->status[2];
389711b3749399 Marek Behún 2019-08-22  217  		rwtm->ram_size = reply->status[3];
389711b3749399 Marek Behún 2019-08-22  218  		reply_to_mac_addr(rwtm->mac_address1, reply->status[4],
389711b3749399 Marek Behún 2019-08-22  219  				  reply->status[5]);
389711b3749399 Marek Behún 2019-08-22  220  		reply_to_mac_addr(rwtm->mac_address2, reply->status[6],
389711b3749399 Marek Behún 2019-08-22  221  				  reply->status[7]);
389711b3749399 Marek Behún 2019-08-22  222  		rwtm->has_board_info = 1;
389711b3749399 Marek Behún 2019-08-22  223  
389711b3749399 Marek Behún 2019-08-22  224  		pr_info("Turris Mox serial number %016llX\n",
389711b3749399 Marek Behún 2019-08-22  225  			rwtm->serial_number);
389711b3749399 Marek Behún 2019-08-22  226  		pr_info("           board version %i\n", rwtm->board_version);
389711b3749399 Marek Behún 2019-08-22  227  		pr_info("           burned RAM size %i MiB\n", rwtm->ram_size);
389711b3749399 Marek Behún 2019-08-22  228  	}
389711b3749399 Marek Behún 2019-08-22  229  
389711b3749399 Marek Behún 2019-08-22  230  	msg.command = MBOX_CMD_ECDSA_PUB_KEY;
389711b3749399 Marek Behún 2019-08-22  231  	ret = mbox_send_message(rwtm->mbox, &msg);
389711b3749399 Marek Behún 2019-08-22  232  	if (ret < 0)
389711b3749399 Marek Behún 2019-08-22  233  		return ret;
389711b3749399 Marek Behún 2019-08-22  234  
389711b3749399 Marek Behún 2019-08-22  235  	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
389711b3749399 Marek Behún 2019-08-22  236  	if (ret < 0)
389711b3749399 Marek Behún 2019-08-22  237  		return ret;
389711b3749399 Marek Behún 2019-08-22  238  
389711b3749399 Marek Behún 2019-08-22  239  	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
389711b3749399 Marek Behún 2019-08-22  240  	if (ret < 0 && ret != -ENODATA) {
389711b3749399 Marek Behún 2019-08-22  241  		return ret;
389711b3749399 Marek Behún 2019-08-22  242  	} else if (ret == -ENODATA) {
389711b3749399 Marek Behún 2019-08-22  243  		dev_warn(rwtm->dev, "Board has no public key burned!\n");
389711b3749399 Marek Behún 2019-08-22  244  	} else {
389711b3749399 Marek Behún 2019-08-22  245  		u32 *s = reply->status;
389711b3749399 Marek Behún 2019-08-22  246  
389711b3749399 Marek Behún 2019-08-22  247  		rwtm->has_pubkey = 1;
389711b3749399 Marek Behún 2019-08-22  248  		sprintf(rwtm->pubkey,
389711b3749399 Marek Behún 2019-08-22 @249  			"%06x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x%08x",
389711b3749399 Marek Behún 2019-08-22  250  			ret, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7],
389711b3749399 Marek Behún 2019-08-22  251  			s[8], s[9], s[10], s[11], s[12], s[13], s[14], s[15]);
389711b3749399 Marek Behún 2019-08-22  252  	}
389711b3749399 Marek Behún 2019-08-22  253  
389711b3749399 Marek Behún 2019-08-22  254  	return 0;
389711b3749399 Marek Behún 2019-08-22  255  }
389711b3749399 Marek Behún 2019-08-22  256  

:::::: The code at line 249 was first introduced by commit
:::::: 389711b374939968d2d0adede01b9e1f3bb4f531 firmware: Add Turris Mox rWTM firmware driver

:::::: TO: Marek Behún <marek.behun@nic.cz>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
