Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D5373
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679826819; x=1711362819;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i+vT2Yv+9tXyOsApuWCxFHs7HUCVwIvClWiYPf+Qutg=;
  b=WF1npF+ZkVkm89FLV1kZWmJYEFUbXhSrgeXG6M+aGeToptosKJL/8h3m
   bnJNSPAAIK5vnqXMVAFUWoiP8ZaMnqUdIusaCYuUnHdJLSLvnBIRr00Qf
   r9M+8F4X8hpMKYGwqbz5qXwbi5xW1XbDP5/BCoxhzL6EB93K7S263nmSS
   E4Lg9GHeqhGKneRO9jkqyE6vVRCOxbX2UBqLMPIVFY2WF97heFt5gF3x3
   B0iD7jmW6CPyqTgTL1m/VR95zhJCY8Rc5UKmbc25UoHQM2ZHkOSJrrxjW
   /0W6MlKuWcwd9P7Kmf4LxUD1LMgim6vOdt+DelxejyRQ2n9DbRsC1ldLQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="320470298"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="320470298"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 03:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="676658164"
X-IronPort-AV: E=Sophos;i="5.98,292,1673942400"; 
   d="scan'208";a="676658164"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Mar 2023 03:33:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgNgu-000H3H-1U;
	Sun, 26 Mar 2023 10:33:36 +0000
Date: Sun, 26 Mar 2023 18:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+454 bytes kernel size regression] [i386-tinyconfig]
 [5b31ca6562] fs: allow to tuck mounts explicitly
Message-ID: <64201f46.o87j+SIw4ZuVXsIP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +454 bytes kernel size regression due to commit:

commit: 5b31ca65629e53f06bb0edf43d31fe5723d91ccd (fs: allow to tuck mounts explicitly)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git b4/fs-tucked-mounts


Details as below (size data is obtained by `nm --size-sort vmlinux`):

d13cc7e2: fs: use a for loop when locking a mount
5b31ca65: fs: allow to tuck mounts explicitly

+----------------------------+----------+----------+-------+
|           symbol           | d13cc7e2 | 5b31ca65 | delta |
+----------------------------+----------+----------+-------+
| bzImage                    | 501536   | 501824   | 288   |
| nm.t.do_move_mount         | 464      | 647      | 183   |
| nm.t.lock_mount_mountpoint | 0        | 152      | 152   |
| nm.t.attach_recursive_mnt  | 454      | 572      | 118   |
| nm.t.mnt_tuck_mountpoint   | 0        | 69       | 69    |
| nm.t.can_umount            | 0        | 44       | 44    |
| nm.T.__ia32_sys_move_mount | 180      | 219      | 39    |
| nm.T.path_mount            | 1092     | 1094     | 2     |
| nm.T.path_umount           | 83       | 59       | -24   |
| nm.t.lock_mount            | 136      | 7        | -129  |
+----------------------------+----------+----------+-------+



Thanks

