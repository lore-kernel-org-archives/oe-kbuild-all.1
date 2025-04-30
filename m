Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7070021D3E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032901; cv=none; b=GT5Tt+LjPrE6YQjpxvkCF5ZDywEZ6Y71iaWYzwN+wkNe7AgE/qRu7DBOT2MMabbcuykp4Tx8mkl5V+8QktfUuhLjJTQA+0SjzNvPul/GYn3Sad9/xBkHPqwGGcGcBMlgSuker+RLsymKMEeR+5tJN5OfbIuZ4R29+pN/ubxtDow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032901; c=relaxed/simple;
	bh=JE+A1XsbYZEyCPx0VFYcR5xYo+oQ/Gb6UmEpD3fMnPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQVVPzaPJImTAAvSleORZRmsZRcwjGYhjYFYzaAlFsPha2J+8MusIsh9B8c1kvm2gF0aFobe4ITZ7BBimKEJLAP+YBRslcuoR2CndL3j0z4tpfkZwWWKcBanQqFeRgHSVpmaSt8F+fT8vdLe49UCTLkkZUcgyq4haWrTFkdlPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CY7ITWuN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY7ITWuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746032900; x=1777568900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JE+A1XsbYZEyCPx0VFYcR5xYo+oQ/Gb6UmEpD3fMnPc=;
  b=CY7ITWuNUBxtMhx4B7GU5VRoxfsPV6zcvyVzjCfKPw1byAr8u2K8hDzx
   cZetw8Wl1jjbfFR6fjKeTfhsEzvBDSTM4l+0J5rbjT5hKtk1GOwD6TNBE
   tfiuL3mhyhS0unJpv5TrWb8JqAKkhNIKLB+p40ZHKo9Q+NL+fLaFQYK37
   bNMqPjGZX7VU6of2OR+K4QhAI/cAL3NCmbKvzQ4YgGv234Y4ZSEEhEv7M
   5Ne9BIZAnwC/3avmZtuF6exvKfdNK0vaPmzZjjwSyFozdhtY7YQQ+p1I9
   BvJy3HKJTt4vmMkujRzbgrMTXLksT3SwtZD3nZDeZEjMaicBQuYxybGCX
   Q==;
X-CSE-ConnectionGUID: KMdxdVB3SwS28WOpqLg3kA==
X-CSE-MsgGUID: VRygfQVnRMOJjbRSULcnuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65237058"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65237058"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:08:19 -0700
X-CSE-ConnectionGUID: c/6moNo7RuW91/3l/dCxZA==
X-CSE-MsgGUID: tapjg7KeRM2INqpp6lBKAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="165248726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2025 10:08:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAAut-0003dg-1U;
	Wed, 30 Apr 2025 17:08:15 +0000
Date: Thu, 1 May 2025 01:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:66: warning: Cannot understand
  * @force_free:
Message-ID: <202505010014.X9c71jEV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   241523b7d82e629fd115303840c385702bf2ea5e
commit: 2e6ffd454acd9b4432dfee6868f3c00be7df0b6c [2195/2195] RNP: NET: Fix rnp errors dmesg show in hygon
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250501/202505010014.X9c71jEV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010014.X9c71jEV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010014.X9c71jEV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:66: warning: Cannot understand  * @force_free:
    on line 66 - I thought it was a doc line


vim +66 drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c

    64	
    65	/**
  > 66	 * @force_free:
    67	 * true: no other reference to this cookie, it is save to mark cookie reusable
    68	 * false: cookie may used by other(firmware), only available after 2min
    69	 **/
    70	static void mbx_free_cookie(struct mbx_req_cookie *cookie, bool force_free)
    71	{
    72		if (!cookie)
    73			return;
    74	
    75		if (force_free) {
    76			cookie->stat = COOKIE_FREE;
    77		} else {
    78			cookie->stat = COOKIE_FREE_WAIT_TIMEOUT;
    79		}
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
