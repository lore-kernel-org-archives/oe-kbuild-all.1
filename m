Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F921C17D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 22:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837695; cv=none; b=u22uyunYf9IdSGfcHpJrNpMnKsyjfqLjCWVLW2gUCrKb36JFOwqm0yvoHvhZzE/pMZfyWtNiub7sZ9YPyGZ7wp079aL6Xzxc8x33QVkGJbs9jStYQtJPLe0MP6ALH0xUZwaW2oVLXI7htyGQiwrxMRUE5ilyrayyViPBXAzOucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837695; c=relaxed/simple;
	bh=OH8BEJhjvZ8aQpM7ItZh9OfaNdgHPPEz2v02kaGcCTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fmvhvx4jdFoywfmCfvhIgfpnxWGOVi34Y4bDTZh6LC18SBmu0cYQkNNx2+uzpLbvx6SaE2D8JH54up9GgaopYJX0iM8PiHJ1dYTtnQytc6QQ1lRrJtIlxMaPLuIimdVo8WLbwtjlgCMYV+k+HYoKUfT8LtsQMLPt8ScnxXCXA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+9poz5/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+9poz5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765837692; x=1797373692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OH8BEJhjvZ8aQpM7ItZh9OfaNdgHPPEz2v02kaGcCTg=;
  b=Y+9poz5/tsyHM5nYUvzUDmEYIjTB0HLunRv+5gib+/MJdymlsyT7dQIP
   wZ70QjoUMJsdJHtxonNffA6ivtpmQ1QPvO/P9y+pl7Rwi/lpvRwrPhD7P
   jZ0G1jQQzSJR2d/9GCAxd5fH1enaorgFsiIFemomcrPGUI87TAP6t2DNY
   1qUrPaEw3PFljsGj9f+BPWPsQ+60byOOvhs86gF45R/4MNFIE21OhSgAB
   jHWRxdIAE/YgTHJxHAAI+8lD5t0C63ooZVVRo9/mFmn9CSjhHSGFD6kFT
   KDUJQkUzoRQWA4uBMdGUl1Is4VdokF7nLd1grYi7Dy4E/K2egUzfLv0EM
   g==;
X-CSE-ConnectionGUID: Uy+mO5LRT9qt4c1x7gCGTQ==
X-CSE-MsgGUID: MMQIIONARGeEOhtC01XJog==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55315014"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="55315014"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 14:28:12 -0800
X-CSE-ConnectionGUID: VUlMJWuPQyG1Doq4uJXpqQ==
X-CSE-MsgGUID: Bl2gi7Z1QceMtjqUJ0GNxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197594285"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 14:28:11 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVH2z-000000000sj-4AeY;
	Mon, 15 Dec 2025 22:28:06 +0000
Date: Tue, 16 Dec 2025 06:27:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for
 'set_em_messages'
Message-ID: <202512160650.NfkLURIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 80fbcaf473f6812d841a575bc3f2690bab774dd5 [25/25] anolis: ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512160650.NfkLURIs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160650.NfkLURIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160650.NfkLURIs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^~~~~~~~~~~~~~~~~
   drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/set_em_messages +601 drivers/ata/ahci_zhaoxin_sgpio.c

   600	
 > 601	void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
   602	{
   603		void __iomem *mmio = sgpio_zhaoxin->mmio;
   604		u32 em_loc = readl(mmio + HOST_EM_LOC);
   605		u32 em_ctl = readl(mmio + HOST_EM_CTL);
   606		u8 messages;
   607	
   608		if (!get_ahci_em_messages())
   609			return;
   610	
   611		messages = (em_ctl & EM_CTRL_MSG_TYPE) >> 16;
   612	
   613		if (messages) {
   614			/* store em_loc */
   615			sgpio_zhaoxin->em_loc = ((em_loc >> 16) * 4);
   616			sgpio_zhaoxin->em_buf_sz = ((em_loc & 0xff) * 4);
   617			sgpio_zhaoxin->em_msg_type = messages;
   618		}
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
