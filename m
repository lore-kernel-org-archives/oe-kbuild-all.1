Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FF28478
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692329807; x=1723865807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oleTW8bDVDpjri4Tvuw8q7HKh+YvRGk33KT7aqexKYM=;
  b=faKEBPe37xvux1Urzi2JbKCy35yko930CFNoFZEeW6/TmylcyiX7tq0f
   WXgtAXWzWIhiqBv4Wk3a58Ylj1LM7C/Lb84BpPNi8xgrbc+Nc6X7wXePl
   vPKyQDp6a/88VMvbOt+7B6KEU+7OJ1IMn1Pdevx7L6c2uhVanjfP98WjR
   GQFakCDfAsUSsDZxxmadoZkNHDF61aHhVlBwia+4vxn69n9meCfqJ5g9d
   unTexZwV7dNDDGBg91Xk0RM2pSsWLAKk2X/TEtQy0eaMlEAojZkHP1Ve8
   ewUn4uoMTUIN4tdqHlVrwk1aIQk91wBKB5jMnHOySWGDY0BcgBUr+twrV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="353308583"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="353308583"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 20:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981473637"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="981473637"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 20:36:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWqI0-00024Y-0k;
	Fri, 18 Aug 2023 03:36:44 +0000
Date: Fri, 18 Aug 2023 11:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 9/21]
 drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Function parameter or
 member 'id' not described in 'spihid_msg_hdr'
Message-ID: <202308181125.nrkSn5U1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   58700c861f0a37630478bf31ded5eaf81e50b1a2
commit: ae2e2c7930d1c554678286e6376f49409155a73e [9/21] WIP: HID: transport: spi: add Apple SPI transport
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308181125.nrkSn5U1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181125.nrkSn5U1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181125.nrkSn5U1-lkp@intel.com/

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
