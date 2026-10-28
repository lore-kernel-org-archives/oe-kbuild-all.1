Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191027;
	b=34GjWfuWXk0aALVr4/wJ08HXiyYObGMInyU9QItLJdIP3ATFZawzM1ZK8nYmGsW2wLAc
	 HmOW7Qp54VfC0j2xg+ccwlHguOiDhbvvBfXDqPQ/JGzLRN4kOF6w35iksBHFoesw6RB5O
	 o95yxd6KxsaDybI1W9tnZXLFr/HeD2pLat+ZpY/jmWs36RVASBEg7Rl6qUd7D3x/yxBkz
	 A+qT62AWmhgPWfLQGzkCCktkkt2M2e+NPJUjeoPQ92ViziXj7vyn4ktitvtqz3OI/P31Y
	 RHIQsDYuo5W7NGPM6BgzG4lnsVwJssYl1Mnu1L7GTqx92PW8STkM7XxYHyBJpWlBGcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191027;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cyUDhnbNjFVO9vLgt9jG8dEY2afPdaAN8+6ET/o7wUM=;
	b=rsK+pTXvBW1TYjigsc+3fK8CNvP40HOf7nj5HGbkxfuEWP4kt0tSnQg9Okby7Qo4aGVW
	 lnUmOzJ6eqVc+xPtTgMxjuO74/fRw8IuYCCIj+QNFk7r0o1dbKgZ1iHDlwoPzOkxy4q5Y
	 okQy7X85zcFrxd9M0Z8j+9MoUVopV0dXF3Q2jZIsn5yTUyRu1wIT4R6DDxJuKsbPdCB1G
	 zcYKnIFvDVEbAPwc2vhIUs1NKQHbIw32ZhAohCP8RLtSvrwg8EqbVmZWdxY53uHKcE7gw
	 6V91h18mcg/97cm8yMkcODMqH6M4MRy25JHHww8GZ23raLJKYbsoksVm4tPzeg/r0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hJraWI96;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 12:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE13B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hJraWI96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793191026; x=1824727026;
  h=date:from:to:cc:subject:message-id;
  bh=ichMsVQird7klE5QhBeLiMfnUam/qQ5EJ6Yf3dzEfHY=;
  b=hJraWI96tloZzdpwKvMQEK3QMBHwUMGoppZbY7lsaCJ5XkvYbcEBBCmF
   UsiWmTPdGL8pKDxoMpDTSvPeV9DQHBUk6yHfEWqj1wZYL8fY+RnF5qwK7
   Y7KjbdNRE0CnvMqhxLF2PviTkfM0pOEqy2m8z3VWklKaFyQXNH9GnPIkk
   6MD+tKdUFbnL46az8xyOSu6gYhWQqnLHi3Ls9HJ4O/GI4YEd4LikmABRE
   8Cbtrr45aULZMJRuLdj7kV88O2q0e0TqILVWyn+bt6OXkiQ3JYkAviZpp
   6I043rwqHk6tyZ8He8E3RebaceGZq/Do/JBlbca9uWykTStNANsihUsTi
   A==;
X-CSE-ConnectionGUID: VACYCs8IRpOsr660xhW6sw==
X-CSE-MsgGUID: tkMl8lqqRrCwZTmNQ+8jNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1818647"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1818647"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:37:05 -0700
X-CSE-ConnectionGUID: 6FCu+qDpT6WkKkgNEz0jtA==
X-CSE-MsgGUID: uKGqVMq7Rs+FQPnWN0e1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4908564"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2026 05:37:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM2tp-00000000YiG-2uG9;
	Wed, 28 Oct 2026 12:37:01 +0000
Date: Wed, 28 Oct 2026 20:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/9]
 drivers/tty/n_gsm.c:4171: warning: Function parameter or struct member 'dlci'
 not described in 'gsm_modem_send_initial_msc'
Message-ID: <202610282030.TalGzges-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 5416e89b81b00443cb03c88df8da097ae091a141 [0/9] tty: n_gsm: Don't block input queue by waiting MSC
config: i386-randconfig-1003-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282030.TalGzges-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282030.TalGzges-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282030.TalGzges-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/n_gsm.c:4171: warning: Function parameter or struct member 'dlci' not described in 'gsm_modem_send_initial_msc'


vim +4171 drivers/tty/n_gsm.c

  4159	
  4160	/**
  4161	 * gsm_modem_send_initial_msc - Send initial modem status message
  4162	 *
  4163	 * @dlci channel
  4164	 *
  4165	 * Send an initial MSC message after DLCI open to set the initial
  4166	 * modem status lines. This is only done for basic mode.
  4167	 * Does not wait for a response as we cannot block the input queue
  4168	 * processing.
  4169	 */
  4170	static int gsm_modem_send_initial_msc(struct gsm_dlci *dlci)
> 4171	{
  4172		u8 modembits[2];
  4173	
  4174		if (dlci->adaption != 1 || dlci->gsm->encoding != GSM_BASIC_OPT)
  4175			return 0;
  4176	
  4177		modembits[0] = (dlci->addr << 2) | 2 | EA; /* DLCI, Valid, EA */
  4178		modembits[1] = (gsm_encode_modem(dlci) << 1) | EA;
  4179		return gsm_control_command(dlci->gsm, CMD_MSC, (const u8 *)&modembits, 2);
  4180	}
  4181	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
