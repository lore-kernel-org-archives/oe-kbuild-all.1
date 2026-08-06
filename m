Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE447F783
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049454; cv=none; b=SM5AudElK31+tuJWOYt2HIf1zM3JwIeiQeLxGevMw/Wuq/3HP9xUmh+LOXxoLHY38oNUQvIAT4XMHQG90lC9gHdfhmx6QXpY22IFTLZlE8xBMZUzLu9ovpQpAL9Hzcung/yRCIfkNj51DJTlvnLLy+1BG59yIDo/mhLkbOpkkvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049454; c=relaxed/simple;
	bh=Vt1phmZkmUC+b2EstzJBmr1Vel4o8DRhGGh73ROQndg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hx1/GGfgz828LoEhC0+26UoVCA+dQTvrDrbr8Z1WP0vYImoEYE8N0PceDpK8TiIpHTIdWEl35zV6oZtGccKlHXg65x0Jm+K5LxEKNA62tZ+0V61zHBvfd7xYZwvc3lsmeo++hPXVg47MlbDmms0pkPdk9DoRtsJ4XkVNx5wb1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q20h56vj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q20h56vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786049453; x=1817585453;
  h=date:from:to:cc:subject:message-id;
  bh=Vt1phmZkmUC+b2EstzJBmr1Vel4o8DRhGGh73ROQndg=;
  b=Q20h56vjLsfxDCsYEJ1VZ2D7H5hZ5tOtlANeRSKNUfcl3GaaseNDN/ai
   5HhYsXN/mt54HLSBk8r0MyQp5ypmHeTqwSE/Q6fXCWFw8ty9sefLOChxN
   7Hp7JCmIeSkXfuyQIYYH3grYh8CsX4bJdKzCyljc4yfk6TOjSQWssP5+x
   mjM6s8rno52h1NUIMVMD19wPWAjL8KjsokFpj5/E6PdXzHI4EOAUUOHXk
   j8f55shz3I1adnVmUriKb2Y2Ovm1tTk8qkNoFtqY7O0b/DmhFX7niQBVb
   vzZMyW13GjUC68Zs9BuDQhUulSicYguZMXqflwbzbU4Dotl9yjcjp9oJ9
   Q==;
X-CSE-ConnectionGUID: yQXaiChVTVCabeO3MMqG7A==
X-CSE-MsgGUID: 8GUXgVujQZaH+I9GdCCiDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86507019"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86507019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:50:52 -0700
X-CSE-ConnectionGUID: D+wBetApRICaeFGtOfwxlw==
X-CSE-MsgGUID: QBsbamBoSV6D9V5PMAstMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="261691792"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2026 13:50:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws53A-00000000GDt-1xvq;
	Thu, 06 Aug 2026 20:50:48 +0000
Date: Fri, 07 Aug 2026 04:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:tvs 2/2] ERROR: modpost: "__bad_udelay"
 [drivers/hwmon/tvs-mpfs.ko] undefined!
Message-ID: <202608070431.bZSwkQY8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tvs
head:   228c0d765ae1ea18fe31e741b270220a496e0719
commit: 228c0d765ae1ea18fe31e741b270220a496e0719 [2/2] WIP
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608070431.bZSwkQY8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070431.bZSwkQY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608070431.bZSwkQY8-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/hwmon/tvs-mpfs.c: In function 'mpfs_tvs_probe':
>> drivers/hwmon/tvs-mpfs.c:485:1: warning: label 'bla' defined but not used [-Wunused-label]
485 | bla:
| ^~~
--
>> ERROR: modpost: "__bad_udelay" [drivers/hwmon/tvs-mpfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
