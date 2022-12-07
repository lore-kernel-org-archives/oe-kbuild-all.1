Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B18F43
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Dec 2022 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670451803; x=1701987803;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Or7jFDAVkQ5Vg8g2E/QItH8WmcbytOwNOoywcLhdVXk=;
  b=Clda2GIxpUCNPXXmHmrZCWuGHmk8A3KowNo8VRNxDT4aHLHofyjTMvja
   wZ1MEbzfCMJHrMJlnLS7uq4rq+KMUmpIeYnlEiMQZG9+QuMgPnvFEouDU
   p3KAv0niI3PJ1PNaSy4vXchb7WFDf9oyhRTrWdOLaAw43oqzZG++dtpzj
   lQISd37eIb37T4fHCHmQknP4+Ic5PF5lGqEPh+RAqOF1BZ6rtCY+fvnAD
   kunerscY/DkcQM+/E4eY4PTtMHAv9WPX8WFID3IlXstZUn4tXiWUtjBY1
   rBuiHYmauw4K6Kd+i745DtalGlNJcC1MG3wokzIxaLBvvMMXc7AeKCzRq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="403284872"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="403284872"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 14:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="646773493"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="646773493"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Dec 2022 14:23:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p32ox-0000bv-2y;
	Wed, 07 Dec 2022 22:23:19 +0000
Date: Thu, 08 Dec 2022 06:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+77 bytes kernel size regression] [i386-tinyconfig]
 [5a7c77eebb] fsnotify: prepare for directory entry pre-modify permission
 events
Message-ID: <6391121d.WolFGJw5FjD6RKcH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +77 bytes kernel size regression due to commit:

commit: 5a7c77eebbac19d62a5f25c78e66c487cd7f8366 (fsnotify: prepare for directory entry pre-modify permission events)
https://github.com/amir73il/linux fan_pre_modify


Details as below (size data is obtained by `nm --size-sort vmlinux`):

79db767d: fanotify: introduce FAN_PRE_ATTRIB permission event
5a7c77ee: fsnotify: prepare for directory entry pre-modify permission events

+-------------------------+----------+----------+-------+
|         symbol          | 79db767d | 5a7c77ee | delta |
+-------------------------+----------+----------+-------+
| nm.T.filename_lookupat  | 0        | 183      | 183   |
| nm.T.user_path_lookupat | 0        | 69       | 69    |
| bzImage                 | 492256   | 492320   | 64    |
| nm.t.filename_parentat  | 165      | 174      | 9     |
| nm.t.do_readlinkat      | 191      | 196      | 5     |
| nm.T.do_renameat2       | 814      | 817      | 3     |
| nm.T.do_rmdir           | 257      | 251      | -6    |
| nm.T.do_unlinkat        | 366      | 360      | -6    |
| nm.T.kern_path_locked   | 139      | 132      | -7    |
| nm.t.filename_create    | 222      | 215      | -7    |
| nm.T.user_path_at_empty | 56       | 0        | -56   |
| nm.T.filename_lookup    | 129      | 19       | -110  |
+-------------------------+----------+----------+-------+



Thanks

