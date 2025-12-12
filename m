Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0614B953
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765573353; cv=none; b=Qth46r0CvGLmxo+44vx5b3bq4rcfwXu+8Kz0h2LDlKEmKBFMF4oH1obLVqR32CMk8o8Z89SEWCPzJULjmCudPpq5OvKAdM6KUqvyweagme5XIKWPZr3Sb2KEBKIlrtC2ugrfwlr2KWPkqvIKGiPzzqie3MehyxfuPr9mfF4Unyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765573353; c=relaxed/simple;
	bh=4jG2WveBdzNGErsr4kFvnLIVqCSQ0C0cpqeQb+euNBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYIjdE+AM+jSfzL8AX+Lq/hlnt3g8DxnpQS5XSzrT6LzvRIhP+kf9vzBR+85xXo/K4L9dbwGgUoqi17QABKp3ffd0PxTxHOURZqkOUjsaqkKKwnew6Fx1hb6gF007Xf6KJa1fjyULVXBJsAkinmZGPaG1wyXlSYs+aQMW9Mx+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfhuDDA2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfhuDDA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765573352; x=1797109352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jG2WveBdzNGErsr4kFvnLIVqCSQ0C0cpqeQb+euNBQ=;
  b=EfhuDDA2m3nwdA+cnYWB+HauabgecEqO1aTDafycYT5Ka7EWcJ+bpETh
   YQTR0b4wlEN91Q22RKxD6eB5rnX5tujWIQFssQIOZRyUDVVos0Ims7x4D
   TRQy/oGPPgriXPD5AjLyDOmAzpKLDh4sVUbb8QJR3lRMK9b3miAGQHFzi
   Z4C0WSmUlnsobVzC2fNmp0pgpVFcng+xHjddwW9FYnFev+GQCzKOTlpiY
   NIbahRSOQyzqe76+d6aqxau/lYN8W2QJQOEE9b91boQ6JnTwQbqe/NZJ8
   A4BTkEbuN550oApD5f/4+Hr2+j+sg+oYvfDymFNPvZYSAPQ6Q6OPA6o1a
   Q==;
X-CSE-ConnectionGUID: +x1Cipq6QqeiwKCGGdDTug==
X-CSE-MsgGUID: p/0SojBJRcyLLPJ1h8Ue6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66571548"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="66571548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 13:02:31 -0800
X-CSE-ConnectionGUID: 4dWqHqtpQPCzpOW5W7dPkA==
X-CSE-MsgGUID: /0nt/9cSRb6JtUcEcorGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202104686"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 13:02:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUAHT-000000006cz-1oZx;
	Fri, 12 Dec 2025 21:02:27 +0000
Date: Sat, 13 Dec 2025 05:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202512130428.lGbwgxgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: c72be4b5bb7cb1a9059d0b845f87223b52399cc2 scsi: mpt3sas: Add support for MCTP Passthrough commands
date:   10 months ago
config: i386-randconfig-r123-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130428.lGbwgxgy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130428.lGbwgxgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130428.lGbwgxgy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] H2DLength @@     got int data_out_sz @@
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse:     expected restricted __le32 [usertype] H2DLength
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse:     got int data_out_sz
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] D2HLength @@     got int data_in_sz @@
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse:     expected restricted __le32 [usertype] D2HLength
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse:     got int data_in_sz
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:2862:40: sparse: sparse: Using plain integer as NULL pointer

vim +678 drivers/scsi/mpt3sas/mpt3sas_ctl.c

   657	
   658	/**
   659	 * _ctl_send_mctp_passthru_req - Send an MCTP passthru request
   660	 * @ioc: per adapter object
   661	 * @mctp_passthru_req: MPI mctp passhthru request from caller
   662	 * @psge: pointer to the H2DSGL
   663	 * @data_out_dma: DMA buffer for H2D SGL
   664	 * @data_out_sz: H2D length
   665	 * @data_in_dma: DMA buffer for D2H SGL
   666	 * @data_in_sz: D2H length
   667	 * @smid: SMID to submit the request
   668	 *
   669	 */
   670	static void
   671	_ctl_send_mctp_passthru_req(
   672		struct MPT3SAS_ADAPTER *ioc,
   673		Mpi26MctpPassthroughRequest_t *mctp_passthru_req, void *psge,
   674		dma_addr_t data_out_dma, int data_out_sz,
   675		dma_addr_t data_in_dma, int data_in_sz,
   676		u16 smid)
   677	{
 > 678		mctp_passthru_req->H2DLength = data_out_sz;
   679		mctp_passthru_req->D2HLength = data_in_sz;
   680	
   681		/* Build the H2D SGL from the data out buffer */
   682		ioc->build_sg(ioc, psge, data_out_dma, data_out_sz, 0, 0);
   683	
   684		psge += ioc->sge_size_ieee;
   685	
   686		/* Build the D2H SGL for the data in buffer */
   687		ioc->build_sg(ioc, psge, 0, 0, data_in_dma, data_in_sz);
   688	
   689		ioc->put_smid_default(ioc, smid);
   690	}
   691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
