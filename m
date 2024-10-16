Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AAF18C33F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078333; cv=none; b=Oi2ddwaeIeFnusVLXivE+mBEu5PGYHLA++HtLj9rLyVHZ5jalUiwZXVwRIh3eLnEvVZjymf2oVDFduhEfYRVmbntTedopfYqnuJ7Kn9hWtFueyTbL4oJv9hWDuTACrWIZYmr1Zo8u5RjELdKxyI2RZnrlOkv8dSFdvTgdCaXusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078333; c=relaxed/simple;
	bh=9GyVmCz3/2XJOD52RriMbWfdAHO7zqhunvS8lm4ENmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPvXsFXbcqY7a1rix9mWKk+ZM23alj7pd7jbyOrfI7Sy/N/a1gQclpZGxKMEgVyBVFr2BL12lGqfr66jGvN/rp5sW1hTNdCh2QFYsgt+psmUASFpvOK1B0LCcEDg2SS8Qw2610U1N+XIDPij5CaLXyxu/9ElZboWyns3wA2yv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGB8ccHO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGB8ccHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729078331; x=1760614331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9GyVmCz3/2XJOD52RriMbWfdAHO7zqhunvS8lm4ENmI=;
  b=oGB8ccHOELTLB6rKumuPc74gEUVeQpPVArUKYRfcg+f9fV0/g+dQfZ81
   Zm3IUAAZ/3vsCMTWDLJhmAh854R1LDNnQVve77EqoL+IgPy4UQm54BOKn
   6oniBqa8sL6p7FrUcueZu0mso0pPYLLyFltq+5djlpRyXuKKVYoW8xQEN
   /HIJBJGewV26a7IB9J6enBb/mq4khs5rfAZS11yy3f+YGUYTWDSiVM/TB
   59/+WgKYFLYXEvFfco6QPXnbXM5/2zO/1gP8zJ6xON7X279/rs5Rw5EKp
   GZyYkR6GdV6CHOQquZfhqe4BgeHNBG2BZWXbQJI232u+Hb4JXiyUf6f35
   w==;
X-CSE-ConnectionGUID: w3ocdkbGQuusOKvnOq7m8w==
X-CSE-MsgGUID: KVIKVhLBR2q5eV8IT8K/+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51055830"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51055830"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:32:10 -0700
X-CSE-ConnectionGUID: jJMt1834RH+5/+cxpTAzlQ==
X-CSE-MsgGUID: cGDwy1S9QuOSeo9yJ+aJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="108941502"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2024 04:32:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t12G7-000KqD-16;
	Wed, 16 Oct 2024 11:32:07 +0000
Date: Wed, 16 Oct 2024 19:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] bcachefs: Fix sysfs warning in fstests generic/730,731
Message-ID: <202410161947.aFz7ShcY-lkp@intel.com>
References: <20241012184239.3785089-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012184239.3785089-1-kent.overstreet@linux.dev>

Hi Kent,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on v6.12-rc3]
[cannot apply to linus/master next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/bcachefs-Fix-sysfs-warning-in-fstests-generic-730-731/20241013-024432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20241012184239.3785089-1-kent.overstreet%40linux.dev
patch subject: [PATCH] bcachefs: Fix sysfs warning in fstests generic/730,731
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241016/202410161947.aFz7ShcY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161947.aFz7ShcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161947.aFz7ShcY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sysfs_delete_link" [fs/bcachefs/bcachefs.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
