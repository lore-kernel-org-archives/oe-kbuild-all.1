Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133B41D5143
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730807310; cv=none; b=FZacxoQSndB2gp2h6kasqCKmbmQgvBXgMYchB+SQOtEZW6wH0y/iTi5qGui9EVyyEEN5G/kWkJkl17xSVbBc9npWVQkHNtUbqOF6qvrBr4XJbxVoxU/Jq2fzDWtU+zx8cfZX9mw9TcGuUZK8zVma92j6y41Q1Kv8cHoTfMCbxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730807310; c=relaxed/simple;
	bh=fH3zy67YxTBwpNLAhiY2iEJ/LWlGNeQIqJN3/erLGnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoVl92lTA3FZxBLbG580ldoGrvYGmCDqSf2JZuRzFXntPcEjGRspZdXveNr/gdeTk4PFI1CHh7V56jU9ToD8+Pcz2YLiyw1CvPg+jMywHpwQk7jwhOIURI1UyFKlknxkCvJnmt7zwXc+MVG98g+9pWyGj6j9dphGTSUnyemQVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxvPWJOe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxvPWJOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730807308; x=1762343308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fH3zy67YxTBwpNLAhiY2iEJ/LWlGNeQIqJN3/erLGnc=;
  b=lxvPWJOeP+lGDJAyVSCMdJOwO0z24t2b8RvCxvuBfbVZdswzynLNbUU/
   IzNLcRzokGuE3u97ns5d5J7gGEldiCoaEbW/vvXW4BaV2NLbUt83hvk2+
   qcG8gHHOIsq8qDDanZt8iWEyyJd9BUADVKr+Pn+n4RuDLVxPsQw9XW3NL
   dAH8KZFmofdiHx9/aWdRgcoB0xTj2bEQB38ya/96vtCG+DBSrjla5Xapx
   DODkn8TsJ6cPEKctPEvpCf0NrzYmY7bWhIPLI1Sc5Atjqd3SAjCEONoHG
   ErjGW6R7IeXLaIGE80AInbBN0143jjzuSy3rYd7OXmfyrEw+BdQ/pcljz
   A==;
X-CSE-ConnectionGUID: h5IxOZ5dR6WsdQmBbX+2uA==
X-CSE-MsgGUID: A4gE62qOSGWQy6NLFnOzjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41945706"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="41945706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 03:48:26 -0800
X-CSE-ConnectionGUID: EY9uyV+zQHyFl0lOkDz0oQ==
X-CSE-MsgGUID: a47mmvi5SPi3g70s3em6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84801344"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 03:48:25 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8I2p-000lzr-0d;
	Tue, 05 Nov 2024 11:48:23 +0000
Date: Tue, 5 Nov 2024 19:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257] net/can/j1939/.tmp_main.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411051936.7BMR1oXT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0c1156b86933300fc91692f839a7f6e0676f55d7
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [1257/1257] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241105/202411051936.7BMR1oXT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051936.7BMR1oXT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051936.7BMR1oXT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/.tmp_main.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
