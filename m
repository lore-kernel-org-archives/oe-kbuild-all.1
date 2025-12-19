Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285CA149C6F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 05:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121355; cv=none; b=DEBcRup+Qa6t3K43qhwrjt6Cd3zVmosr56heDxcutBmolOhh3vJY2xvtlYKVLJn7vaRrZiWktKKGSUqrDbZCwv+ZBpGM12DaHe4wIn0YCiyDSfBvX1kVidBnTlLoDuNkhzvKfPVwhJyzNKkG+mOkrKR4F8hMrJWQUwp8+sB87uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121355; c=relaxed/simple;
	bh=iJ61QoTK7UdwSLd5rky8wiiVQDWeXyG49I8TOhkpikA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MA5ujX4tyRxo0NcyLQkth+VuDfT5YvZ1X7Hf0HjGYXNHtiP6JyowogP+UeGX+tVQdXLjjFJ5N/CtLvPoj1kgV8rB0cAgfzMRrGZ+pG9hI2dncyzyf3MEDlVTJBAVFuMb36MzoHdgPwnYkj2wIlbetUNftNTuGLdBtFk9Ho2WlJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwzKjiuf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwzKjiuf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766121354; x=1797657354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJ61QoTK7UdwSLd5rky8wiiVQDWeXyG49I8TOhkpikA=;
  b=AwzKjiuft0HGRD/fSH2AtJlsb9F7WAFPWhKsL/zt50Xhq8lHP0+TbS6f
   KXVZZqDObgZEo40dZ0gx/ZvRUtkIz4UiQMWwe8tWdKIlGtjnYsDkF8kqJ
   XA1J125EOmR/0a1/ExwRyM0hgiZqgvib1cM0w5VK7GHUf56Bar4Jxd9OY
   I81wJmVZc9fMgjll/YRssmJoLbB9pMtD+gtw4mfyxyiILguTSCRnDhDpC
   lbLEvRLtNuw+cd/z8bkn3ZbqxhALE12AJbu9gdx0eDby1+Bnx7lXNsxCT
   clcsUjsEm3x+c5Eps/z6l/7GrZLov2z5n0WhchmWvl+kQrlzIaoL2adLE
   w==;
X-CSE-ConnectionGUID: 4beli7fLT9OPaqYef2Lg9A==
X-CSE-MsgGUID: 0DeJ0f+zSdy9YHEAZQyEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71942712"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71942712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 21:15:53 -0800
X-CSE-ConnectionGUID: vrk4JxoBS1mVLOPYUNQ1aw==
X-CSE-MsgGUID: ZKLm1zy7R0KKNgIgUlCLEw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 21:15:52 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWSqE-0000000033W-2VvH;
	Fri, 19 Dec 2025 05:15:50 +0000
Date: Fri, 19 Dec 2025 13:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] drivers/tty/n_gsm.c:4171:
 warning: Function parameter or struct member 'dlci' not described in
 'gsm_modem_send_initial_msc'
Message-ID: <202512191342.GiGds9qo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Seppo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e81a8aa2967acbb7f13879f471406ee2b0c83cc0
commit: 5416e89b81b00443cb03c88df8da097ae091a141 [4/4] tty: n_gsm: Don't block input queue by waiting MSC
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191342.GiGds9qo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191342.GiGds9qo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191342.GiGds9qo-lkp@intel.com/

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
