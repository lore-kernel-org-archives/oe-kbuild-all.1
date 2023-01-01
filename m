Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1AD7E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jan 2023 01:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672536205; x=1704072205;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=jMiNHY03PwxZT93vkHSv7I4VGYXfYMiJauQPzrUCqVU=;
  b=STxHBDpjOmvLT2IGoYj4/kpeAqQb3N5Fup3vjr0/6W7XvXcpcuT2P1Dt
   ZRNJeUOyQ97DToD39QJ1d0Z11CBpu1SfGEhcbYfERcXXpD3YNj8uF9urF
   3/AZnUpR9vmX1uNau/1ZNkQWlzlNfTPANUgbWzSWMkHhv6VdMW96Em2N+
   HvNjtTBGakuwsm7qgPrG/vbE1SPA8HaRu0S/KdpoCRutp6PMUMko4CZ0u
   kZSm9YYBbk1pKq8ymRYfjv5Im8NFVngdQNciLpmluuJHgXFdBE4HfXOFV
   awoaLBEeBAvJlJDiugLSQOpZto8CW1ZkXx4C27vxzMrUY45Ee2PHP23xv
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="309110530"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="309110530"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2022 17:23:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10577"; a="828253747"
X-IronPort-AV: E=Sophos;i="5.96,291,1665471600"; 
   d="scan'208";a="828253747"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Dec 2022 17:23:23 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBn4N-000OMv-0b;
	Sun, 01 Jan 2023 01:23:23 +0000
Date: Sun, 1 Jan 2023 09:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+132 bytes kernel size regression] [i386-tinyconfig]
 [522fc24c0c] mm: Convert page_remove_rmap() to use a folio internally
Message-ID: <Y7DgZtOPrmNMS0oR@42f7f79a36c2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231214610.2800682-6-willy@infradead.org>


FYI, we noticed a +132 bytes kernel size regression due to commit:

commit: 522fc24c0c247d13b0a4ee0d0d2117c9ac4834d3 (mm: Convert page_remove_rmap() to use a folio internally)
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/mm-Remove-folio_pincount_ptr-and-head_compound_pincount/20230101-054709
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git e4cf7c25bae5c3b5089a3c23a897f450149caef2
patch link: https://lore.kernel.org/all/20221231214610.2800682-6-willy@infradead.org/
patch subject: [PATCH 05/22] mm: Convert page_remove_rmap() to use a folio internally


Details as below (size data is obtained by `nm --size-sort vmlinux`):

0c14feef: mm: Convert total_compound_mapcount() to folio_total_mapcount()
522fc24c: mm: Convert page_remove_rmap() to use a folio internally

+-----------------------+----------+----------+-------+
|        symbol         | 0c14feef | 522fc24c | delta |
+-----------------------+----------+----------+-------+
| bzImage               | 495744   | 495904   | 160   |
| nm.T.page_remove_rmap | 117      | 249      | 132   |
+-----------------------+----------+----------+-------+



Thanks


