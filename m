Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E53101B8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772994115; cv=none; b=VhNcaKPNdXhKI4HZWkcNq+JFvGgHYKaDNPuq+Ad6TrHEQWVwwW7Bdu5UGWDI3qBYDR5IyuLvqcghyhbmJk9Ku7C/r9y5eNmJ4cedctVIa5KbiXcAYxoGZZo6lLhQVpUdW6Bcg5E/BMDpb/h1pm6YUwhvv8Z2pDV2zpERxnNbyB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772994115; c=relaxed/simple;
	bh=TTYWwAu254Vb/CSxWwQKYG+qkb+GMbTzWPafe1a7VNw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f28urr2LZ5BNf+Cm+gDOkkk1HtefI+jzFKMA1z/r1AeMQZm5/CnEY9B2SByPwQ6ITDGVIEmeZ467VHGf2EPmL2vJxEWn79n9Ba6d/fCU48bO7wVH+X//Zw78cB9sCXhMuhy5fucY57OIuLhLJHUfQB/r2ZGrsC9GiaqtMMnx/gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2ibJL+1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2ibJL+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772994114; x=1804530114;
  h=date:from:to:cc:subject:message-id;
  bh=TTYWwAu254Vb/CSxWwQKYG+qkb+GMbTzWPafe1a7VNw=;
  b=X2ibJL+1k3Kq50vOwIeP/5y1qDqscjgUglmgCOSGPJHnJcFU6WC7Pl4P
   qIXcRk9XOx4mjieUjOBAAUz1XzhUYukBU9871WYcLHAXxPSJ/othzjZVS
   mgGAmNd982etYo0UxOfpnqul6hsVXsZ8KUbLY3s2/le5cZwqe6Sh5MVbo
   B7URgC641+30X7ntEHJ8xisSEQqN6Ly/bocqUSd2Jx7H18vDme8tARi7v
   Imx+IZsi/i96SPjIW6QkwTjF5v0q2wgwDWV5QB6VMM7IA2QIXoSR+AJsZ
   pN8cOUH89Cx0gcZcRDJv1TzS61YYzsiicIQZ3vgzIUCgByQefaISqD8D5
   Q==;
X-CSE-ConnectionGUID: i0IgNUQ+QtqpBbJ2qryQ1Q==
X-CSE-MsgGUID: Bn5XXIFDT1WB2X91NmebqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73930895"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73930895"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 11:21:54 -0700
X-CSE-ConnectionGUID: pCYeHHIaRjWNtQL2SpNHZQ==
X-CSE-MsgGUID: FidhJ1dNSzOSqcGIEq5bqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216536973"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2026 11:21:52 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzIlB-000000003Jy-3X2r;
	Sun, 08 Mar 2026 18:21:49 +0000
Date: Mon, 09 Mar 2026 02:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 7/27] ERROR: modpost: "__udivdi3"
 [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202603090226.lT7r6IjX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ff7762c0ad6f444f352985132aa4ad5c8f02cda5
commit: 051eb168fb764a72a86dcbacc929903cdf54e7a7 [7/27] bcachefs: fallocate: use partial disk reservations
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260309/202603090226.lT7r6IjX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603090226.lT7r6IjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603090226.lT7r6IjX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
