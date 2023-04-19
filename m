Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFFA2564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 07:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681889383; x=1713425383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iofq/F4+4mEdTbosEGzoaT4+pRMtpOoNYIPnHcfqqOI=;
  b=h24X8tLwlc4sAV/CjaU55phMp5Rw3jfnY7H0PD5SoiEifkwtXXd4JOA7
   0aYJ5shFLD1Pe+csuo/TNzWAJ3LzBYW04xKqS5JEeecwFgE6jq1rVsNB5
   zN4l5J9nj1U0zU1L6agsnhVCk79mA7TN8WLM+KXU9U3ieBPgc9OGqUbNp
   Wb6RZF394MxGD3Clb3wFde51SZMW+cq2hTw5hf0FGQUQqCpDHdvr/ULbj
   VbWBxD4OEKgTL3Wp/RbWE/sIf4J1Wb33nnRTrr77b43r0e6lepOoHPrWg
   iUi129jLBgDn+caet8LDlPuk7ohzT/N4KLjJ2pA+nTy/lA1/G8Kqn710f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342863607"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="342863607"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 00:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684888204"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="684888204"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 00:29:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp2G3-000efn-38;
	Wed, 19 Apr 2023 07:29:39 +0000
Date: Wed, 19 Apr 2023 15:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202304191503.UlgtNB1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af67688dca57999fd848f051eeea1d375ba546b2
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   9 months ago
config: openrisc-randconfig-s053-20230419 (https://download.01.org/0day-ci/archive/20230419/202304191503.UlgtNB1Z-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ded2ee36313c941f1a12b6f85cde295b575264ae
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ded2ee36313c941f1a12b6f85cde295b575264ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191503.UlgtNB1Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/be2iscsi/be_main.c:148:1: sparse: sparse: symbol 'dev_attr_beiscsi_log_enable' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:158:1: sparse: sparse: symbol 'dev_attr_beiscsi_drvr_ver' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:159:1: sparse: sparse: symbol 'dev_attr_beiscsi_adapter_family' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:160:1: sparse: sparse: symbol 'dev_attr_beiscsi_fw_ver' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:161:1: sparse: sparse: symbol 'dev_attr_beiscsi_phys_port' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:162:1: sparse: sparse: symbol 'dev_attr_beiscsi_active_session_count' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:164:1: sparse: sparse: symbol 'dev_attr_beiscsi_free_session_count' was not declared. Should it be static?
   drivers/scsi/be2iscsi/be_main.c:1154:29: sparse: sparse: cast to restricted __be16
   drivers/scsi/be2iscsi/be_main.c:1180:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2wait @@     got int @@
   drivers/scsi/be2iscsi/be_main.c:1180:21: sparse:     expected restricted __be16 [usertype] t2wait
   drivers/scsi/be2iscsi/be_main.c:1180:21: sparse:     got int
   drivers/scsi/be2iscsi/be_main.c:1665:33: sparse: sparse: cast to restricted __be16
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1803:28: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:1822:36: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_main.c:4337:19: sparse: sparse: cast from restricted itt_t
   drivers/scsi/be2iscsi/be_main.c:4370:34: sparse: sparse: cast to restricted itt_t
   drivers/scsi/be2iscsi/be_main.c:4467:16: sparse: sparse: cast to restricted itt_t
   drivers/scsi/be2iscsi/be_main.c:4467:16: sparse: sparse: cast from restricted __be32
   drivers/scsi/be2iscsi/be_main.c:4523:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be16 [usertype] @@
   drivers/scsi/be2iscsi/be_main.c:4523:9: sparse:     expected unsigned int [usertype] value
   drivers/scsi/be2iscsi/be_main.c:4523:9: sparse:     got restricted __be16 [usertype]
   drivers/scsi/be2iscsi/be_main.c:4583:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be16 [usertype] @@
   drivers/scsi/be2iscsi/be_main.c:4583:9: sparse:     expected unsigned int [usertype] value
   drivers/scsi/be2iscsi/be_main.c:4583:9: sparse:     got restricted __be16 [usertype]
   drivers/scsi/be2iscsi/be_main.c:4677:30: sparse: sparse: restricted __be32 degrades to integer
   drivers/scsi/be2iscsi/be_main.c:4762:17: sparse: sparse: cast to restricted __be32
   drivers/scsi/be2iscsi/be_main.c:4762:17: sparse: sparse: cast from restricted itt_t
   drivers/scsi/be2iscsi/be_main.c: note: in included file (through drivers/scsi/be2iscsi/be_main.h):
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
--
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:338:24: sparse: sparse: cast to restricted __le32
   drivers/scsi/be2iscsi/be_cmds.c:690:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] request_length @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:690:33: sparse:     expected unsigned int [usertype] request_length
   drivers/scsi/be2iscsi/be_cmds.c:690:33: sparse:     got restricted __le32 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:702:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] lo @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:702:29: sparse:     expected unsigned int [usertype] lo
   drivers/scsi/be2iscsi/be_cmds.c:702:29: sparse:     got restricted __le32 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:703:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] hi @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:703:29: sparse:     expected unsigned int [usertype] hi
   drivers/scsi/be2iscsi/be_cmds.c:703:29: sparse:     got restricted __le32 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:752:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:752:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/scsi/be2iscsi/be_cmds.c:752:24: sparse:     got restricted __le16 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:768:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:768:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:768:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:768:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:795:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] num_pages @@     got restricted __le16 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:795:24: sparse:     expected unsigned short [usertype] num_pages
   drivers/scsi/be2iscsi/be_cmds.c:795:24: sparse:     got restricted __le16 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:830:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:830:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:830:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:830:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:892:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:892:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:892:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:892:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:948:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] id @@     got restricted __le16 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:948:25: sparse:     expected unsigned short [usertype] id
   drivers/scsi/be2iscsi/be_cmds.c:948:25: sparse:     got restricted __le16 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:1041:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1041:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1041:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1041:26: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1106:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1106:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1106:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1106:28: sparse: sparse: cast to restricted __le16
   drivers/scsi/be2iscsi/be_cmds.c:1772:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] hdr_ring_id @@     got restricted __le16 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:1772:37: sparse:     expected unsigned short [usertype] hdr_ring_id
   drivers/scsi/be2iscsi/be_cmds.c:1772:37: sparse:     got restricted __le16 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c:1773:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] data_ring_id @@     got restricted __le16 [usertype] @@
   drivers/scsi/be2iscsi/be_cmds.c:1773:38: sparse:     expected unsigned short [usertype] data_ring_id
   drivers/scsi/be2iscsi/be_cmds.c:1773:38: sparse:     got restricted __le16 [usertype]
   drivers/scsi/be2iscsi/be_cmds.c: note: in included file (through drivers/scsi/be2iscsi/be_main.h):
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/be2iscsi/be.h:199:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     expected unsigned int [usertype]
   drivers/scsi/be2iscsi/be.h:199:21: sparse:     got restricted __le32 [usertype]

