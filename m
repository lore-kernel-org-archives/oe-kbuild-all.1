Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9976A8C1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670451742; x=1701987742;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oFmnL2x3iYqnyv9/inI9EpmZroPV1h7zdwSix4T/JrY=;
  b=ihq6z9KEGaqRHM2zohxCH1KZpOmIWHnSbEhp0tr6TDcG7uV/R8wvaM8K
   uQVO775VnFkJJ7vpfRy6Ppdzuj5801bqIsxUMwm68JUpnkuwHyTQ8wTUD
   IBZQf3OVJW6bQZOL+3GfabwrDtTSrhX7l83IHcoLD6k6y8HjtSpy09HE0
   NLMzgUPblUAMnBFgMNqKPf7PxFqYrVT0jFKK4B5C8bDeTlWqJrOwWDZVi
   Zpp1ldJU6a9FFl4WsEcIgdin5Hq7BCqNbh8aR+pkpgf6elJtWb72F2DCZ
   lVH4zPLwRtkGF7mgBaXhh5sg2OJTZw9x1mwf6m7b1pfShjfkv2SyzQpbD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="317027879"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="317027879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 14:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="715352548"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="715352548"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2022 14:22:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p32nz-0000bi-2j;
	Wed, 07 Dec 2022 22:22:19 +0000
Date: Thu, 08 Dec 2022 06:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+292 bytes kernel size regression] [i386-tinyconfig]
 [79db767dcf] fanotify: introduce FAN_PRE_ATTRIB permission event
Message-ID: <63911211.ZT+5NO/trX128JA7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +292 bytes kernel size regression due to commit:

commit: 79db767dcf19875e1d544b139521c09fae7f7e7e (fanotify: introduce FAN_PRE_ATTRIB permission event)
https://github.com/amir73il/linux fan_pre_modify


Details as below (size data is obtained by `nm --size-sort vmlinux`):

884a2487: fanotify: introduce FAN_PRE_MODIFY permission event
79db767d: fanotify: introduce FAN_PRE_ATTRIB permission event

+-------------------------------+----------+----------+-------+
|            symbol             | 884a2487 | 79db767d | delta |
+-------------------------------+----------+----------+-------+
| bzImage                       | 492128   | 492256   | 128   |
| nm.T.mnt_want_write_file_attr | 0        | 87       | 87    |
| nm.T.mnt_want_write_path_attr | 0        | 78       | 78    |
| nm.T.vfs_fallocate            | 529      | 561      | 32    |
| nm.T.vfs_truncate             | 165      | 190      | 25    |
| nm.t.do_open                  | 399      | 417      | 18    |
| nm.t.path_removexattr         | 106      | 123      | 17    |
| nm.t.path_setxattr            | 125      | 142      | 17    |
| nm.T.__ia32_sys_fsetxattr     | 116      | 129      | 13    |
| nm.T.chmod_common             | 139      | 152      | 13    |
| nm.T.do_fchownat              | 150      | 163      | 13    |
| nm.T.__ia32_sys_fremovexattr  | 79       | 91       | 12    |
| nm.T.vfs_utimes               | 330      | 320      | -10   |
| nm.T.do_sys_ftruncate         | 236      | 213      | -23   |
+-------------------------------+----------+----------+-------+



Thanks

