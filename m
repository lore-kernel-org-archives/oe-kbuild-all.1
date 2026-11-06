Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002458;
	b=28UQEnSW2KRE9ipL/7VgSElEqoNO3KqUJN5Y+YHXYybRTgHmXCsg+KRsuX/uMsrFgGVx
	 B6b2Hj38cGJ9F2BPttvoy1fel9teD0h4Wzs+N3vwHyBGiFG2oTVCM9AzLIT8ZPP5HXMEo
	 y9sB98S6q409ibjbSsb56QDGkkAQat/pAKGUyMR73MdzsXpk/4viz8IO47OIl6JHnXPRD
	 kIGRyJCqFU56exL83X+xsht/NqrQV/yhaa2pZqlqzW+FK4/39cHxAAzA14c3p7r2KoLSG
	 m036hPIgA6euYG2q6++GRNbBDu6ZqmKyNlfJYJ5ucjJP7N4mjKoVEWPw+llxRT1xT6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002458;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GpB22hhUY2zvJPZHm3rXXr6BOtUtdqjdOzRABACpRsA=;
	b=R8T0i1i4EPDLqQr0zCvH+QkeDuuqOrjL02+v4oTPOvtOtyT+N5yCrsq5Y0nyEfOj6xAJ
	 kmPF9N8oJ/3adtBK1f4L3I45uokFaAzv7gE2oQ2XJv/EWXn9sbDdmIwu2V0ZW0ka2k8Tk
	 0tFKNnlDU0mx8XZKG8raVbu6g/P88tzaFK00W/zpDG7f7YbKT2+sWo23tUCxI7QHWEOyE
	 YR4+H1hmlxuIJaeb1XlrqIPYOLYw81P9nbCMTgMUnc1g+FmhdGGru2DTHXh8796hXhfeV
	 eRWNZT9YP4vy3eRSSIowLHOblgzyGew/IiZexh7Cr5anYFymcOGO9lalhkE6/8vEI4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kssO6CkJ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9A606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 22:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF9A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kssO6CkJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794002458; x=1825538458;
  h=date:from:to:cc:subject:message-id;
  bh=aAp6Tu7QcFopIFffjieEDnZkJKOKlsAtEygrBAHSvy8=;
  b=kssO6CkJzQXpWs++EcSsJpHsNQndv5F74nVfg1KoOgMASFE0bgm8tYHj
   0oBcWMg5r8Cm+CiAMvs5tiLxiCuRYlHoaaIoiXisMatFOYCzqvRdjCOe+
   3GPeyfH72FikAoYbLFXw+0pc3QsulKoZHw+I5l8Q03Xk7I7hhAvb0yJrw
   6S3FWQZAN76lMF+6A2SrTsslYeTeoJ0mpxmI72irpAGGKjLMQ7btL3Tl4
   ANt99CzlMnyINQZg73ZDNAkILo5rhpfdwfsh67Rb9Wi+s6rr50DvmG812
   31vY+j63Op3yGQfyoBdnE5v+QrVKhr5025qqt8oRyVmIf/q9KsZcYleAm
   g==;
X-CSE-ConnectionGUID: ZoCjrDCmT4OtM67oxNezpQ==
X-CSE-MsgGUID: dpfyhVi4SBCJb5YKu/Iuzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2813321"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2813321"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 14:00:57 -0800
X-CSE-ConnectionGUID: jlRyCy4wSmirlNzBw9ed7w==
X-CSE-MsgGUID: kiloUs9BR4+6YZjzcOEAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9147850"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 06 Nov 2026 14:00:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPRzN-00000000ANH-48dX;
	Fri, 06 Nov 2026 22:00:49 +0000
Date: Fri, 06 Nov 2026 23:00:36 +0100
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Andreas Grapentin <gra@linux.ibm.com>
Subject: [kvms390:sae 28/28] arch/s390/kernel/aef.c:79:1: sparse:
 sparse: symbol 'bin_attr_qmc' was not declared. Should it be static?
Message-ID: <202611062241.QRhwhHK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae
head:   2abfa741008fd96c3684c316a2f5f37d3bb7bd8b
commit: 6f0139f1ab685b923aadef3e1653c6f3b2f963c0 [28/28] s390: Report AEF features to sysfs
config: s390-randconfig-r2307-20261106 (https://download.01.org/0day-ci/archive/20261106/202611062241.QRhwhHK0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062241.QRhwhHK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611062241.QRhwhHK0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/s390/kernel/aef.c:79:1: sparse: sparse: symbol 'bin_attr_qmc' was not declared. Should it be static?
>> arch/s390/kernel/aef.c:89:1: sparse: sparse: symbol 'bin_attr_save_area' was not declared. Should it be static?

vim +/bin_attr_qmc +79 arch/s390/kernel/aef.c

    78	
  > 79	BIN_ATTR_RO(qmc, sizeof(qmc));
    80	
    81	static ssize_t save_area_read(struct file *filp, struct kobject *kobj,
    82				      const struct bin_attribute *attr, char *buf,
    83				      loff_t off, size_t count)
    84	{
    85		return memory_read_from_buffer(buf, count, &off, &save_area,
    86					       sizeof(save_area));
    87	}
    88	
  > 89	BIN_ATTR_RO(save_area, sizeof(save_area));
    90	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
