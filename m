Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD33219F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4TQsUuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215616; x=1728751616;
  h=date:from:to:cc:subject:message-id;
  bh=CHWGMYcjgnO250BbX+MyLOvOvUQbykUkmsDv2dfnHk0=;
  b=N4TQsUuokXN7MJuAMjjz89bXnnNC+HOsvOaJe7dm8rDqjTjeuXNKcjjw
   kAgSMXuaaPAQczXSQjXAjPjl6GusqLYV8z73M3Da45fhdMsC9rJpakG6o
   5kR0WaCQXOMefCJxYJk03f6pBXl3/nF6vF3dnQQGFrgyW9IhO8Pkb/A8/
   insG2DRiwlh7H1ozqyVPB2V71TwmvkBTLcJ9zoVQRfHr8F+a6NdZM3YLK
   4mJh4TTLTLGQImZ5OuZDcGsVtSDuAI4hxLMBrE2jVgid7tDQDlsrMjkHN
   AY7PfXie6rVhiESCgFz7bxm9gilEwH3pKYoUalko13IGdNi4XkoUTOVgh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6781069"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="6781069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704707901"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704707901"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 09:46:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLJL-00059N-2c;
	Fri, 13 Oct 2023 16:46:51 +0000
Date: Sat, 14 Oct 2023 00:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+72 bytes kernel size regression] [i386-tinyconfig]
 [d54e66ccdd] fuse: implement read/write passthrough
Message-ID: <20231013164606.JRNMH%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +72 bytes kernel size regression due to commit:

commit: d54e66ccddcc9e73043b1b7b34b0dc6801ba7180 (fuse: implement read/write passthrough)
https://github.com/amir73il/linux fuse-backing-fd


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4019ce76: fuse: implement ioctls to map backing files to inodes
d54e66cc: fuse: implement read/write passthrough

+--------------------------------+----------+----------+-------+
|             symbol             | 4019ce76 | d54e66cc | delta |
+--------------------------------+----------+----------+-------+
| nm.t.backing_file_write_iter   | 0        | 337      | 337   |
| bzImage                        | 522656   | 522816   | 160   |
| nm.T.backing_file_splice_write | 93       | 115      | 22    |
| nm.t.backing_aio_cleanup       | 60       | 77       | 17    |
| nm.T.backing_file_read_iter    | 278      | 280      | 2     |
| nm.T.backing_file_write_iter   | 361      | 55       | -306  |
+--------------------------------+----------+----------+-------+



Thanks

