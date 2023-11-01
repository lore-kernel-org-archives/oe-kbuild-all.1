Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A194C77
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ic24v1LU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698836198; x=1730372198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYtugfp7YDjekrFkSbjKPNcIJiCh9y579b5cD9jufFU=;
  b=ic24v1LUzhJz+KDOt8YKLmpC7svgSGTrQ8jz3SnxYRA8YvAiRjDXUl42
   jFmzmW6ybgAmC6vQteVG9nenIUS6pQAqMHJ3aTbC/9AEDCMW9l3D06Zz3
   7b6SMaesmrQEKQ2CsnqjwFWUnSPVc1ChqpxcJixphzs4mqTMX47nOx5YU
   pCX5YWxwVHzQo4S1LnHcBIjv5jjzmXt3KMC3U6G57LSllVaHgOPEBkmno
   BnaKvb+aDNm+c3FUwcFa9y4X+cSUBQbT/WEUY3cBgZGmowoBNgoElXJj/
   jtuzs9tHKbhODL1sSjNJHJ2SdcfB5P1ofk3cceaCLuBgAVePLyNJWNkjl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454948359"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="454948359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 03:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="8632390"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2023 03:56:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy8tm-0000lO-22;
	Wed, 01 Nov 2023 10:56:34 +0000
Date: Wed, 1 Nov 2023 18:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 15829/16064] fs/bcachefs/disk_groups.c:534:6:
 warning: no previous declaration for 'bch2_target_to_text_sb'
Message-ID: <202311011824.HYApSA1M-lkp@intel.com>
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
config: x86_64-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231101/202311011824.HYApSA1M-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011824.HYApSA1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011824.HYApSA1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/disk_groups.c:534:6: warning: no previous declaration for 'bch2_target_to_text_sb' [-Wmissing-declarations]
    void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
         ^~~~~~~~~~~~~~~~~~~~~~


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
