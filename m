Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A70A4C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 22:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677708519; x=1709244519;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rvh7nuAO1YnhWCtRiXh75rphjl1PEHTcYzvMe++BszY=;
  b=IEY+LgPd6l4eA0NaQkl/ul8MsBJNsbpo2x8FY2sctF98TqktWpwn3GRQ
   r7EjM+5aIBQvR+M2h/XIkujxI4Aeh3VU289HXkXib/OhxtfOzRSe1/KZf
   PN1eQp/ogSuhwcGu4h79Rw27TOlMdvWjcQAT5tB6HLSevA6VIvYuy9oxi
   OzyjTRCGmxb0FdFosItEvX22NIsWpNlsWU6HYCSMP4+Dq1gQ5IhuBuje/
   QO92bfhGvPwq8qYbWRRD35xgb2Z5z0SH+we6QN2GplGzfhrdCBDQHOXLm
   hiRa7it843CdxOOCiQWseUv6Lv/KvyOrlT6Bd7HHXXuKMcBiDDUj+KJFG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420794235"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420794235"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 14:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="668019218"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="668019218"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Mar 2023 14:08:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXUcm-0006Rz-0G;
	Wed, 01 Mar 2023 22:08:36 +0000
Date: Thu, 2 Mar 2023 06:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
	Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+258 bytes kernel size regression] [i386-tinyconfig]
 [39a1aa674d] ptrace,syscall_user_dispatch: checkpoint/restore support for
 SUD
Message-ID: <Y//M2bLFnYdftzuz@8d190a1611c4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301205843.2164-3-gregory.price@memverge.com>


FYI, we noticed a +258 bytes kernel size regression due to commit:

commit: 39a1aa674dbf23f8f44af1eb2bd1d01a9531de8e (ptrace,syscall_user_dispatch: checkpoint/restore support for SUD)
url: https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/syscall_user_dispatch-helper-function-to-operate-on-given-task/20230302-050205
base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git next
patch link: https://lore.kernel.org/all/20230301205843.2164-3-gregory.price@memverge.com/
patch subject: [PATCH v13 2/3] ptrace,syscall_user_dispatch: checkpoint/restore support for SUD


Details as below (size data is obtained by `nm --size-sort vmlinux`):

43d29eea: syscall_user_dispatch: helper function to operate on given task
39a1aa67: ptrace,syscall_user_dispatch: checkpoint/restore support for SUD

+---------------------------------------+----------+----------+-------+
|                symbol                 | 43d29eea | 39a1aa67 | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 495936   | 496064   | 128   |
| nm.t.task_set_syscall_user_dispatch   | 0        | 127      | 127   |
| nm.T.syscall_user_dispatch_get_config | 0        | 117      | 117   |
| nm.T.syscall_user_dispatch_set_config | 0        | 73       | 73    |
| nm.T.ptrace_request                   | 1186     | 1228     | 42    |
| nm.D.linux_banner                     | 165      | 166      | 1     |
| nm.T.set_syscall_user_dispatch        | 128      | 26       | -102  |
+---------------------------------------+----------+----------+-------+



Thanks


