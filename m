Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0AD1841
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b326ESNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698028300; x=1729564300;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/z5TsfmBKgB8iOXf3RI+KVdgm0KDBHdg9UTLejQULv0=;
  b=b326ESNecUK5IxXjvWxbrVouTt7xlA+jwpexbcj6SmgNcQA3EqlZvn9c
   5z62PTyX0lwTmoN2BzxsXKvyK8wN4NazX1sKrGyel3tQ6NJJQeIXhJB3r
   f7nuJfNy56b5Icq0wLZgZ9h/tYMMvmkgzLnr4OsNYGXPID/YIapYTgxXt
   8OM6tPlkSxQ3hA3cWKUsVe72gNxcpT0tZa5R1tD9p6vdbjkOF4265/Ryp
   n9SP0cspMlceHZMBZBKr434onnh+Pkzc2L+ArWBgmTD//CKz4sD2UySYB
   eJNlD7mbii8cVJD7e6+0HPpLP3R7ckoSAz+aFEOTaLjtN62hQb+O4iif5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="472966257"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="472966257"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 19:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734512967"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="734512967"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 19:31:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qukix-0006UT-2t;
	Mon, 23 Oct 2023 02:31:23 +0000
Date: Mon, 23 Oct 2023 10:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: Baokun Li <libaokun1@huawei.com>, linux-ext4@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/4] ext4: unify the type of flexbg_size to unsigned
 int
Message-ID: <202310231017.HTcNT4ZK-lkp@intel.com>
References: <20231023013057.2117948-2-libaokun1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023013057.2117948-2-libaokun1@huawei.com>

Hi Baokun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baokun-Li/ext4-unify-the-type-of-flexbg_size-to-unsigned-int/20231023-092711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231023013057.2117948-2-libaokun1%40huawei.com
patch subject: [PATCH v2 1/4] ext4: unify the type of flexbg_size to unsigned int
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310231017.HTcNT4ZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231017.HTcNT4ZK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#50: FILE: fs/ext4/resize.c:387:
 		printk(KERN_DEBUG "EXT4-fs: adding a flex group with "
+		       "%u groups, flexbg size is %u:\n", flex_gd->count,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
