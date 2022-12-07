Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22BE8F46
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 22:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670451804; x=1701987804;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L/OLFPPIhP7r+Y7ednoNYDCkO7jBBVvwfwMgmYn6wPA=;
  b=dNBJ/Dc6lflFHkh0khhLCWCuwhjVKnAL6oYhkhyzRi8uhquv+moQDF/Z
   dVBvl3E6e1MW1G8BJutZETyAmsKQVZLQtkaFK/PJe7Zby34W8RVyMIp+K
   ATw/Cp56UsEIBsf5m9YULaI1cqkwt8zwz0/qVt6VxIczZnRgtLlI+3dx4
   kzD1KEdTe7p2YKYwieJtLc+QpFeaeewh32GFS7gQy4y2TnnpdDKez6C3u
   8TQrPqcJbeldRj4hKxjQTHsumfi5ULc3COuVK+OB0uhk5Jgzfle15npR3
   hXjbWdO+9lpi7yLjS1Ff+lB+ZBfNeHti2i8N03zVpEluA/Xc+g1Sj8hQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="344059099"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="344059099"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 14:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="821111169"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="821111169"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2022 14:23:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p32ox-0000c3-3A;
	Wed, 07 Dec 2022 22:23:19 +0000
Date: Thu, 08 Dec 2022 06:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+467 bytes kernel size regression] [i386-tinyconfig]
 [d68dec755e] fanotify: introduce directory entry pre-modify permission
 events
Message-ID: <63911228.+hNye+vuQLhCmERc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +467 bytes kernel size regression due to commit:

commit: d68dec755ef85f527fd1623357aac4c0ac6cb378 (fanotify: introduce directory entry pre-modify permission events)
https://github.com/amir73il/linux fan_pre_modify


Details as below (size data is obtained by `nm --size-sort vmlinux`):

5a7c77ee: fsnotify: prepare for directory entry pre-modify permission events
d68dec75: fanotify: introduce directory entry pre-modify permission events

+-----------------------------+----------+----------+-------+
|           symbol            | 5a7c77ee | d68dec75 | delta |
+-----------------------------+----------+----------+-------+
| nm.t.filename_create_srcu   | 0        | 235      | 235   |
| bzImage                     | 492320   | 492512   | 192   |
| nm.T.mnt_want_write_parents | 0        | 119      | 119   |
| nm.T.mnt_want_write_parent  | 0        | 110      | 110   |
| nm.t.open_last_lookups      | 396      | 474      | 78    |
| nm.t.done_path_create_srcu  | 0        | 31       | 31    |
| nm.T.do_rmdir               | 251      | 265      | 14    |
| nm.T.do_symlinkat           | 139      | 149      | 10    |
| nm.T.do_linkat              | 279      | 289      | 10    |
| nm.t.do_mknodat             | 362      | 372      | 10    |
| nm.T.do_unlinkat            | 360      | 369      | 9     |
| nm.T.do_mkdirat             | 148      | 153      | 5     |
| nm.T.do_renameat2           | 817      | 818      | 1     |
| nm.t.filename_create        | 215      | 50       | -165  |
+-----------------------------+----------+----------+-------+



Thanks

