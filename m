Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59C79D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679090182; x=1710626182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UAoYHJomMqmqOsGdRgXaOiF7nBb2JAbPlMrQm7SxO8Y=;
  b=Xs2da5ml9Ki4VEcC1loSLWm7Ycvtws4ej5MyCtuo1uJt1ze4rpAZXaip
   Ak5EZYMyQQHdKjYLqJIfGiXqtdThzHY657lyQlk7ozBYU6CzuM+0U5C0f
   QoV5pUQDeqnSPdWvIxIMbXRgyoodo7uIWHAbRuMd1ojkwmKXnBn8WflWk
   MX71m/kDjBZRxK/ovKyuHVzvYd3FRgFIruk5oTU/Cvjlo+uMWqwIwbR/l
   NBAGGSdV1CbbcvWDZyuIPNA01+du7dROHUBXKcKvkEYun+IhLFMSsoNMz
   NLWr3W7U2ZKhCEwXV2sK+2Oyo7YSQlomTZeZ4fjtgSxnAyfukZPfyM5eE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403240986"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="403240986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="710634651"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="710634651"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Mar 2023 14:56:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdI3f-0009as-2v;
	Fri, 17 Mar 2023 21:56:19 +0000
Date: Sat, 18 Mar 2023 05:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+421 bytes kernel size regression] [i386-tinyconfig]
 [21a1f3affa] fs: allow to tuck mounts explicitly
Message-ID: <6414e1cc.HDR00Fhtm1jtp9xf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +421 bytes kernel size regression due to commit:

commit: 21a1f3affa6a6ccfafb60a8e85cbf544a9cbc807 (fs: allow to tuck mounts explicitly)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git b4/fs-tucked-mounts


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2ea45266: fs: use for loop
21a1f3af: fs: allow to tuck mounts explicitly

+----------------------------+----------+----------+-------+
|           symbol           | 2ea45266 | 21a1f3af | delta |
+----------------------------+----------+----------+-------+
| bzImage                    | 501536   | 501856   | 320   |
| nm.t.do_move_mount         | 464      | 647      | 183   |
| nm.t.lock_mount_mountpoint | 0        | 152      | 152   |
| nm.t.attach_recursive_mnt  | 454      | 539      | 85    |
| nm.t.mnt_tuck_mountpoint   | 0        | 69       | 69    |
| nm.t.can_umount            | 0        | 44       | 44    |
| nm.T.__ia32_sys_move_mount | 180      | 219      | 39    |
| nm.T.path_mount            | 1092     | 1094     | 2     |
| nm.T.path_umount           | 83       | 59       | -24   |
| nm.t.lock_mount            | 136      | 7        | -129  |
+----------------------------+----------+----------+-------+



Thanks

