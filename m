Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139D1377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368073; x=1724904073;
  h=date:from:to:cc:subject:message-id;
  bh=+gAwUqnX1XzmUIA4KCg6VstpJBkksjRbirnZpp5MDDo=;
  b=jWyTVfF9aZZWZEzAKAc7LxxQzxR2JkzsCKhcYZx73291BWV7ujH/3w7c
   WSH3L7hrCsFaDfkbhfIZM/E7vg9XpE0IL6PqjEvHZi7QnR6PRwTm99dvf
   0l2kLZ83TkYPnKxuQpO4tdqPTTRMlz7qqFRfPzU6aaAqTob7GIg7Kfx96
   s8vKdvNmBqmHQ6sdf6NJ5ihstBAkN2wyvSpZaXuxNWmGY/4di+M+SxcqG
   9TQdpwyl8ezVs2fV+3kbKz4XcuVzPFKdSpI8PGzTocS/chtlADeRkuX5K
   WC+R1CxC8gwbuG33CPHJwaI2RtNf/J6o2Swey0eHV9G5Cz6oWc9Pwz+pP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360540792"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="360540792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804367085"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="804367085"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 21:01:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCOB-0009Oi-26;
	Wed, 30 Aug 2023 04:01:08 +0000
Date: Wed, 30 Aug 2023 11:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+105 bytes kernel size regression] [i386-tinyconfig]
 [38456f7729] filemap: use minimum order while allocating folios
Message-ID: <20230830035936.NCXqp%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +105 bytes kernel size regression due to commit:

commit: 38456f7729f80f69c919827fd1b022381180c14b (filemap: use minimum order while allocating folios)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

ebd0f7a7: xfs: set minimum order folio for page cache based on blocksize
38456f77: filemap: use minimum order while allocating folios

+------------------------------+----------+----------+-------+
|            symbol            | ebd0f7a7 | 38456f77 | delta |
+------------------------------+----------+----------+-------+
| bzImage                      | 522400   | 522496   | 96    |
| nm.T.__filemap_get_folio     | 442      | 506      | 64    |
| nm.T.page_cache_ra_unbounded | 267      | 296      | 29    |
| nm.T.__filemap_add_folio     | 287      | 307      | 20    |
| nm.t.do_read_cache_folio     | 253      | 263      | 10    |
| nm.t.filemap_get_pages       | 701      | 707      | 6     |
| nm.t.read_pages              | 140      | 129      | -11   |
| nm.t.readahead_folio         | 92       | 79       | -13   |
+------------------------------+----------+----------+-------+



Thanks

