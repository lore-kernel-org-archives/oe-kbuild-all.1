Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045F28F43
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670451743; x=1701987743;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=drVSCkvJeem7jV/HQZvFRg1YG/D4sBGeVKurjImRdbc=;
  b=fYBZWoLXVk01LC2HDI9ARJVVdWKd+K17REJlSRMIMoWk0Qkblt75sj6D
   UXBWriUQqYQkqagE5wbVCRS0sigpZrWebi9u2ZPthLKUizfd3EDMpI908
   6/PuOsVi7sxnhRMp2VopedaOwL8WSWtUOTJ0HKlx8Xkpo67ohYttV3TfC
   FlzzRdjLHWe22y81A9qL39ct6zToxyIGX8rZgAveaHTfhSZmmuoYWvnkL
   wQWBrxNEGDRtAS/Ff+V3jhBJ8e6pGY4tPD0FT0lfEzGveKQDPI5EfXKps
   Uzzpi8Fj2lFRt5boRlT5ACdmhBIZBEp7Iiomy0afs65wjRX0Uc0fNInL7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315731713"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="315731713"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 14:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="771259545"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="771259545"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 14:22:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p32nz-0000bg-2d;
	Wed, 07 Dec 2022 22:22:19 +0000
Date: Thu, 08 Dec 2022 06:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+346 bytes kernel size regression] [i386-tinyconfig]
 [91d26357eb] vfs: prepare for pre-modify permission events on write
Message-ID: <63911205.d5Ev6gUZU9xgvs/J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +346 bytes kernel size regression due to commit:

commit: 91d26357ebf095c16183cdc5c774dce425780dce (vfs: prepare for pre-modify permission events on write)
https://github.com/amir73il/linux sb_write_barrier


Details as below (size data is obtained by `nm --size-sort vmlinux`):

e8a2a30b: vfs: implement 'vfs write barriers'
91d26357: vfs: prepare for pre-modify permission events on write

+----------------------------+----------+----------+-------+
|           symbol           | e8a2a30b | 91d26357 | delta |
+----------------------------+----------+----------+-------+
| bzImage                    | 491872   | 492192   | 320   |
| nm.t.vfs_writev            | 100      | 205      | 105   |
| nm.t.file_end_write_srcu   | 0        | 83       | 83    |
| nm.T.file_start_write_area | 0        | 43       | 43    |
| nm.T.vfs_copy_file_range   | 760      | 801      | 41    |
| nm.T.vfs_fallocate         | 490      | 529      | 39    |
| nm.T.kernel_write          | 74       | 98       | 24    |
| nm.T.do_sys_ftruncate      | 212      | 236      | 24    |
| nm.T.vfs_write             | 320      | 344      | 24    |
| nm.t.remap_verify_area     | 64       | 84       | 20    |
| nm.t.do_sendfile           | 565      | 585      | 20    |
| nm.T.__rw_verify_area      | 124      | 142      | 18    |
| nm.T.do_splice             | 594      | 607      | 13    |
| nm.T.vfs_clone_file_range  | 298      | 300      | 2     |
| nm.t.file_start_write      | 52       | 0        | -52   |
| nm.t.file_end_write        | 58       | 0        | -58   |
+----------------------------+----------+----------+-------+



Thanks

