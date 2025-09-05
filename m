Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3110E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757035153; cv=none; b=cetlZURBOyIS9WVPRKEnkbhHIcJLqBrfgOyhqfB5gYl0XMdF5iqWl9O3+VElbk/QrhpQHJdSrktVKc8j+uIFK6yxjiTZa5TL9fpIXujDJME0lab0exrdplo4S+5aJF4xvRDwr0obTm2Wp7r784fp+FiHh8smWAlbXXnzJ8oreqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757035153; c=relaxed/simple;
	bh=Y3Eqa5t2smDCA43Xxi6XK1TpNhL5CZygzm23USeG5UA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfvXTmHnHcPb26/ux/CoTsd3Mz3KoECukYebZPQFLchHavxFDJuendUT6dxrjEKV4rZCOWnyTvZ3GUDUrizcxP7gjXthjMm9Hy6vE+Lk2zHDwgHTtbkdto98vNEpZvdllBf+wz2nczXliD2QC1GAS1PwG3kjnlfvFmW+Z+n0ecA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHPlycJK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHPlycJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757035151; x=1788571151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3Eqa5t2smDCA43Xxi6XK1TpNhL5CZygzm23USeG5UA=;
  b=lHPlycJKMQb+LV8XEyAzsB2IbLM5M7Vz2YvCu4v8gwTJ3QzoyJUIX1CC
   aRLmJtJZyWhftEJPFNKn5uzuA6iWBaMpLjPt8vY10PPa8ifNBMlgKd7hn
   HBioymsNmyW/NW1TlcrnXQksmavqmysPKhlCnciBRWldOpnLeYB852ROP
   1CvKHJ8wf3di1M/oxSN/eXm7tVCdJ/BcAFZS8cftO61Q4nx8YeT7Ji5t8
   QblirCteI/vwe2Qr7JCNuBpaS8zOr3UjOj2x6ZZeuHjIXIdv4C65f5EJt
   yJLtdieXfXPr89MpHZAV4xKgC8mK4pCKJrJ27nKrCf+TP37G0Xi18eTev
   A==;
X-CSE-ConnectionGUID: HJQbNbxXRD6j+yKT2KoF1Q==
X-CSE-MsgGUID: 6VGCJ4FRRkO8492PwZSQow==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59326573"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="59326573"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 18:19:11 -0700
X-CSE-ConnectionGUID: 6appALysSVSyHSRfmHSUdw==
X-CSE-MsgGUID: msbVIFAjSDqFjW2A3R1rGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="171331695"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2025 18:19:09 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuL6P-00064h-25;
	Fri, 05 Sep 2025 01:19:02 +0000
Date: Fri, 5 Sep 2025 09:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Child <nchild@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:for-upstream-20250903-1 2/2]
 drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse: sparse: incompatible
 types in comparison expression (different base types):
Message-ID: <202509050952.SkudhLrr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20250903-1
head:   42ab16807bc676eb7d0d33ede83d44aca682abf2
commit: 42ab16807bc676eb7d0d33ede83d44aca682abf2 [2/2] IB/rdmavt: Fix lock dependency in rvt_send/recv_cq
config: x86_64-randconfig-122-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050952.SkudhLrr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050952.SkudhLrr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050952.SkudhLrr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/sw/rdmavt/qp.c:1375:17: sparse: sparse: typename in expression
   drivers/infiniband/sw/rdmavt/qp.c:1375:26: sparse: sparse: Expected ; at end of statement
   drivers/infiniband/sw/rdmavt/qp.c:1375:26: sparse: sparse: got long
   drivers/infiniband/sw/rdmavt/qp.c:1375:17: sparse: sparse: undefined identifier 'unsigned'
   drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse: sparse: undefined identifier 'flags'
>> drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse:    unsigned long *
   drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse:    bad type *
   drivers/infiniband/sw/rdmavt/qp.c:1378:17: sparse: sparse: undefined identifier 'flags'
   drivers/infiniband/sw/rdmavt/qp.c:1382:53: sparse: sparse: undefined identifier 'flags'

vim +1378 drivers/infiniband/sw/rdmavt/qp.c

  1355	
  1356	/**
  1357	 * rvt_error_qp - put a QP into the error state
  1358	 * @qp: the QP to put into the error state
  1359	 * @err: the receive completion error to signal if a RWQE is active
  1360	 * @lock_state: caller ownership representation of r and s lock
  1361	 *
  1362	 * Flushes both send and receive work queues.
  1363	 *
  1364	 * Return: true if last WQE event should be generated.
  1365	 * The QP r_lock and s_lock should be held and interrupts disabled.
  1366	 * If we are already in error state, just return.
  1367	 */
  1368	int rvt_error_qp(struct rvt_qp *qp, enum ib_wc_status err,
  1369			 enum rvt_qp_lock_state lock_state)
  1370	{
  1371		int ret;
  1372	
  1373		switch (lock_state) {
  1374		case RVT_QP_LOCK_STATE_NONE:
  1375			unsigned long flags;
  1376	
  1377			/* only case where caller may not have handled irqs */
> 1378			spin_lock_irqsave(&qp->r_lock, flags);
  1379			spin_lock(&qp->s_lock);
  1380			ret = __rvt_error_qp_locked(qp, err);
  1381			spin_unlock(&qp->s_lock);
  1382			spin_unlock_irqrestore(&qp->r_lock, flags);
  1383			break;
  1384	
  1385		case RVT_QP_LOCK_STATE_S:
  1386			/* r_lock -> s_lock ordering can be broken here iff
  1387			 * no one else is using the r_lock at the moment
  1388			 */
  1389			if (!spin_trylock(&qp->r_lock)) {
  1390				/* otherwise we must respect ordering */
  1391				spin_unlock(&qp->s_lock);
  1392				spin_lock(&qp->r_lock);
  1393				spin_lock(&qp->s_lock);
  1394			}
  1395			ret = __rvt_error_qp_locked(qp, err);
  1396			spin_unlock(&qp->r_lock);
  1397			break;
  1398	
  1399		case RVT_QP_LOCK_STATE_R:
  1400			spin_lock(&qp->s_lock);
  1401			ret = __rvt_error_qp_locked(qp, err);
  1402			spin_unlock(&qp->s_lock);
  1403			break;
  1404	
  1405		case RVT_QP_LOCK_STATE_RS:
  1406			fallthrough;
  1407		default:
  1408			ret = __rvt_error_qp_locked(qp, err);
  1409		}
  1410	
  1411		return ret;
  1412	}
  1413	EXPORT_SYMBOL(rvt_error_qp);
  1414	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
