Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50D19BA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732588166; cv=none; b=LdQAfQq0tD5cwzyU/JU1MBZwYcqPOO7uWSbLYMLs8qoGBE7lclyRdyiJDRegmr1bBtWECu/iu+1VEKBdI5xXLxzvtdmJOcdaKDvMMf3du4FaHVgAk8JkMX8o0Rywr6Ioh2N4IFsw6FfiT9YMXCYMXbJhSNVtb8GB5uUMn85mt0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732588166; c=relaxed/simple;
	bh=tDiMPEpkD9ev6/pPp0Hb5c2fIRkQ7FJBbC4zidYUHhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jdkhtfypbhhBWwMWKATgaeYr/CNtjlAJY6qZ7EhBH/e86GvoTC09l3C3BCNVvqjzz+0CT/n870BnOU8Qj5VIGITaXvjhnUV4jkagb4l34ABfucmRVhLIgaq6FvY06epWrFygNYSs81S8rGGmDZlmZ6ngs2TobV5xBFht71tqBUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVuH9bJx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVuH9bJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732588164; x=1764124164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDiMPEpkD9ev6/pPp0Hb5c2fIRkQ7FJBbC4zidYUHhs=;
  b=iVuH9bJxFSCKyrZ0MBNtzZePsyRV/7rTyXUxT1oH5UvehSGK0IYLWwwk
   QZbCvVtiTZaok2qNjYjBHyJeafnEm8vrYQMre3ZssPGfNbam/BApy07UI
   nVe0ucZ83Ckhgd+6gZ097PBhNZxkQBmq3T7Rlp7EHx1z2O7BrkNS/KoQ+
   i75Rpj81OBK0myyLeNQk2Nb0P2BWF4knBiMD7+C/QFODav+ZiRdGYgHtl
   BKWv4kwlwzsUuH9q4RYgnvjrLIzmxsN1UFcvC7268AdznNaE5/cLMixfT
   9FSTiTL65xYKdC2lxSX3IHMFAplWZ1pEEOHP8V6QW535yXEtQyi13EmQm
   A==;
X-CSE-ConnectionGUID: 0OjWjKimRfSEenVJ7X3+OA==
X-CSE-MsgGUID: n0983Kd8QDW+JCkFl8RUMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32581662"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32581662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 18:29:24 -0800
X-CSE-ConnectionGUID: XEGxC3jUQdKHRiF5wphiyw==
X-CSE-MsgGUID: WknxWgmOQkq/+9oiVG+GaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="128976962"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2024 18:29:23 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFlKK-0006zZ-3B;
	Tue, 26 Nov 2024 02:29:20 +0000
Date: Tue, 26 Nov 2024 10:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7]
 drivers/platform/x86/intel/intel_vsec.o: warning: objtool: __jump_table+0x8:
 can't find key sym
Message-ID: <202411261019.yN1r9GeH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   e876185909a78808ab603ad2dcc7e2e09a67bc25
commit: e876185909a78808ab603ad2dcc7e2e09a67bc25 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241126/202411261019.yN1r9GeH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261019.yN1r9GeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261019.yN1r9GeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/intel_vsec.o: warning: objtool: __jump_table+0x8: can't find key sym

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
