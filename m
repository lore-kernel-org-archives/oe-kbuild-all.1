Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7551FE45A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 04:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765773296; cv=none; b=J9hKBdxwBuzZ07OyLJrNG9p0GjxxrZ1ay1l7I1FXJXXs7SpoKC2Zdu/PCXY1HygF07Q6F949nfFGTHnvdUkVp00gvrS41ZLRFrhtB5+JULmBTh+cfwTfWkczTLORKEDHDgSExVPinFvhEdqk//DRznOFcbVfTo1WSIe4qsspELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765773296; c=relaxed/simple;
	bh=ux4smfBx1rDHFh8OqE3Wnwl+PC4+L7cgIsr/jJahsNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKZwyeHWEpWOIvvSAGbuLHnMCMQXt6aU/M0OWJ6atsfMzO5AKGEZ1Z4u+kXkW947vDztw4X3SH+dQmMT4OupPHZ64EP1wzcbn3OO2ztDFxodu8pmcunAOyJPi/kniu2cIt/TsvHU5Kw+vVhG9mL5z22D51HF6jKSIGgSWuF+TX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RygTIFEH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RygTIFEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765773295; x=1797309295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ux4smfBx1rDHFh8OqE3Wnwl+PC4+L7cgIsr/jJahsNE=;
  b=RygTIFEHgcfIEd1JCeGQyEl32UGlnFOgOl3XktziW/V9FzkzjYXM2AW7
   /7SnXbBW6vaa6UbG1zshed2TxwPTDBkWLBMkZhYhHeM0USk83hJHkkbpG
   ufvnkY0hVKa7H5W5E06HG789JQCXo7nMpLGn19JrOTA8XtuGAqGZSuFji
   DIdjY47Av9E2KYNIUUGp0nnfhKtu1XZFI2iyjgOWwIkSTjmRfVCpwNMhb
   XoX3oxw7+FMewZooA5PvMqs921AnGTbM8SKYgERjcWik9C+gBLrnukgkK
   BOUdT692+X+F33OijdNVe9rfbYx5IDFYHg842cpU1ardKUdsGcvXaKt5A
   A==;
X-CSE-ConnectionGUID: 5KS7Esk/TrKWh4tgrzpG/Q==
X-CSE-MsgGUID: m/vRJ6+PRTeYkffLFN6PgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78375133"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78375133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:34:54 -0800
X-CSE-ConnectionGUID: Ql28yyu6SEaM0/JHVCKzrw==
X-CSE-MsgGUID: 7Uk9RTATQmmcZ25gLey4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201808317"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2025 20:34:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0IN-000000002ZI-0kPf;
	Mon, 15 Dec 2025 04:34:51 +0000
Date: Mon, 15 Dec 2025 05:34:12 +0100
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/emt 0/9] htmldocs:
 Documentation/networking/ethtool-netlink.rst:1725: WARNING: Title underline
 too short.
Message-ID: <202512150547.4KJMds5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vinicius,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 86d439801ac617ef74f9851058a3d5dbab8d27f1 [0/9] ethtool: Add support for configuring frame preemption
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150547.4KJMds5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150547.4KJMds5y-lkp@intel.com/

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
