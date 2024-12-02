Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4581DF97F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733183481; cv=none; b=jR7EPUnEp/AMpJGOLdmTS7nQviO32Z+16/Y0yxT4gj6lgnR2x3/fH9V9BC6z7TF3Ng8X+cLfXIljquPgLa2KryHvZ4y5NdMPjKiictij78iwInrb36o+fGNinY//2VBp6iHi5enTv2V3pBP/bjLgbO9hQpp081fs/mBqY0jN17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733183481; c=relaxed/simple;
	bh=NB3/yFtWuvtLzC0XK7mVIzjbXgFPdh1CL9OXbExWxQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AxWA6BgDhSvsX5AmFoZL0rhKEiI8MBwn4yF0zcYo9B6NZEbid87ZCx0TXzxXZcnujTR7CcYvvvwWN7hUTcWuI+OXFe62oJS11/E+z0D4UzmZA7OjMWFe7hNcRAQ2z9g+qkGrZQNWuztZPao3p8mEBABwpMTl6OO7CU8h4nak7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh7PfHrj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh7PfHrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733183480; x=1764719480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NB3/yFtWuvtLzC0XK7mVIzjbXgFPdh1CL9OXbExWxQI=;
  b=Fh7PfHrju/Cg0heeQMYCYZAPnhgCaO/dfWK5FjjBTi/IaTOL1UMHNOgg
   1fbVkzYyq08v4yD1f6ZhTlJtrTA50q/sBUALRCKRgZdtCajxSTOyZMvMw
   5mRzrCCJ0Weti4gvoYKdLt/1UFDuzWDmkng9VbYtFDHWejMQBFO6GCKw5
   T+XlGqZeZa2gOQ4Vlr2lsOlAawUtrHrjV4x1sgMBXfivdXHp3aXtkyDBs
   ODQsxrCF0/QlqjzdmePrVSgz41L2Gfp665h3ceOjuoxdOAL5rvhSvLwvS
   vOqaSrXC0kJIay2V+s9UBcKebKy9vKJuQjIcucXmjOVVbBRJRvLDoYdbo
   A==;
X-CSE-ConnectionGUID: XlXpxz6wSM+StpLuNUEleg==
X-CSE-MsgGUID: gHEPsiHiTcqzJ2lxNDFZ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43986220"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="43986220"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:51:19 -0800
X-CSE-ConnectionGUID: L6X8Y761QGqff5ueRHmwmg==
X-CSE-MsgGUID: x0QhOLWnQkKoW0iQuRGeTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93661924"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2024 15:51:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIGCC-00031t-0I;
	Mon, 02 Dec 2024 23:51:16 +0000
Date: Tue, 3 Dec 2024 07:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/3]
 drivers/firmware/arm_scmi/shmem.c:190:9: warning: 'reg_io_width' is used
 uninitialized
Message-ID: <202412030700.LZ61NI5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   997d1e6f69f19132c03f29612f28aefbc2566f39
commit: fa34bcaf9e7b5bd86a417a14ea86bb88d9ea524e [2/3] BACKPORT: firmware: arm_scmi: Support 'reg-io-width' property for shared memory
config: i386-buildonly-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030700.LZ61NI5i-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030700.LZ61NI5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030700.LZ61NI5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/shmem.c: In function 'shmem_get_io_ops':
>> drivers/firmware/arm_scmi/shmem.c:190:9: warning: 'reg_io_width' is used uninitialized [-Wuninitialized]
     190 |         switch (reg_io_width) {
         |         ^~~~~~
   drivers/firmware/arm_scmi/shmem.c:187:13: note: 'reg_io_width' was declared here
     187 |         u32 reg_io_width;
         |             ^~~~~~~~~~~~


vim +/reg_io_width +190 drivers/firmware/arm_scmi/shmem.c

   184	
   185	struct scmi_shmem_io_ops *shmem_get_io_ops(struct device_node *shmem)
   186	{
   187		u32 reg_io_width;
   188	
   189		of_property_read_u32(shmem, "reg-io-width", &reg_io_width);
 > 190		switch (reg_io_width) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
