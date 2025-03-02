Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC22BD04
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740936028; cv=none; b=WS4r2MTuOpK0cKU7k/YuI1DLRkwE0tJDjNo/cJ5LPYD2sUeQSsdCGHw3/iIVM54zJh772bnGbRwRp6dqcfycDqd+E02jGUD9k4oL9s4eTfpsonMymTxAm+JfGvuHCeYFDQchwra16gc3YtRZixUxb5g27g51Xz561Y2QCjREfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740936028; c=relaxed/simple;
	bh=ZngZ0Ou/fnr6OvPe5mlLf/lYsuR34A6vTyTwNTnP1UA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ig2ubbZt1pCH+oqGt5d+iiNdiNbgGiwyecdgynTXlz6EzuYAoCpm1hPnnx4j+VWs3x7BMnpGnysbGXL+YS65KukFW4yXUUCKbKDmteDrP1dg0D3nDGTtydiFrSFzdnKIXrMOlVSAEilJclbaP8MxQJcRnutMoxwXkQTAq78c3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh4Qmi/G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh4Qmi/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740936027; x=1772472027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZngZ0Ou/fnr6OvPe5mlLf/lYsuR34A6vTyTwNTnP1UA=;
  b=eh4Qmi/GdBVfjZF6WtMfaHQO1NfJn4RZpnCW8/gGgc+52EE1n4YfflDr
   TmWBalZcvka64ehwSYZCHHXwNpd88herjtDoJYuYlFpCfdihH0XCqcB86
   vO2KhB5Y9snkynKokdZE2WIPHxcKQl/0W8T9rI0FcL96aCVModivNV2G2
   B5tgW0fUjBqhY5CaT42cOVAiItIILDP4i4GNPiJJYxodrTmbaGx+y0vhK
   Fc9ZaG7dRPaXXNf+PkqfQ1jKAPukmNkTRlu/yUVh9MGg7FfibtpXwTJMC
   SsJgkbOdh8K5op6WAG6Doc9NPi0X6/RYH1StoA0CxeuKA3pRjJU/G5kIk
   w==;
X-CSE-ConnectionGUID: kealY+40TZubv6X8/unYww==
X-CSE-MsgGUID: yOkYwntwRTCu/4/9zsDtEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44626303"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="44626303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 09:20:26 -0800
X-CSE-ConnectionGUID: jDtsdxTrSBO/VVteZE106w==
X-CSE-MsgGUID: MpZiLuGJRaW9S7DlSCqQ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121930311"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2025 09:20:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tomzH-000HTu-0F;
	Sun, 02 Mar 2025 17:20:23 +0000
Date: Mon, 3 Mar 2025 01:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for
 'arch_report_meminfo'
Message-ID: <202503030123.GrzZ1SpJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1973160c90d7886c523e52e1f56164e6a74f0474
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   1 year, 10 months ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250303/202503030123.GrzZ1SpJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030123.GrzZ1SpJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030123.GrzZ1SpJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +65 arch/parisc/kernel/pdt.c

c9c2877d08d9aa Helge Deller 2017-05-11  63  
c9c2877d08d9aa Helge Deller 2017-05-11  64  /* report PDT entries via /proc/meminfo */
c9c2877d08d9aa Helge Deller 2017-05-11 @65  void arch_report_meminfo(struct seq_file *m)
c9c2877d08d9aa Helge Deller 2017-05-11  66  {
c9c2877d08d9aa Helge Deller 2017-05-11  67  	if (pdt_type == PDT_NONE)
c9c2877d08d9aa Helge Deller 2017-05-11  68  		return;
c9c2877d08d9aa Helge Deller 2017-05-11  69  
c9c2877d08d9aa Helge Deller 2017-05-11  70  	seq_printf(m, "PDT_max_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  71  			pdt_status.pdt_size);
c9c2877d08d9aa Helge Deller 2017-05-11  72  	seq_printf(m, "PDT_cur_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  73  			pdt_status.pdt_entries);
c9c2877d08d9aa Helge Deller 2017-05-11  74  }
c9c2877d08d9aa Helge Deller 2017-05-11  75  

:::::: The code at line 65 was first introduced by commit
:::::: c9c2877d08d9aa0ca0a5c227ac795fbb76269300 parisc: Add Page Deallocation Table (PDT) support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
