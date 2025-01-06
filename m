Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DE35973
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176696; cv=none; b=mkP6iMeiYaVowoPdVPZqSUvFStEmvinWN2pHDG/igKQ7fP8dxIv9ECw51HnFq1z7HgFiK0xrygd/QAxlU+1uwjgK6EfZfijgfBlW1DLbcop/HP0znZPhDAGqEAEU40beDTeEhIEVon47EBJYgWmSR9c40fYD91JXY2SMqMpN3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176696; c=relaxed/simple;
	bh=I2tUvdPeZzALd2MIDYqRivrmBQpDsllbbv4nweFoIK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fBgXdLYzL/hVsh/0M3F1IFPRA6iw06in0gOLhYwlVpfB9c/cFVcYervWSQz0N6Y8ZrzRkaQ/03/YSnwhJjRpe8CjOe5M18M594HBx4CkI3ju7AoP6fRcxu2BL9kIn68DOMIutIOLA/x8TvJ4hTAW+t3j7eSVzvIbjUfrHVqkjUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8IyBlXB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8IyBlXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736176695; x=1767712695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2tUvdPeZzALd2MIDYqRivrmBQpDsllbbv4nweFoIK0=;
  b=D8IyBlXBGDqAvM6T3ik9uQb6rhy9WqwbRJyjIuFCHuOfQOLJHLjYVHeo
   M0JTrYZfoZYIdsm33h1yvwLda6IPV5ZEXQb7WxwUNpVlDMzPuurqZ9lx0
   o3nvk0A8qocuCGakYHqJeqavaOci9l/Kau6+Pt2r6Rb62sbHgfWVPOmqN
   xXPVYCLrq0PEuszSI/DA05j3KuRGi5OT7b/RTvF5ScS76SYcie+ZYkyaB
   hMKu1voeOhqEAs13YxqZSzAYvaRLq+oUxFrfbJCC2gjsjvYQ4kqsp1fGV
   Dt89wz8xgkWWe2ADPY6RQa7YkEJ+pCs7TXjZ7XZvEWw3gRRXGvvtyk4dX
   Q==;
X-CSE-ConnectionGUID: eVo0sR/ESjadLaflvQsmlA==
X-CSE-MsgGUID: mELGFBiqSYi0NgbWahTCYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="23928064"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="23928064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 07:18:15 -0800
X-CSE-ConnectionGUID: AtUJ4FQMQhOT6//7ei+DUQ==
X-CSE-MsgGUID: qRdFhVJ+Qou1SDEGI3MxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125751170"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 07:18:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUorq-000Cjh-0f;
	Mon, 06 Jan 2025 15:18:10 +0000
Date: Mon, 6 Jan 2025 23:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	Nilesh Javali <njavali@marvell.com>
Subject: drivers/scsi/qla2xxx/qla_isr.c:3724: warning: Function parameter or
 struct member 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'
Message-ID: <202501062332.mMT0MRFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d89551994a430b50c4fffcb1e617a057fa76e20
commit: c019cd656e717349ff22d0c41d6fbfc773f48c52 scsi: qla2xxx: edif: Fix dropped IKE message
date:   2 years, 6 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250106/202501062332.mMT0MRFg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062332.mMT0MRFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062332.mMT0MRFg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_isr.c:3724: warning: Function parameter or struct member 'rsp_q_in' not described in 'qla_chk_cont_iocb_avail'


vim +3724 drivers/scsi/qla2xxx/qla_isr.c

