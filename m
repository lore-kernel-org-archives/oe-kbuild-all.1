Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095232E370A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754691292; cv=none; b=Z4R7ectqlsG4bS/rYrYwYJL6BZnsAbnR0gY4HX1c75Z80kzoGjVNbjs20WfSKLh3fjGeqBNSmBK72eZJSnTk9VhlTRPHxzuwambqHS+OZmGj8eRdeP+RiBDWu0Ci/nsn383x+hZoMWxg5/8ew38CvrvtV87xQSehKfO583vCXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754691292; c=relaxed/simple;
	bh=Va51qyaTkz2CTQqYFwwQTQQj1zq50RUD2yJd6Ld/8Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgV459dw65NDZ+0UD69GzjjovNwJjVw5pSuZ0CfebHL4CP1kwo1ZYRAjPq6kD0yDxVJwdXG/5dwybh6QmQmgCd1DbTcY7NJf12dXv5B4hpUKwDHdSDWZnr5jnuE69Hwheap56exLn4dJ3ifQVJUL8lqS9PNKsMmP9JOcAuyYcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbGHDyBQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbGHDyBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754691291; x=1786227291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Va51qyaTkz2CTQqYFwwQTQQj1zq50RUD2yJd6Ld/8Bw=;
  b=fbGHDyBQ0Uv8JYDVM9XZAQvIJpTzuwYEPc8mLQsAvFjxKDHUmRsBrHxx
   p7HGmT8AegrsF6dPZEvV6SHQlPpN3ksrmnpCE2wkPIgUDKYSR7gkfnoNg
   iN5aaJHzH6BUrdADsjRuaJFIwwyRUuVH8v/phkqYJTep5Pdhe26FIwzJ2
   +Ec0q45QrrmgkSgJ8kjhKkyoaXApMjIuDLEpNOGgh3fNt0FE5tFcP5HMV
   dy7GytwVavJCmD6MS2wjq2h/Do5CzJPZCUMf7WIweDa/Wj2peGNbxQAzV
   sWfD2ip97q9Ez4+XzmsoPG/7LbPj7gEg9klJ/Z+BkoNCWVriSNdqgAHPh
   w==;
X-CSE-ConnectionGUID: oU27gxvLS12BS0iLfv+Dxg==
X-CSE-MsgGUID: Tj3U7TDiR/qmHqp7zRyfuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="67636577"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67636577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 15:14:49 -0700
X-CSE-ConnectionGUID: JPb+1T4QTmiOEChXSiTB/A==
X-CSE-MsgGUID: sqBD9nHuSUC7wz4ibvOLpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169879650"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2025 15:14:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukVLt-0004MU-1R;
	Fri, 08 Aug 2025 22:14:26 +0000
Date: Sat, 9 Aug 2025 06:12:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2662/2662]
 drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to
 restricted __le32
Message-ID: <202508090640.BEtBteXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9f11838de785067991187f7d0aa9b340abfba381
commit: 97a2bb6ece556f3882263ee8df2b77f10c511311 [2662/2662] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
config: x86_64-randconfig-121-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090640.BEtBteXt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090640.BEtBteXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090640.BEtBteXt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le64
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le64
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le64
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le64
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le16
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1795:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le16
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le32
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:1815:17: sparse: sparse: cast to restricted __le64
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2249:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2249:33: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2249:33: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2250:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2250:31: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2250:31: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2376:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long virtDiskLba @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2376:27: sparse:     expected unsigned long long virtDiskLba
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2376:27: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2377:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int numBlocks @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2377:25: sparse:     expected unsigned int numBlocks
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2377:25: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3058:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int numLba @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3058:28: sparse:     expected unsigned int numLba
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3058:28: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3062:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int sLbaHi @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3062:28: sparse:     expected unsigned int sLbaHi
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3062:28: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3064:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int sLbaLo @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3064:28: sparse:     expected unsigned int sLbaLo
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3064:28: sparse:     got restricted __le32 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3066:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short cID @@     got restricted __le16 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3066:32: sparse:     expected unsigned short cID
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:3066:32: sparse:     got restricted __le16 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2095:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int length @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2095:25: sparse:     expected unsigned int length
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2095:25: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2096:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2096:23: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2096:23: sparse:     got restricted __le64 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2119:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long addr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2119:23: sparse:     expected unsigned long long addr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2119:23: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2868:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long dataBaseAddr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2868:36: sparse:     expected unsigned long long dataBaseAddr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2868:36: sparse:     got restricted __le64 [usertype]
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2869:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int dataBufLenDWAlign:24 @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2869:41: sparse:     expected unsigned int dataBufLenDWAlign:24
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2869:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2874:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long dataBaseAddr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2874:36: sparse:     expected unsigned long long dataBaseAddr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2874:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2875:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int dataBufLenDWAlign:24 @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2875:41: sparse:     expected unsigned int dataBufLenDWAlign:24
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2875:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2964:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int dataBufLenDWAlign:24 @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2964:41: sparse:     expected unsigned int dataBufLenDWAlign:24
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2964:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2966:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long dataBaseAddr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2966:36: sparse:     expected unsigned long long dataBaseAddr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2966:36: sparse:     got restricted __le64 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2971:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int dataBufLenDWAlign:24 @@     got restricted __le32 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2971:41: sparse:     expected unsigned int dataBufLenDWAlign:24
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2971:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2973:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long dataBaseAddr @@     got restricted __le64 [usertype] @@
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2973:36: sparse:     expected unsigned long long dataBaseAddr
   drivers/scsi/linkdata/ps3stor/ps3_scsih.c:2973:36: sparse:     got restricted __le64 [usertype]

