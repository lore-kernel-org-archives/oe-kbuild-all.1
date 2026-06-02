Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7365227BB5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780427784; cv=none; b=qao/IViSgNBUtKPiXdTIvR6flYPMtXKMB6qiOjzEtPOH7cDOO3i6EbGi19wtwJp22CSISvrJ8yVMMzoxpxQg+GjuKnbtTy4UfN5U/G6LnfVYFmopQ1JTqfVdowSH7liwZClJ/hrwHDc+U4p2igCJ8fsiVZYM6G2UW6YXKI6DMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780427784; c=relaxed/simple;
	bh=TA4sRMQIFXvjziTHBy/XrNgccguhUzqUft/3BfZkzG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gxsOyOpLL6HHeZRibJtmFSwl70UYtUxsiY3sL1REp3eNf570sd0okTu9b6RJYpwNx9/ls+mBTvdbYqJa54jIl4CKTuqF9UpmHznSNFFgZBgYUSaPA6x12Nz84LLMm8DkcvMMWgJ1zHTq1M1iZXBNZm8Rg3maT1sLp5tjTQldGXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M25uqSJv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M25uqSJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780427783; x=1811963783;
  h=date:from:to:cc:subject:message-id;
  bh=TA4sRMQIFXvjziTHBy/XrNgccguhUzqUft/3BfZkzG4=;
  b=M25uqSJv2Yl5bOM9PDyJKfqGS4xiaHjCxMkBKqAOi8NLZCH91GQDTFXo
   1NeNGq4pp7AJVTMwJWQGv7PMVa4/KVC/38zoRFaV2rhJh5NjVcAmRgTxS
   KxgrISwhBE/wqURc8vD7txvYuPDWHvsmeX9OwK2RbrTUXUAYMkjCzjGxA
   qLJ7f5nQ//1Nyymty7zbiXFdBq2s3EjLuNp5RCpHpBXrRJj8KAm8IbZK3
   WVBgxF1j8r99KWHOLiQ/PGUP/uxXkvQXhudkomrWUz43Fd468M4TTFTIa
   00YUp2Wl4H/6pKuni+1lpPB51EnuHlFicD3zHx+66kGjfNPzOHfPDG6nP
   g==;
X-CSE-ConnectionGUID: gLOJZj5pQAy4cthvVvkx/w==
X-CSE-MsgGUID: zU9fW1j7T6iXn1wCrbnHOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="84851279"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="84851279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 12:16:21 -0700
X-CSE-ConnectionGUID: WvTkVCihTxCJpLIfz/t4Dw==
X-CSE-MsgGUID: D6iq8WuURXe1jr9QqJZnaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239829166"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 12:16:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUUb3-00000000CR8-0zQV;
	Tue, 02 Jun 2026 19:16:17 +0000
Date: Wed, 03 Jun 2026 03:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-s390@vger.kernel.org,
 Steffen Eiden <seiden@linux.ibm.com>
Subject: [kvms390:sae 1/53] Warning: drivers/vfio/vfio_main.c:1547
 function parameter 'kvm_module' not described in 'vfio_file_set_kvm'
Message-ID: <202606030332.VEwXvAer-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae
head:   f33dbafc8623f6c22ac90428a03f29019940b157
commit: 412a531e0fe32aad575353cda4214518278508d1 [1/53] VFIO: take reference to the KVM module
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030332.VEwXvAer-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030332.VEwXvAer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030332.VEwXvAer-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/vfio/vfio_main.c:1547 function parameter 'kvm_module' not described in 'vfio_file_set_kvm'
>> Warning: drivers/vfio/vfio_main.c:1547 function parameter 'kvm_module' not described in 'vfio_file_set_kvm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
