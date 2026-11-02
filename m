Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660720;
	b=tb4CBTvJ26sNTxAPrQ6XOUYH7uD7Lalss5cmANKW1IZZI1M0fd49PN7kriKUssXyHEPA
	 isaSjvC8QBxYo96TCOapOKdcO1nSV6sms7Mz3N3YZzc9y4DnsQLaQRsWJZf653nCNmNIy
	 vb9IKhsamLgylXLz9BcE+Mcwc1ZwifSUwihg5lc0nzxINUMaCoAz5JZpWnrFBeGJvafxO
	 k7vkYAXwC6vQ82I+jMOmy35rl4Fj95C+geayzLrQcxfkWMV3HYmq2GmXVefvQFWpFoi1C
	 /U2LYU/gQ3T+6Mtbpb1zkKGdsn4qFUxMDaSKDbL2JBd4ASCKQisHvkP34uBuc6PMt4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660720;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F4BKywpSjTYAlR5/U61vF5dJ87IeyreYsAcEIvZzgR8=;
	b=Oh+fa3XT5/wh/FAhBtOyu7nDI+91t4PVutIBGHFaOgU3Ho++wSg2As6SmV3kZXhQf4rE
	 OJawZxPtiZKx0jJuvGlABBPmH2z6vTLzhPn6iIUICfj9on2V1qU925JKH2aKmlVmR2NZY
	 I8+GY1GnP5mVGe+jOMN+070y1GPLDiZfQdb5OWBbH8TqRTd2LIpnBvwRh/bXANmi2xpHx
	 8m8U5yHSjS+9D/YDH7ZZDz7lv3LD3auMM6DwOeLVXb130K7zs5+WAk5nk2lPA/c6Z6LOJ
	 U+g/GBDJZLWXhRrWjTUVdejsZi+DtUP8sF1FNPt4hwfYet7eeYKXsNP40GTUQofGVsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dTRBr0lz;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAB606A332
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 23:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FAB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dTRBr0lz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793660712; x=1825196712;
  h=date:from:to:cc:subject:message-id;
  bh=hxqT4eTKDRS6ZXmIyjLTSjbK7bsj51wcx1H7dBxFW6o=;
  b=dTRBr0lz57fGPwi86aGId5lHqdkQ4RRazh6weztZRpxFYBUFO9HmuSvJ
   K9IaNPa/riKMmQGXH8XyxYlhs3AYbmL8NEQas0Q6AG41B2BxDxg7nYiZH
   DSWfrBQVvOCDF1v6NPiaalrcPkvtMB8i2f1Yd8U5KtnyP+B7ZFnQgymLw
   RZs3QT0K3aUaLMnRx9BjE2Ufy4fUvaB/pjbWsIAaiTRcuxn2PYkflczKu
   ICWcZoI8x0i3Abmj2MICQbDj/0A2WW37bqiqgdMmR2dnW50RWbJdAvl0K
   czVjCeddGBZ5byc2DVg+YeM7z0iEUtwdUAegJQf1UVTSB2Cr+a0uBHUe8
   w==;
X-CSE-ConnectionGUID: f9/3Tu87Q66URJejBXzhcw==
X-CSE-MsgGUID: 77aQz/WpQ66vTQhKykCraw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2259223"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2259223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:10 -0800
X-CSE-ConnectionGUID: XIFQHHmxTN+us95XWYru3A==
X-CSE-MsgGUID: o3rOH5CCRVGh5LduyWoeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6412256"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2026 15:05:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xO15O-00000000hys-2Nqp;
	Mon, 02 Nov 2026 23:05:06 +0000
Date: Tue, 03 Nov 2026 07:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 22/29]
 drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Warning: Tried to .set
 unrecognized mode `.L__sym_size_bcm6846_runner_start'
Message-ID: <202611030609.VNrVUjTY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   9efd82bc75823208a3e1c475db053417d3036bdc
commit: 8418a425aefab5763e03d2956cf7e3c892d63253 [22/29] net: broadcom: Assemble the BCM6846 Runner program at build time
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20261103/202611030609.VNrVUjTY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030609.VNrVUjTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030609.VNrVUjTY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /tmp/ccdwFGmG.s: Assembler messages:
>> drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Warning: Tried to .set unrecognized mode `.L__sym_size_bcm6846_runner_start'
   drivers/net/ethernet/broadcom/bcm6846_runner.S:8: Error: junk at end of line, first unrecognized character is `,'
   /tmp/ccdwFGmG.s: Error: .size expression for bcm6846_runner_start does not evaluate to a constant


vim +8 drivers/net/ethernet/broadcom/bcm6846_runner.S

     3	
     4		.section .rodata.bcm6846_runner, "a"
     5		.balign 4
     6	SYM_DATA_START(bcm6846_runner_start)
     7		.incbin "bcm6846_runner.bin"
   > 8	SYM_DATA_END_LABEL(bcm6846_runner_start, SYM_L_GLOBAL, bcm6846_runner_end)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
