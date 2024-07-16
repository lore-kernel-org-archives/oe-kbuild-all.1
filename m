Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27EAD2E5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 03:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721100147; cv=none; b=cqUk7N1QkZbMcOkekfJ75zbhWDz6CWe2MSjLZ2LLrxMNwIAi5QzNn7kCSAuaJQdyiOkVxpHM/3GRcLwuB+rDZ0mvSkM26iXdPtdgl3QSG6kIqL5BlBm/dgiXG6jDzVM9x63u5VJdHnkEyhCimOJ33F834t4K42RP3lZ3c9+u8ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721100147; c=relaxed/simple;
	bh=6CxnONqXx8MEHh8xsDm7vwy4l7hv8ABNoqWuzhbsrtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPYZ7xwPNLC3Dj2DXNvjA7NwV8jNazjmvO+hz87U90iP6aUWLkys5swR5wSD7f/uVauILwtvyqcQKQkUmm6V8hlcD5Xv88qfOIvZsGMc0tAeMdFMDKZnZt5a5h4rZFm3MIv7bODQz6L891YR0/+1GlaAkrhuCWNOEWzGC0dnEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArBMpz9J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArBMpz9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721100146; x=1752636146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6CxnONqXx8MEHh8xsDm7vwy4l7hv8ABNoqWuzhbsrtQ=;
  b=ArBMpz9JYAEtJOUTxnxnTAkqs/56fXdgMUnC7UURdSrKdfDEyXtru81o
   Jbo2T/NkdiUiGcqAOqKFHITS3m08CuZTkMa8EDiBhW8SmID3m1vffJN0g
   tjijuePGH/i4GqUzUDL/wYlHe4b5bCpLD8LepiKcLQUzaOr8I8jjvZTxi
   LQKiN8zcGu28wjwGY4GL6555ZSEGSHObMt8ddupi0r0f9rYgdW5XZBk55
   5g91uctuElVoHBLoRiR0ZPsaKDz0M/xVnoVNUWr7yqk5SoqxEizsxOl14
   J5w4npZU1WqSWUL6NpYLjFVdTFXCebp76OzCRwRbF0XjrbOKS1Erypn4n
   Q==;
X-CSE-ConnectionGUID: GaidtRI2S1aP6JWmfq9UvA==
X-CSE-MsgGUID: voghLbY4SeOSaxoGduL/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="41038213"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="41038213"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 20:22:26 -0700
X-CSE-ConnectionGUID: hxLbkVyTRgCaRMZOkbVGWg==
X-CSE-MsgGUID: dGVhxJz1RH+F8argfBUAnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49785603"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2024 20:22:24 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTYlh-000erK-2H;
	Tue, 16 Jul 2024 03:22:21 +0000
Date: Tue, 16 Jul 2024 11:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12760/12989] WARNING: modpost: vmlinux: section
 mismatch in reference: map_kfence_pool+0x7c (section: .text) ->
 create_physical_mapping.constprop.0 (section: .init.text)
Message-ID: <202407161144.468gBK3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91e3b24eb7d297d9d99030800ed96944b8652eaf
commit: 4a3d9bcd897bc747972e8da0368eee57f0245019 [12760/12989] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
config: powerpc64-randconfig-r012-20220611 (https://download.01.org/0day-ci/archive/20240716/202407161144.468gBK3c-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161144.468gBK3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161144.468gBK3c-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: map_kfence_pool+0x7c (section: .text) -> create_physical_mapping.constprop.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
