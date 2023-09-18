Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927E1D699
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695040220; x=1726576220;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=nf3qlUGpmmhEqAhu6/uOPOZrq8FidMpC0keEoc6ZBao=;
  b=Wi2lnhLGlQhTavqs1UKOXP9RqmlmiJd/O4VG5wqG9uXZKOabGsPyDvrR
   I1ndWtbWGz5m0tc5iM+p0HeuxR994KUFB6MZoqU93ikQYtNw7b6Rb8y7o
   /fB3KwuGpSatPDTjdxyaJ7wqNKTdkjAyrv2gLa6OWOecpk3YrGqYEsnoZ
   9yYCYgQ1WVjuuHinm0fTZGm3Yb/JSh9Zu0XAwO/Sv+mk+clLoyh9pAT2F
   N5DirVsAKdGTcpBgdSjH7rND6G/JxqSP/oV09zCl+SBDks4vzkE+nMhNr
   zBvF/M5eM75bWENyagTQvTfGSbDyT54POn9OYJb7lqhmPX6oZRGd03VfF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="383461765"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="383461765"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 05:30:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739122616"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="739122616"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Sep 2023 05:30:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiDOK-00065y-0X;
	Mon, 18 Sep 2023 12:30:16 +0000
Date: Mon, 18 Sep 2023 20:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+550 bytes kernel size regression] [i386-tinyconfig]
 [8558b2228d] fs: Allow fine-grained control of folio sizes
Message-ID: <ZQhCu8zIiPwWGYJK@f25e8072a0ba>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918110510.66470-7-hare@suse.de>


FYI, we noticed a +550 bytes kernel size regression due to commit:

commit: 8558b2228d415844dc8bb42d48a08aa85678fef9 (fs: Allow fine-grained control of folio sizes)
url: https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/mm-readahead-rework-loop-in-page_cache_ra_unbounded/20230918-190732
base: https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next
patch link: https://lore.kernel.org/all/20230918110510.66470-7-hare@suse.de/
patch subject: [PATCH 06/18] fs: Allow fine-grained control of folio sizes


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4cf60235: fs/mpage: use accessor function to translate page index to sectors
8558b222: fs: Allow fine-grained control of folio sizes

+------------------------------+----------+----------+-------+
|            symbol            | 4cf60235 | 8558b222 | delta |
+------------------------------+----------+----------+-------+
| nm.T.page_cache_ra_order     | 11       | 447      | 436   |
| bzImage                      | 522176   | 522560   | 384   |
| nm.T.__filemap_get_folio     | 338      | 442      | 104   |
| nm.T.readahead_expand        | 351      | 355      | 4     |
| nm.t.do_read_cache_folio     | 251      | 253      | 2     |
| nm.T.page_cache_ra_unbounded | 290      | 292      | 2     |
| nm.t.filemap_get_pages       | 699      | 701      | 2     |
+------------------------------+----------+----------+-------+



Thanks


