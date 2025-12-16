Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C668341674
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884772; cv=none; b=fkKAL2qUsVSX5A94/GAPU72PAd3D6Wa3uju6tFWYMiMj2yeSPauA5Qjf91PWMni450kh4aW0cF3Zi2VcEoapbqKsdsdnM6rJCQDSqd9zPVG4FMJu6x6Nzg2YTm2KKrjY0EOLKRDT8Iu4nivlcRzwBqBQRDEbRoQe2zECGz1agyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884772; c=relaxed/simple;
	bh=YXpMXp4NuPAAiVJsUZhqRBIl7JhsDrMhl8A4vkBtp64=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIpS8TfCPqo7OfcIqFlJlPrS/t+a48i9FF2DW4Q4g6nozBkJuNuy0EGk51Ec4OmkntrrokeY4e+MYGbYoU+Rag7gVcdaWcsRk6fG9F3Xc1NS82AUVZrlh6wu9tBA5i6jlGtC7F+w73de1ovj599prxyhJOhHknMOaqdtfRKv22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri7FLfQY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri7FLfQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765884771; x=1797420771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YXpMXp4NuPAAiVJsUZhqRBIl7JhsDrMhl8A4vkBtp64=;
  b=Ri7FLfQYnkixikFr2rRpOad/SSRgAxl5JdlAlRk5Erx+3R6AMmbO/pAa
   esV3EK8s+f4Ui81CD99Rk74UUU7gWyIYpWndbaHqLDwzabGe9jfRXRt+f
   P6tPFi73nr8z3nQaheNQeGX2uCB8h30dXT/2HFh6NABom1sE8xGe4buVk
   dFd2BB/s7K42wiHtlFJSNxBqin09IBHJPIiSsnv3xboWToEzVGWUrBTlb
   zKrUlgdEBE15qUymhE4jL/PASLEG+kj+5xf/4EfjjRJClJQfrZGGQenQk
   FxvSWg7ywv1ymw3xXUtEkgQ0SzRcK1BPiBVbSWYWIzmlbdUM+CARMktCc
   w==;
X-CSE-ConnectionGUID: Zf9TfjeLTb+NryKCZyw1uQ==
X-CSE-MsgGUID: MJ/UjAaiQ/2apJhWgyvwUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66786591"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="66786591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 03:32:50 -0800
X-CSE-ConnectionGUID: yd6m6Wo6T3KOMEDemP1wdg==
X-CSE-MsgGUID: gFKVKvUfT1KNDdhHIAHFiw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 03:32:50 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVTIN-000000001kg-27F7;
	Tue, 16 Dec 2025 11:32:47 +0000
Date: Tue, 16 Dec 2025 19:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/cxl/aliscm.c:513:5: warning: no previous prototype for
 'cxl_aliscm_send_cmd'
Message-ID: <202512161922.7H9ikr1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: b332886ddf0e8d9bd286f9d57eb4e110d094cb2f [25/25] anolis: driver/cxl: Add a custom module for AliSCM
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512161922.7H9ikr1L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161922.7H9ikr1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161922.7H9ikr1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/aliscm.c:513:5: warning: no previous prototype for 'cxl_aliscm_send_cmd' [-Wmissing-prototypes]
     513 | int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/cxl/aliscm.c:607:24: warning: no previous prototype for 'devm_cxl_add_aliscm' [-Wmissing-prototypes]
     607 | struct cxl_aliscm_dev *devm_cxl_add_aliscm(struct device *host)
         |                        ^~~~~~~~~~~~~~~~~~~


vim +/cxl_aliscm_send_cmd +513 drivers/cxl/aliscm.c

   512	
 > 513	int cxl_aliscm_send_cmd(struct cxl_aliscm_dev *aliscm, struct cxl_send_command __user *s)
   514	{
   515		struct device *dev = &aliscm->dev;
   516		struct cxl_send_command send;
   517		struct aliscm_cmd cmd;
   518		int rc;
   519	
   520		dev_dbg(dev, "Send IOCTL to AliSCM\n");
   521	
   522		if (copy_from_user(&send, s, sizeof(send)))
   523			return -EFAULT;
   524	
   525		if (send.rsvd == ALISCM_DOE_ID) {
   526			rc = doe_validate_cmd_from_user(&cmd, aliscm, &send);
   527			if (rc)
   528				return rc;
   529	
   530			rc = handle_aliscm_doe_cmd_from_user(aliscm, &cmd, send.out.payload,
   531								&send.out.size, &send.retval);
   532			if (rc)
   533				return rc;
   534		} else if (send.rsvd == ALISCM_GET_CXL_REG_ID) {
   535			rc = get_cxl_reg_validate_cmd_from_user(&cmd, aliscm, &send);
   536			if (rc)
   537				return rc;
   538	
   539			rc = handle_aliscm_get_cxl_reg_cmd_from_user(aliscm, &cmd, send.out.payload,
   540								&send.out.size, &send.retval);
   541			if (rc)
   542				return rc;
   543		} else {
   544			dev_warn(dev, "Unsupported command type: %x\n", send.rsvd);
   545			return -EINVAL;
   546		}
   547	
   548		if (copy_to_user(s, &send, sizeof(send)))
   549			return -EFAULT;
   550	
   551		return 0;
   552	}
   553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
