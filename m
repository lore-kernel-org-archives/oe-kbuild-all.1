Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0418AED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720133838; cv=none; b=HXPGW6G4xl4lMlgcdW7fGSskD0LTnVzTe7fbv9uo8BVaq9hkQjheJXWHOAwn4JK5ZT6H3KkKCqTFeupSs8ku+uXqw90jsv4TjqNhjAMSCpXdXm/A0EEM/P3iD2oiU4Ta58SNsTZAzp05rXxw5Uwo+M3u/bzfs5ZAdVO3EcSW8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720133838; c=relaxed/simple;
	bh=MoZz7itoEYZaF17Te6Z9RXYWUd5M0SSHngCMSRxP6M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqnvrBMyJfoanCkT3bq1/KFegH+V4kcXVw/Lg5kQgLevsVbWbuJ1WPor5ckXBgX+Uw/1H++fKXMJ5A4l3ui7BI3yymUfMroVN+b+yVrsqsPJeAk9cyNLhTkV7nESmrEDRb4RTPFkk4tvTuOiZlHXIUKI7G0wi42Npcfcjv2wLlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5GeRjvd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5GeRjvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720133837; x=1751669837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoZz7itoEYZaF17Te6Z9RXYWUd5M0SSHngCMSRxP6M8=;
  b=m5GeRjvdvNaAyJ2dSo1Xfpg/poPm27LAb61+9PpgAY5VjQK7rLEblP8O
   7zC0BcZyW8gE6jXVpa6GGSMqBNeJG7wAqcLdNMXDo5t09Pnxo56bWYTwk
   NohNevQ2A+2mEh+NAyzQsvQFVDzWK7l3+3nGg+redo6ea5dZ8R65Vfnvf
   ywXTipn0kOgJY4zf1C908AZHqv+uBeiBiNAKeGG5VnjJICXB/Yns9G4tX
   3yq9C+o/2Mb3kh1p0XtmqrRGpueBXWqSSOAXkcmCQAR4/Olc7+Qcvz1KB
   uF6HNz4qfqyZgbvG3JGUq2NCGJe/PQtm8+77v+2gmMz/JfpeeP8HcVNdD
   g==;
X-CSE-ConnectionGUID: mvF2KIF+SpOWzeQBRPR5mw==
X-CSE-MsgGUID: TBBAIx0zR+KNVYED6tPh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17529017"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17529017"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 15:57:17 -0700
X-CSE-ConnectionGUID: 1qNf3jCLT8S/iqmnP7skEA==
X-CSE-MsgGUID: swJxC19sQDOnDyPGZgEOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46487203"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2024 15:57:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPVO5-000RbK-00;
	Thu, 04 Jul 2024 22:57:13 +0000
Date: Fri, 5 Jul 2024 06:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-next 4/11] drivers/usb/typec/ucsi/ucsi_ccg.c:572:14:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202407050600.HGza0qcn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   179264157bbaf3d169b184160d0b5283f8a50e73
commit: 467399d989d799433ec7dd8da2ebbfbc70207d03 [4/11] usb: typec: ucsi: split read operation
config: hexagon-randconfig-r112-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050600.HGza0qcn-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407050600.HGza0qcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050600.HGza0qcn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/typec/ucsi/ucsi_ccg.c:572:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] cci @@
   drivers/usb/typec/ucsi/ucsi_ccg.c:572:14: sparse:     expected unsigned int [usertype]
   drivers/usb/typec/ucsi/ucsi_ccg.c:572:14: sparse:     got restricted __le32 [usertype] cci

vim +572 drivers/usb/typec/ucsi/ucsi_ccg.c

   566	
   567	static int ucsi_ccg_read_cci(struct ucsi *ucsi, u32 *cci)
   568	{
   569		struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
   570	
   571		spin_lock(&uc->op_lock);
 > 572		*cci = uc->op_data.cci;
   573		spin_unlock(&uc->op_lock);
   574	
   575		return 0;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
