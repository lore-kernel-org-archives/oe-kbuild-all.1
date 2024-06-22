Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177E4F1E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719042941; cv=none; b=tESI9kstm2KY7ewWp4GRObQZWRd4dzbik099uaK4OZ60/SEgU2rLc3l3QIzA4bHPdTN9YwxBFXPw7OUhSfgrxbFTH2DWlSt0V/F0gM+1bL8HMmkbxMkq5MeJKwJ70c8TQ7sML5xmepl8u9U++eWyvqu7Is8QhzJNl7OWHs2JLnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719042941; c=relaxed/simple;
	bh=yjKB7c00E/aRDtCS8vXuQsWr5kHWvtVNluwvcInDMJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CchPFVpDOZglhNhd1BQ03NpWG9MqSt+yQntPZCk9p01asjbmw1RgbVYqA7v+Lfgq+Z0bKETJImuLs+7xfTgNScugwChV17jZUbSxOhDu9iJWut6ZsYlHq1EAF+QbdEok2AhCmzbseFZ8fHroOtM5ogFdx2zVmPRJCQPEKhsE5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KU7UAZuV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KU7UAZuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719042939; x=1750578939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjKB7c00E/aRDtCS8vXuQsWr5kHWvtVNluwvcInDMJA=;
  b=KU7UAZuVddM8zWqRJ0dP79yHHIn+ClkfU4pEhiouc0Bb+UU+cxEMdQaN
   B54b5sGjIPFmM7pOjx54uX49CtGODeVdJIGtRVq8OlMRVeECrLB1YrtVv
   AgwMT21ysR5tXx7XNDeEvRW7zL6FhwjrH4RvpWBnlE2BnLLUFKmW5by18
   oBK5ggXQ3DJrjuOjIcfHhXFxpTx9L/Y9OtF1JQHvqW7EgJm3t699chQ+G
   VPmuIYlkfJeWCTULJ4HXlzyCygn9Zqa6M3z3QkxnVvpsFV1QYeXxO1MAM
   oqhUX9XGDcAZhZpDNeul4DM6+m3c591JFH3lHL8naLenIOI/1Iy8b4N5x
   w==;
X-CSE-ConnectionGUID: 7pjMHcYKQ46oGl+XXBGihA==
X-CSE-MsgGUID: 8ryfnCgvTiyu6rqSAeGZqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="18987055"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="18987055"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 00:55:38 -0700
X-CSE-ConnectionGUID: ht90ffjdQXChDORk/zt6ZA==
X-CSE-MsgGUID: bj3enYIpTEiEm54GDRKNNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="42904591"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2024 00:55:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKvax-0009QM-2I;
	Sat, 22 Jun 2024 07:55:35 +0000
Date: Sat, 22 Jun 2024 15:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:rosebush 2/5] make[4]: *** No rule to make target
 'lib/rosebush.o', needed by 'lib/lib.a'.
Message-ID: <202406221507.vb9U6nhU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

First bad commit (maybe != root cause):

tree:   git://git.infradead.org/users/willy/pagecache rosebush
head:   57eed781c2196dbe78dc12acbaba3620f518f65f
commit: 82133b301e90143a2e4d0c1406d8595da7690713 [2/5] rosebush: Add new data structure
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240622/202406221507.vb9U6nhU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221507.vb9U6nhU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221507.vb9U6nhU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'lib/rosebush.o', needed by 'lib/lib.a'.
   make[4]: Target 'lib/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
