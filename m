Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97C210B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EesCVnJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699398235; x=1730934235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGuif5eO0pEFcVAR+7n/lz6DY6FGOXJvln7yK+3Edfk=;
  b=EesCVnJWPSMg/b+9jTZup7qokWeFeJTF5YiWAky69Ymmp8yuSX2C2fyA
   h9JUGyuCK/v1Qp3Zdsx9u6rxE1SAXKibnbWamlG2NoxrPS4rjCLxQb1Ql
   ivBvZuHfX0Icr6DWszdcD7gz5FmJXQT466jzUYTIlxDDbAO4HFmhdOSTK
   ZaKuZFmmmeY/9Uepc5D6SRN4uY233lefsbnEmeGNDjqygNY0+oNlqviiM
   ISeURgCpN1OBtFJwf+v5OuU/qWeEXr/DHnhnle35vUmyhft/YRLaqbnri
   qfPunVC9ecucB6ObVdJMUd5MwrCFzTG7ixkT0/r0MDMnW+y1UUFZ3pGXU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8294033"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="8294033"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010072942"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="1010072942"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2023 15:03:52 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0V6s-0007Si-1l;
	Tue, 07 Nov 2023 23:03:50 +0000
Date: Wed, 8 Nov 2023 07:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-attest-wip 13/13]
 drivers/virt/coco/tdx-guest/tdx-guest.c:89: warning: Function parameter or
 member 'hdr' not described in 'att_service_req'
Message-ID: <202311080614.7HVnlic8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest-wip
head:   4ed58356a95af36f4112fa8808ca91bdd81e65d0
commit: 4ed58356a95af36f4112fa8808ca91bdd81e65d0 [13/13] virt: coco: tdx-guest: Add service quote support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311080614.7HVnlic8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080614.7HVnlic8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080614.7HVnlic8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virt/coco/tdx-guest/tdx-guest.c:89: warning: Function parameter or member 'hdr' not described in 'att_service_req'


vim +89 drivers/virt/coco/tdx-guest/tdx-guest.c

    66	
    67	/**
    68	 * struct att_service_req - Attestation Service command buffer
    69	 * hdr: Command buffer header.
    70	 * @version: Command version (default is 0).
    71	 * @cmd: Command ID.
    72	 * @rsvd: Reserved for future use.
    73	 * @len: Length of the report data.
    74	 * @data: Report data used in Quote generation
    75	 */
    76	struct att_service_req
    77	{
    78		/* Command buffer header */
    79		struct tdx_service_req_hdr hdr;
    80	
    81		/* Command data */
    82		u8 version;
    83		u8 cmd;
    84		u16 rsvd;
    85		
    86		/* Report data */
    87		u32 len;
    88		u8 data[];
  > 89	} __packed;
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
