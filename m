Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0D0360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705884995; cv=none; b=YqU43X5wBpCFs+2EFMluyjV3Rkq23o8Z5Fn3rQvWiqzXcvjZzDxV63Wl5P/MWOPm7KhzYuZUaG7apktj7SnaNEJeeGsLP2ukrTm6EVICAJRbGaY7Xixnwe8AmO5SVMVmIZt8mGI+K2M2uqMz+X+dJTmLpVxHdIofj53+GBZsj8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705884995; c=relaxed/simple;
	bh=9V57vSe0a9ae/EhMA7q2UfUtyd55wrZWEcjllsC0Pvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPqU++FBqVWOOEmcf2Z6hr74QN1f++1FPVjEbmqReMD6RH8gJtpPWPX1y+blVgP41EdBYev5mS/POSmX3S2HCKomvkmNIAOCg18eouSRfh6zja/ldQ52R9FZPlgCupQp8PVo5/nQ13CZ8TIAEVDcH1b7j7BxcDlRqZFCmouJcBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fu/g2YRi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fu/g2YRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705884993; x=1737420993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9V57vSe0a9ae/EhMA7q2UfUtyd55wrZWEcjllsC0Pvo=;
  b=fu/g2YRiZ33xBloiJPA8AlaienHb1dRqyutRV0YnG1ZkgSaGzLdyQ8yy
   97TbifeZIVKYg//4ZIOkVxUrOpBQeRF5SUhc+OgWGRbZ1raYnN1YAhrfQ
   aclPrRNo2QRm5uvB5SJwjIwjp/Xvm6WCl5IqwUhn3f57IAZX91nIyMujm
   2N23xVG2NwYzdXhQryYqjqRBjL/vl7gGOuUZhWWKSO1q8+KOjRPkAsRU1
   ADlRBZ1T72WeMc3mFtNvvO644Rob0wESXV+x5D8yf3XQnZNmU7lQS3w6v
   mwS4d/tjVbnYNsXv9erNXVhKAGeYGI0bwYiQvM8SiT8mMH7PVtPPvKfm8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7754662"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7754662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 16:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1035613"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2024 16:56:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRic0-0006IO-36;
	Mon, 22 Jan 2024 00:56:28 +0000
Date: Mon, 22 Jan 2024 08:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21465/21561]
 drivers/scsi/hisi_raid/hiraid_main.c:2221:49: warning: '%d' directive
 writing between 1 and 11 bytes into a region of size 7
Message-ID: <202401220837.GB8qTJlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: f153a1e5e708c7cf9607ad375bf7145060ababd4 [21465/21561] SCSI: hisi_raid: support SPxxx serial RAID/HBA controllers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240122/202401220837.GB8qTJlA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220837.GB8qTJlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220837.GB8qTJlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/hisi_raid/hiraid_main.c: In function 'hiraid_alloc_resources':
>> drivers/scsi/hisi_raid/hiraid_main.c:2221:49: warning: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Wformat-overflow=]
    2221 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                                                 ^~
   In function 'hiraid_create_prp_pools',
       inlined from 'hiraid_alloc_resources' at drivers/scsi/hisi_raid/hiraid_main.c:2563:8:
   drivers/scsi/hisi_raid/hiraid_main.c:2221:35: note: directive argument in the range [-2147483641, 254]
    2221 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_raid/hiraid_main.c:2221:17: note: 'sprintf' output between 15 and 25 bytes into a destination of size 20
    2221 |                 sprintf(poolname, "prp_list_256_%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hdev' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'qid' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1851: warning: Function parameter or member 'cq_vector' not described in 'hiraid_create_complete_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hdev' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'qid' not described in 'hiraid_create_send_queue'
   drivers/scsi/hisi_raid/hiraid_main.c:1871: warning: Function parameter or member 'hiraidq' not described in 'hiraid_create_send_queue'


vim +2221 drivers/scsi/hisi_raid/hiraid_main.c

  2206	
  2207	static int hiraid_create_prp_pools(struct hiraid_dev *hdev)
  2208	{
  2209		int i;
  2210		char poolname[20] = { 0 };
  2211	
  2212		hdev->prp_page_pool = dma_pool_create("prp list page", hdev->dev,
  2213						PAGE_SIZE, PAGE_SIZE, 0);
  2214	
  2215		if (!hdev->prp_page_pool) {
  2216			dev_err(hdev->dev, "create prp_page_pool failed\n");
  2217			return -ENOMEM;
  2218		}
  2219	
  2220		for (i = 0; i < extra_pool_num; i++) {
> 2221			sprintf(poolname, "prp_list_256_%d", i);
  2222			hdev->prp_extra_pool[i] = dma_pool_create(poolname, hdev->dev,
  2223								EXTRA_POOL_SIZE,
  2224								EXTRA_POOL_SIZE, 0);
  2225	
  2226			if (!hdev->prp_extra_pool[i]) {
  2227				dev_err(hdev->dev, "create extra pool[%d] fail\n", i);
  2228				goto destroy_prp_extra_pool;
  2229			}
  2230		}
  2231	
  2232		return 0;
  2233	
  2234	destroy_prp_extra_pool:
  2235		while (i > 0)
  2236			dma_pool_destroy(hdev->prp_extra_pool[--i]);
  2237		dma_pool_destroy(hdev->prp_page_pool);
  2238	
  2239		return -ENOMEM;
  2240	}
  2241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
