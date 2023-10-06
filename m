Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F4114F74
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRl21t4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696587075; x=1728123075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gWyN3EqzVzw4L7rRN5ptGG7jS2JKY4p4z/mDEUA73x4=;
  b=iRl21t4L7jN2o/d4tdslj/CrflaU60++LO3+m0PAGGhSwjYhxn4fY/3F
   s4AevS7646hbh5+2KoR91xH/c9x+/kU1KLkGbq8k/BsdkxS/8EQFF6Mvn
   3q9ZPr7ASxh+JYnHsgwpnS5R8nU/mrXBKcRAvioIqpCTLREQuQ7BkoBNs
   HZ2k6QqymPnvH/njymokjdlqGNhUSZtiv58HmRXcemxMG9jrvYhzdwAHw
   /MXB/lK0Xo4/MBBcBfG0D2IeRhSoDupqdv9zFDkyLcr8nlDy9n1hH1Zmy
   mgKRCNtV6IAm9yu97ebDskfeyanENGzqOaNBPW0h3vMbFedL/MFXfltRV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382589512"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382589512"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 03:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="1083402019"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="1083402019"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2023 03:11:11 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qohnZ-000MUi-1j;
	Fri, 06 Oct 2023 10:11:09 +0000
Date: Fri, 6 Oct 2023 18:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH v3 07/10] cxl/memdev: Fix sanitize vs decoder setup
 locking
Message-ID: <202310061706.JTytkmZT-lkp@intel.com>
References: <169657719974.1491153.15276451196916291864.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169657719974.1491153.15276451196916291864.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6465e260f48790807eef06b583b38ca9789b6072]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/cxl-pci-Remove-unnecessary-device-reference-management-in-sanitize-work/20231006-152823
base:   6465e260f48790807eef06b583b38ca9789b6072
patch link:    https://lore.kernel.org/r/169657719974.1491153.15276451196916291864.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH v3 07/10] cxl/memdev: Fix sanitize vs decoder setup locking
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310061706.JTytkmZT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061706.JTytkmZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061706.JTytkmZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1190: warning: Function parameter or member 'cxlmd' not described in 'cxl_mem_sanitize'
>> drivers/cxl/core/mbox.c:1190: warning: Excess function parameter 'mds' description in 'cxl_mem_sanitize'


vim +1190 drivers/cxl/core/mbox.c

  1173	
  1174	
  1175	/**
  1176	 * cxl_mem_sanitize() - Send a sanitization command to the device.
  1177	 * @mds: The device for the operation
  1178	 * @cmd: The specific sanitization command opcode
  1179	 *
  1180	 * Return: 0 if the command was executed successfully, regardless of
  1181	 * whether or not the actual security operation is done in the background,
  1182	 * such as for the Sanitize case.
  1183	 * Error return values can be the result of the mailbox command, -EINVAL
  1184	 * when security requirements are not met or invalid contexts, or -EBUSY
  1185	 * if the sanitize operation is already in flight.
  1186	 *
  1187	 * See CXL 3.0 @8.2.9.8.5.1 Sanitize and @8.2.9.8.5.2 Secure Erase.
  1188	 */
  1189	int cxl_mem_sanitize(struct cxl_memdev *cxlmd, u16 cmd)
> 1190	{
  1191		struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlmd->cxlds);
  1192		struct cxl_port  *endpoint;
  1193		int rc;
  1194	
  1195		/* synchronize with cxl_mem_probe() and decoder write operations */
  1196		device_lock(&cxlmd->dev);
  1197		endpoint = cxlmd->endpoint;
  1198		down_read(&cxl_region_rwsem);
  1199		/*
  1200		 * Require an endpoint to be safe otherwise the driver can not
  1201		 * be sure that the device is unmapped.
  1202		 */
  1203		if (endpoint && endpoint->commit_end == -1)
  1204			rc = __cxl_mem_sanitize(mds, cmd);
  1205		else
  1206			rc = -EBUSY;
  1207		up_read(&cxl_region_rwsem);
  1208		device_unlock(&cxlmd->dev);
  1209	
  1210		return rc;
  1211	}
  1212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