vim +199 drivers/scsi/be2iscsi/be.h

6733b39a1301b0 Jayamohan Kallickal 2009-09-05  184  
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  185  #define AMAP_GET_BITS(_struct, field, ptr)				\
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  186  		amap_get(ptr,						\
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  187  			offsetof(_struct, field)/32,			\
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  188  			amap_mask(sizeof(((_struct *)0)->field)),	\
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  189  			AMAP_BIT_OFFSET(_struct, field))
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  190  
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  191  #define be_dws_cpu_to_le(wrb, len) swap_dws(wrb, len)
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  192  #define be_dws_le_to_cpu(wrb, len) swap_dws(wrb, len)
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  193  static inline void swap_dws(void *wrb, int len)
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  194  {
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  195  #ifdef __BIG_ENDIAN
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  196  	u32 *dw = wrb;
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  197  	WARN_ON(len % 4);
6733b39a1301b0 Jayamohan Kallickal 2009-09-05  198  	do {
6733b39a1301b0 Jayamohan Kallickal 2009-09-05 @199  		*dw = cpu_to_le32(*dw);

:::::: The code at line 199 was first introduced by commit
:::::: 6733b39a1301b0b020bbcbf3295852e93e624cb1 [SCSI] be2iscsi: add 10Gbps iSCSI - BladeEngine 2 driver

:::::: TO: Jayamohan Kallickal <jayamohank@serverengines.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
