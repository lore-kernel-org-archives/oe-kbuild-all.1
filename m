Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A9402B8D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551522; cv=none; b=da9pDw3RVzBPX2Zgpa+tzryggUAH8eLnBamoZV8evQD4G8GOEXmFir/WL5TA/RY28LtijWARIIDrPy8YWsTmf6PiWe2hJUsIdQkUWGrvPq2c0tT3BnztrLw6F3L/LvuD0gj5NGf1VgJ1EcZe1NpqBsjri61wbs0cNuQISkt6384=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551522; c=relaxed/simple;
	bh=rVklRIRZYDFnVAt4xwUDSYYqKzPfmoTODe4qBkBZBYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lSEq3DjqAxY2PP5Z569Dmq9nXzXfe/L56Vg803eYiUudtiSXKx0z7LTorvr6I6CsOLQuIMlgp3OG2LlX5LRWN2sEJFjrJj5dsa+3ya3B/hEqw7SDMZN+70x+dAsGHVcROy8fI78aQoJlxfBFeQ0+mOYBCK3ZYkOGSG9Cy1DHmFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/uguwJA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/uguwJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777551519; x=1809087519;
  h=date:from:to:cc:subject:message-id;
  bh=rVklRIRZYDFnVAt4xwUDSYYqKzPfmoTODe4qBkBZBYk=;
  b=A/uguwJA+y8wQq0fFB3Ibm52PTo2CK2lT3V8TZYubxQiMLEz9ce+CZHS
   O62sDBhmqqwcXYF+hYpKHjImi82EJOG/rL1BfrVRQiGQIcGcCxVZyZtYy
   ykKZPaDU5rY9FojIQZVnEvAx+h1Rw/QxXAt86NPLo3SSPJcDCWAqTSwoW
   wXEtNedSRDonTd9i40ySulIFSVaDleg2WERmSTqJWC84RiAX74w5VzdeA
   7/jqM7w9ULAcEEeOc8cE0gfQCXQFart/ORroTtAJ4cm81zmNMS+lkKU7j
   qCfi2UDfwDeiQffrOuJZD3ZWg8tNV1bnkb+oFRxr1pjVL9MhmAtoBJakU
   Q==;
X-CSE-ConnectionGUID: 5bT+siR5Qci+xwEV6XLXkQ==
X-CSE-MsgGUID: 5fQTLQouRrS+fLtCcZiI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="101163773"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="101163773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:18:37 -0700
X-CSE-ConnectionGUID: HXfYdtDXSkS5mqRZT2oMsQ==
X-CSE-MsgGUID: W70nrv0KTfWXSCTrajHdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233724608"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 05:18:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQLh-000000004ot-3YzH;
	Thu, 30 Apr 2026 12:18:33 +0000
Date: Thu, 30 Apr 2026 14:18:31 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING:
 toctree contains reference to nonexisting document
 'networking/device_drivers/ethernet/cirrus/cs89x0' [toc.not_readable]
Message-ID: <202604301418.xWBPHv08-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Lunn/drivers-net-3com-3c509-Remove-this-driver/20260424-104110
head:   9223eb1499a6a614ff3744386dc2b772907adc68
commit: ece15657f74a8fe0c3cf05e2837534bb570a85bc drivers: net: cirrus: cs89x0: Remove this driver
date:   6 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604301418.xWBPHv08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301418.xWBPHv08-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
   Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/3com/3c509' [toc.not_readable]
>> Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/cirrus/cs89x0' [toc.not_readable]
   Documentation/networking/device_drivers/ethernet/index.rst:10: WARNING: toctree contains reference to nonexisting document 'networking/device_drivers/ethernet/smsc/smc9' [toc.not_readable]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +10 Documentation/networking/device_drivers/ethernet/index.rst

132db93572821e Jakub Kicinski 2020-06-26   7  
132db93572821e Jakub Kicinski 2020-06-26   8  Contents:
132db93572821e Jakub Kicinski 2020-06-26   9  
132db93572821e Jakub Kicinski 2020-06-26 @10  .. toctree::

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
