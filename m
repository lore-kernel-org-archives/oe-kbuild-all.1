Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD02E40A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRsgG7iC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702648721; x=1734184721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+xAnZvPiAQ4/i95FHMRT08pXNCGDifD1Xw3j1zjdSk=;
  b=FRsgG7iC/B10CwROXY50aPBhDJEVTWEEFWahngfGlIVZ1S1gDbN5vRQM
   u9w20bP5+86nQPelstjD58IAEaDYvFCsGUluX/hHGZ0ZJ9TqakClUt9iS
   lK6j0flCKp6li3MMZNE6tf+5Yu19Z/u/Wp1edELekZGVS089aj1KiY7Z1
   Pec8tksGk0Y75eZ9/h228fdZb7BYlMyM8/rv5A4+nYm4Rop0fWvyXHsAj
   L22ByIsVYppfnkflsPQzjdzGSML/1GDJnLeg9yeoWwA5tuhajNBjcASb+
   5KJMIDBBm7ar+YzHncETxaxPjAnJDzpH6xv7ed5+TJ4u9utOOkFv9sUyC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="16830792"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16830792"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 05:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1106131952"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="1106131952"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2023 05:58:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE8i5-0000Hw-1w;
	Fri, 15 Dec 2023 13:58:37 +0000
Date: Fri, 15 Dec 2023 21:57:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Tzvetomir Stoyanov (VMware)" <tz.stoyanov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [rostedt-trace:ring-buffer-multi-page-subbufers 37/47]
 scripts/kernel-doc: kernel/trace/ring_buffer.c:5690: warning: Function
 parameter or struct member 'data_page' not described in
 'ring_buffer_free_read_page'
Message-ID: <202312152152.q8B75qw4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ring-buffer-multi-page-subbufers
head:   e24541a2a1a09ed1c10d0d0a887fe8cf0b350bb9
commit: 24791879a84daada5528634c4b515d0d20e5c3f8 [37/47] ring-buffer: Read and write to ring buffers with custom sub buffer size
config: arc-defconfig (https://download.01.org/0day-ci/archive/20231215/202312152152.q8B75qw4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152152.q8B75qw4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152152.q8B75qw4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kernel-doc: kernel/trace/ring_buffer.c:5690: warning: Function parameter or struct member 'data_page' not described in 'ring_buffer_free_read_page'
>> scripts/kernel-doc: kernel/trace/ring_buffer.c:5690: warning: Excess function parameter 'page' description in 'ring_buffer_free_read_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
