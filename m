Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F2077102
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737182255; cv=none; b=D+UXOxH29zM2MH+MYIy12nx0cePmsInT/Zmfm6SYib1mUlNze3kJ4FO1L9HuVnLjy7IudlK8xmuHRD0HNCzw/HmqKpYK2U5NBUYtFUvVUdDK3ARrALr2cdND6/4edp+YtcEW9w1Mdx3ZfGqQ8wz/b0R1mdf4gDLIrL5JBLg2Ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737182255; c=relaxed/simple;
	bh=8b++c8FbFkg+mVd7Zp6KoAGqkjTTsWYXv64r4V25upU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EDnbZYALf9XZ2ZlvsGSUWcAfFXJDVX7bdbgQ8x0qN2B5wNOevQyz1npE0CpwY2HZ/+yur4aPG62kseg8FaztFNfL4QPzsbVuRMP8IkMxNPB0CoWZFOlk+x0yv4So+iWCHPokrU35GCS/Ymh3UXrQIDmk11FkK6tqmp+hSj7b8VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NB7pNLWs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NB7pNLWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737182254; x=1768718254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8b++c8FbFkg+mVd7Zp6KoAGqkjTTsWYXv64r4V25upU=;
  b=NB7pNLWs/TIBi0iMOYwLBGwu3CYIOJsfCYJ6i4aFOD9+DJDqGh6dq7g/
   SgTzaDc6s3qZOOhCDbFus2n4GIe2G5rBVWZ1Soh6m1s/tqjpe1SfnmRvv
   PwlI6EO1sN+hFiNmKd9OhCJLOIJoYtxtlFpYE3aL9oWJwaRVIDZbG6yu6
   MURAkjSl5ipCVJg2/NEi3Ewnl/f6q473YTtoHPaJgNyKNLqKVLYUdYkKu
   YCFrJKKmp9n53qZvvIp/0vV4mmk6DqG8nJdMFrMEE0XSKRTc6NgU+CB8W
   5ruqFkmNCGLOFzhNbJkeMUzwRRGm/X32MI1H5tno40UeSTRItTZuVH+z+
   Q==;
X-CSE-ConnectionGUID: +fK0He5ITNyobLOUa6/WuQ==
X-CSE-MsgGUID: Hcahul//S5CBwPBPYmT3bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37531623"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37531623"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 22:37:33 -0800
X-CSE-ConnectionGUID: 6GHV+cM3Tm+CdjM6aQjZYg==
X-CSE-MsgGUID: m9DJhF3oSvmds3R12Uem3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="110994142"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 22:37:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ2SY-000UAN-13;
	Sat, 18 Jan 2025 06:37:30 +0000
Date: Sat, 18 Jan 2025 14:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] include/linux/sched/signal.h:
 linux/kabi.h is included more than once.
Message-ID: <202501181428.cSbIc8DR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: b53643e68c841ccb6f05f90601ea30b1afeb0a2b [1826/1826] !3695 x86: Add x86 related kabi reservations
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181428.cSbIc8DR-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/sched/signal.h: linux/kabi.h is included more than once.

vim +15 include/linux/sched/signal.h

     4	
     5	#include <linux/rculist.h>
     6	#include <linux/signal.h>
     7	#include <linux/sched.h>
     8	#include <linux/sched/jobctl.h>
     9	#include <linux/sched/task.h>
    10	#include <linux/cred.h>
    11	#include <linux/refcount.h>
    12	#include <linux/posix-timers.h>
    13	#include <linux/mm_types.h>
    14	#include <asm/ptrace.h>
  > 15	#include <linux/kabi.h>
    16	
  > 17	#include <linux/kabi.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
