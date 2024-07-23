Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6713C90E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721761373; cv=none; b=bqwHJ1QGcqBIQRy/SkmgA261ZBcuFOoI1AdyZUXziKC7RZsUsCZRy6IGFNUM7ti1yQJ0UrvZ/Dkum40ZVS1MDydnV+3BiFNtC4jl64gBcraMy03qZdH5lVDB8OPnJKbGvbJO1Insouki6eCvxgcwUQAC78HoONxxvbwnyl+cqv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721761373; c=relaxed/simple;
	bh=RHsDenMUvAxQiVL3rkM9k8N1yHlrtKvt6o1g262oUSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZk7gsLHMixizMyWxPcZhy9xmZO46B5fSHAoDilguw+vXbOm30Fd4imSckPRN+WomY75kHNBb4sFRbI71wQn+ZzLU/0p0cJ3P74gEcs7snBFx1zX0rR+J9nFxxijJmxuZ9DXexWpwMYmSM8LtBuGRrVyOYM458oflTI9VaRMijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN+Nd0/q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN+Nd0/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721761371; x=1753297371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHsDenMUvAxQiVL3rkM9k8N1yHlrtKvt6o1g262oUSY=;
  b=iN+Nd0/qKYeVE4dzNxlMpbnYFCGFwKBMoQ2fFA9JJ8eIMsp1bwwkLbh0
   xvgARu9uqjRHenasxQP5sPGNVBPfCQY17ZsNwicXp5toFpMF/ToiwSVxR
   UTNlIG5XibrUZ1L6s0t2fT4NNl9P0jPXeCDMLBPgbO4Ob6Exblb5CR1AH
   VjCgtjT0XY4iCjw7R461mNVkiprTKuPtwUNLKGuaxyhYT5aNbJ4MsIpXN
   Hs4SzEFEVAQR0VzeITS/ySw6Wm/emVnHLuRVIdSfyGKOVQcGme6ufnLMi
   qVh/iKU/Fc+xvWcFjUeZxG3So1BBRmPgoXePoR61Wn3W9PU1FJ/tia14e
   Q==;
X-CSE-ConnectionGUID: YBRFi/ADSxmTtAkKsKXA6w==
X-CSE-MsgGUID: PHtV762rSOKNTayqyZlj8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19592627"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19592627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 12:02:50 -0700
X-CSE-ConnectionGUID: 22y6zM28QJixhKde1HQRIg==
X-CSE-MsgGUID: KVGi/qcKQfGmmXutnSxAWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52935510"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jul 2024 12:02:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWKmc-000mHU-1X;
	Tue, 23 Jul 2024 19:02:46 +0000
Date: Wed, 24 Jul 2024 03:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>
Subject: fs/btrfs/delayed-ref.o: warning: objtool: add_delayed_ref+0x1ac:
 unreachable instruction
Message-ID: <202407240323.OFy29s1f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28bbe4ea686a023929d907cc168430b61094811c
commit: f75464f7bbbdd3bd63b91a1f023e26ef85e348c3 btrfs: unify the btrfs_add_delayed_*_ref helpers into one helper
date:   3 months ago
config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240724/202407240323.OFy29s1f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240323.OFy29s1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240323.OFy29s1f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/delayed-ref.o: warning: objtool: insert_delayed_ref+0x1cc: unreachable instruction
>> fs/btrfs/delayed-ref.o: warning: objtool: add_delayed_ref+0x1ac: unreachable instruction


objdump-func vmlinux.o add_delayed_ref:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
