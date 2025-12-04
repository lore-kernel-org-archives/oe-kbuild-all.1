Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0633A013
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845268; cv=none; b=MrckGaZ8YPyI00C4YRMwHkHrE9xA7x2XCm5aBnYfHZnKrNuZIJJriFCXaKgUIC3MCumsp4JyD13wUGIc8gzWJOIGSihUSJreaxikZ1ZQpovG1WN1DZohTM3++ogl1AdD6p0ulKFK6c84BSTq1FGSc3vfC2sci48sulshUV7MyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845268; c=relaxed/simple;
	bh=qei3l6IxWC3a7I4Zv7O9KzOBqyo6dURA6OIvHnUx7TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKxdB1ihfy+ItkUdpgF+EpyVkyiT0NyDPM55c/AAXinY0y4N7P9m9CvTmdesChE4ZYH2XdorZ1ts30FVp8B0N+5NzGkc+nx1CvoMYnY9ezuY9AGqIf40bDDwPsfV3+WmogqoKrbtjFU+oGG0iwWuNLbBrz69tisykTN26GaZNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TN/XtQMZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TN/XtQMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764845266; x=1796381266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qei3l6IxWC3a7I4Zv7O9KzOBqyo6dURA6OIvHnUx7TQ=;
  b=TN/XtQMZzPqPRtlYNxMfuxEscYVp3oPmYd75Bk6vXvmWjcHGvBHKuR2l
   t1UajejvtTlpJpU4PVfZoAKB0bbDHxerdZjLuzrLX4oDh9fBE6i7JAu+y
   P9hnSiyCDlsAAki0zd5TFQJ+C4skq4YcpbH1iYnyeGJgKkh+ANrmYBJpI
   99r7NF67rkap7LSpm+WpmRVcjB9iwLmlqbXCgpo3UpNAfgtJhu/i8Rn75
   xeUyvmyc1Vn3NadvSnV/WYkVpZhmkcLUAg56i56e9/3NcGdeyJ50xE25b
   JlnG0g9HOgYd5KKkzICwhl5hd4GRmdgalTz+bVssxQqRsr4VAUvx/eVdj
   w==;
X-CSE-ConnectionGUID: 5ZKDkpxVStCn/m9Q1XT+ng==
X-CSE-MsgGUID: tPaxKMheRaet3rlcpA3GYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54408809"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="54408809"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 02:47:44 -0800
X-CSE-ConnectionGUID: 81slK0zbSyuIFpj3HoAfAQ==
X-CSE-MsgGUID: 1Qf9ueKiR8KvPvRjjpkA8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195364383"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Dec 2025 02:47:43 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR6s8-000000000if-1zLi;
	Thu, 04 Dec 2025 10:47:40 +0000
Date: Thu, 4 Dec 2025 11:47:11 +0100
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:locking/futex 4/5] robust_list.c:522:24: warning: storing the
 address of local variable 'a' in 'head.list.next'
Message-ID: <202512041141.cPM7Ow4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/futex
head:   c42ba5a87bdccbca11403b7ca8bad1a57b833732
commit: cd91b502f1b4bb81e82fbae38678c698ee5ac026 [4/5] selftests/futex: Create test for robust list
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251204/202512041141.cPM7Ow4I-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041141.cPM7Ow4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041141.cPM7Ow4I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   robust_list.c: In function 'child_circular_list':
>> robust_list.c:522:24: warning: storing the address of local variable 'a' in 'head.list.next' [-Wdangling-pointer=]
     522 |         head.list.next = &a.list;
         |         ~~~~~~~~~~~~~~~^~~~~~~~~
   robust_list.c:513:28: note: 'a' declared here
     513 |         struct lock_struct a, b, c;
         |                            ^
   robust_list.c:512:40: note: 'head' declared here
     512 |         static struct robust_list_head head;
         |                                        ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
