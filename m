Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC901F9E9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717440654; cv=none; b=hVvPFpAGw0PqFKLw/NCKiis2UJAwkDkklpgumveQCQAFv702NzTZ26tpHOcrdf31xYIEO7YxwehnAh1il2+F1fGJO0I5QUkj33uBtuVAcaOUrHpeCqIWTo+euZWbZEEuFs4cMovW+hP2tBSoedcC4Wx/LFUkDGSs7+9gktETeNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717440654; c=relaxed/simple;
	bh=GQ5K/D+OZZ0HE10oxSu8epiXdPWanlCArVZ00eu5fqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gE63EN7qyFszxZys2Bra4zl+hAiApiLYm0XZQpiXgxCgwcUc16YP+NMW5SNBeD5yoxZNmyS6Sm5zz09EED+xwjtor+qfOgBF4BmxArjiKYJXL9YGoXcPLMBGRzOq6nOsLyqWi8hryiB5M+VRX0jjuRKiVAxqKj/N0tmzysRg8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8o1Ey46; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8o1Ey46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717440653; x=1748976653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQ5K/D+OZZ0HE10oxSu8epiXdPWanlCArVZ00eu5fqA=;
  b=O8o1Ey46sfpckfdogADIbNg9VgW3Xhn1ufK8q04Qm/jPckuEzbJGlBUo
   JjWGxwAwkei6OnbmKAubwYoIh6Q3Pq4WURYoV06TBk7GIWdXd9TmYMCiC
   u2/Bj7z0aHIrVAAhV71DLKcT5iM+WFsnwxryJ5c1Ftr8ngqLsO8qSCDAf
   b/i99gZmBJboaNuMmIgJJkkbGLWpSBAv87djCF4IT+kODxcCOY8fTqwAj
   tZfuJtjO64ebfDDFO0gaTWT5F5gQOxpl9rxV+mvodIsKvElkjY9RAcaGg
   9fOVx9+Nl0QDkx6+qrgD9OGYXicxFrd/NfqEyacjnSz8Qu+gNzCC3aDX6
   w==;
X-CSE-ConnectionGUID: kmG7/DlmQUuucREve+3D7w==
X-CSE-MsgGUID: L0rpq6izQFW1W8yoi6gzjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24530538"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="24530538"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 11:50:52 -0700
X-CSE-ConnectionGUID: LcZO8AT2Ro2hsgLQvTq+7A==
X-CSE-MsgGUID: a9g634aiSKqfogcmkuj07w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="67801248"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 11:50:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sECld-000M4d-16;
	Mon, 03 Jun 2024 18:50:49 +0000
Date: Tue, 4 Jun 2024 02:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 26/27] drivers/char/aaa.o: warning: objtool:
 unexpected relocation symbol type in .rela.discard.reachable
Message-ID: <202406040235.0RV7KhKm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   dda2d26edd879979b20eeaaafff23074a59fddec
commit: c4f52252826bab0a408e81030120a67a23318ca0 [26/27] kfifo tester
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240604/202406040235.0RV7KhKm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040235.0RV7KhKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040235.0RV7KhKm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/aaa.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
