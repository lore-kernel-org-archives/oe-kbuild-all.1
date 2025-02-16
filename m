Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077E1758B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 11:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739706846; cv=none; b=lHGi+OXTN8d1/dxti4sEZtlVhL3YzpkrCC0s9HJ7p44ZBTjqSpX4k/xRCY+9iRMUfMCGNagNsBZyzxhubZuWdW290HsTM1JY+nsvVa7+yTXIPSukbx2r76NtI7ILrXMrsn9iJGPUTb/6eRI1q0THeb69X1A2hdZi+63BA2nhuv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739706846; c=relaxed/simple;
	bh=dDggTHw/cMmSgOVTFrfnUYIYxbQgcn7vAoLuNBitQKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOegX1kYuwRyxyKlmPQ2SrxVd1pqhTPcXxWivwecFNXZEUZ/+aqXM3GsE4rr3VZ4z9MfTXqgOt5DUuAjikIozb8vnSNetvfWW99+C71m47XTWiFZENWwsk6H6G/H4O3VPza+fbVqdW3Ds7tlYxAtDRFgC8d2Kb9ub3pLwgBFPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3/EmNHY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3/EmNHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739706844; x=1771242844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDggTHw/cMmSgOVTFrfnUYIYxbQgcn7vAoLuNBitQKE=;
  b=D3/EmNHYEvOyjBX2GiMgcCJ6WFWP7qrCR+/8mCBFzo1VkQ4O6QD+HIJW
   WZ6JoPs0L044htZdF8pVyt1YVMnQXe+rryLEq04lvnwPgL9JBAVRtI54g
   zxyL2vHIS2AOwXx8rfS/fV7QVnTGL7l5qvnqZFhA9TZVSEWjtx+VU434H
   pedY/PNLT0l0oHxMzh6Lli6jlF7IXZKv7wB2vxoGBUBfcWYALPTtcg+s9
   ijRyBm2jx8gRpulfasjEU9ciU+27uK+YkG4OAuRf+H/K5/H6bPGDywE2r
   g7bIlnAGlnLS0zroI4RvOKr3TtS/Et9Cdh6aaaZ0YjZhJdThgRDGMsA2R
   g==;
X-CSE-ConnectionGUID: t1dgQI9UTMqUqnhpPsw21A==
X-CSE-MsgGUID: 9uCBjr8OSAyV7KbmH5akhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="39586248"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="39586248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 03:54:03 -0800
X-CSE-ConnectionGUID: 0p7ok6j0QAe2QYjfHNyHuA==
X-CSE-MsgGUID: jI4B0520RH+h1P6wdhZX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137107524"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Feb 2025 03:54:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjdDk-001BtN-0P;
	Sun, 16 Feb 2025 11:54:00 +0000
Date: Sun, 16 Feb 2025 19:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2740/2740] fs/afs/vl_alias.o: warning: objtool:
 afs_compare_volume_slists()+0x21c: unreachable instruction
Message-ID: <202502161959.kat8z9E7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e804018e3930644594e31fd711068f5d48ae05af
commit: a8cd7bb0c2528d3afe29db0be10841671df41b5d [2740/2740] afs: Fix afs_server_list to be cleaned up with RCU
config: x86_64-buildonly-randconfig-001-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161959.kat8z9E7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161959.kat8z9E7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161959.kat8z9E7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/vl_alias.o: warning: objtool: afs_compare_volume_slists()+0x21c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
