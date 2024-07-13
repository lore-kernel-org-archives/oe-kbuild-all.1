Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3FC1CD37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 15:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720886016; cv=none; b=oot0WTyuuhTrjVw9JD9P3Hg/jk8LnHZS6gup2rFRNXXCMXi17di+ZYq0P1zVzLtFku780tIngJJhNGyxRpA6UwwrW37+y7Q3ogp1Kisj2kzNAAL4H+WVR/RCRT+lgZyGawBHDYEvo7B0VTWFx2kI2m3hJz0hTbJ2qjjSc0X6FM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720886016; c=relaxed/simple;
	bh=QYt3fULpwtP0EFBrNbM8G12nQD4ldLue+PImYMaxObI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCJEKz5zy2NvnKVdDMI6xNckfRmergUUNqAPDc8cMO+Smhbtauo2Ug44hISR89mESpy00sVuEX5cRnYdKYvv5VlRw8rJ6XXDVkm6dsFHLUxZfHg0NcgJmuRsBNZTa74dk9oa/lWfkrYM41Tgz93nffeKzCmvQMlmqO0pLDoAMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2QcRXiQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2QcRXiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720886015; x=1752422015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYt3fULpwtP0EFBrNbM8G12nQD4ldLue+PImYMaxObI=;
  b=e2QcRXiQHyHT6ufAIz2tXKChKJM9qgCltPKVHPlD037NlEGzXRl1shbO
   1ttNoFWbkEIY8NO7E85l7yS10wA6B/5Ai++ySJeJUcDsFD1U2GLX4/PHS
   jOREYyapjZ4SFnYFci3zGFkXAZ0QDy4YpPMrRWJvxTlm1V+IOth4u4eJM
   VBNeglBJtGpx9sGHa9XnN3GYPfdJ6WfBORNVx54ovGzpqnqGyAcNdlW+r
   U3jSNCECNwmiCq+UfdOu7fnYCfCgqoMB/WFJHhDil4ultzElmkFEHbJeJ
   KeXDQKDzD1KlQBYXs5wFfF1DPprlsTJUfoplS0UJm2d7Ex7gDDbBf5JkR
   w==;
X-CSE-ConnectionGUID: HlqFnBxoQ4erk9TfqSNADQ==
X-CSE-MsgGUID: Pfo3823XQ2e20jAGea6muw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18268485"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="18268485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 08:53:34 -0700
X-CSE-ConnectionGUID: Mh6E+PWUSf+gV7PE9sGXrg==
X-CSE-MsgGUID: +rHHIbxtRrWFJo/nu0As2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="54028034"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jul 2024 08:53:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSf3y-000cS8-2S;
	Sat, 13 Jul 2024 15:53:30 +0000
Date: Sat, 13 Jul 2024 23:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 1/3] kismet: WARNING: unmet
 direct dependencies detected for TIMER_OF when selected by ARM
Message-ID: <202407132349.fsT8RGP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   3cf2ba5bb279edd16bd1606f4feb0a3bd87a5700
commit: feac31245eaf458048d88903bdae76aa8ba59ee3 [1/3] scsi: Rename .slave_alloc() and .slave_destroy()
config: arm-kismet-CONFIG_TIMER_OF-CONFIG_ARM-0-0 (https://download.01.org/0day-ci/archive/20240713/202407132349.fsT8RGP1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240713/202407132349.fsT8RGP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407132349.fsT8RGP1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TIMER_OF when selected by ARM
   

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
