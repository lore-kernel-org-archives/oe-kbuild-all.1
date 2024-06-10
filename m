Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7213BB48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060200; cv=none; b=hXtOODniFsvWD5pfD1T3mW0bCbDCV98GmYbQ4qPqsW7NAZ8g1Hm7jmJyC7TN8uiY/s5Q5h8YCnNWesPpief79lFe2JTw25/lApVnzNixiSAjC7FZgVPzgYbiwBApHgdxtgh3L9YKRHZ1EPsaR+sdCBUX1DEZp5WyNd5oBuRf5MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060200; c=relaxed/simple;
	bh=PIO+FxGIwgijeeyTUzUPUJBuE5SZbRGlS/JrnVtDBHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=La0H83MuXWBL7DN7tKPbFtQ5WOnrZl/SCtyaXkMY1wCtLhbdPTSnho6p6LIuX5QVx5VRLDKsoaIbJNOFTp18+6wZrISJVwr9Qxwk8y2ByQvtq4AhcIShiZWd40SxEAN9stsEATxVCQaSjAi9SojeTn8uD+rBG06ZleN3b8p267g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPdsRNxW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPdsRNxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718060198; x=1749596198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIO+FxGIwgijeeyTUzUPUJBuE5SZbRGlS/JrnVtDBHs=;
  b=HPdsRNxWs4hIM8jWShQLgXiTxPCB4LPXCiCg61GLPbbgGecy4uWng3U/
   0/FLK/3gDgHZDxSIcUsV0y4XQNZH2lE3FNCayQY1oxUZFfAocecXKUIgW
   ErrfH8tWcfHd9KTicUYsHkbUBa+Lq3Z/JtyQjh9est3TjWrQ9NgyhrbFA
   ddinpbW1D1NJvomaNV29swHEkjCR02sxGRdB/4j8czNL7qdv+hSCXSlmN
   K3fY1tgWlvieIBeCc1aNfndJ2rz9+miVvGB2GDfP1kwsQ2Ao4rGbqUU4G
   LUkp8s65izMAcJapuxcg3FsE+QB6prI+sjLcl4gOCpmCV3pqUTQ4IEDHw
   Q==;
X-CSE-ConnectionGUID: BT/+tA2GQRyIo0+N7fI2hA==
X-CSE-MsgGUID: BdEhx5ByRpegDLBAKM7iCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14972835"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14972835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 15:56:37 -0700
X-CSE-ConnectionGUID: whIH6rB0QNOJOkICXsjsgg==
X-CSE-MsgGUID: suXJC0bnRLW9ziIMWx+2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44161186"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2024 15:56:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGnwI-0002Yj-0y;
	Mon, 10 Jun 2024 22:56:34 +0000
Date: Tue, 11 Jun 2024 06:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix2 39/51] kernel/signal.c:3413:21: error:
 'kernel_siginfo_t' {aka 'struct kernel_siginfo'} has no member named
 'su_sys_privptr'
Message-ID: <202406110619.f4WvUusR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix2
head:   a4a0ffeb374e0ecc63c2ed15c2dbb191ddcb0744
commit: 32c975fa86f74632844c21efea82d3b30f356c61 [39/51] signal: Add sys_private_ptr to siginfo::_sifields::_timer
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110619.f4WvUusR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110619.f4WvUusR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110619.f4WvUusR-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/signal.c: In function 'post_copy_siginfo_from_user':
>> kernel/signal.c:3413:21: error: 'kernel_siginfo_t' {aka 'struct kernel_siginfo'} has no member named 'su_sys_privptr'
    3413 |                 info->su_sys_privptr = NULL;
         |                     ^~


vim +3413 kernel/signal.c

  3402	
  3403	static int post_copy_siginfo_from_user(kernel_siginfo_t *info,
  3404					       const siginfo_t __user *from)
  3405	{
  3406		/*
  3407		 * Clear the si_sys_priv* fields for timer signals as that's the
  3408		 * indicator for rearming a posix timer. User space submitted
  3409		 * signals are not allowed to inject that.
  3410		 */
  3411		if (info->si_code == SI_TIMER) {
  3412			info->si_sys_private = 0;
> 3413			info->su_sys_privptr = NULL;
  3414		}
  3415	
  3416		if (unlikely(!known_siginfo_layout(info->si_signo, info->si_code))) {
  3417			char __user *expansion = si_expansion(from);
  3418			char buf[SI_EXPANSION_SIZE];
  3419			int i;
  3420			/*
  3421			 * An unknown si_code might need more than
  3422			 * sizeof(struct kernel_siginfo) bytes.  Verify all of the
  3423			 * extra bytes are 0.  This guarantees copy_siginfo_to_user
  3424			 * will return this data to userspace exactly.
  3425			 */
  3426			if (copy_from_user(&buf, expansion, SI_EXPANSION_SIZE))
  3427				return -EFAULT;
  3428			for (i = 0; i < SI_EXPANSION_SIZE; i++) {
  3429				if (buf[i] != 0)
  3430					return -E2BIG;
  3431			}
  3432		}
  3433		return 0;
  3434	}
  3435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
