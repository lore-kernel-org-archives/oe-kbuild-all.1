Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D615A480
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140677; cv=none; b=C1OC1kZVOgHaIBgklFk2+9TsR6WSSEg0NlvWb/4Asto31mQu7SrZqGLmHBQvV6MJTGZArnj0zNWdhjGenGnLXocsCgybsmX+ueBrwBX3FSUea/V+/h5fIh5le7HEaR+9ocyzlCxt9miO/vMCsjEfndeeFE9m0BF5Mo3WSPqdTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140677; c=relaxed/simple;
	bh=6XWK/jC1Q9raFK0OkWlNJnybTk+z/ObCbw8VW6PBcEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hCRvomR/uqHNVi05yOY00AhQb7He8IpF70G7hgel6Dfsn1J02JJJkJ+sQv5gpIwMv/OCZpxG6WkL6ZS7nrVYVad1Xd9FKBqE1sWVev+SY0ez2uCS7s2WRXA7X2KpkFny7dwTVlmwkAs2E/d0f+Isw8rOmhS0OXVRC56PdaFicw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWVO/MmO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWVO/MmO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709140675; x=1740676675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XWK/jC1Q9raFK0OkWlNJnybTk+z/ObCbw8VW6PBcEU=;
  b=eWVO/MmOypiFCy0qXKYxgaB7bDKEg06nc1CQTQPiUMxlVo7UBd5qGTBc
   QTWEVzU4hcHj+8TOvnhrlp3qUBk1j9JvBcddzgocn1n5QLE3QGWHqUJ/V
   w8WmralLflJSB7B0fIAyMuk1OGGr/kJPfg+EhRfVZqDXDp7auqq27emb4
   uceMEh/9tRkoEr3Itan69QXLUI+/BPWBbkBqlMcve9sNq1ls+9TVUF/9L
   NBMc9wuL0DMVAamEQ7MNqDMKGjqM2BkZMvPSnUfz/bMlTKCI1NT+CPs9F
   kLIJWmfAvRlcTnUAH/lP1mF+1nq7YMTrHwpPNpkxQ9EmgFK1vNeVoG+Pb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3475177"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3475177"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 09:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12070685"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2024 09:17:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfNYy-000CGa-0C;
	Wed, 28 Feb 2024 17:17:48 +0000
Date: Thu, 29 Feb 2024 01:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Helen Koike <helen.koike@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Martyn Welch <martyn.welch@collabora.com>,
	Tales Aparecida <tales.aparecida@redhat.com>
Subject: [martyn:ci-test 1/1] .gitlab-ci.yml: warning: ignored by one of the
 .gitignore files
Message-ID: <202402290152.s23WMlaw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.collabora.com/martyn/linux ci-test
head:   bee22cd8d651338f6244e3a0d8485ff1e8333027
commit: bee22cd8d651338f6244e3a0d8485ff1e8333027 [1/1] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel Testing
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240229/202402290152.s23WMlaw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290152.s23WMlaw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290152.s23WMlaw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitlab-ci.yml: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
