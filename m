Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641413FFC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711258530; cv=none; b=opKYcPtmYu6y7HcwnxJe82/5Uy01YpAnaCQbYFO71xnBqKk6gdxtj8/ywwV/FMflwH0z/ZCtHbDoH5eMcSJ1VjQ8OgZ+WuRRYyq41VJ14Z+TuU2CCI09x67RaYNyIH+lcVhjxmBZa9JTR0x7Y7lb7LcByBss4Rt0eznvDNyoanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711258530; c=relaxed/simple;
	bh=QgPt62oJRyEkxF3kqIXljme0XjzCbCdY4RX2CztNAEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sy0A7juq5jj/oXqFzI5y5RVausi2Tm8ABDHM80tT0h+nzrR3Uwj2OO8+c9ouvQxvikX15+iYtW/sbVh6U5ULEin8g8pkftBoR1Jdd16iHoT8J30kSPMAJdkOzTfEN77lA9mvcwAA33VOwiPaa/kTbVe/wmJ77aJB06QNdIA9Hic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmLI6K1d; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmLI6K1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711258529; x=1742794529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgPt62oJRyEkxF3kqIXljme0XjzCbCdY4RX2CztNAEQ=;
  b=hmLI6K1dr3V6IyT+gsRJD6+ocpqa/GoJSyH1kMzv9rMsEUEkrM2gipew
   tMK0uu5ZgNkOGEkL9fTXH0uo6B9uBoRt7P94D0tasGB8S+tLTSmtipHyH
   I6LNcg2j+/4zsQuvp022g4hBDSjwCm3q+sSabRIzTbZKZGNGKZScfUk5O
   DCoLy8xkw7+WGLEF53v4nC6drEV0ELqwfFk8PqrlPhFJsiuPLBKeT7IpJ
   +LGbVANj8HU35rTV9yBaR+ol7KOohOhJtVPO4Obdr+ITTso2+j8rXPgrx
   OL7cEGTE+eMdH60yzV9Z1fpxw8Rp0cuhrf2cF7GpwIbis3lcFsoAvhkYr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6207518"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6207518"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 22:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15187164"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2024 22:35:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roGVw-000LgN-1j;
	Sun, 24 Mar 2024 05:35:24 +0000
Date: Sun, 24 Mar 2024 13:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-limits 20/23]
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2902:19: error: too few arguments to
 function 'hisi_sas_device_configure'
Message-ID: <202403241300.yNTTK6An-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-limits
head:   d56272297e728376fca28b0998de7fe9642c6dee
commit: 1d2296d51677f5461596f2d1570fd3ed08a9470e [20/23] libata: switch to using ->device_configure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240324/202403241300.yNTTK6An-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241300.yNTTK6An-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241300.yNTTK6An-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c: In function 'device_configure_v3_hw':
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:2902:19: error: too few arguments to function 'hisi_sas_device_configure'
    2902 |         int ret = hisi_sas_device_configure(sdev);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:7:
   drivers/scsi/hisi_sas/hisi_sas.h:646:5: note: declared here
     646 | int hisi_sas_device_configure(struct scsi_device *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hisi_sas_device_configure +2902 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c

  2896	
  2897	static int device_configure_v3_hw(struct scsi_device *sdev,
  2898			struct queue_limits *lim)
  2899	{
  2900		struct Scsi_Host *shost = dev_to_shost(&sdev->sdev_gendev);
  2901		struct hisi_hba *hisi_hba = shost_priv(shost);
> 2902		int ret = hisi_sas_device_configure(sdev);
  2903		struct device *dev = hisi_hba->dev;
  2904	
  2905		if (ret)
  2906			return ret;
  2907	
  2908		if (sdev->type == TYPE_ENCLOSURE)
  2909			return 0;
  2910	
  2911		if (!device_link_add(&sdev->sdev_gendev, dev,
  2912				     DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE)) {
  2913			if (pm_runtime_enabled(dev)) {
  2914				dev_info(dev, "add device link failed, disable runtime PM for the host\n");
  2915				pm_runtime_disable(dev);
  2916			}
  2917		}
  2918	
  2919		return 0;
  2920	}
  2921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
