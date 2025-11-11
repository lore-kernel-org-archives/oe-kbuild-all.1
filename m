Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEF33D6D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762892661; cv=none; b=DQhqxfkrBg3UwBYaFN3ftRZ5Y8XPRD3esIQlRhe28n2Qa42M+gcB+zDsFFLKDo3WHuldEb7/7vBO2NcPYKVBsp34d0zG9wHMEg3nVFz3Cl4tXcTwKWfDrYxHQmW046MNH8/kmnkMcOLb/gtczeCQOidbhpaO6yAWUf+nNyDBxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762892661; c=relaxed/simple;
	bh=Ixt3n/UcjWeRas+Fn3mr3fZzywGZ358dw1pEm4Hfm0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ow3qa/sG59oMRD+lZ4mfx+iSJYbk8dkeE5/Gm5lMWCE3Q6GYU/HRHPxSw3/ZcbwDJ4YxHTNwzQJQQ7OqWVJ0hF4tYy32TBH6iZ4ERhuW1Ff0TKNCylyj2kT5zMRhK6J/f0IOqmoqLPOLk6o0jffidJDmC/8PrEPBX7lAXVHYdsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCBLjczA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCBLjczA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762892659; x=1794428659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ixt3n/UcjWeRas+Fn3mr3fZzywGZ358dw1pEm4Hfm0U=;
  b=PCBLjczAliDhr0VQ8SiriFrIrBHbIdZcGYUyIcl49cInWiFsJ4oBY3ub
   QWTFdgGgd298rXsNvkYSKAF4FnZzALBehihvyTJiQydz8hQVb3oZgryqR
   Is70BspXncrGGZojdrOf+Iyj2fjV3szLtNetXKyl4DJ5av5bH+oPFC6La
   SpKbVOJlJzW8qbZPbQKHYOXMwlS69ydmH2HmmoT8Dltps/SEYEhPvN5/p
   7wB379odcgZwtRsDzh30BvQ+DBZGvZhBCofT2GFMwx8SEvnqxt3XbUxPp
   csjeFQjmXer/xzMlSOlFIQHQ49n0jxnFku9BsfJP2BpYhfo1drHpsExSn
   A==;
X-CSE-ConnectionGUID: QLdFQNLdRgChpr7lzBnT+g==
X-CSE-MsgGUID: blpMcaYmR0SDRfTfxCfrUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82356433"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="82356433"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 12:24:19 -0800
X-CSE-ConnectionGUID: cYHAaFRISW+gvOFBPZ+Wiw==
X-CSE-MsgGUID: TlZ0z4jDR7a+obc7QsHfKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2025 12:24:18 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIuuV-0003Y7-3C;
	Tue, 11 Nov 2025 20:24:15 +0000
Date: Wed, 12 Nov 2025 04:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 9/9] vmlinux.o:
 warning: objtool: iommu_dma_sw_msi+0x42: unannotated intra-function call
Message-ID: <202511120432.p4EMvrYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   e77810343d95dd833d1c64fbbca223e3095e3ea5
commit: b298ea8d583f953ff965d9746fefaf31c458112f [9/9] iommu: Drop sw_msi from iommu_domain
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20251112/202511120432.p4EMvrYn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120432.p4EMvrYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120432.p4EMvrYn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: iommu_dma_sw_msi+0x42: unannotated intra-function call

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
