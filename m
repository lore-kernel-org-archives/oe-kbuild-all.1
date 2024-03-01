Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2435915C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 23:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709335072; cv=none; b=sXGdBgy7fds1ne876uGy2ZUP1emQlF1gBkbvIui2ghA1PedaRr5zkrbnDaQVFa0gkunHM0FTriHQNlMlUVk7U81KkccuRvH2e+bu/rRi9kvxviFCQzBWkt21Edhq+7BqevzpBX9iXGYqYA7qL7iiTGKHQaIpkFN2Wv8Ur541h60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709335072; c=relaxed/simple;
	bh=gLeibuaPXgoUSdwEaciakkBqj+/6BTNTQQrvBWT304c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiSaWlrYznM5KGysyMDrpx1OYWvnhU3KokXiSLizvZNoT58wlW5HHgs+PAxuDCyjPC5HsHJVQr7IR39ZyBMyh13WqjvV4bJ8A/IW8jyr+XgZFVdZhUj/cGHXhmuRROu4PeS+06oEzEfwJ+pYsDsnYbvaRJIfloOFCDZ9FBnsUbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Np1gf2W0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Np1gf2W0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709335070; x=1740871070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLeibuaPXgoUSdwEaciakkBqj+/6BTNTQQrvBWT304c=;
  b=Np1gf2W028wgmxD119ca9Q03293BGuDIVUc0neJQLv84tyzLDa95OMbK
   SKGkagFUtYphsbH9+effOTvtvtKi1pgIB7Z3JzWQjBtKJ1CMIbY3rFWkn
   zs3be0oSVme1fWbGdTE9ppr1uPS2MEbOMlDmdU2cyL4z1hCGVccGfhaX1
   VhrIYPoS4U3R5QX10z159yPnKHFfhkrk/cncaWLKuZL8ED3rJYx6oxhYa
   Iv6YzQ+31UMa9v77tnYLEBk8+bdmG5bkE5Ui+fa/djwaFJibe50kLKJuS
   heampzzzLZtTfqB6pcXG3EhJhCmqPGTf6EDx+cKwadDYIbR+AGHQqbY1z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4019481"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="4019481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 15:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8288637"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Mar 2024 15:17:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgC8N-000EAZ-1C;
	Fri, 01 Mar 2024 23:17:43 +0000
Date: Sat, 2 Mar 2024 07:17:39 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: tools/bpf/bpf_asm.c references a file that
 doesn't exist: Documentation/networking/filter.rst
Message-ID: <202403020729.6jEZRk6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: af2ddee074010b709289319d0b9c4cc8cf5744f6 bpftool: sync bpftool from 5.10
date:   1 year, 6 months ago
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403020729.6jEZRk6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020729.6jEZRk6L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/
>> Warning: tools/bpf/bpf_asm.c references a file that doesn't exist: Documentation/networking/filter.rst
>> Warning: tools/bpf/bpf_dbg.c references a file that doesn't exist: Documentation/networking/filter.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
