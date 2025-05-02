Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906DD22C35C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180470; cv=none; b=iPyY7+KskmlULRQzc/Ga8rILDBgmeYf4iAjbrn+1j5S7g7zkt736GI9ZcVRgyyj6g0GEYZrAT8FywM8dr0102OmhCg8V7UMkfYYkb0hQqda1Wp0JkzkvZrejMZNe06uQGaXu6dIoUQ7PRC0/hYk42ERx724vZgyF1qWBmvjVR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180470; c=relaxed/simple;
	bh=4MuF8dR6VBa8EbL6mFdNPtnSPOyXvax/W1ted+qbnYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7g2pL+MsD+UABc4sYeEKiBLOXkcTn//sDFm1EAcMK+HH0bzZRmazBGZUbcDT4nmIu6sDRhLK8DXrpgg0HgpIqLmKqf6iAhGz3o61hgv3nz2zAlR9gWW55UktdLPME1PxseOyCCHGKZOUih9oiAkg7ueLO3C03c+5hxwKaovXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzwcXQM4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzwcXQM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746180468; x=1777716468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4MuF8dR6VBa8EbL6mFdNPtnSPOyXvax/W1ted+qbnYA=;
  b=RzwcXQM4T9+7dZv10Q5MJL31BAswdVHzCBNDOr3jNV+3G+O5Nx+c7PEj
   yFJv2TPhOgYvderJl13JyEEkEixugvXdbpdB0mqPSsc6KgUijkDOyCxK4
   IYcUGcCtskdYCo2CBpB7SAFsu0cABPuUvVZ8lZ6usaZxFZKtkQBmY6M2+
   5evYNwPJtNSE1Adox95VBy9wJHcGW06IhLAV2r6prRY7yAR84y/cqi+vc
   9nBKsPBQW188dVTeJfWkOK91HdKdvPlhJyQmOWmw3UZlRUWSGNo96Qi5B
   Arg75OhvS41IUmPYi9qOD6y9OJhVlCBZriUFXIGYPdSAvwoZI9EYcdUi7
   A==;
X-CSE-ConnectionGUID: 0Bo0gM9dS6yVFwL8bstNrQ==
X-CSE-MsgGUID: fVYW5uv3QPSLSdAEy2nEPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47119322"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47119322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 03:07:47 -0700
X-CSE-ConnectionGUID: JyyUTrVkQPaQQCkqNX2uVQ==
X-CSE-MsgGUID: dcALkghfQaGrA6roh9j6WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135131131"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2025 03:07:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAnJ2-0004fv-1u;
	Fri, 02 May 2025 10:07:44 +0000
Date: Fri, 2 May 2025 18:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] ld.lld: error: undefined symbol:
 sk_msg_alloc
Message-ID: <202505021845.WkxnVSOV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wei,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: e9ce37bbceb2779c0015fcac54cc8df7a2ec8b76 [2882/2882] tcp_comp: implement sendmsg for tcp compression
config: x86_64-randconfig-102-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021845.WkxnVSOV-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021845.WkxnVSOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021845.WkxnVSOV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sk_msg_alloc
   >>> referenced by tcp_comp.c:148 (net/ipv4/tcp_comp.c:148)
   >>>               ipv4/tcp_comp.o:(tcp_comp_sendmsg) in archive net/built-in.a
--
>> ld.lld: error: undefined symbol: sk_msg_trim
   >>> referenced by tcp_comp.c:236 (net/ipv4/tcp_comp.c:236)
   >>>               ipv4/tcp_comp.o:(tcp_comp_sendmsg) in archive net/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
