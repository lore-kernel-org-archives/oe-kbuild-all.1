Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362728DB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 05:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740374376; cv=none; b=nz6xb02UJSS8tnOpqhKFe1vIEcJmaIwwPcqU4onhVjZSV4WoCpgTlwwTMNnf/mgu9M+tCrrJXk4tVczA32EnNOr6zOvyFrf0Rn628Go4u8/lBLYGjkMEPnxlouaovSgyF/yUL341mfXAdvxPEJw173zCshux0+nnLYx3K2JeXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740374376; c=relaxed/simple;
	bh=AXn7UZtVzDz8sM5XOwqQu38uup36qXPAwxwGY11zbrg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UDs1NtXaABY0OiqO67MIQG5Up1E7hjSnQKzCL+Q6GAEb1dI3OWt2/WGvOzdJz9yF5kLxHN830yeVQFgeTPCd9NmrDxAYCRoSZD/wtwz8upPnGd+hvuJNFtODoxelQVmxLWf1FIbdLCKGhIlGvDZkwiUR3rdDiStKUGuXAjISnW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0YvIr73; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0YvIr73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740374374; x=1771910374;
  h=date:from:cc:subject:message-id:mime-version;
  bh=AXn7UZtVzDz8sM5XOwqQu38uup36qXPAwxwGY11zbrg=;
  b=K0YvIr739XQ1uEYKxGGtvby1iDrIvWIowE8BnEb+OcMpCnBNtuPLz5At
   rhE2c/p/LEqZ/ylKhUt1SL/T6roFxD3TDZjJoeWPbHNvyJbD15677AuMN
   MRDBy/Khh8qoKK6a8ccaUH/OiBvQanD09KDzfmR/spgm1/Eg8DJ0642uv
   B1hrd/AYJS/4BifYEBJWaxWCuU0gecbu+tY5SZjdHE7NEYictj0SVAHTX
   m/2gRP3yuj1PHMBqfgUh81UkT7I0IscgaKq7OrifciUWjhH1THPllqiIR
   dXMcEKwT+habPG0fxm2MzPwnE7dVR/RF7EXsi+yuIwBLkxegxoRpmJPAc
   A==;
X-CSE-ConnectionGUID: vMfYKz7LTx+bcu29grWRbA==
X-CSE-MsgGUID: ATP9isoPRzi3hAti/c8E1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="40990323"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40990323"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 21:19:33 -0800
X-CSE-ConnectionGUID: f7Zl+ACpQRSmR++breTpeg==
X-CSE-MsgGUID: p8WmsAV2QhW3BIHOGLdK8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="120867901"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Feb 2025 21:19:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmQsL-0007t9-2S
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 05:19:29 +0000
Date: Mon, 24 Feb 2025 13:19:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] arch/s390/include/asm/io.h:64:38: warning:
 'return' with a value, in function returning void
Message-ID: <202502241340.igE4pn5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 22e743898dcd693cf587593781699db2fa888e23 [1/1] media: ddbridge: bump ddbridge code to version 0.9.29
config: s390-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241340.igE4pn5n-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241340.igE4pn5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241340.igE4pn5n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:25:0,
                    from drivers/media/pci/ddbridge/ddbridge-core.c:29:
   drivers/media/pci/ddbridge/ddbridge.h: In function 'ddbcpyto':
