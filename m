Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0E37462
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 08:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHuIibn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698827486; x=1730363486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=55k7wa8WWL7zJyWG7CU9nTz+PWdmrlLd5n7NAgnQ1/g=;
  b=UHuIibn/AuOeSuICNNZXVbbV+t9rSNFuMhRJQq9d12AdwZRWFjcar9ci
   8Vj+xwsoiLGCU6GS4Bab0j936cKHZFHmNYVgPLRWIzhpACE+SiODCSIwi
   2GU5/Ukc6rfZYgYzVHZ3I7CLHe1q/7HqdyrQS4Oe3iQFgMo07PJzIzYG0
   jHeGw9oNFS2QCT8p1iY6iIBRF5S7mTdRFSsrN77QJIafBOV8r/IRMK0K4
   4IIquAsjw0To2CjReoi9brGRW+4t6Wt+xHtj8v1hnO41BQWZ3RpcWHcR7
   iny5sSL2pDdo10XhiHSUDCRNAja6WisjFPPlfdIZGDXaIkYsvxZKOwxJ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392319056"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="392319056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 01:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="2024010"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2023 01:31:25 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy6dG-0000hI-12;
	Wed, 01 Nov 2023 08:31:22 +0000
Date: Wed, 1 Nov 2023 16:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 15829/16064] fs/bcachefs/disk_groups.c:534:6:
 warning: no previous prototype for 'bch2_target_to_text_sb'
Message-ID: <202311011659.fOMoFPWP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fa7d0c17278644aa691f96d08bef8001b762f9cd
commit: bf0d9e89de2e62fe9967ebb77b68d58d3812e4db [15829/16064] bcachefs: Split apart bch2_target_to_text(), bch2_target_to_text_sb()
config: powerpc64-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011659.fOMoFPWP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011659.fOMoFPWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011659.fOMoFPWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:206,
                    from fs/bcachefs/disk_groups.c:2:
   fs/bcachefs/bcachefs_format.h:215:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     215 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:217:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     217 |         struct bversion version;
         |                         ^~~~~~~
>> fs/bcachefs/disk_groups.c:534:6: warning: no previous prototype for 'bch2_target_to_text_sb' [-Wmissing-prototypes]
     534 | void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/bch2_target_to_text_sb +534 fs/bcachefs/disk_groups.c

   533	
 > 534	void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
   535	{
   536		struct target t = target_decode(v);
   537	
   538		switch (t.type) {
   539		case TARGET_NULL:
   540			prt_printf(out, "none");
   541			break;
   542		case TARGET_DEV: {
   543			struct bch_member m = bch2_sb_member_get(sb, t.dev);
   544	
   545			if (bch2_dev_exists(sb, t.dev)) {
   546				prt_printf(out, "Device ");
   547				pr_uuid(out, m.uuid.b);
   548				prt_printf(out, " (%u)", t.dev);
   549			} else {
   550				prt_printf(out, "Bad device %u", t.dev);
   551			}
   552			break;
   553		}
   554		case TARGET_GROUP:
   555			bch2_disk_path_to_text(out, sb, t.group);
   556			break;
   557		default:
   558			BUG();
   559		}
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
