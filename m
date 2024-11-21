Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D91DE3B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231758; cv=none; b=cLuDsimkOlwsSlnarabLnN71zj1uesBIzJF+eAChFHrWUFDvD8SPHp/XA7jHGKOvZ7uJ+oRvUxRCPhFKl0d03ofHC3bbmfVlSX/TjeRQ73VNuzYtHswmR8NepqP8N0AwCka3aYFnGmN8us53iBi7xa802RfwJ5KlPsz4tA6rZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231758; c=relaxed/simple;
	bh=Lk+TwZ0zYpeJP0ZBZt6CrtTPZGhTomkpdnJQ7Jodgv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEHxnW8UEwMrs3wzL7ntEDv08QC32hqIgObxmQGSwQZ0DiqU4b02WGYaMR9inw5053JVUmfnj8jSTsspt4mLunkvjGPn8TubPMrBaWbMcWR8L3R7BxBlLBGu5ZM1lng+NRz5Ouf9CCmJzUNtWWGplTmQ5iGzKRAQZ2Ljo1O6z+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5tk/eLh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5tk/eLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732231757; x=1763767757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lk+TwZ0zYpeJP0ZBZt6CrtTPZGhTomkpdnJQ7Jodgv8=;
  b=O5tk/eLhftVCBlH5SV3csAUimGXSlc8teu1QXK8GP/G2bG5w8YE04cf3
   2M+RMrxtkkVhDbtqnkBksUpKyVCB5d0l70Ely6xm379IyspXof6RnFNuj
   JdVvDKwWJApqoafoDCC10uug1MTARdjo3q08FXO1WEHM6h1ujy9VIsc+C
   YwnAIzgbrDVymQltBpfDUKfXKO2Ssr4KvMMPg6hJkHclxT26NczH/bs0t
   AdR4Cl8zfN6SKnLaohGdReP1/k2QlXH2oJoD8v+GIePhlF6e+ct/cXzT9
   BZQxqpOKs0waY4Hs2XFFYA+klqsV5O1t4+q8WLGO4Spv2N4gn2/DxwwAE
   g==;
X-CSE-ConnectionGUID: z+QE77rkQGyPYPI+OvvoeA==
X-CSE-MsgGUID: g/E778ifSV29UC3L/UNILQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42987330"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="42987330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 15:29:11 -0800
X-CSE-ConnectionGUID: YzZgXwpOSpi8/lDzF5ULDQ==
X-CSE-MsgGUID: ilV3PKyDQRa3D8WUe6b6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="94490163"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 15:29:09 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEGbj-0003TA-0M;
	Thu, 21 Nov 2024 23:29:07 +0000
Date: Fri, 22 Nov 2024 07:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: JP Abgrall <jpa@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Alistair Strachan <astrachan@google.com>
Subject: net/netfilter/xt_quota2.c:172:37: warning: 'q2_counter_fops' defined
 but not used
Message-ID: <202411220713.IZh1qOAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 10cda83af99dd606e19a39bb97cf1d90bf2b0f36 ANDROID: netfilter: xt_quota2: adding the original quota2 from xtables-addons
date:   6 years ago
config: arm-randconfig-003-20241122 (https://download.01.org/0day-ci/archive/20241122/202411220713.IZh1qOAJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220713.IZh1qOAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220713.IZh1qOAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/xt_quota2.c:172:37: warning: 'q2_counter_fops' defined but not used [-Wunused-const-variable=]
     172 | static const struct file_operations q2_counter_fops = {
         |                                     ^~~~~~~~~~~~~~~
   net/netfilter/xt_quota2.c:48: warning: Cannot understand  * @lock:       lock to protect quota writers from each other
    on line 48 - I thought it was a doc line
   net/netfilter/xt_quota2.c:206: warning: Function parameter or member 'q' not described in 'q2_get_counter'
   net/netfilter/xt_quota2.c:206: warning: Excess function parameter 'name' description in 'q2_get_counter'


vim +/q2_counter_fops +172 net/netfilter/xt_quota2.c

   171	
 > 172	static const struct file_operations q2_counter_fops = {
   173		.read		= quota_proc_read,
   174		.write		= quota_proc_write,
   175		.llseek		= default_llseek,
   176	};
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