>> arch/s390/include/asm/io.h:64:38: warning: 'return' with a value, in function returning void
    #define memcpy_toio(dst, src, count) zpci_memcpy_toio(dst, src, count)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/ddbridge/ddbridge.h:374:9: note: in expansion of macro 'memcpy_toio'
     return memcpy_toio((char *) (dev->regs + adr), src, count);
            ^~~~~~~~~~~
   In file included from drivers/media/pci/ddbridge/ddbridge-core.c:37:0:
   drivers/media/pci/ddbridge/ddbridge.h:372:20: note: declared here
    static inline void ddbcpyto(struct ddb *dev, u32 adr, void *src, long count)
                       ^~~~~~~~
   In file included from include/linux/io.h:25:0,
                    from drivers/media/pci/ddbridge/ddbridge-core.c:29:
   drivers/media/pci/ddbridge/ddbridge.h: In function 'ddbcpyfrom':
   arch/s390/include/asm/io.h:63:40: warning: 'return' with a value, in function returning void
    #define memcpy_fromio(dst, src, count) zpci_memcpy_fromio(dst, src, count)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/ddbridge/ddbridge.h:379:9: note: in expansion of macro 'memcpy_fromio'
     return memcpy_fromio(dst, (char *) (dev->regs + adr), count);
            ^~~~~~~~~~~~~
   In file included from drivers/media/pci/ddbridge/ddbridge-core.c:37:0:
   drivers/media/pci/ddbridge/ddbridge.h:377:20: note: declared here
    static inline void ddbcpyfrom(struct ddb *dev, void *dst, u32 adr, long count)
                       ^~~~~~~~~~
   drivers/media/pci/ddbridge/ddbridge-core.c: In function 'ddb_port_attach':
   drivers/media/pci/ddbridge/ddbridge-core.c:2290:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (ret < 0)
         ^
   drivers/media/pci/ddbridge/ddbridge-core.c:2292:2: note: here
     case DDB_PORT_LOOP:
     ^~~~
   drivers/media/pci/ddbridge/ddbridge-core.c: In function 'dvb_input_attach':
   drivers/media/pci/ddbridge/ddbridge-core.c:1534:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (input->port->dev->link[input->port->lnr].info->ts_quirks &
         ^
   drivers/media/pci/ddbridge/ddbridge-core.c:1539:2: note: here
     case DDB_TUNER_DVBCT2_SONY_P:
     ^~~~
   drivers/media/pci/ddbridge/ddbridge-core.c:1558:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
      osc24 = 1;
      ~~~~~~^~~
   drivers/media/pci/ddbridge/ddbridge-core.c:1559:2: note: here
     case DDB_TUNER_DVBCT2_SONY:
     ^~~~
--
   In file included from include/linux/io.h:25:0,
                    from drivers/media/pci/ddbridge/ddbridge-i2c.c:25:
   drivers/media/pci/ddbridge/ddbridge.h: In function 'ddbcpyto':
>> arch/s390/include/asm/io.h:64:38: warning: 'return' with a value, in function returning void
    #define memcpy_toio(dst, src, count) zpci_memcpy_toio(dst, src, count)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/ddbridge/ddbridge.h:374:9: note: in expansion of macro 'memcpy_toio'
     return memcpy_toio((char *) (dev->regs + adr), src, count);
            ^~~~~~~~~~~
   In file included from drivers/media/pci/ddbridge/ddbridge-i2c.c:33:0:
   drivers/media/pci/ddbridge/ddbridge.h:372:20: note: declared here
    static inline void ddbcpyto(struct ddb *dev, u32 adr, void *src, long count)
                       ^~~~~~~~
   In file included from include/linux/io.h:25:0,
                    from drivers/media/pci/ddbridge/ddbridge-i2c.c:25:
   drivers/media/pci/ddbridge/ddbridge.h: In function 'ddbcpyfrom':
   arch/s390/include/asm/io.h:63:40: warning: 'return' with a value, in function returning void
    #define memcpy_fromio(dst, src, count) zpci_memcpy_fromio(dst, src, count)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/ddbridge/ddbridge.h:379:9: note: in expansion of macro 'memcpy_fromio'
     return memcpy_fromio(dst, (char *) (dev->regs + adr), count);
            ^~~~~~~~~~~~~
   In file included from drivers/media/pci/ddbridge/ddbridge-i2c.c:33:0:
   drivers/media/pci/ddbridge/ddbridge.h:377:20: note: declared here
    static inline void ddbcpyfrom(struct ddb *dev, void *dst, u32 adr, long count)
                       ^~~~~~~~~~


vim +/return +64 arch/s390/include/asm/io.h

cd24834130ac65 Jan Glauber 2012-11-29  62  
cd24834130ac65 Jan Glauber 2012-11-29  63  #define memcpy_fromio(dst, src, count)	zpci_memcpy_fromio(dst, src, count)
cd24834130ac65 Jan Glauber 2012-11-29 @64  #define memcpy_toio(dst, src, count)	zpci_memcpy_toio(dst, src, count)
cd24834130ac65 Jan Glauber 2012-11-29  65  #define memset_io(dst, val, count)	zpci_memset_io(dst, val, count)
cd24834130ac65 Jan Glauber 2012-11-29  66  

:::::: The code at line 64 was first introduced by commit
:::::: cd24834130ac655d15accee6757e0eaeab4ad4ef s390/pci: base support

:::::: TO: Jan Glauber <jang@linux.vnet.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
