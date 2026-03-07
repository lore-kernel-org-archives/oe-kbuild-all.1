Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E71E4BE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772867815; cv=none; b=Q1hzhxNCoDxX60tT9yxXToc/TNYCbOMt50UzGrBYPYTy3sC22Ny6qYTEUCEuWR4pNC7FfTpKPDkwvY8amdEk/CRbbgRwIXBXFBOXTPmoYMt45r6KEZU0oewtWfDPCLL6iutepLxqe7U3FK3KkAUqZPOcZwObm//GsvynRwk039M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772867815; c=relaxed/simple;
	bh=cAefbE27Xi9v9St/jVXJhO3Rou0PRhhEguSDBqRaA6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X2CyH/AGLgnV9C+2f/WaYrnx88knw8WrZghPm8DVMO/GQF4ilK/ikmoCxWUNONUvVycw2TaJVDEPJ+omrf0wMe7ZIoO0XtDTgRgziu19biYhgfPporYTgiCIixVVlNY056gCRq8NaomGzRMffMgbt1iMaxpriPioMN5ZmelH7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtpdsJW9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtpdsJW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772867812; x=1804403812;
  h=date:from:to:cc:subject:message-id;
  bh=cAefbE27Xi9v9St/jVXJhO3Rou0PRhhEguSDBqRaA6k=;
  b=PtpdsJW9xP3k78LGyQfLt4LQjXHVXXTT4lTtd7oErtMVaMYHV/ftkfqF
   tZ8/AiiGjOv9TuAttubakZ0vOk2NBBC7+moLz4HNogtWSjClueFG0GsP2
   +67sHHMVtypFRNKs7QhnPepVdK1JiBOXL7eXskwGL4577KroN1fqdCAiK
   pdPcI0l+ILqEzLIwR9CFII7TNP0c9qJmGGYlhiCCjXbWLYfbzLhetIqpp
   Cb/JOdQ5Y2o3g6UQpU9joULzyi6GjRKXzkSIyztM0qRHRcei9QsMQb+Vl
   Ck3CxT6+3PQltqzOfg/zqZ5XEm+pxp8nv2cJJjApZNZaNcZDfp6Go8u+m
   g==;
X-CSE-ConnectionGUID: jHilNpAoTgqYBs1kQIc1hw==
X-CSE-MsgGUID: la8d9x3fQcSb8UV4GaGf6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77849889"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="77849889"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 23:16:51 -0800
X-CSE-ConnectionGUID: kDBKtxkJSGi4ngEEL2GlMA==
X-CSE-MsgGUID: 9GELVtlnTqSB44OSV4kTdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224180815"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 23:16:49 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vylu2-000000001nF-1MPk;
	Sat, 07 Mar 2026 07:16:46 +0000
Date: Sat, 07 Mar 2026 15:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3]
 drivers/block/loop.c:1989:6: warning: no previous prototype for
 'loop_process_cmd_list'
Message-ID: <202603071500.cQRvOTmz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi jiayingrui,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   39d310b0a4c14302f75c539bbae2f64a015ead7b
commit: aa8a9034d8a0e18d37fff6c6053f470be77637ae [3/3] ANDROID: loop: export loop_process_cmd_list
config: arm-randconfig-004-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071500.cQRvOTmz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071500.cQRvOTmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071500.cQRvOTmz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1989:6: warning: no previous prototype for 'loop_process_cmd_list' [-Wmissing-prototypes]
    1989 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/loop_process_cmd_list +1989 drivers/block/loop.c

  1988	
> 1989	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1990	{
  1991		struct loop_device *lo = disk->private_data;
  1992		loop_process_work(NULL, cmd_list, lo);
  1993	}
  1994	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1995	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
