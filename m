Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531172627
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 19:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061603; cv=none; b=qvHhkpUZY7Na8S3gEm6G6QLWgGeAYzJc/lK9T/Po/NLAeoSCqjo5M3UpLzG6e0+mMB5Kk0P7mgGBklPqyl9MF7M9R4SW0pIP5DB74QEN6ao3jwsCouO+alfyF8KO/AZGQBPFzRB+86eDmObR8X761ebAIywtwpf6VBHYX3QAj/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061603; c=relaxed/simple;
	bh=TFn5p17AdU+ewLx+yvi/Q6RCvsZQp4hixKeO8bgKD94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R7klK1tyiVhs4BIDdbchADxllts/nZs4WuXQIH4uagr4+VyLg7I1X4+ykI8UO2raRI1beG1U9rCjf3u88VOrk19VS92gN7EK5h5A06S5x65Sn6JRRe12zyThosrDmgyOC+fL+tew3skzCelM2skzMLt2w/7ZdujP7UVdHsmoJZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2tlGt41; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2tlGt41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770061601; x=1801597601;
  h=date:from:to:cc:subject:message-id;
  bh=TFn5p17AdU+ewLx+yvi/Q6RCvsZQp4hixKeO8bgKD94=;
  b=J2tlGt41jUVrktda54V3NN2WebzcVA3DtdeLMnmnoGwE8Edej5cjAvAv
   gYZa6auFnPwtmzxU4xy2juJT1GtC2guXsR/PHgWe9RooBozrO2B8lw32w
   rJYGPiRrAXBxGRvtn/Y7mI6Lv/2PfY7h8H4uIUnCPRrKYMHFacl6MsMwI
   OvRY7+s7gM2PZFJDcjCRu3alAR9Ud5F5X+imkq1rPmVWE8wd78oHLCMYN
   Kh9+IhGT8uCNJhuUV5r7p1vSlRyP03czz3OjwCpBHLlza+Wr2e322Dm6r
   Y6fDuRDxVqaDTC6M2CcPqDygz4CFIdw/xlXC00apDgYHIjHDNPB/nyNux
   A==;
X-CSE-ConnectionGUID: WVe+V5Q2S/Cxs8HOQtDiSg==
X-CSE-MsgGUID: K4DSTHzTQ6yhI0JPVXXbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88647302"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="88647302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 11:46:40 -0800
X-CSE-ConnectionGUID: aW8W4Ve8QX6fcnf0F3AIjA==
X-CSE-MsgGUID: TrBUZ3IWQXSs0UVeTcC7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="208897697"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2026 11:46:39 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmzsa-000000003Bt-2S4C;
	Mon, 02 Feb 2026 19:46:36 +0000
Date: Mon, 02 Feb 2026 20:45:38 +0100
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/driver-api/tty/tty_port.rst:65:
 WARNING: Document or section may not begin with a transition. [docutils]
Message-ID: <202602022007.fALe9bGB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: 00d95fcc4dee66dfb6980de6f2973b32f973a1eb docs: kdoc: handle the obsolescensce of docutils.ErrorString()
date:   5 months ago
reproduce: (https://download.01.org/0day-ci/archive/20260202/202602022007.fALe9bGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602022007.fALe9bGB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/tty_port.h
   ERROR: Cannot find file ./include/linux/tty_port.h
   WARNING: No kernel-doc for file ./include/linux/tty_port.h
   ERROR: Cannot find file ./include/linux/tty_port.h
   WARNING: No kernel-doc for file ./include/linux/tty_port.h
>> Documentation/driver-api/tty/tty_port.rst:65: WARNING: Document or section may not begin with a transition. [docutils]
   ERROR: Cannot find file ./include/linux/tty.h
   WARNING: No kernel-doc for file ./include/linux/tty.h
   ERROR: Cannot find file ./include/linux/tty.h
   WARNING: No kernel-doc for file ./include/linux/tty.h
   ERROR: Cannot find file ./include/linux/tty.h


vim +65 Documentation/driver-api/tty/tty_port.rst

3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  61  
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  62  .. kernel-doc:: include/linux/tty_port.h
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  63     :identifiers: tty_port
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  64  
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26 @65  ----
3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  66  

:::::: The code at line 65 was first introduced by commit
:::::: 3f19fed8d0daed6e0e04b130d203d4333b757901 Documentation: add TTY chapter

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
