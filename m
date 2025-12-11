Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229630FC1C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765456670; cv=none; b=RT+npolNK/kOaLR9uhReLq+DNQIzS9ZA1mpMrSFO0QltRLIS1fDgOQZj1zTk0jBQhjsPEZxD7mYQzWi9d4HC2fpPS26594ywk+PXZ5RnnC4S874CdWjkRAJdGDWZhTWjXA0T5VqlpsiVA9p07MJBhXZ22RUIn+CSylmXMEUu59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765456670; c=relaxed/simple;
	bh=K8uV2xVa7cA1IMyxtLYefwzb2dBz6G2iIqxX+ZJXauc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQDjtKEfnUISy5QryMZvUthRGoHZ+uskSCkyYtxL5huXiu/SNFeio9clc0Y9osmVQ5nEdqhgWD95XTy0aN/GgEyfm70WgY/e8SkLVwdxCIJasNxGQPFZvhlf6WlxACjk4Pb2dXUPX7yIOBtdFsGch5pmB6GQfhJRJ9ciWCw6xmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU3gpVpf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU3gpVpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765456668; x=1796992668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8uV2xVa7cA1IMyxtLYefwzb2dBz6G2iIqxX+ZJXauc=;
  b=fU3gpVpfpmXCwvf2Q9X5yWEy0iGbblRftMFRnb5JUcD5XAkMxuaPFtNG
   /DW/ZPKiORlBbTQHZbadAJLL0S1/EvKrVhDrrYl82wVjvdmt6F6hitAdr
   S+6yOn8eih9+rHRehQ/fiUWSzqSJgPbEnxk94fNFnGUg7Mw7ls1oNymWm
   5wK8m/MsB8tnkleBRKTNKytgqa5Xc+I+rZKK9b0bdiEzkgD68jJslBU0+
   MTmNaBVdKy1/WCnrsSMGqo9f2X5J0ZShfHrl32OL412RVbBxLGO96ubUK
   +8glIP5nd6vc+WX6rkZeC+LV4fLo879g/xfT7bWErVdwTFBelLAVMNTIF
   A==;
X-CSE-ConnectionGUID: xOUA9AaWRbK0Nta/16f2Kg==
X-CSE-MsgGUID: jpcatRNOQWu9LPnueHXPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84844592"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="84844592"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:37:48 -0800
X-CSE-ConnectionGUID: W6kdXVJHRLaNiYVnOeBbBw==
X-CSE-MsgGUID: v4bkjhMKT6aR0EZDzx94bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="201213167"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 04:37:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTfvU-0000000015c-2CVi;
	Thu, 11 Dec 2025 12:37:44 +0000
Date: Thu, 11 Dec 2025 13:37:40 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GUO Zihua <guozihua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] htmldocs:
 Documentation/powerpc/kaslr-booke.rst:14: WARNING: Title underline too
 short.
Message-ID: <202512111312.iKXg5EbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: c3d1c3ac9ce3b71e515f8b310a892116272222ec [3534/3534] powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst and add 64bit part
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111312.iKXg5EbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111312.iKXg5EbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function dataref and headerless skbs ./include/linux/skbuff.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function skb checksums ./include/linux/skbuff.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/peci.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/energy_model.h' failed with return code 2
   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
>> Documentation/powerpc/kaslr-booke.rst:14: WARNING: Title underline too short.


vim +14 Documentation/powerpc/kaslr-booke.rst

    12	
    13	KASLR for Freescale BookE32
  > 14	-------------------------
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
