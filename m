Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD315B8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 01:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677895053; x=1709431053;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=s6gQcHI7GpoXhV5SjJK0KkCtciQ/DHuQvZD7MJ19Ung=;
  b=i8Ocu1VGLU//2kO2v7m8hR677iszmKoZ1oBWc0QZoi62A6MtaqVwBrvT
   FGMWgac1OEtx2JMykKmzDmO7/CqHrkh899LgtyZvGVyPiWK2V/oHMePGN
   OpHkJW6Abl2Y+Mvs1cpenupra6O/X05joS2Lq4hQEoYdTT2D0fevyLxBL
   9dV783aSwsaOgoD9mLNR4ikL8LYoZFwMB1jwi2Y5H4iKHNsZU8O4iPB0X
   bfyuY7WXsCb+BjoLdCftGpcz2wtKlrr3wBZVeTnMEtOptnmv7RjgroGdT
   3whWrBIXueMXU31KbHD36MEfb2P0+2JEtHdCTiS+8j2LFAojofntolJY6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323509006"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="323509006"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 17:57:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="705843909"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; 
   d="scan'208";a="705843909"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 17:57:31 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYH9O-0001me-2k;
	Sat, 04 Mar 2023 01:57:30 +0000
Date: Sat, 4 Mar 2023 09:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+298 bytes kernel size regression] [i386-tinyconfig]
 [6c154242b9] driver core: Add fw_devlink.sync_state command line param
Message-ID: <ZAKlad9avnvlRFeR@8d190a1611c4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230304005355.746421-2-saravanak@google.com>


FYI, we noticed a +298 bytes kernel size regression due to commit:

commit: 6c154242b90e7467a9df29368ee05a542f3e1d20 (driver core: Add fw_devlink.sync_state command line param)
url: https://github.com/intel-lab-lkp/linux/commits/Saravana-Kannan/driver-core-Add-fw_devlink-sync_state-command-line-param/20230304-085552
base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git 2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
patch link: https://lore.kernel.org/all/20230304005355.746421-2-saravanak@google.com/
patch subject: [PATCH v2 1/2] driver core: Add fw_devlink.sync_state command line param


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2eb29d59: Merge tag 'drm-next-2023-03-03-1' of git://anongit.freedesktop.org/drm/drm
6c154242: driver core: Add fw_devlink.sync_state command line param

+----------------------------------------------+----------+----------+-------+
|                    symbol                    | 2eb29d59 | 6c154242 | delta |
+----------------------------------------------+----------+----------+-------+
| bzImage                                      | 501536   | 501760   | 224   |
| nm.t.fw_devlink_dev_sync_state               | 0        | 117      | 117   |
| nm.t.fw_devlink_sync_state_setup             | 0        | 74       | 74    |
| nm.T.fw_devlink_probing_done                 | 0        | 56       | 56    |
| nm.d.__setup_str_fw_devlink_sync_state_setup | 0        | 22       | 22    |
| nm.d.__setup_fw_devlink_sync_state_setup     | 0        | 12       | 12    |
| nm.t.deferred_probe_timeout_work_func        | 70       | 75       | 5     |
| nm.t.deferred_probe_initcall                 | 72       | 77       | 5     |
| nm.b.fw_devlink_sync_state                   | 0        | 4        | 4     |
| nm.t.klist_children_get                      | 5        | 8        | 3     |
+----------------------------------------------+----------+----------+-------+



Thanks


