Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1889847A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715389662; cv=none; b=g2WUoAU1qPtaKneDW0gVIkE3B42T+lbadhsVTBRrevffT2mNIIbAMZ07w0AZK5P6JopNvfw+3cO3HLAp4ZYRG/u/el0UpPZxkjBDreCTQLRUnJW6YQeXbWQkXN/JEehY5Q5XiwvL3fkOW2lQvv1R+bHFofoCWDdx0j3vj1TiqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715389662; c=relaxed/simple;
	bh=QyDN65FbOyDq3jx+1Rccv7/MCTXm1/MTPSHdEjCzCSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dtIqz1VQf3Tk0TX0lZ+t3KgEVZc9lfV86FE/Y1Zn/6eMP94KLa9FwxvuNn9gGAz5cd+MhuBi/KfCiu0Sd35OhXNIIj0Npl8LLd4aiYj0nAjM439F3nQPsjKKnJknsiDCVtKr5xhBjDqqlvZiB05PzJuuO+h9kPcOkuue6R12xnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3fX7IyC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3fX7IyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715389661; x=1746925661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QyDN65FbOyDq3jx+1Rccv7/MCTXm1/MTPSHdEjCzCSw=;
  b=O3fX7IyCBsKJ/5Z5jhSxbml31h/Sry0wlrkcFD/FYPDW7WqZKWav/JYb
   y6Fb9Jh1CSQ5KlLUJSk3tZqF6sN9aVkkdFaqM5CjN4xz8IY16V2yZMGsB
   X9JbosjlbCFQ957jEIK5IZUn4754clac1byV51hpfKAQq8p/jBthP9eYu
   bByjbZYVh1gRzwVNa5D1dUU2iY1uBgJjMJY0sU/4f28RmLgqq9Egypytu
   TfHoDvWPn5vj7RZz6dnB1tXEmCH7zFPYSre9VsQJLWp55/wd0t7bJmvPY
   zj9kej9V5Yf+dQckr+U5sB0YEZ7YaxfNTeauxXnxh9lfgKoTri45QlGk4
   A==;
X-CSE-ConnectionGUID: fg5VjndASOScTOjAmBAH1A==
X-CSE-MsgGUID: Qrr6blb/RamGQ1pQwUQgQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="15204147"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="15204147"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 18:07:40 -0700
X-CSE-ConnectionGUID: LOX8sd/+T5isW/BNgwVszg==
X-CSE-MsgGUID: TU20YZP9RsOHhUicucIhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="34328967"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2024 18:07:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5bD7-0006lL-09;
	Sat, 11 May 2024 01:07:37 +0000
Date: Sat, 11 May 2024 09:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 5395/22398] net/rxrpc/.tmp_input.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202405110912.db5AcH6D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a786a35ec1aeb84a5ff258956854c2eaebec12b7
commit: ef48248d933d2602d3c9d30e9d85c6807e0ac46e [5395/22398] rxrpc: fix race condition in rxrpc_input_packet()
config: x86_64-buildonly-randconfig-003-20240509 (https://download.01.org/0day-ci/archive/20240511/202405110912.db5AcH6D-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110912.db5AcH6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110912.db5AcH6D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/.tmp_input.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
