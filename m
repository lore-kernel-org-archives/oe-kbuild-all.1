Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10521377
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 04:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693368075; x=1724904075;
  h=date:from:to:cc:subject:message-id;
  bh=KmLphqQCzXi8/EJLlO+uooxNJcCtXEMznVTLDAE9nPI=;
  b=l7D3qJqrHUlgeEDHW22p1K4xXIeuz4yhuERnANTZSWalaM4DJciVpiHS
   UBeB4Tham/7YNTAtQgDppzWhy6nQyHg2dQL5wuFxz2sS7PhLmxW8qVPu7
   5Tg8WvSui/4fjTjNu8OJm0lEDgHVVfOKT/deRyMnb3cAYwCArOtx3Xeq0
   0gPz3Zz9ib0WeiMzdldN4SmrRLHHubtOT+dUz3UORc2xbgoOs2Zu4z6s/
   zOGKFUpRawjL8iN809XW5DITSAqIKj0YdDKihzksxsYsLN6Wi1mNp79e7
   VBNhjCBMMefYw+W7Tg1raWD4sE6gea2YuOgUgOks/tWWEiYSxCcaaTC0h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360540795"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="360540795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 21:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804367092"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="804367092"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 21:01:13 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbCOF-0009Oq-0V;
	Wed, 30 Aug 2023 04:01:11 +0000
Date: Wed, 30 Aug 2023 12:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+102 bytes kernel size regression] [i386-tinyconfig]
 [f2464b170d] page-cache: fauilt fixes
Message-ID: <20230830040019.7jvfa%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +102 bytes kernel size regression due to commit:

commit: f2464b170dab8c5cc97d236f5eb04f4133a53b81 (page-cache: fauilt fixes)
https://git.kernel.org/cgit/linux/kernel/git/mcgrof/linux-next.git large-block-nobdev-20230829-minorder


Details as below (size data is obtained by `nm --size-sort vmlinux`):

dea2cb72: test_xarray: add tests for advanced multi-index use
f2464b17: page-cache: fauilt fixes

+-----------------------------------+----------+----------+-------+
|              symbol               | dea2cb72 | f2464b17 | delta |
+-----------------------------------+----------+----------+-------+
| bzImage                           | 522848   | 522912   | 64    |
| nm.T.filemap_fault                | 1203     | 1243     | 40    |
| nm.T.delete_from_page_cache_batch | 239      | 276      | 37    |
| nm.T.replace_page_cache_folio     | 189      | 214      | 25    |
+-----------------------------------+----------+----------+-------+



Thanks

