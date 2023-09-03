Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E728ED
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693757281; x=1725293281;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=vLdILlIsEuSxkS1E9GaU6X/a1Gb2lQEQGj8z/fKaf00=;
  b=WdXXJmGJdapS9+9tVXhT3S+/t8hYHS6jPADZnTweE5YL+Mzvw+SUnACX
   O3H2VMhqj1K/0nq/XOH3ubKbqq31ovoSVSCLwfWPSkLi04Z2wDCy8ClUo
   UHuXHJ/u5F/uAiNcKAW9y1ukEZbKycEGlIw9yFooaFD2JnENuAij49NGA
   YZptJP+7AJkAqTuYE1O7WvYdbSrCNsUuv3xSxE58O0AelvlbxC8s/t/vW
   bpSBZXfXhlNBVNtVTM1uAHm5gQbJ4V6JSI2OMR32VMQ/cabuJTArTNRXo
   w5RGnAE9xFlHohbUWMGj9yReAoait4mHrKPOyFMMhI5KULR3nPIHn1Dox
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="407457212"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="407457212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 09:08:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="805999643"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="805999643"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Sep 2023 09:07:58 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcpdk-0003GB-1h;
	Sun, 03 Sep 2023 16:07:56 +0000
Date: Mon, 4 Sep 2023 00:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+134 bytes kernel size regression] [i386-tinyconfig]
 [8d22a4573c] mm/mremap: Optimize the start addresses in move_page_tables()
Message-ID: <ZPSvOY635cS2fQIj@0ccc9b5d148e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903151328.2981432-2-joel@joelfernandes.org>


FYI, we noticed a +134 bytes kernel size regression due to commit:

commit: 8d22a4573c37fc699bee5452368ce1c497ec8a0c (mm/mremap: Optimize the start addresses in move_page_tables())
url: https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes-Google/mm-mremap-Optimize-the-start-addresses-in-move_page_tables/20230903-231541
base: https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-everything
patch link: https://lore.kernel.org/all/20230903151328.2981432-2-joel@joelfernandes.org/
patch subject: [PATCH v6 1/7] mm/mremap: Optimize the start addresses in move_page_tables()


Details as below (size data is obtained by `nm --size-sort vmlinux`):

69d5f96a: Merge branch 'mm-nonmm-unstable' into mm-everything
8d22a457: mm/mremap: Optimize the start addresses in move_page_tables()

+-----------------------+----------+----------+-------+
|        symbol         | 69d5f96a | 8d22a457 | delta |
+-----------------------+----------+----------+-------+
| nm.T.move_page_tables | 27       | 775      | 748   |
| bzImage               | 516400   | 516464   | 64    |
| nm.t.can_align_down   | 0        | 29       | 29    |
| nm.t.move_page_tables | 643      | 0        | -643  |
+-----------------------+----------+----------+-------+



Thanks


