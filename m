Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A2B270EA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780081; cv=none; b=HMa60f34PS52mGDfjadp0zKLsIJOeI/gmxC0JFD+h5pAcjYGvNn+eYtXpa9x6ppVFEbCAfQ/HZvcBDm2zp05H4aq1G5AtSSOthT3O5KE58YsOKiAmqA+HuBLW7K6PFW1QDl77cGpXjKAM3h8I8Q0idMP+/Cv2q5wRDjiqQy1Yes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780081; c=relaxed/simple;
	bh=DUPYu95NpoFm5DtGk36orNXhMaVpyC2jUvZ8STv/9l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDnL8t0AbPLFXqjr8MRSOJYFMqi/SgMByVSe+vceQNK6LAYeYBgfPzRx5Lm9iuB27PPLxAON1kZpSqnpqvljHoAL33AArku/vfDp4Zg8qpu3/zlqN1DALJ8V0g42NXLz7fttxme4PNH3r7fXhuhdbhsAkpEk6e1pODmlMRhd/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gISO15Zs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gISO15Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753780080; x=1785316080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUPYu95NpoFm5DtGk36orNXhMaVpyC2jUvZ8STv/9l0=;
  b=gISO15ZsrPeqorA1B74+EGffBu+YK4z9NItq3GDvgylyAEGYj+PBJqBR
   9EI9YbRzmO1N/YzpuR89jbPxQPg11ArLzqGYiQAbnDqHGwM4RjUuzmf2L
   7caGDdApAQltsXSqemMZRbQgB2K0mJb1G7wRDx5yytCwLc1eY/9NzyLfk
   Vqwbd6bzLlH1BtbNm3L3or8N/BSNJjkEgDQtMuTeAt+vzoN7Hc+WHcwI0
   EX39RbXRCsB8xYGCxsS1wQaHKPs2/AVnNW5A2npQCrh77Ve5YYbhfbU7B
   UgGgm9eRIEve6J2dYgaC8dclMpcsOMfTgxB7rdFdEGARg1QYRn6VzB2Ud
   Q==;
X-CSE-ConnectionGUID: xIp9JsaKQQ+T4kQ7nNR//Q==
X-CSE-MsgGUID: WgYRv8OrTdaXnXbsz8ywLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56120427"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="56120427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 02:07:59 -0700
X-CSE-ConnectionGUID: Vv0fp02bQkGFUj3BsrszDA==
X-CSE-MsgGUID: cWx6JD0WQXG++uqZpGowPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="167141626"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jul 2025 02:07:58 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uggJP-00018x-1z;
	Tue, 29 Jul 2025 09:07:55 +0000
Date: Tue, 29 Jul 2025 17:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/rmcall 36/38] rust-project.json: warning: ignored by one
 of the .gitignore files
Message-ID: <202507291641.QURjw3rV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/rmcall
head:   f84efb7ad6abf84f73a43a0c526e85d243138bc4
commit: e3d86dd373496072b321f826fa24e034dba7d153 [36/38] JOEL: Add LSM metadata
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20250729/202507291641.QURjw3rV-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291641.QURjw3rV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291641.QURjw3rV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .pylintrc: warning: ignored by one of the .gitignore files
   compile_commands.json: warning: ignored by one of the .gitignore files
>> rust-project.json: warning: ignored by one of the .gitignore files
   scripts/target.json: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
