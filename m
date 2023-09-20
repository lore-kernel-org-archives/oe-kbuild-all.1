Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB2C1A58E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695250916; x=1726786916;
  h=date:from:to:cc:subject:message-id;
  bh=L5PGAkYOuwiGYJPLcUA1AGUb5Y/ISSk60v16sabH9AI=;
  b=djhenpJQWRdLo6qvaPTZOgcdHPwT8/MK/888cit8NC0/2Pef895F7qve
   2IaQvxFt1DyoER4uTNqbtd4ZyktetttKTryf8lF5kZctKSM3h2MxdnmJo
   9UUL9JONr1wlhljYBKofmkK7NzNJ7IhqQEeTfoM9E8jeoe9pWHNsCQw9c
   OcmZjJPj1Da7C/5Skko5AtO2sMIAZ+JzpvI3gyIbH8jkWVzD7ukDrFOW1
   anLq4XRJmQfP7cOPKWB6PMijWDygDjhxIgmxXkG64GyuKuAbGQaC5wOr8
   oYbWnZZa6CsC4yulqmqdK2uxwBbLG5BvxFfGlrzRlglXWdqfXcvP/DOTT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365428328"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="365428328"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 16:01:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862198438"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="862198438"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2023 16:01:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj6CC-0009F8-0c;
	Wed, 20 Sep 2023 23:01:24 +0000
Date: Thu, 21 Sep 2023 07:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com,
 Josh Triplett <josh@joshtriplett.org>
Subject: [lkp] [+323 bytes kernel size regression] [i386-tinyconfig]
 [587a6a805e] iov_iter: Convert iterate*() to inline funcs
Message-ID: <20230920230034.ixGH9%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +323 bytes kernel size regression due to commit:

commit: 587a6a805e2ebf90427af4f9ac35496678d49ca3 (iov_iter: Convert iterate*() to inline funcs)
https://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git iov-cleanup


Details as below (size data is obtained by `nm --size-sort vmlinux`):

e2532bd2: iov_iter: Derive user-backedness from the iterator type
587a6a80: iov_iter: Convert iterate*() to inline funcs

+---------------------------------+----------+----------+-------+
|             symbol              | e2532bd2 | 587a6a80 | delta |
+---------------------------------+----------+----------+-------+
| bzImage                         | 522176   | 522304   | 128   |
| nm.T._copy_to_iter              | 776      | 874      | 98    |
| nm.T._copy_from_iter            | 776      | 861      | 85    |
| nm.t.copy_page_from_iter_atomic | 810      | 891      | 81    |
| nm.T._copy_from_iter_nocache    | 776      | 832      | 56    |
| nm.T.iov_iter_zero              | 695      | 750      | 55    |
| nm.T.csum_and_copy_from_iter    | 932      | 985      | 53    |
| nm.T.csum_and_copy_to_iter      | 1030     | 1056     | 26    |
| nm.t.copyout                    | 41       | 0        | -41   |
| nm.t.copyin                     | 43       | 0        | -43   |
| nm.t.copy_page_to_iter_nofault  | 975      | 928      | -47   |
+---------------------------------+----------+----------+-------+



Thanks