vim +1795 drivers/scsi/linkdata/ps3stor/ps3_scsih.c

  1782	
  1783	static void ps3_scsih_print_hw_req(struct ps3_cmd *cmd, unsigned char log_level)
  1784	{
  1785		struct IODT_V1 *req = NULL;
  1786		struct ps3_pd_entry *pd_entry =
  1787			(struct ps3_pd_entry *)cmd->io_attr.pd_entry;
  1788		if (pd_entry == NULL)
  1789			return;
  1790		ps3_scsih_print_req_head(cmd, log_level);
  1791		switch (pd_entry->dev_type) {
  1792		case PS3_DEV_TYPE_SAS_HDD:
  1793		case PS3_DEV_TYPE_SAS_SSD:
  1794			req = &cmd->req_frame->hwReq.sasReqFrame;
> 1795			LOG_LEVEL(log_level,
  1796				  "hno:%u cmdProto:%d cmdType:%d\n"
  1797				  "\tcmdLen:%d dataAddr:0x%llx sgeMode:%d\n"
  1798				  "\tdirect:%d function:%d phyDiskID:%d\n"
  1799				  "\treqFrameID:%d CmdWordType:%d cmdDir:%d\n"
  1800				  "\tdataBufLenDWAlign:0x%x iuSrc:%d sataCtl:%d\n",
  1801				  PS3_HOST(cmd->instance), req->protocolType,
  1802				  req->frameType, le32_to_cpu(req->cmdLen),
  1803				  le64_to_cpu(req->dataBaseAddr), req->dmaCfg.sgMode,
  1804				  req->commonWord.direct, req->commonWord.function,
  1805				  le16_to_cpu(req->commonWord.phyDiskID),
  1806				  le16_to_cpu(req->commonWord.reqFrameID),
  1807				  req->commonWord.type, req->cmdDir,
  1808				  le32_to_cpu(req->dataBufLenDWAlign), req->iuSrc,
  1809				  req->sasCtl);
  1810			ps3_scsih_print_cdb(req->B.cdb);
  1811			break;
  1812		case PS3_DEV_TYPE_SATA_HDD:
  1813		case PS3_DEV_TYPE_SATA_SSD:
  1814			req = &cmd->req_frame->hwReq.sasReqFrame;
  1815			LOG_LEVEL(log_level,
  1816				  "hno:%u cmdProto:%d cmdType:%d\n"
  1817				  "\tdataAddr:0x%llx sgeMode:%d\n"
  1818				  "\tdirect:%d function:%d phyDiskID:%d\n"
  1819				  "\treqFrameID:%d CmdWordType:%d cmdDir:%d\n"
  1820				  "\tdataBufLenDWAlign:0x%x lba:0x%llx\n"
  1821				  "\topCode:0x%llx iuSrc:%d sataCtl:%d\n",
  1822				  PS3_HOST(cmd->instance), req->protocolType,
  1823				  req->frameType, le64_to_cpu(req->dataBaseAddr),
  1824				  req->dmaCfg.sgMode, req->commonWord.direct,
  1825				  req->commonWord.function,
  1826				  le16_to_cpu(req->commonWord.phyDiskID),
  1827				  le16_to_cpu(req->commonWord.reqFrameID),
  1828				  req->commonWord.type, req->cmdDir,
  1829				  le32_to_cpu(req->dataBufLenDWAlign),
  1830				  le64_to_cpu(req->C.lba),
  1831				  (unsigned long long)req->C.opCode, req->iuSrc,
  1832				  req->sataCtl);
  1833			break;
  1834		case PS3_DEV_TYPE_NVME_SSD:
  1835			break;
  1836		default:
  1837			LOG_LEVEL(log_level, "hno:%u dev_type:%d\n",
  1838				  PS3_HOST(cmd->instance), pd_entry->dev_type);
  1839			break;
  1840		}
  1841	}
  1842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
