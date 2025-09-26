Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120551E489
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894051; cv=none; b=FxQA+00EYmwqfjfdS9UDkq4EUGLyCH5P+ZC+Udo/0gOZNj0t4mNHAQkTs1PX9M8SbFIhpjPkgMleamJJUxPlyVrGnETZqn4JMihcvceY3nzw3tdiR6ofsQFOkTczdjqzrZCN4gUPcoP+Nc/Ox+/hYoNO16dssiDM2QMFy5EILCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894051; c=relaxed/simple;
	bh=b3I+XW1LzjCCV8USsgM5r5jnfu+FMAjzole6QqlKbJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TlZtL3kUHx4bwtpH3we/fQy73J2kkGWnifmIGRn1YJTDc/x7mhC2Hvr4CWRPbUdQveZfYt8/NGQmIgpBVi6R3+6sP82oR29eOK/oIpc5utRwN5rO7JcqaBSwdpoCpoOE3pCD50dTX5FrYvQzjtN4V58gncEExmjV/Dr4JDtShrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0s7LlVo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0s7LlVo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758894050; x=1790430050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3I+XW1LzjCCV8USsgM5r5jnfu+FMAjzole6QqlKbJ8=;
  b=a0s7LlVomtwLJxSlOz5ufLSa+oevoyY8WaRe6QWRC9z7593bLhP0hMbK
   9bQp/kq5NsZdD9mT1fF83xyglQMPxfhqijoblbUddrhYNBHF48IFrff9A
   bigLHAnXHV/Cac38JMNmNU2q86O5MDYyM8r0WFK2itKX9S+FHKM2mCO/y
   wjO2CzS95fvfkal/KU6hDZAveiIa1itUM7IZeanVh7KcrJk+wARGNjiGr
   QrUmx+9aFS1C4SsxKHIxHwJp/TDhKVVuE6duCW0OMHh1OCYzlli6M7TA8
   5k6bTY1BfLzTimBuwsD74ohw1+VPudqzAmSAMtCQQfqygyb9Nhs3jf/jF
   g==;
X-CSE-ConnectionGUID: +DSc7IRfQiOjqHA9oJHE7Q==
X-CSE-MsgGUID: evRfSo3GRrqkhjQze27gMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72660044"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="72660044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 06:40:50 -0700
X-CSE-ConnectionGUID: tuRd1jteSoyZjgMkAPzSaw==
X-CSE-MsgGUID: LNYt5PM6Q82XfwRi+rGbzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177176749"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 06:40:49 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v28go-000000005FF-14QP;
	Fri, 26 Sep 2025 13:40:46 +0000
Date: Fri, 26 Sep 2025 15:40:31 +0200
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kishor408 <kishorx.buchi@intel.com>
Subject: [intel-lts:6.12/linux 0/3] htmldocs:
 Documentation/networking/ethtool-netlink.rst:1725: WARNING: Title underline
 too short.
Message-ID: <202509261516.ehDcqi8D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   140444823a5e75b687391abcd563af8d068c931f
commit: 86d439801ac617ef74f9851058a3d5dbab8d27f1 [0/3] ethtool: Add support for configuring frame preemption
reproduce: (https://download.01.org/0day-ci/archive/20250926/202509261516.ehDcqi8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261516.ehDcqi8D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem-internal.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/migrate.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_pause_stats ./include/linux/ethtool.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function ethtool_fec_stats ./include/linux/ethtool.h' failed with return code 1
>> Documentation/networking/ethtool-netlink.rst:1725: WARNING: Title underline too short.
--
   Sets transceiver module parameters.
   ======= [docutils]
>> Documentation/networking/ethtool-netlink.rst:1725: WARNING: Title underline too short.


vim +1725 Documentation/networking/ethtool-netlink.rst

  1723	
  1724	Sets transceiver module parameters.
> 1725	=======
  1726	  ``ETHTOOL_A_PREEMPT_HEADER``            nested  reply header
  1727	  ``ETHTOOL_A_PREEMPT_ENABLED``           bool    frame preemption enabled
  1728	  ``ETHTOOL_A_PREEMPT_PREEMPTIBLE_MASK``  bitset  preemptible queue mask
  1729	  ``ETHTOOL_A_PREEMPT_ADD_FRAG_SIZE``     u32     Min additional frag size
  1730	  ======================================  ======  ==========================
  1731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
