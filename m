Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C633C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721782621; cv=none; b=d/qcDwcKL22oMDoR1mO0sbOzlR++JuEaLL3f4cFUnarPYNbZlkCF2AzR+PUTFIbCDnZkKag8FbTK3IrhETFr5GuPNWYlXVrU0LeNfAoZxEm0hGuoEkG7xDXMtMs6MYX3fGAnzBTyc4Zu5A9tuBilOy5iVVdKTZIxWwmqa1KcZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721782621; c=relaxed/simple;
	bh=l2GwPdv7X5GsJVoTR+K0x66sBo/f2oVbtOLNeCB43VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZO/6lJj7JgbUw4hi/pkqX/CNMnYZeU1no0SBA2iUNjl0p45Q9Ch0N76Rbk1TyFk5n65ug6jzGROcRd++wWqn5tr9vEqTclkWCWomYOO0OsphUk2hx2DY8P9+XYSeQsW8p3A2jKJk1Rz1Y6iprB1FHBATPF3JGuLacyZVNNmULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqftNiRM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqftNiRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721782620; x=1753318620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2GwPdv7X5GsJVoTR+K0x66sBo/f2oVbtOLNeCB43VA=;
  b=NqftNiRM4Qe0AcaqMdg/8beYanFMAJYVc9aUSwzvw6n1g2nyEWFirwuZ
   S5RCikGg6GXFWIyEr20/LWOOZc0uWcbjEutTnVnwx8vnqeLSWPgS5dUZT
   vK49t3kCntY3xhGt01Hvip9xSqkg4Va/HqonycKu7PM/zcShyjcIkkUBe
   wzs7gIAX4Xf7OEJOmS+2xapfd+954Kzq2mgJbQflJj/R2lqu3/3wvYDke
   JkVhykZumREzbxBY9VjASiVFImipaA6iOxEW6ML0aVatFnszZ9o3uHNri
   VgMG+HinZbe73cKyJtxCB2b+aJ61M800HzGbznwRaNOaLHCTvQpDIRA1B
   g==;
X-CSE-ConnectionGUID: NbjBtgWySxC/rCJkzEOgzA==
X-CSE-MsgGUID: 21f0bjrUQ5mmsxQ0RHiNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19243806"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19243806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 17:56:59 -0700
X-CSE-ConnectionGUID: zoXRsZPDSOSLGujx9LfCaA==
X-CSE-MsgGUID: F3jC3tKUSMW3z+Hs2phywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56712372"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jul 2024 17:56:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWQJL-000mVU-13;
	Wed, 24 Jul 2024 00:56:55 +0000
Date: Wed, 24 Jul 2024 08:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jan Kara <jack@suse.cz>
Subject: fs/reiserfs/inode.o: warning: objtool: reiserfs_write_folio+0x394:
 unreachable instruction
Message-ID: <202407240856.rcNo0xl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ad7ff8738b8bd238ca899df08badb1f61bcc39e
commit: 4f8cf60ac18bee62e8c58654a300eb44b96caf09 reiserfs: Convert to writepages
date:   3 months ago
config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240724/202407240856.rcNo0xl1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240856.rcNo0xl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240856.rcNo0xl1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/reiserfs/inode.o: warning: objtool: restart_transaction+0x38: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: reiserfs_write_begin+0x90: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: __reiserfs_write_begin+0x88: unreachable instruction
>> fs/reiserfs/inode.o: warning: objtool: reiserfs_write_folio+0x394: unreachable instruction
   fs/reiserfs/inode.o: warning: objtool: reiserfs_new_inode+0x8c: unreachable instruction


objdump-func vmlinux.o reiserfs_write_folio:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
