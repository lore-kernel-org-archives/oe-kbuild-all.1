Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417280BEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 02:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695943; cv=none; b=n83765g81pTBEfC7lSYpDTtS5xzWfLgBkMDBhC45TAdz/FTs8QQ2BnOZi5yIbCHbmn3TmxXriwAMnNnK7Fxnk70r73YwcaFbDbQfogCk7g2bqhVrGXJH18+IzY07HIddquA19CWuRM+UaT/fy6CQwt/r+sRApBVhNd+2Zac36hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695943; c=relaxed/simple;
	bh=o4kZgQvj7J1X1vQqDl0BQXF+BLsQQWVxhWLUP3ElQvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVLju8IISbAF4UhnJhrrxQo0nyXGxbY2vY7hO6bBg++hs6zOZcBLD/2dB0UU3YpQBM58ocrdfpZcyBCknfdeB9UmJbARynDj4cbNwtOiqwcthsZCnbGUWLoq0t7ELSiRCtmVIJmgDkFGcIHkGP9ushFx6Tx1VHg0OQMdtx7uweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqcF9/0R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqcF9/0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749695942; x=1781231942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4kZgQvj7J1X1vQqDl0BQXF+BLsQQWVxhWLUP3ElQvA=;
  b=QqcF9/0RMcXgzABvgiGdLYPuP9YjCYdGujElyfg13OUxJ1R3ipCFZnCN
   J+pux5QnQzFTetYFTacy4b5DL1CNm9z/I8wf8wzRbTl6zgJp8MXYwv24D
   uTz9XoUl+hyJIsaLG2i6oBtr4cEunZAJBmv5aAD3Ykg8lYst3KCzM4WS/
   Ck26upkFSB8+8Jcqn7EuwYrdAEelXJoGQurgcPTXQbVTP1BMZxUKrR1Zf
   ry//6H02a5H1f2twILHwsoNy44EcAaBFBvMG3SLKruvWTLEuQNhEwCgh6
   cEkKeiF002iK6AknfQEby9Qzyy54zqe2HcH3vixwFwNa/Pr15PSVIYwZJ
   w==;
X-CSE-ConnectionGUID: 6UFw64JrTTqPjYTScFwmaA==
X-CSE-MsgGUID: KTXMNj+NSbO7N8InVLoF9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69425102"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="69425102"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:39:01 -0700
X-CSE-ConnectionGUID: bieSMm7qQwmnU+oQiNXkjw==
X-CSE-MsgGUID: xQ8JIoWUTu6xDGdUFOVYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147248921"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2025 19:38:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPXqC-000B2M-2F;
	Thu, 12 Jun 2025 02:38:56 +0000
Date: Thu, 12 Jun 2025 10:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-rsassa-pcks1 1/1]
 include/crypto/rsassa-pkcs1.h:6:1: warning: 'static' ignored on this
 declaration
Message-ID: <202506121005.9KpGs5Kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-rsassa-pcks1
head:   4aa6bd6ed8db4e361c1afa84c1e550b9ef9ae089
commit: f89414cc24a639477622355f0f48a5b95311af8c [1/1] crypto: rsa-pkcs1pad: export rsassa_pkcs1_find_hash_prefix
config: x86_64-randconfig-003-20250612 (https://download.01.org/0day-ci/archive/20250612/202506121005.9KpGs5Kj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121005.9KpGs5Kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121005.9KpGs5Kj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/rsassa-pkcs1.c:19:
>> include/crypto/rsassa-pkcs1.h:6:1: warning: 'static' ignored on this declaration [-Wmissing-declarations]
       6 | static const struct hash_prefix {
         | ^
>> include/crypto/rsassa-pkcs1.h:6:8: warning: 'const' ignored on this declaration [-Wmissing-declarations]
       6 | static const struct hash_prefix {
         |        ^
   2 warnings generated.


vim +/static +6 include/crypto/rsassa-pkcs1.h

     5	
   > 6	static const struct hash_prefix {
     7		const char *name;
     8		const u8 *data;
     9		size_t size;
    10	};
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
