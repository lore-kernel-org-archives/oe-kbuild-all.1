Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EFF31A807
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784413637; cv=none; b=eH4nbys+mudlo/FGlplAZBqz4xS2OEK3rTfaO88ecFAn6x8OClwp1IA41fJHwSOcbz/poOvcUObTBtUZpGKlf6C3v4X2ceFqycSMCLaj49zJXO1Oy9UrorAmfa3xrdqoWO5hdlh/rqyscbzsY3vV/n+lp4ZLNSLf8ihOF0u9ceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784413637; c=relaxed/simple;
	bh=R5OTqIRuPcAL/HhZRnYB9LmDGpz/8n06hQ4xBHRRJOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D+9PJ1RqRk5kxQ8aRK9IA+eC/4HKDPyRQ4PX06sx5QCv2eCr4oWohsuGSBg5FLHMaMoFZC5IL6+hwJV3UpR0tGZmJrJy/sNbz+ZGSUQNBYoQqPfMzW7Mji8x/dk4vvXRl5Xyx+2CBHXExl7N4eugPGsrTVoKnJZGe5Q/iTq97jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noqZpjj+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noqZpjj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784413635; x=1815949635;
  h=date:from:to:cc:subject:message-id;
  bh=R5OTqIRuPcAL/HhZRnYB9LmDGpz/8n06hQ4xBHRRJOs=;
  b=noqZpjj+ljSW3pX4+0bJ1+ZawnDqXNllkL56SIKTtAv7YgfrJV4XOw9S
   +Ku/l5j6AcPXuzfSoUty28X+0CaaIJN2b0TrEb4BMTp0oO+1jJNmqxrhs
   NnDr2PhV0zgG8muap4YSjCnPTiCXOVIlRz1h1bzYxSjboZyyiV8o7UyCs
   b5FN9q48z50sAOiBtb0Xa7jrdqnrm3Zw1QognfSmmIaLbHt5D5pMG724G
   LsOU7pBzuA9Jzsgt3sDhl0uOIyUTxkSB6UNXdwhvNkq0UJBOQFecWB2Ay
   GEkZbKMYU6wOAx5x8eW5pyuIJ2/feTeBOahgp9NtNl767mvyZWB2GymS7
   Q==;
X-CSE-ConnectionGUID: 95J7tx03QSSrTNADjFAIdw==
X-CSE-MsgGUID: RvzS7Of5TailIbOHVc1s6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="85164489"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="85164489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 15:27:14 -0700
X-CSE-ConnectionGUID: vzVrH+fzSfufFcRc253axw==
X-CSE-MsgGUID: Wb0dIQ+tS2yI8ZEqTx1HqQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2026 15:27:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlDV1-00000000VA1-0JkQ;
	Sat, 18 Jul 2026 22:27:11 +0000
Date: Sun, 19 Jul 2026 06:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 drivers/tty/n_gsm.c:4171: warning: Function parameter or struct member 'dlci'
 not described in 'gsm_modem_send_initial_msc'
Message-ID: <202607190624.VAPx4hpf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 5416e89b81b00443cb03c88df8da097ae091a141 [12/12] tty: n_gsm: Don't block input queue by waiting MSC
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260719/202607190624.VAPx4hpf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190624.VAPx4hpf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190624.VAPx4hpf-lkp@intel.com/

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
