Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF01CEE98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729891715; cv=none; b=aecICsoBweHj248gI9EPGiFBqt9RSqAV77r65+jItp5kNhuM40JozMsjfjUbgsWekXnKG5QdWQ4qbmDJWREgCWlbf9rLwnFjA8U5ATIEJn2HldWpxB9ib+YnGkAKMv+UNkYi2KwqYKwsriqLTQEooA4NnWkoGCt1uwz4T9g6a08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729891715; c=relaxed/simple;
	bh=HeQ0iClMefFtrlS+MkY3UIAUVCObdP/JZemkk6MLMtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sunYz+MhDtbpnWTM01h/SP3Tqv8JnDjPjejpozA/G5QuUvX2UYJC7bvKmqkLduS+NOnBEYzw6YnwmY7IsSBy8Mo8hIOWF8mBubnuiVb3GlqhNMI0VT+ST/IvoS+LybqxvP5RTYhZkmaNi/ARuFnYLGJmRIjao8PhjN/x1llijec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4fuRyoi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4fuRyoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729891712; x=1761427712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeQ0iClMefFtrlS+MkY3UIAUVCObdP/JZemkk6MLMtI=;
  b=X4fuRyoi6vxfT/5tKLSn26HZE/iNeHnebTfg63ljc7e/drTTXBXqNR+E
   NyZauzmAAb9eWH7uPDLpC1QUc7D916/G5r3dCFBvCue6CVY75bnmVzaSc
   SlinxJJveFZ9D87y11nOs1aNJ3cK8ELLICJTFgGt2JQNFnYoJAyxBbMeJ
   3AyABU8MMMWguUo/3yNcfIQ2oHhWRi0QNQQaLmB/YijmDhR3NafY0Ec/R
   10tR/jOD2+vroB5SymV8Vf0cg4spyhd+zxb1mjmVBzndgz47St1yuSXxU
   R+1dmUMp/3XjKQKCvJUIuTj2gYiUKkdzN+gtWIlqc1Ak3XGY91Ky6lX1O
   Q==;
X-CSE-ConnectionGUID: E7Q++Si1RmW/Ilt4L0LEww==
X-CSE-MsgGUID: YJ3pTUzFQtaDWvPTtSV1Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40191418"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40191418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:28:32 -0700
X-CSE-ConnectionGUID: qLtNqWzmTXGvtCrtdvFmyQ==
X-CSE-MsgGUID: 42R2PdDISXKjb4FlHh5bww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="85812041"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 14:28:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4RrA-000Yug-26;
	Fri, 25 Oct 2024 21:28:28 +0000
Date: Sat, 26 Oct 2024 05:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 6/10] include/xen/xen-ops.h:10:10: fatal error:
 asm/xen/interface.h: No such file or directory
Message-ID: <202410260523.cvj1zgbA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1ee7d4424b5fb877c9020b7426879470c2d47125
commit: 9434751ce7a253179363e854b6ed1796f62a338a [6/10] virtio: msg: Add DMA OPs support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260523.cvj1zgbA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260523.cvj1zgbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260523.cvj1zgbA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_dma_ops.c:19:
>> include/xen/xen-ops.h:10:10: fatal error: asm/xen/interface.h: No such file or directory
      10 | #include <asm/xen/interface.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 include/xen/xen-ops.h

e04d0d0767a9c2 Isaku Yamahata     2008-04-02   4  
e04d0d0767a9c2 Isaku Yamahata     2008-04-02   5  #include <linux/percpu.h>
cd979883b9ede9 Stanislaw Gruszka  2014-02-26   6  #include <linux/notifier.h>
be81c8a1da2428 Daniel Kiper       2014-06-30   7  #include <linux/efi.h>
251e90e7e346a2 Juergen Gross      2022-06-22   8  #include <linux/virtio_anchor.h>
f030aade916508 Juergen Gross      2018-08-28   9  #include <xen/features.h>
7892f6928d0cd9 Ian Campbell       2012-10-16 @10  #include <asm/xen/interface.h>
4ccefbe597392d Stefano Stabellini 2015-11-05  11  #include <xen/interface/vcpu.h>
e04d0d0767a9c2 Isaku Yamahata     2008-04-02  12  

:::::: The code at line 10 was first introduced by commit
:::::: 7892f6928d0cd9ef9200a193183c2033b3143dab xen: correctly use xen_pfn_t in remap_domain_mfn_range.

:::::: TO: Ian Campbell <ian.campbell@citrix.com>
:::::: CC: Ian Campbell <ian.campbell@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
