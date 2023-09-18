Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1D23C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 05:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695014203; x=1726550203;
  h=date:from:to:cc:subject:message-id;
  bh=vAvVh9/kfJoS4NYmfx/h9nRCp6y+V/wFifbg496YFVY=;
  b=XePanhfBw9XqJBrqXe2g/uodGXrx8GA4c1XqVu4bgcGoD7wgpEcRqU2k
   H43OIqhvTSQnM/CY7Jcjf/RaKT3SW6VEOv2XbHFI8IDf8FBlA4pm4DVfF
   5lvVxoubwPmBjkwg68kf6kDoYmI+4NH1fdNjaF2IvRcaq7r2Jxr7qQ4vs
   O760pyRdBZE5TWR1uYIMHuuULhIt9L34LUKzZz3GA6oSIPIECX/ueB7gG
   wFyaS2iUvY3rtETTE64JKbfK5ZXehFEZhhKfaD5cX6kv2yDHA0cpHYiSn
   GqaarMRrUenj+kw8aZE05902Fr6XucVH6/hGrnRtcy66XTY57hMtlYl9I
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359821489"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="359821489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 22:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="722340758"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="722340758"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Sep 2023 22:16:39 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi6cf-0005l4-0w;
	Mon, 18 Sep 2023 05:16:37 +0000
Date: Mon, 18 Sep 2023 13:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox (Oracle) <willy@infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+549 bytes kernel size regression] [i386-tinyconfig]
 [90d28b9285] fs: Allow fine-grained control of folio sizes
Message-ID: <20230918051612.oQcSZ%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +549 bytes kernel size regression due to commit:

commit: 90d28b9285f106957489dc1d368f4e7f14545678 (fs: Allow fine-grained control of folio sizes)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux.git v6.6-rc2-lbs-nobdev


Details as below (size data is obtained by `nm --size-sort vmlinux`):

ce9ecca0: Linux 6.6-rc2
90d28b92: fs: Allow fine-grained control of folio sizes

+------------------------------+----------+----------+-------+
|            symbol            | ce9ecca0 | 90d28b92 | delta |
+------------------------------+----------+----------+-------+
| nm.T.page_cache_ra_order     | 11       | 445      | 434   |
| bzImage                      | 522176   | 522528   | 352   |
| nm.T.__filemap_get_folio     | 338      | 442      | 104   |
| nm.T.readahead_expand        | 351      | 355      | 4     |
| nm.t.do_read_cache_folio     | 251      | 253      | 2     |
| nm.T.page_cache_ra_unbounded | 265      | 267      | 2     |
| nm.t.filemap_get_pages       | 699      | 701      | 2     |
| nm.D.linux_banner            | 154      | 155      | 1     |
+------------------------------+----------+----------+-------+



Thanks

