Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000B12EBE9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 06:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728802723; cv=none; b=GupCc4QemWZaNWomWFf0ZUWClPj/26uEprduAr/PR+XW76bf5EXTUYBoUvMHgUMn67AYuFXjtPC2zFbwjvjLJXBacwu28GW8EGFHBTGbuP6TiFp7bOamkAeD46G/Og+gkGXVIEDokN6GDLgST5LWwgN6LjiLTWhbqBa7FT5QYWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728802723; c=relaxed/simple;
	bh=kzKgqGl+8k5EVwHPhD0pMcimWB9DroUSYjZZsLaYGOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHSj0tPfVOZoRkxBwCc5t3esmQXlcPBXC3/lVT+5tg3utJH5950hunXn51smgw/pO0lHOu1lWNg+Cf3gftJP4DPrsKsgfBbx4lrD25w/jwus3P2OE2btpBp6uw4AFLWEvPsdmOsuk9/1hKafiSpzKWe8NH8K0IuAQr8vKrWOHdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyFnMcaY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyFnMcaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728802721; x=1760338721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kzKgqGl+8k5EVwHPhD0pMcimWB9DroUSYjZZsLaYGOE=;
  b=OyFnMcaYm0jsyfRoB25zf2pyWnZl2FImmr6d6b+NjhqcgujkTay9Y5kr
   9T0sQE2km7N56Iun8SJuzRbFPwVFHUG+B+zDOKzL7j8LhzxSm4EeaXYx0
   sIr2WukLvQD/64U8SlXuvcl5As0Uup/BAQkFk3BhNILL5oGimMSqGFgxt
   gXsRN4E/dAvp0XUZG/+DlX0iQkQY5eqLZEwM+2SwizeWSs+WSycpea4z7
   uinChJgC9aOzNNCP7VDIOyum1O9r2taDU6ux19IX03KW8gzFrVLP8rTyM
   mWyldBRFQ19wNz7j5JNhqadQxsjSpkw2IYxie+9g3SxPgsOBiPCAtwGWt
   Q==;
X-CSE-ConnectionGUID: 3D0CN335Q5Gzup8cToXVgA==
X-CSE-MsgGUID: OIs7OMQhRCyMryRAS5Xtbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28253316"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="28253316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 23:58:40 -0700
X-CSE-ConnectionGUID: wv7FFXLVSpOhPjV5u7QfQQ==
X-CSE-MsgGUID: wEHL3Ts1R76uVTyJ2D98Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="82290888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Oct 2024 23:58:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szsYm-000EA6-1q;
	Sun, 13 Oct 2024 06:58:36 +0000
Date: Sun, 13 Oct 2024 14:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation
 before object free at line 54.
Message-ID: <202410131412.5csjqw8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36c254515dc6592c44db77b84908358979dd6b50
commit: 35f96de04127d332a5c5e8a155d31f452f88c76d bpf: Introduce BPF token object
date:   9 months ago
config: alpha-randconfig-r054-20241012 (https://download.01.org/0day-ci/archive/20241013/202410131412.5csjqw8L-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131412.5csjqw8L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation before object free at line 54.

vim +50 kernel/bpf/token.c

    44	
    45	void bpf_token_put(struct bpf_token *token)
    46	{
    47		if (!token)
    48			return;
    49	
  > 50		if (!atomic64_dec_and_test(&token->refcnt))
    51			return;
    52	
    53		INIT_WORK(&token->work, bpf_token_put_deferred);
  > 54		schedule_work(&token->work);
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
