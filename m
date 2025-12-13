Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4991A0BD6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765628862; cv=none; b=VN+abzm/GbxwHx9EUQ1YUqDeTpiAtmd1dAKY2ls9wfmXZyChuFxEplQ+W6zO3hnM40bN2qp2gxTI3Qf/JgcSYMaHP3KTGkCXmkVcNB6NVN9gLWOG4AKoxUwabGWdEFHP3GVNN2jMvOoEEHE0s2jqJZTK5nH+co8iaAs1ZB9DFc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765628862; c=relaxed/simple;
	bh=TxvapsbG30kuVela1kf/5kXVNRJJaIYsMTHv0EtZDsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsYuMbPT+1iiehf9UZVjt8B9hiWRilkhDffUauNmRHTjMJ8EUBG6JHyiq5Q7TiRHfkH453yl7aeWpOZO9JihkAOoLhm4DEa+wIz9FtcjNO0WHMiUCIjB9TFzsAZJnYSQz+wQ2X1p993r4uZQMNB4Jm+rR1tPx1a0Zd+y0iO714E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giQAbDDm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giQAbDDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765628860; x=1797164860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxvapsbG30kuVela1kf/5kXVNRJJaIYsMTHv0EtZDsI=;
  b=giQAbDDmJBAfCPHjG34v8Pki+9SzpJNeDOL0PNd5/nsYcr0zEq8E5gKo
   Z5G0V95+UFzAzDtWxTeXcLc83Nu8Xtr+uC1Hs3rtyHqGSrDvknbYRqMO5
   ldzjzUNxQUuM65arhP21HQ5K5rzzLnvfsAtx5AsA4IsmyI6jVaCkCppiQ
   CJzfn8qzdCZ+77dPiIShUV32pjc1pprC4zoSBtm0Wm0uotyrsXOxbGpRH
   dCGXUz5McMfqjNEb9L0bkkzT9Owu+ALYnml/xrr50hS3gbCaTWYJ2qzMM
   wbh+8CHKSPn0c9GEjbWhVhLYAy6pdOctl1re1KL0budc+FhCAnwjaVNH4
   Q==;
X-CSE-ConnectionGUID: LgCbhrYHSrCzW/5WL870sA==
X-CSE-MsgGUID: j9/9FQymS82Xz533z0hmVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71237396"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71237396"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:27:40 -0800
X-CSE-ConnectionGUID: jPniVBJ5S8OMBmBwWtGEFg==
X-CSE-MsgGUID: WjF+JcLTRzC3oxrReNSDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196590151"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 04:27:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUOim-000000007bp-1Op6;
	Sat, 13 Dec 2025 12:27:36 +0000
Date: Sat, 13 Dec 2025 20:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 0/11]
 drivers/ata/libahci.c:210:5: warning: no previous prototype for
 'get_ahci_em_messages'
Message-ID: <202512132010.xlnhNsMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: 80fbcaf473f6812d841a575bc3f2690bab774dd5 [0/11] anolis: ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132010.xlnhNsMl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132010.xlnhNsMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132010.xlnhNsMl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/libahci.c:210:5: warning: no previous prototype for 'get_ahci_em_messages' [-Wmissing-prototypes]
     210 | int get_ahci_em_messages(void)
         |     ^~~~~~~~~~~~~~~~~~~~
--
   drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/get_ahci_em_messages +210 drivers/ata/libahci.c

   209	
 > 210	int get_ahci_em_messages(void)
   211	{
   212		return ahci_em_messages;
   213	}
   214	EXPORT_SYMBOL_GPL(get_ahci_em_messages);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
