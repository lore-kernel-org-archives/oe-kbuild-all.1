Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8012E620
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 12:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714738535; cv=none; b=adw5cD2F7jSas2oWR+skbTSy7jAO1N3X27Abzb9IVrweTpIUuOejxlUZ88Lw/wAucHAsiCNMfJOdEppqXpQL5g/QuLe3z5vj2QRC8U/xL/Bt4itbQ6cPM6fJEeEpw9EEAXNu1LnDKaO0cRLrGnD1uzNOagOgtI674X/tKaWycQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714738535; c=relaxed/simple;
	bh=9o+UW+gPp99rzXCuK6lQlMEzX16Cu2LL/rd8mDEN8CU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SrLbcoBXWrLjPeI+x030kO3FjypTg9eyyp1o9ZKSOQ7BKxiHOKwNYy4sfWelrTc1rMpqakUKAV3v46gpz6naAO+CxsMrhrIZ/2Bjd/Ny3C66rz9vLrBt7IEFefFXJBy0sSqqJ12Kn8Di1bDzSkxf+GPlFely1d4CTSuXFoDlgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiV6wDev; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiV6wDev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714738533; x=1746274533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9o+UW+gPp99rzXCuK6lQlMEzX16Cu2LL/rd8mDEN8CU=;
  b=JiV6wDevhTyf+gPbfS+fPKZ68eR2hvXJ0HaTxxLVU3EeZQOSwYUitOi3
   cYQj7tOxnE8EYoatS8BiR2JbEiSVXwn9vnq2+iZOwkMR8KkB/h0Q6n5Iu
   db723AiWjby8rIUfjYulTrylXY1phDa2woAlaVOW19+bpf5dA2C1Nfo/K
   7m4n1hJdwAeGOSgvcEpFkJoMnPkf0mx8NMUvEFdELLvvt7ECm4Dw3Ob38
   PSP6IlYbUmWEzzdHfAcUxJmJgRapar7glke9PT6195Ig9DmoU+fKnQB7L
   VtMpCMG/jIGuuJwHkmy6Yrlkh57quK+9AOz9Q0p10bvLWFInJvYFETg9+
   g==;
X-CSE-ConnectionGUID: h06bsa5WREebbQWEkIMg+Q==
X-CSE-MsgGUID: bVXUS8mMSHuM14j/gmjNbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10707022"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10707022"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 05:15:32 -0700
X-CSE-ConnectionGUID: MxpSMLl/SHyKud+xeui7fA==
X-CSE-MsgGUID: KKF9aqzlQaGdri66z+sTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32239737"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2024 05:15:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2rp2-000Bfw-1U;
	Fri, 03 May 2024 12:15:28 +0000
Date: Fri, 3 May 2024 20:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 305/1143]
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:373:13: warning:
 'i3c_aspeed_set_daa_index' defined but not used
Message-ID: <202405032054.kKCasfR0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 9c614f270ff6c7a68ecf3b1348eab81cba623114 [305/1143] i3c: mipi-i3c-hci: Make aspeed i3c compatible with HCI.
config: arc-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032054.kKCasfR0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032054.kKCasfR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032054.kKCasfR0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:373:13: warning: 'i3c_aspeed_set_daa_index' defined but not used [-Wunused-function]
     373 | static void i3c_aspeed_set_daa_index(struct i3c_hci *hci, u8 addr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/i3c_aspeed_set_daa_index +373 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c

   372	
 > 373	static void i3c_aspeed_set_daa_index(struct i3c_hci *hci, u8 addr)
   374	{
   375		if (addr < 32)
   376			writel(BIT(addr),
   377			       hci->EXTCAPS_regs + ASPEED_I3C_DAA_INDEX0);
   378		else if ((addr >= 32) && (addr < 64))
   379			writel(BIT(addr - 32),
   380			       hci->EXTCAPS_regs + ASPEED_I3C_DAA_INDEX1);
   381		else if ((addr >= 64) && (addr < 96))
   382			writel(BIT(addr - 64),
   383			       hci->EXTCAPS_regs + ASPEED_I3C_DAA_INDEX2);
   384		else
   385			writel(BIT(addr - 96),
   386			       hci->EXTCAPS_regs + ASPEED_I3C_DAA_INDEX3);
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