e84067d7430107a Duane Grigsby 2017-06-21  3713  
fac2807946c10b9 Quinn Tran    2021-06-23  3714  /**
fac2807946c10b9 Quinn Tran    2021-06-23  3715   * qla_chk_cont_iocb_avail - check for all continuation iocbs are available
fac2807946c10b9 Quinn Tran    2021-06-23  3716   *   before iocb processing can start.
fac2807946c10b9 Quinn Tran    2021-06-23  3717   * @vha: host adapter pointer
fac2807946c10b9 Quinn Tran    2021-06-23  3718   * @rsp: respond queue
fac2807946c10b9 Quinn Tran    2021-06-23  3719   * @pkt: head iocb describing how many continuation iocb
fac2807946c10b9 Quinn Tran    2021-06-23  3720   * Return: 0 all iocbs has arrived, xx- all iocbs have not arrived.
fac2807946c10b9 Quinn Tran    2021-06-23  3721   */
fac2807946c10b9 Quinn Tran    2021-06-23  3722  static int qla_chk_cont_iocb_avail(struct scsi_qla_host *vha,
c019cd656e71734 Quinn Tran    2022-07-12  3723  	struct rsp_que *rsp, response_t *pkt, u32 rsp_q_in)
fac2807946c10b9 Quinn Tran    2021-06-23 @3724  {
c019cd656e71734 Quinn Tran    2022-07-12  3725  	int start_pkt_ring_index;
c019cd656e71734 Quinn Tran    2022-07-12  3726  	u32 iocb_cnt = 0;
fac2807946c10b9 Quinn Tran    2021-06-23  3727  	int rc = 0;
fac2807946c10b9 Quinn Tran    2021-06-23  3728  
fac2807946c10b9 Quinn Tran    2021-06-23  3729  	if (pkt->entry_count == 1)
fac2807946c10b9 Quinn Tran    2021-06-23  3730  		return rc;
fac2807946c10b9 Quinn Tran    2021-06-23  3731  
fac2807946c10b9 Quinn Tran    2021-06-23  3732  	/* ring_index was pre-increment. set it back to current pkt */
fac2807946c10b9 Quinn Tran    2021-06-23  3733  	if (rsp->ring_index == 0)
fac2807946c10b9 Quinn Tran    2021-06-23  3734  		start_pkt_ring_index = rsp->length - 1;
fac2807946c10b9 Quinn Tran    2021-06-23  3735  	else
fac2807946c10b9 Quinn Tran    2021-06-23  3736  		start_pkt_ring_index = rsp->ring_index - 1;
fac2807946c10b9 Quinn Tran    2021-06-23  3737  
c019cd656e71734 Quinn Tran    2022-07-12  3738  	if (rsp_q_in < start_pkt_ring_index)
c019cd656e71734 Quinn Tran    2022-07-12  3739  		/* q in ptr is wrapped */
c019cd656e71734 Quinn Tran    2022-07-12  3740  		iocb_cnt = rsp->length - start_pkt_ring_index + rsp_q_in;
fac2807946c10b9 Quinn Tran    2021-06-23  3741  	else
c019cd656e71734 Quinn Tran    2022-07-12  3742  		iocb_cnt = rsp_q_in - start_pkt_ring_index;
fac2807946c10b9 Quinn Tran    2021-06-23  3743  
c019cd656e71734 Quinn Tran    2022-07-12  3744  	if (iocb_cnt < pkt->entry_count)
fac2807946c10b9 Quinn Tran    2021-06-23  3745  		rc = -EIO;
fac2807946c10b9 Quinn Tran    2021-06-23  3746  
c019cd656e71734 Quinn Tran    2022-07-12  3747  	ql_dbg(ql_dbg_init, vha, 0x5091,
c019cd656e71734 Quinn Tran    2022-07-12  3748  	       "%s - ring %p pkt %p entry count %d iocb_cnt %d rsp_q_in %d rc %d\n",
c019cd656e71734 Quinn Tran    2022-07-12  3749  	       __func__, rsp->ring, pkt, pkt->entry_count, iocb_cnt, rsp_q_in, rc);
fac2807946c10b9 Quinn Tran    2021-06-23  3750  
fac2807946c10b9 Quinn Tran    2021-06-23  3751  	return rc;
fac2807946c10b9 Quinn Tran    2021-06-23  3752  }
fac2807946c10b9 Quinn Tran    2021-06-23  3753  

:::::: The code at line 3724 was first introduced by commit
:::::: fac2807946c10b9a509b9c348afd442fa823c5f7 scsi: qla2xxx: edif: Add extraction of auth_els from the wire

:::::: TO: Quinn Tran <qutran@marvell.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
