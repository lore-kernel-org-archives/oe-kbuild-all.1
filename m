Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4013A863
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 05:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731907329; cv=none; b=Uwp+W8bIBz8YiYO67DfpSGMuG5jnlQoF1S04q9E5rL1YdfQKX7YEsCjFNyfDYqDKwWAq0u51WRJz+vgVpzqzzxIeNLU3O4L4ybG3YqucWU/jwifjz7MfUwEfQ0swurDYcpxBdyT9U3N41m+kNz31PBhB8KfgH+D70lw9Utzooeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731907329; c=relaxed/simple;
	bh=CmXBnXj8+uhXByW9KO8oUPahNJ1MTBS6EmbkyLTjmcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UecpATuP+eEOgdeVUOg9SUxj51Gs4xnq3AqWM67ndU8K4qsoSCTjxNcu7pmjiCZLQEt4TXW7wy7Gr8PtDQzJqobjBAqJrcryZaNdoeF1kplrFoDUqwxSAhzq72D/K/wYycTbpz/dkgzbpRkSsTOCbcO59PqqrkWRcQO0zfP7RHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBgcRW/n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBgcRW/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731907328; x=1763443328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmXBnXj8+uhXByW9KO8oUPahNJ1MTBS6EmbkyLTjmcQ=;
  b=EBgcRW/nNj80x50M1z67nKYVmJ9UMzeH3mLqu832a5bvMZ4yKfXw1Cia
   A4opfS7zAn2Y9RxNMYV5X/mlzmaNrWKy8rMqYDS4pnMEozxvHdK14/gNm
   VQ9GL15FEMPRYFgGA6vvzLTxJvntVbARgmyN4hN5je7V8SBVbmiV4TP4g
   9cQjQ7Z2F5CifSg/tcnxy5qzw8I1S10G3tokGvBqbGGyrzHrNQrAI1MUr
   /z1j5Iy7gZVSAUmTQG9DGWN3HllNW2Fv+Jn85ly6ciLRKihs+E10wKVSJ
   d/BwNBK3ke+LeU3C4h0NEGFEyTwlZ96lMX/ES7eaDyI6OW5PAIyupnE0t
   w==;
X-CSE-ConnectionGUID: BWIB0I0IRLansMpar7yEXQ==
X-CSE-MsgGUID: JQZiVIscSzqEZ+RmouJkFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49283788"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="49283788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 21:22:07 -0800
X-CSE-ConnectionGUID: 50AM5ii3Rm60718z/9UAlw==
X-CSE-MsgGUID: mflG+1oBQYGV1mt3+20H7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88883776"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 21:22:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCuD5-0002HS-2f;
	Mon, 18 Nov 2024 05:22:03 +0000
Date: Mon, 18 Nov 2024 13:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 63/64] call_event.c:undefined reference
 to `__divdi3'
Message-ID: <202411181300.WBqbII8i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   2f36eeb32c6d169f6def5f26b80a769ce6e47821
commit: bfd619ae7621aeb303a461188f453034d90383d2 [63/64] rxrpc: Skip trawl of packets in tx queue for every ACK received if we can
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411181300.WBqbII8i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181300.WBqbII8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181300.WBqbII8i-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/rxrpc/call_event.o: in function `rxrpc_resend':
>> call_event.c:(.text+0x1628): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
