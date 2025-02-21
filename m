Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792EA205514
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149665; cv=none; b=Ah3F12kln+MScHYmFERNcEJk9bYUYwKWeZIJDCUtB56SvUUbnfaFgeapTxxxCo2/dGEZWR/RuN7JRXEK17bHfNa4k3ZdqUoNFU5qYbXCJswT9hGiw0LwpheDkB7aszgQ+WG0Lwswy3RYJTC7Wdm0QP5uUK/S+1GSgRc6qeChBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149665; c=relaxed/simple;
	bh=+Rw0Gi2FDtzl3Gv2Z1ddChZhnU6r87VVmpkvHDOJVU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tR3CUdaKa/Z4ABNEWcsldUrKeHUkU0i2AfjPx+mw3haJhpZQXs/LsUUEjHktKqo2D0a9loFkCTG2vHSmh5YB3CfJkCIbaVKWafrOBq8pMg4ayncGBXr+zAx83b8iOHNTkS/nxveTF8lnpF/qtsPjJbNwIux49mHYQ9jQhIXYhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyaIFBej; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyaIFBej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740149664; x=1771685664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Rw0Gi2FDtzl3Gv2Z1ddChZhnU6r87VVmpkvHDOJVU0=;
  b=XyaIFBejz0wnA3mP3ZM6lFfp+bncFqsNtfD98bzYCGpsYbOelYNkVzdn
   rP4TMYvYvDc5eSWjxJVN/hij/+Xz3uYgmGs68pWFLLeV80kBdHlCeW3le
   LjZT7TxXLjaGPL0UT1r0frMrBl9Qg3bFGjmOn7XXNta/dVlK2YJlX2De4
   5bFKrEo+Sx+HUvST9JqnrfG+UXcof0sC0ODmg1JhHgYQwxv9Ct2t9bZu3
   Ac3UlT1cknF8K1RaitAUni0wIIDVy43jnG0K7T73HgCpo4fihS/UyegBc
   PkRMLydyJc2H6kHGSkkX0kAk4bNwtpyP8Uq+Kn5Im7dyQGyYuuwoBUV0V
   Q==;
X-CSE-ConnectionGUID: DTC7Q/8qQuasbFl6W2/5fw==
X-CSE-MsgGUID: UO2UYHugSz+9FGP4WERk9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41093512"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41093512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 06:54:23 -0800
X-CSE-ConnectionGUID: TyKSZKzDSsKGxNYn6vcJ4A==
X-CSE-MsgGUID: mMgD1pyZSSiHU2c1ofMyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="116025184"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Feb 2025 06:54:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlUPz-0005dT-0w;
	Fri, 21 Feb 2025 14:54:19 +0000
Date: Fri, 21 Feb 2025 22:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: [linux-next:master 5453/5524]
 drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202502212253.oIgoXdQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: c72be4b5bb7cb1a9059d0b845f87223b52399cc2 [5453/5524] scsi: mpt3sas: Add support for MCTP Passthrough commands
config: x86_64-randconfig-r113-20250221 (https://download.01.org/0day-ci/archive/20250221/202502212253.oIgoXdQa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212253.oIgoXdQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212253.oIgoXdQa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] H2DLength @@     got int data_out_sz @@
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse:     expected restricted __le32 [usertype] H2DLength
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:678:38: sparse:     got int data_out_sz
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] D2HLength @@     got int data_in_sz @@
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse:     expected restricted __le32 [usertype] D2HLength
   drivers/scsi/mpt3sas/mpt3sas_ctl.c:679:38: sparse:     got int data_in_sz
>> drivers/scsi/mpt3sas/mpt3sas_ctl.c:2862:40: sparse: sparse: Using plain integer as NULL pointer

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
 > 679		mctp_passthru_req->D2HLength = data_in_sz;
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
