Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC02B13A26B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728728645; cv=none; b=FZEl4pDhjIXycewhHcruU0WbfA9bLIyVEeWco+xgiMaKg0sIFW4pB1TFVjSq/plWal+PDhBmTmmC3/EBv9Nl0X71VKVX7n+/9vRh8TvXbLAK0bORS3VTqyRzVjQWuujnpKJlItGE3deZFx2mSRsFjcxmbfa+92k7FYCm2jrJ3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728728645; c=relaxed/simple;
	bh=Tj+5tL3dLj48VskY+tlsuY5Fwftz3fW4BegDJ55t4O0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBUKZEgThGmSmAVCjhLh5hEgSWW25ijFDg+aGMbbEViynBvEvy6ns/hlsW2jjLD03rG5BlfvlW2zUH9NByiU774puKR4KVQDgEjOkAJxdLWHf69q9pwdS44krvvxh2BbSqA5cJyI9osz2CEf0cg2jN3JpYYgneK55Isp89pecUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awFddwxB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awFddwxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728728643; x=1760264643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tj+5tL3dLj48VskY+tlsuY5Fwftz3fW4BegDJ55t4O0=;
  b=awFddwxB6yey0OxfQbYKHXb38zXDaXVAwYIQbGvZZDSD0ZUu7BB9tTkI
   CjojTL0OruBgV26HqJkrdVQSWgqivtr5zbGdiUdZ9yg2njNHq0QBfM09z
   EaNhSKm/gUs6E42S8UPnIcd7xy7KuFG2rf+VIEeZMPkMTmuR5dvU9O5ep
   G1phQszGBJjawRHLVXTqwi/f9EslgpKGVR31kOCv9vvU4Ydi3BN89OTXj
   ANfmYLLytHH9W+dwnkZqjTB+9s4fsQSbVuQl3OUbyB47CpWExYgbu7300
   P1rOuYAJ6gTsi21czIvl/bcKUZiRGc5YZ1sIOewQp1Z4Wex1Sj8FyNYve
   A==;
X-CSE-ConnectionGUID: ywx/McnFR9aUaI4cXLOP1Q==
X-CSE-MsgGUID: 3VRZbtRaQISgwezE/FLV9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38767941"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="38767941"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 03:24:01 -0700
X-CSE-ConnectionGUID: 7XJh5b+/TLu+x9X4p0fPTg==
X-CSE-MsgGUID: tBozTfOrROO0qGF1ULp5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="76760002"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Oct 2024 03:24:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szZHy-000DHH-0l;
	Sat, 12 Oct 2024 10:23:58 +0000
Date: Sat, 12 Oct 2024 18:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13479/14352]
 drivers/crypto/ccp/hygon/hct.c:233:18: sparse: sparse: symbol
 'hct_mdev_type' was not declared. Should it be static?
Message-ID: <202410121833.1SampNGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0fac4b66f365181375364ed55678bc5faa6940ff
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [13479/14352] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-r122-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121833.1SampNGd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121833.1SampNGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121833.1SampNGd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/hct.c:233:18: sparse: sparse: symbol 'hct_mdev_type' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:237:18: sparse: sparse: symbol 'hct_mdev_types' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:459:23: sparse: sparse: cast to restricted __le32
>> drivers/crypto/ccp/hygon/hct.c:1204:20: sparse: sparse: symbol 'hct_mdev_driver' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:1333:13: sparse: sparse: symbol 'hct_pin_memory' was not declared. Should it be static?

vim +/hct_mdev_type +233 drivers/crypto/ccp/hygon/hct.c

   232	
 > 233	struct mdev_type hct_mdev_type = {
   234		.sysfs_name = "1",
   235		.pretty_name = "hct mdev type"
   236	};
 > 237	struct mdev_type *hct_mdev_types[] = {
   238		&hct_mdev_type
   239	};
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
