Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6423C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 05:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695014271; x=1726550271;
  h=date:from:to:cc:subject:message-id;
  bh=gfr0x3TX7APmq0xwgPwTryVKB1CeQvk9vqGQpWALQws=;
  b=HUakuousiHrm+/4tMznDKUuNcVCwf2APnh+HXHow3zMqNMJsHPhwfxhs
   fSq0YifKCU8BaOQl5BP70OLrLyhbYaoWvstyqbvgLUyNNuq2l6ig6ODdT
   cxMB4hIMl+VTECAwOYSKDpbVmAXPU8wmEMtzrmS60Ap1JRkUWQD9jdFfL
   fQ283464L5fT8osNKt37eNpbFagLEa/jlRTq8Zhc2FceFqzqtnNwGEZHo
   tgqbjrsFDdgn2XYwp4hsAqhxOuKbFKnS4D89+ucMWySE8Jhoh9AwKZ5nv
   ioMU7RGH5k5IPE8vlWqt7EQ544rs9JvusYp4iOlibiV9ZuN8azDZOm+JE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="443644906"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="443644906"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 22:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="745676054"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="745676054"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Sep 2023 22:17:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi6dn-0005lF-1t;
	Mon, 18 Sep 2023 05:17:47 +0000
Date: Mon, 18 Sep 2023 13:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+95 bytes kernel size regression] [i386-tinyconfig]
 [eee71a77be] filemap: align the index to mapping_min_order in
 do_[a]sync_mmap_readahead
Message-ID: <20230918051641.VHg3N%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +95 bytes kernel size regression due to commit:

commit: eee71a77be45ad93073dacbf7a17248aa02e9791 (filemap: align the index to mapping_min_order in do_[a]sync_mmap_readahead)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux.git v6.6-rc2-lbs-nobdev


Details as below (size data is obtained by `nm --size-sort vmlinux`):

b97d39fc: filemap: align the index to mapping_min_order in filemap_get_pages()
eee71a77: filemap: align the index to mapping_min_order in do_[a]sync_mmap_readahead

+--------------------+----------+----------+-------+
|       symbol       | b97d39fc | eee71a77 | delta |
+--------------------+----------+----------+-------+
| bzImage            | 522592   | 522720   | 128   |
| nm.T.filemap_fault | 1072     | 1167     | 95    |
+--------------------+----------+----------+-------+



Thanks

