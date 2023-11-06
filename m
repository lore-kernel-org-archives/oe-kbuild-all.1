Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67F18E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXaL8MjU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699230190; x=1730766190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pV5H4CmwZUjYFjpPbJfyLiYcDQb0Sq//jiYqaBn1Kj0=;
  b=ZXaL8MjUZJcg2axBS+8h7iTGVp522jDHlxfdX00ATLctXG0LycJsfWFy
   ol3+r0+u8ZuRz7sZufcerfMtpENMNFVDWucnGeSL582xi2rgBuOEriVrQ
   vM+/rAoKoveABj8s5vIhlSWDoWoGA8rKlNYT1mQzAaMvVM0IMq0vKB576
   MXW+hi9vo7eO17c7auPUgZ+Ym9LmsMo+Np47b/qtJHa2rwkhDQcICc9Cd
   ur4yQP36qcys5TzJ57cqYcwBKbX/S1ZAlX3UF8oPWHCfz1beCH57/iQ3K
   1Wm5mQGTG3CJidL3ztGyHskN9AJZeazL/YF0bcXS/46+4LfP15Het/p3Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386359808"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="386359808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 16:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="9924323"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2023 16:23:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qznOT-0005v3-2A;
	Mon, 06 Nov 2023 00:23:05 +0000
Date: Mon, 6 Nov 2023 08:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 9/21]
 drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Function parameter or
 member 'id' not described in 'spihid_msg_hdr'
Message-ID: <202311060705.wMZhH4rq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   aefaf432ff80e54092c35dcba09404239f181de6
commit: 372d4679f7251105cfe589c326eb5ee9b3d4f8a1 [9/21] WIP: HID: transport: spi: add Apple SPI transport
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060705.wMZhH4rq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060705.wMZhH4rq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060705.wMZhH4rq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Function parameter or member 'id' not described in 'spihid_msg_hdr'


vim +151 drivers/hid/spi-hid/spi-hid-apple-core.c

   119	
   120	/**
   121	 * struct spihid_msg_hdr - common header of protocol messages.
   122	 *
   123	 * Each message begins with fixed header, followed by a message-type specific
   124	 * payload, and ends with a 16-bit crc. Because of the varying lengths of the
   125	 * payload, the crc is defined at the end of each payload struct, rather than
   126	 * in this struct.
   127	 *
   128	 * @unknown0:	request type? output, input (0x10), feature, protocol
   129	 * @unknown1:	maybe report id?
   130	 * @unknown2:	mostly zero, in info request maybe device num
   131	 * @msgid:	incremented on each message, rolls over after 255; there is a
   132	 *		separate counter for each message type.
   133	 * @rsplen:	response length (the exact nature of this field is quite
   134	 *		speculative). On a request/write this is often the same as
   135	 *		@length, though in some cases it has been seen to be much larger
   136	 *		(e.g. 0x400); on a response/read this the same as on the
   137	 *		request; for reads that are not responses it is 0.
   138	 * @length:	length of the remainder of the data in the whole message
   139	 *		structure (after re-assembly in case of being split over
   140	 *		multiple spi-packets), minus the trailing crc. The total size
   141	 *		of a message is therefore @length + 10.
   142	 */
   143	
   144	struct spihid_msg_hdr {
   145		u8 unknown0;
   146		u8 unknown1;
   147		u8 unknown2;
   148		u8 id;
   149		__le16 rsplen;
   150		__le16 length;
 > 151	};
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
