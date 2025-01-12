Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26442556E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682652; cv=none; b=NHeBinBxGlrICdFD8how90u1rfyqSD1sb2bNKUcpE0fsdp3G5LClVfDYViAKdEoFQ2TMQGBOxMhouBW5vLonCODXnZwRRf1VL2yGeNKdNF85Mw7h8UGA3qwQv7grz2fVwSlgSwo7YkJ8dIP8UrFMqG3un0xOJKe5mqnJNeVyN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682652; c=relaxed/simple;
	bh=1D0hx8u6t5xPtwMSzKNLg1MIjFDzNV5QHNhc/s61/ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pS7f9JOLCsWrs6R9Fo8he6ECCdE8zUoyaUB3x5MiaAr5EKav7BxCrMaIXMpXO71NvRLRNmuzvu5pT4i/M/B5ZQWbXDujeIcdRLCO08M0MqNtXeBAtOqE+Vuc1GEu6kVXmoqxghqQoV+4TBXOJ3hK9SDdlm6out1TCkIZsl5iiGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwLBNOXQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwLBNOXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736682651; x=1768218651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1D0hx8u6t5xPtwMSzKNLg1MIjFDzNV5QHNhc/s61/ag=;
  b=gwLBNOXQ4pQ509JCGYMz/TcACwxp962J0L4RsyDOD3vBiJrZHlUCYbSb
   xFh2LlS8QYJFvZLO8vg3rp0FD//JBKH4oy3W2LhIKBgt42PqzMyiITEKP
   +bljz9brkDTmiFR7HpSNZ/VsvdddXROhWumY9SVyS70onLPDlQleALeH7
   zmMk43remdU/u9Vy0h49kCh56Ff9KlNf5oyEX8R5ufyArC6t/pHdetx9J
   Mm0FW9YRXu+snq5NDcDg9aD6z/sSdNivfKMMVEMd2nbUKpdirZFX0FUmo
   2+B9DUeAiBzHou8q/OOsgWL/oGxesJ6vUSbdXvor3sKR9e0/7SK9SvZZG
   w==;
X-CSE-ConnectionGUID: ibLHi1r/TjaFKMAYoQbx2Q==
X-CSE-MsgGUID: dWSJ2JG5RiiHZMx+tKD8AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="62294856"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="62294856"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 03:50:50 -0800
X-CSE-ConnectionGUID: gd/vEqTKRcuGcqc6Nrti4g==
X-CSE-MsgGUID: +WSpuY6yQEKo3DW9x7dKzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104343224"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2025 03:50:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWwUQ-000LrH-1O;
	Sun, 12 Jan 2025 11:50:46 +0000
Date: Sun, 12 Jan 2025 19:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: arch/loongarch/kernel/machine_kexec.o: warning: objtool:
 kexec_shutdown_secondary+0x60: stack state mismatch: cfa1=3+0 cfa2=3+16
Message-ID: <202501121943.oXLOT3f0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: ab6b1010dab68f6d4bf063517db4ce2d63554bc6 cpumask: Switch from inline to __always_inline
date:   5 months ago
config: loongarch-randconfig-r131-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121943.oXLOT3f0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121943.oXLOT3f0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121943.oXLOT3f0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/machine_kexec.o: warning: objtool: kexec_shutdown_secondary+0x60: stack state mismatch: cfa1=3+0 cfa2=3+16
   arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
