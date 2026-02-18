Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F193019BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446911; cv=none; b=e0zR0nvkgRB5iVupy1UfZGbzlOHiG4C5gOHqwJaB9uT1GEh7WQuknObGYskbTbd6rfcXrnRCpH7JdoPOvlVirR+1nAT0CG/9armpl7BLnp7oD3MXoyq6uKhbzAAL72IM5+RtU7YpB1YfnAV033/xpYVBXE/TD7BflXHKj8ZEfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446911; c=relaxed/simple;
	bh=TFP/kqQvvY3KJNzW5hcN8ySQcmJMSWo3BXka+a+oks8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DCDJEJcyZvpYsSpd6F+srg0Z39KJS9hojYEX2ZuOgvzotfyPtXtiWzt0OVG+jY4YfPdc6Vm78IOBdjIcQlPnfpNQ/NhHz7rzLp98QjVl+U/FntblREOknZYgXk/jwUZRim6DFA+X+yoxqIc3tXOvvUumArk7zoFTfkHXLyuLqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+JQ/S2z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+JQ/S2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771446910; x=1802982910;
  h=date:from:to:cc:subject:message-id;
  bh=TFP/kqQvvY3KJNzW5hcN8ySQcmJMSWo3BXka+a+oks8=;
  b=A+JQ/S2zhKAxuIN71lYtMMVCvxx56ZxA92+zu6rK4SIlG8O35eZaEpnO
   SzxCMlF5b6ra+8OzhVGaBNW7n53GHGnEQXRtLzj/Kqaa84y9JoZ4Tselr
   cwUMoDGxWGsC2JNnLV38q25hrVVfVBT9I9M55/VfLwSfZICnuaYe+2WVM
   Y1qri0HJR75qW34fuCaubQdwKKHsiIwN5tMXb3LmtPY2QLXbaYmlUErUR
   x8BxL7J7oKco+L7Lvv7FKb5TVpzaGQ/2bOVoz628+slWiyonCE7mInXeL
   riy22v9wXuHA0fHBj1JJ2GTyCGz3HxgYpFb5h9Szbt9gC852s689nygnK
   w==;
X-CSE-ConnectionGUID: sS8hgXCyQYWs62QzudrKpQ==
X-CSE-MsgGUID: M9dUnHuISXWOvyPkMeea3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83895840"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83895840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 12:35:09 -0800
X-CSE-ConnectionGUID: hdBaHqFuSsC9LjhJ67K8qg==
X-CSE-MsgGUID: u+4G98sZQ5upiuwmztSmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218450177"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 12:35:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsoGI-000000012ia-16Cb;
	Wed, 18 Feb 2026 20:35:06 +0000
Date: Thu, 19 Feb 2026 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 20/27] Warning: mm/memory.c:5285 function
 parameter 'pteoff' not described in 'set_pte_range'
Message-ID: <202602190404.pgt9lTbB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   1903e57e83c0c0526b0ee193ce32e6aac90863af
commit: d191e9a30ff9fbc7c0c6b00033856799a4ab4f5b [20/27] mm: Update set_pte_range() to take pteoff
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602190404.pgt9lTbB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190404.pgt9lTbB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190404.pgt9lTbB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory.c:5285 function parameter 'pteoff' not described in 'set_pte_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
