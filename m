Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA112B94
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733189609; cv=none; b=PHlfFDV4f9mu7qCndknMLBKSCpU76QwJPCrzBFrXfajzqA88Fxt/6TwvoDwu9mQPB1pxtLsDLBLCbqqz4kp0zxUaqJW7av9K/bjHgc+4fRmjmcYScmu9oK7ukXkPMVOg6Jr6Z6FQE2CNdrYuYaeSm0HPDeKHAelNE2ysF+T5lmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733189609; c=relaxed/simple;
	bh=dKmlHlkb7WbW+4b8/pXx9raRh/cUFXpHa9D93jn+wv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTH24l3zKbto7L571R5qDHMRHwufq6yIikz5OZ2hjcMltGI9JBGSKOvbJlZOD6keWYtZ1hGCaIe7r+uzcUmFzWIIcEyJrOVd6nt+NXo6/q9ItFWfEZhQCC3J2K4OpeiVpAgxAideo5mpHfdvC6To7NHxseIiIMzAALxB7cXIgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fb8YYhoZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fb8YYhoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733189608; x=1764725608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKmlHlkb7WbW+4b8/pXx9raRh/cUFXpHa9D93jn+wv0=;
  b=fb8YYhoZmB4it0vHrbMTktE41J6z7HoOyF3EHELN8ms2MLTU/vsXix8L
   hacVS+E613FyMMIlZDaIm4bSM55dB1/QHQ91tja/Scu5XfkeoERKeWCD7
   SQnyZCaJnP58IOekdOuuIjiGUhYzWtTOQw5W120HxYawP85AKF9mqcK1l
   6W7X5VlstpL88e2VPkL6UxsmqTOrdD34lbZyEkcyuY4bFA4S/QKoJFJtJ
   CV7MdA7kx4XPf8uMpudZcNUgToEGIIxUV6cn8XORFi2Bf7n2IDDm0wEex
   F8QcKPTPgc41M7/FDYp1LKN7tfPAGY5k0fz3sRzHFCZUiYKCLTFPq1rUF
   w==;
X-CSE-ConnectionGUID: rA1knQTbTHq8mqaaVYVyyg==
X-CSE-MsgGUID: pPNrRLqPSzqxO6vPfW8yGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33634799"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33634799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:33:27 -0800
X-CSE-ConnectionGUID: 6zTRF/TrT9CYE1yJpqRsvw==
X-CSE-MsgGUID: 0g4FHChITwaaxuin/nIZPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93112331"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Dec 2024 17:33:27 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHmz-00037x-34;
	Tue, 03 Dec 2024 01:33:22 +0000
Date: Tue, 3 Dec 2024 09:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __trace_event_discard_commit+0x160 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202412030913.OTV5Qxsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   1 year, 4 months ago
config: xtensa-randconfig-r121-20241114 (https://download.01.org/0day-ci/archive/20241203/202412030913.OTV5Qxsz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241203/202412030913.OTV5Qxsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030913.OTV5Qxsz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x94 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: __trace_event_discard_commit+0x160 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
