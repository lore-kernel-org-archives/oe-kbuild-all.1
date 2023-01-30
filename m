Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18B20E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675079824; x=1706615824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MO9HaqgoEZa324lPHW4mucIyTGr6jHjgUr89uhD3Xv0=;
  b=DMBlTiX8aoJfdcL3M+BiPANwUakgx2pqgPC5zHeVnulYgHqOqAsO2TCc
   rAGhZi4tjgW1RQCOXFFHXn6C3wXYXITvLyp4sJI3RG1IE1h969PAz6Zki
   bIo4non8oHSCAP/twxn3RQM0bUxpfLgz3ukglaUDjhjZ0B/BcPhx9fb1N
   JbLbevRaNbgRqLHSuibUFAloWFzWsxui5DjyzD2s1vnZnbTJ34NbJr3zd
   BMH7dLeJ7fP2nVSfsvPB3qK0ti8aqvHCQSf0C262l9Td6E0seWEH1dju+
   hPQrGJ7QPkEerTM1PTOW39Nji/ogbVlcRZWj/FCvfEpQPUyMzGHsHk8DC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327556273"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="327556273"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 03:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="664069621"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; 
   d="scan'208";a="664069621"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 03:57:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMSmT-0003bC-0f;
	Mon, 30 Jan 2023 11:57:01 +0000
Date: Mon, 30 Jan 2023 19:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+338 bytes kernel size regression] [i386-tinyconfig]
 [a24d451c5e] vfs: prepare for pre-modify permission events on write
Message-ID: <63d7b080.+lvyiLl9A6MuIPJr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +338 bytes kernel size regression due to commit:

commit: a24d451c5e39da37771e4cde1f401fab0d6420db (vfs: prepare for pre-modify permission events on write)
https://github.com/amir73il/linux sb_write_barrier


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a2a4e9ba: vfs: implement 'vfs write barriers'
a24d451c: vfs: prepare for pre-modify permission events on write

+----------------------------+----------+----------+-------+
|           symbol           | a2a4e9ba | a24d451c | delta |
+----------------------------+----------+----------+-------+
| bzImage                    | 496128   | 496320   | 192   |
| nm.t.vfs_writev            | 100      | 205      | 105   |
| nm.t.file_end_write_srcu   | 0        | 83       | 83    |
| nm.T.file_start_write_area | 0        | 43       | 43    |
| nm.T.vfs_copy_file_range   | 760      | 801      | 41    |
| nm.T.vfs_fallocate         | 490      | 529      | 39    |
| nm.T.kernel_write          | 74       | 98       | 24    |
| nm.T.vfs_write             | 320      | 344      | 24    |
| nm.t.remap_verify_area     | 64       | 84       | 20    |
| nm.t.do_sendfile           | 565      | 585      | 20    |
| nm.T.__rw_verify_area      | 124      | 142      | 18    |
| nm.T.do_sys_ftruncate      | 214      | 230      | 16    |
| nm.T.do_splice             | 594      | 607      | 13    |
| nm.T.vfs_clone_file_range  | 298      | 300      | 2     |
| nm.t.file_start_write      | 52       | 0        | -52   |
| nm.t.file_end_write        | 58       | 0        | -58   |
+----------------------------+----------+----------+-------+



Thanks

